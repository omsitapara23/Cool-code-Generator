package cool;

import java.util.HashMap;
import java.util.Map;

class VisitorImplCodeGen {

    // Expression visitors

    // Used for no_expression
    public String traverse(AST.expression expression) {
        if (expression instanceof AST.no_expr) {
            AST.no_expr exp = (AST.no_expr) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.assign) {
            AST.assign exp = (AST.assign) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.static_dispatch) {
            AST.static_dispatch exp = (AST.static_dispatch) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.cond) {
            AST.cond exp = (AST.cond) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.loop) {
            AST.loop exp = (AST.loop) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.block) {
            AST.block exp = (AST.block) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.new_) {
            AST.new_ exp = (AST.new_) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.isvoid) {
            AST.isvoid exp = (AST.isvoid) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.plus) {
            AST.plus exp = (AST.plus) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.sub) {
            AST.sub exp = (AST.sub) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.mul) {
            AST.mul exp = (AST.mul) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.divide) {
            AST.divide exp = (AST.divide) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.comp) {
            AST.comp exp = (AST.comp) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.lt) {
            AST.lt exp = (AST.lt) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.leq) {
            AST.leq exp = (AST.leq) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.eq) {
            AST.eq exp = (AST.eq) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.neg) {
            AST.neg exp = (AST.neg) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.object) {
            AST.object exp = (AST.object) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.int_const) {
            AST.int_const exp = (AST.int_const) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.string_const) {
            AST.string_const exp = (AST.string_const) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.bool_const) {
            AST.bool_const exp = (AST.bool_const) expression;
            return this.traverse(exp);
        }
        return null;

    }

    public String traverse(AST.no_expr expression) {

        return null;

    }

    // Visits 'ID <- expression' expression
    public String traverse(AST.assign expression) {
        String returnString = this.traverse(expression.e1);
        String varToStore;
        String newType = returnString;
        String varToStoreType = ScopeTableHandler.scopeTable
                .lookUpGlobal(ScopeTableHandler.getMangledNameVar(expression.name));
        if (expression.e1.type.equals(varToStoreType) == false) {
            if (InheritanceGraph.restrictedInheritanceType.contains(expression.e1.type)) {
                AST.new_ newObject = new AST.new_(Constants.ROOT_TYPE, 0);
                newObject.type = Constants.ROOT_TYPE;
                newType = this.traverse(newObject);
            }

            else {
                System.out.println("sending : assign " + expression.e1.type);
                newType = UtilFunctionsIR.convertInstruction(returnString, expression.e1.type, varToStoreType,
                        "bitcast");
            }
        }

        if (GlobalVariables.formalList.contains(expression.name)) {
            // directly taking the function parameter
            varToStore = "%" + expression.name + ".addr";
        } else {
            // GEP
            varToStore = UtilFunctionsIR.classAttributeGEP(GlobalVariables.presentClass, "%this", expression.name);
        }

        UtilFunctionsIR.storeInstruction(newType, varToStore, UtilFunctionImpl.typeOfattr(varToStoreType, true));
        return returnString;

    }

    public String irForDefaultMethod(AST.static_dispatch expression) {
        String ir = null;

        if (expression.name.equals("type_name")
                && InheritanceGraph.restrictedInheritanceType.contains(expression.caller.type)) {
            this.traverse(expression.caller);
            ir = UtilFunctionsIR.stringGEP(expression.caller.type);
        } else if (expression.name.equals("abort")
                && InheritanceGraph.restrictedInheritanceType.contains(expression.caller.type)) {
            this.traverse(expression.caller);
            ir = UtilFunctionsIR.abortPrimitiveType(expression.caller.type);
        } else if (expression.name.equals("length") && expression.typeid.equals(Constants.STRING_TYPE)) {
            String callInst = UtilFunctionsIR.CallInstruction("i64", "strlen",
                    "i8* " + this.traverse(expression.caller));
            // Here we are using the strlen function defined in C for handling length.
            ir = UtilFunctionsIR.convertInstruction(callInst, "i64", "i32", "trunc");

        }

        return ir;
    }

    // Visits 'expression@TYPE.ID([expression [[, expression]]∗])' expression
    public String traverse(AST.static_dispatch expression) {
        // IR handling for default methods, if not null then we handled for default
        // methods
        String defaultMethodIR = irForDefaultMethod(expression);

        if (defaultMethodIR == null) {
            String traverseCaller = this.traverse(expression.caller);
            if (InheritanceGraph.restrictedInheritanceType.contains(expression.caller.type) == false) {
                // generating labels for different branches that we are going to construct.

                String labelIfEnd = UtilFunctionsIR.LabelGenerator("branch.normal", false);

                // null comparison
                String compare = UtilFunctionsIR.binaryInstruction("icmp eq", traverseCaller, "null",
                        expression.caller.type, false, false);

                UtilFunctionsIR.conditionalBreakInstruction(compare, "static.void", labelIfEnd);

                UtilFunctionsIR.LabelCreator(labelIfEnd);
            }

            // looking up for the nearest class which contains this method to be invoked
            String temp = expression.typeid;
            String nearestMethod;
            while (!GlobalVariables.mangledFunctionNames
                    .contains(UtilFunctionImpl.getMangledNameWithClassAndFunction(temp, expression.name))) {
                temp = GlobalVariables.inheritanceGraph.inheritanceGraph
                        .get(GlobalVariables.inheritanceGraph.giveClassIndex(temp)).getASTClass().parent;
            }
            nearestMethod = temp;

            // method is not present in the same class, so "bitcast" is needed
            if (expression.caller.type.equals(nearestMethod) == false) {
                System.out.println(" sending : static " + expression.caller.type);
                traverseCaller = UtilFunctionsIR.convertInstruction(traverseCaller, expression.caller.type,
                        nearestMethod, "bitcast");
            }

            StringBuilder br = new StringBuilder();
            br.append(UtilFunctionImpl.typeOfattr(nearestMethod, true)).append(" ").append(traverseCaller);

            // traversing for formals of expression.actuals
            for (AST.expression formal : expression.actuals) {
                br.append(", ").append(UtilFunctionImpl.typeOfattr(formal.type, true));
                br.append(" ").append(this.traverse(formal));
            }

            // invoking the method

            return (UtilFunctionsIR.CallInstruction(expression.type,
                    UtilFunctionImpl.getMangledNameWithClassAndFunction(nearestMethod, expression.name),
                    br.toString()));

        } else {
            return defaultMethodIR;

        }

    }

    // Visits 'if expression then expression else expression fi' expression
    public String traverse(AST.cond expression) {

        // generating labels for different branches that we are going to construct.
        String labelIfThen = UtilFunctionsIR.LabelGenerator("cond.true", false);

        String labelIfElse = UtilFunctionsIR.LabelGenerator("cond.false", false);

        String labelIfEnd = UtilFunctionsIR.LabelGenerator("branch.normal", false);
        String joinTypeResult;
        if (InheritanceGraph.restrictedInheritanceType
                .contains(expression.ifbody.type) == InheritanceGraph.restrictedInheritanceType
                        .contains(expression.elsebody.type)) {
            joinTypeResult = expression.ifbody.type;
        } else if (InheritanceGraph.restrictedInheritanceType.contains(expression.ifbody.type)
                || InheritanceGraph.restrictedInheritanceType.contains(expression.elsebody.type)) {
            joinTypeResult = Constants.ROOT_TYPE;
        } else {
            joinTypeResult = UtilFunctionImpl.joinTypesOf(expression.ifbody.type, expression.elsebody.type,
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.ifbody.type)),
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.elsebody.type)));
        }

        String allocaReturn = UtilFunctionsIR.allocaInstruction(joinTypeResult, null);

        String compare = this.traverse(expression.predicate);

        String convertIns = UtilFunctionsIR.convertInstruction(compare, "i8", "i1", "trunc");

        UtilFunctionsIR.conditionalBreakInstruction(convertIns, labelIfThen, labelIfElse);

        // generating for if-then

        UtilFunctionsIR.LabelCreator(labelIfThen);
        String ifbody = this.traverse(expression.ifbody);
        if (expression.ifbody.type.equals(joinTypeResult) == false) {
            System.out.println(" sending : ifbody " + expression.ifbody.type);
            ifbody = UtilFunctionsIR.convertInstruction(ifbody, expression.ifbody.type, joinTypeResult, "bitcast");
        }
        if (!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult)) {
            UtilFunctionsIR.storeInstruction(
                    UtilFunctionsIR.loadInstruction(ifbody, UtilFunctionImpl.typeOfattr(joinTypeResult, false)),
                    allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        } else {
            UtilFunctionsIR.storeInstruction(ifbody, allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }

        UtilFunctionsIR.breakInstruction(labelIfEnd);

        // generating for if-else

        UtilFunctionsIR.LabelCreator(labelIfElse);
        String elsebody = this.traverse(expression.elsebody);
        if (expression.elsebody.type.equals(joinTypeResult) == false) {
            System.out.println(" sending : elsebody " + expression.elsebody.type);
            elsebody = UtilFunctionsIR.convertInstruction(elsebody, expression.elsebody.type, joinTypeResult,
                    "bitcast");
        }
        if (!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult)) {
            UtilFunctionsIR.storeInstruction(
                    UtilFunctionsIR.loadInstruction(elsebody, UtilFunctionImpl.typeOfattr(joinTypeResult, false)),
                    allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        } else {
            UtilFunctionsIR.storeInstruction(elsebody, allocaReturn,
                    UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }

        UtilFunctionsIR.breakInstruction(labelIfEnd);

        // generating for if-end
        UtilFunctionsIR.LabelCreator(labelIfEnd);
        if (!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult)) {
            return allocaReturn;
        } else {
            return (UtilFunctionsIR.loadInstruction(allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false)));
        }
    }

    // Visits 'while expression loop expression pool' expression
    public String traverse(AST.loop expression) {

        String loopCondition = UtilFunctionsIR.LabelGenerator("loop.cond", false);
        String loopBody = UtilFunctionsIR.LabelGenerator("loop.body", false);
        String loopExit = UtilFunctionsIR.LabelGenerator("loop.exit", false);

        // creating the loop entry
        UtilFunctionsIR.breakInstruction(loopCondition);
        UtilFunctionsIR.LabelCreator(loopCondition);

        String loopPredicate = this.traverse(expression.predicate);

        String loopSwitcher = UtilFunctionsIR.convertInstruction(loopPredicate, "i8", "i1", "trunc");

        UtilFunctionsIR.conditionalBreakInstruction(loopSwitcher, loopBody, loopExit);

        UtilFunctionsIR.LabelCreator(loopBody);
        this.traverse(expression.body);

        UtilFunctionsIR.breakInstruction(loopCondition);
        UtilFunctionsIR.LabelCreator(loopExit);
        return "null";

    }

    // Visits '{ [expression{}]+ }' expression
    public String traverse(AST.block expression) {

        String toReturn = null;
        for (AST.expression curr_expr : expression.l1) {
            toReturn = this.traverse(curr_expr);
        }

        return toReturn;
    }

    // Visits 'new TYPE' expression
    public String traverse(AST.new_ expression) {

        if (InheritanceGraph.restrictedInheritanceType.contains(expression.typeid)) {
            return UtilFunctionImpl.primitiveValue(expression.typeid);
        }

        // calculating the bytes to allocate
        String sizeOfAllocation = GlobalVariables.mapClassSize.get(expression.typeid).toString();

        // calculating the register in which value is to be stored
        String registerToStore = UtilFunctionsIR.mallocInstruction(sizeOfAllocation);

        // register in which the allocated bytes are type casted
        String toReturn = UtilFunctionsIR.convertInstruction(registerToStore, "i8*", expression.typeid, "bitcast");

        // calling the constructor
        UtilFunctionsIR.voidCallInstruction(
                UtilFunctionImpl.getMangledNameWithClassAndFunction(expression.typeid, expression.typeid),
                UtilFunctionImpl.getIRNameForClass(expression.typeid) + "* " + toReturn);

        // store the name here
        String objBitcast = toReturn;
        if (Constants.ROOT_TYPE.equals(expression.typeid) == false) {
            System.out.println("sending : new " + expression.typeid);
            objBitcast = UtilFunctionsIR.convertInstruction(toReturn, expression.typeid, Constants.ROOT_TYPE,
                    "bitcast");
        }

        return toReturn;

    }

    // Visits 'isvoid expression' expression
    public String traverse(AST.isvoid expression) {

        // expression.e1.accept(this);
        String toReturn = this.traverse(expression.e1);

        if (InheritanceGraph.restrictedInheritanceType.contains(expression.e1.type)) {
            return "0";
        }
        String outBin = UtilFunctionsIR.binaryInstruction("icmp eq", toReturn, "null", expression.e1.type, false,
                false);
        return UtilFunctionsIR.convertInstruction(outBin, "i1", "i8", "zext");
    }

    // Visits 'expression + expression' expression
    public String traverse(AST.plus expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String toReturn = UtilFunctionsIR.binaryInstruction("add", first, second, expression.type, false, true);
        return toReturn;
    }

    // Visits 'expression - expression' expression
    public String traverse(AST.sub expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String toReturn = UtilFunctionsIR.binaryInstruction("sub", first, second, expression.type, false, true);
        return toReturn;
    }

    // Visits 'expression * expression' expression
    public String traverse(AST.mul expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String toReturn = UtilFunctionsIR.binaryInstruction("mul", first, second, expression.type, false, true);
        return toReturn;
    }

    // Visits 'expression / expression' expression
    public String traverse(AST.divide expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        // generating labels for different branches that we are going to construct.

        String labelIfEnd = UtilFunctionsIR.LabelGenerator("branch.normal", false);

        // divide by 0 check
        String compare = UtilFunctionsIR.binaryInstruction("icmp eq", second, "0", Constants.INT_TYPE, false, false);

        UtilFunctionsIR.conditionalBreakInstruction(compare, "division.0", labelIfEnd);

        UtilFunctionsIR.LabelCreator(labelIfEnd);
        String toReturn = UtilFunctionsIR.binaryInstruction("sdiv", first, second, expression.type, false, false);
        return toReturn;
    }

    // Visits 'not expression' expression
    public String traverse(AST.comp expression) {
        String first = this.traverse(expression.e1);

        String toReturn = UtilFunctionsIR.binaryInstruction("xor", first, "1", expression.e1.type, false, false);
        return toReturn;
    }

    // Visits 'expression < expression' expression
    public String traverse(AST.lt expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String out_bin = UtilFunctionsIR.binaryInstruction("icmp slt", first, second, expression.e1.type, false, false);
        String toReturn = UtilFunctionsIR.convertInstruction(out_bin, "i1", "i8", "zext");
        return toReturn;
    }

    // Visits 'expression <= expression' expression
    public String traverse(AST.leq expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String out_bin = UtilFunctionsIR.binaryInstruction("icmp sle", first, second, expression.e1.type, false, false);
        String toReturn = UtilFunctionsIR.convertInstruction(out_bin, "i1", "i8", "zext");
        return toReturn;
    }

    public String traverse(AST.eq expression) {
        String first = this.traverse(expression.e1);
        String second = this.traverse(expression.e2);

        String out_bin = UtilFunctionsIR.binaryInstruction("icmp eq", first, second, expression.e1.type, false, false);
        String toReturn = UtilFunctionsIR.convertInstruction(out_bin, "i1", "i8", "zext");
        return toReturn;
    }

    // Visits '~expression' expression
    public String traverse(AST.neg expression) {
        String first = this.traverse(expression.e1);

        String out_bin = UtilFunctionsIR.binaryInstruction("sub", "0", first, expression.type, false, true);
        return out_bin;
    }

    // Visits 'ID' expression
    public String traverse(AST.object expression) {
        if ("self".equals(expression.name)) {
            return "%this";
        }

        if (GlobalVariables.formalList.contains(expression.name)) {
            return UtilFunctionsIR.loadInstruction("%" + expression.name + ".addr",
                    UtilFunctionImpl.typeOfattr(expression.type, true));
        } else {
            String pointerToObject = UtilFunctionsIR.classAttributeGEP(GlobalVariables.presentClass, "%this",
                    expression.name);
            if (InheritanceGraph.restrictedInheritanceType.contains(expression.type)) {
                pointerToObject = UtilFunctionsIR.loadInstruction(pointerToObject,
                        UtilFunctionImpl.typeOfattr(expression.type, false));
            } else {
                pointerToObject = UtilFunctionsIR.loadInstruction(pointerToObject,
                        UtilFunctionImpl.typeOfattr(expression.type, false) + "*");
            }

            return pointerToObject;
        }

    }

    // Visits integer expression
    public String traverse(AST.int_const expression) {
        return String.valueOf(expression.value);
    }

    // Visits string expression
    public String traverse(AST.string_const expression) {
        return UtilFunctionsIR.stringGEP(expression.value);
    }

    // Visits bool expression
    public String traverse(AST.bool_const expression) {
        // System.out.println(expression.lineNo);
        if (expression.value)
            return "1";
        else
            return "0";
    }

    public void traverse(AST.program prog) {

        GlobalVariables.inheritanceGraph = new InheritanceGraph();
        System.out.println(GlobalVariables.inheritanceGraph.getRootNode().getChildren().size());
        System.out.println("t : " + GlobalVariables.inheritanceGraph.inheritanceGraph.size());

        // traversing for all AST class
        for (AST.class_ className : prog.classes) {
            GlobalVariables.inheritanceGraph.addNewClass(className);
            System.out.println(GlobalVariables.inheritanceGraph.getRootNode().getChildren().size());
            System.out.println("t : " + GlobalVariables.inheritanceGraph.inheritanceGraph.size());
        }
        System.out.println(GlobalVariables.inheritanceGraph.getRootNode().getChildren().size());
        System.out.println("t : " + GlobalVariables.inheritanceGraph.inheritanceGraph.size());
        GlobalVariables.inheritanceGraph.connectGraphCodegen();
        System.out.println("t : " + GlobalVariables.inheritanceGraph.inheritanceGraph.size());
        System.out.println(GlobalVariables.inheritanceGraph.getRootNode().getChildren().size());

        // For all functions updating mangled name
        GlobalVariables.mapClassSize.put("Int", Constants.intSize);
        GlobalVariables.mapClassSize.put("Bool", Constants.boolSize);
        GlobalVariables.mapClassSize.put("IO", Constants.ioSize);
        GlobalVariables.mapClassSize.put("Object", Constants.objectSize);
        GlobalVariables.mapClassSize.put("String", Constants.stringSize);

        // mangling the predefined classname and function name and then adding it to
        // mangledFunctionNames
        // mangling for class object
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("Object", "type_name"));
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("Object", "abort"));

        // mangling for class IO
        GlobalVariables.mangledFunctionNames.add(UtilFunctionImpl.getMangledNameWithClassAndFunction("IO", "in_int"));
        GlobalVariables.mangledFunctionNames.add(UtilFunctionImpl.getMangledNameWithClassAndFunction("IO", "out_int"));
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("IO", "in_string"));
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("IO", "out_string"));

        // mangling for class String
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("String", "concat"));
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("String", "substr"));
        GlobalVariables.mangledFunctionNames
                .add(UtilFunctionImpl.getMangledNameWithClassAndFunction("String", "length"));

        // Adding and Printing all the string constants
        GlobalVariables.output.println("; String constant declarations");

        UtilFunctionImpl.defaultStringsAppend();

        // string to store different structures
        StringBuilder buildingBlocks = new StringBuilder();

        for (Map.Entry<String, String> itr : GlobalVariables.GlobalStringToIRMap.entrySet()) {
            // Uncomment the below line if error comes ----------
            buildingBlocks.setLength(0);

            GlobalVariables.output.println(buildingBlocks.append(itr.getValue())
                    .append(" = private unnamed_addr constant [").append(itr.getKey().length() + 1).append(" x i8] c\"")
                    .append(itr.getKey()).append("\\00\", align 1").toString());
        }

        GlobalVariables.output.println();
        GlobalVariables.output.println("; Class Declarations");
        // System.out.println(GlobalVariables.inheritanceGraph.getRootNode().getChildren().size());
        GraphNode root = GlobalVariables.inheritanceGraph.getRootNode();
        GlobalVariables.output.println(UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + " = type {i8*}");
        GlobalVariables.IndexOfVariablesForClassMap.put(Constants.ROOT_TYPE, new HashMap<>());

        for (GraphNode curr : root.getChildren()) {
            UtilFunctionImpl.DFSprintClassToIR(curr);
        }
        GlobalVariables.output.println();

        // generateConstructors
        DFSGenerateConstructors(GlobalVariables.inheritanceGraph.getRootNode());
        // generate DEFAULt methodss
        UtilFunctionsIR.generateDefaultMethods();

        DFSVisitor(GlobalVariables.inheritanceGraph.getRootNode());

        UtilFunctionsIR.CmainMethod();

    }

    private void DFSGenerateConstructors(GraphNode node) {
        ScopeTableHandler.scopeTable.enterScope();

        AST.class_ cl = node.getASTClass();

        if (InheritanceGraph.restrictedInheritanceType.contains(cl.name) == true) {
            return;
        }

        // reinitializing some global variables
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.presentClass = cl.name;
        GlobalVariables.labelCounterMap.clear();
        GlobalVariables.output.println("\n; Constructor of class '" + cl.name + "'" + "\ndefine void @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(cl.name, cl.name) + "("
                + UtilFunctionImpl.getIRNameForClass(cl.name) + "* %this) {");
        UtilFunctionsIR.LabelCreator("entry");

        // creating for parent constructor i.e calling parent constructor
        String parentName = GlobalVariables.inheritanceGraph.inheritanceGraph
                .get(GlobalVariables.inheritanceGraph.giveClassIndex(cl.name)).getASTClass().parent;
        if (parentName != null) {
            System.out.println("constructio : " + cl.name);
            UtilFunctionsIR.constructorCall(parentName,
                    UtilFunctionsIR.convertInstruction("%this", cl.name, parentName, "bitcast"));
        }

        // now we visit for each attribute of AST.attr
        for (AST.feature f : cl.features) {
            if (f instanceof AST.attr) {
                ScopeTableHandler.insertVar(((AST.attr) f).name, ((AST.attr) f).typeid);
            }
        }

        for (AST.feature f : cl.features) {
            if (f instanceof AST.attr) {
                AST.attr a = (AST.attr) f;

                this.traverse(a);
            }
        }

        GlobalVariables.output.println("  " + "ret void" + "\n}");

        // traversing in a dfs fashion for children
        for (GraphNode children : node.getChildren()) {
            System.out.println(children.getASTClass().name + " : " + node.getASTClass().name);
            DFSGenerateConstructors(children);
        }

        ScopeTableHandler.scopeTable.exitScope();

    }

    private void DFSVisitor(GraphNode node) {
        ScopeTableHandler.scopeTable.enterScope();

        if (!(InheritanceGraph.restrictedType.contains(node.getASTClass().name)
                || node.getASTClass().name == Constants.ROOT_TYPE)) {
            this.traverse(node.getASTClass());
        }

        for (GraphNode children : node.getChildren()) {
            DFSVisitor(children);
        }

        ScopeTableHandler.scopeTable.exitScope();

    }

    // updating our mapMangledNames
    private void manglingNames() {
        for (GraphNode tempNode : GlobalVariables.inheritanceGraph.getNodeList()) {
            AST.class_ newClass = tempNode.getASTClass();
            for (AST.feature newfeature : newClass.features) {
                if (newfeature instanceof AST.method) {
                    AST.method m = (AST.method) newfeature;
                    System.out.println("name = " + m.name);
                    String mangeledName = UtilFunctionImpl.getMangledNameWithClass(newClass.name, m.formals, m.name);
                    System.out.println(mangeledName);
                    System.out.println(m.typeid);
                    GlobalVariables.mapMangledNames.put(mangeledName, m.typeid);

                }
                System.out.println("dffdf");
            }
        }

        for (String key : GlobalVariables.mapMangledNames.keySet()) {
            System.out.println(key);
        }
    }

    public void traverse(AST.class_ cl) {
        GlobalVariables.presentClass = cl.name;

        // checking all its features
        for (AST.feature feature : cl.features) {
            // checking for variable
            if (feature instanceof AST.attr) {
                AST.attr variable = (AST.attr) feature;
                ScopeTableHandler.insertVar(variable.name, variable.typeid);
            }
            // checking for method
            else {

                AST.method method = (AST.method) feature;
                // System.out.println("fuckling " + method.body);
                this.traverse(method);
            }
        }

    }

    // Visits the attributes of the class
    public void traverse(AST.attr attribute) {
        // creating class attribute get element pointer
        String classAttrGepReg = UtilFunctionsIR.classAttributeGEP(GlobalVariables.presentClass, "%this",
                attribute.name);

        // traversing for attribute value
        String value = this.traverse(attribute.value);

        // single pointer - gep
        if (InheritanceGraph.restrictedInheritanceType.contains(attribute.typeid) == true) {

            if (value != null) {
                // storing the default value, no assignment done here
                UtilFunctionsIR.storeInstruction(value, classAttrGepReg,
                        UtilFunctionImpl.typeOfattr(attribute.typeid, false));
            } else {
                // assignment being performed
                String defValue = "undef";
                if (attribute.typeid.equals(Constants.INT_TYPE) || attribute.typeid.equals(Constants.BOOL_TYPE))
                    defValue = "0";
                else if (attribute.typeid.equals(Constants.STRING_TYPE))
                    defValue = UtilFunctionsIR.stringGEP("");

                UtilFunctionsIR.storeInstruction(defValue, classAttrGepReg,
                        UtilFunctionImpl.typeOfattr(attribute.typeid, false));
            }
        }
        // dobule pointer - gep
        else {
            System.out.println(" printing -- " + attribute.typeid + " value = " + value);
            if (value != null) {
                // assignemnt being performed
                if (attribute.value.type.equals(attribute.typeid) == false) {
                    if (InheritanceGraph.restrictedInheritanceType.contains(attribute.value.type)
                            && attribute.typeid.equals(Constants.ROOT_TYPE)) {
                        // attribute.value.type is primitive, hence we need to create a new object, as
                        // they cant be stored in object struct directly

                        AST.new_ objCreated = new AST.new_(Constants.ROOT_TYPE, 0);
                        // setting its type to root type
                        objCreated.type = Constants.ROOT_TYPE;

                        value = this.traverse(objCreated);
                    } else {
                        String presentClass = GlobalVariables.inheritanceGraph.inheritanceGraph
                                .get(GlobalVariables.inheritanceGraph.giveClassIndex(attribute.value.type))
                                .getASTClass().parent;

                        String ancesstorClass = attribute.value.type;

                        // iterate until presentClass is same as attribute.typeid
                        while (attribute.typeid.equals(presentClass) == false) {
                            System.out.println("attr: " + ancesstorClass);
                            value = UtilFunctionsIR.convertInstruction(value, ancesstorClass, presentClass, "bitcast");

                            ancesstorClass = presentClass;
                            // going towards parent
                            presentClass = GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(presentClass))
                                    .getASTClass().parent;
                        }
                        System.out.println("attr: " + ancesstorClass);
                        value = UtilFunctionsIR.convertInstruction(value, ancesstorClass, attribute.typeid, "bitcast");
                    }

                    UtilFunctionsIR.doublePointerStoreInstruction(value, classAttrGepReg, attribute.typeid);
                } else {

                    UtilFunctionsIR.doublePointerStoreInstruction(value, classAttrGepReg, attribute.typeid);

                }
            } else {

                // storing null for pointer as assignment is not performed
                UtilFunctionsIR.doublePointerStoreInstruction("null", classAttrGepReg, attribute.typeid);
            }
        }
    }

    // Visits the method of the class
    public void traverse(AST.method method) {
        // a new scope, as local variables in a function hides the scope of the
        // member variables of the class
        ScopeTableHandler.scopeTable.enterScope();

        GlobalVariables.GlobalRegisterCounter = 0;
        String methodBody = UtilFunctionsIR.LabelGenerator("method.body", true);

        if (GlobalVariables.presentClass.equals("Main") && ("main").equals(method.name)) {
            GlobalVariables.mainRet = method.typeid;
        }
        GlobalVariables.formalList.clear();
        GlobalVariables.output.println("\n; Class: " + GlobalVariables.presentClass + ", Method: " + method.name);
        GlobalVariables.output.print("define " + UtilFunctionImpl.typeOfattr(method.typeid, true) + " @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(GlobalVariables.presentClass, method.name) + "(");
        GlobalVariables.output.print(UtilFunctionImpl.getIRNameForClass(GlobalVariables.presentClass) + "* %this");

        for (AST.formal fm : method.formals) {
            GlobalVariables.output.print(", ");
            this.traverse(fm);
        }

        GlobalVariables.output.println(") {");
        UtilFunctionsIR.LabelCreator("entry");

        // traversing the formal list
        for (AST.formal f : method.formals) {
            UtilFunctionsIR.allocaInstruction(UtilFunctionImpl.typeOfattr(f.typeid, true), f.name + ".addr");
            UtilFunctionsIR.storeInstruction("%" + f.name, "%" + f.name + ".addr",
                    UtilFunctionImpl.typeOfattr(f.typeid, true));

        }

        UtilFunctionsIR.breakInstruction(methodBody);

        UtilFunctionsIR.LabelCreator("static.void");
        UtilFunctionsIR.voidCallInstruction("print_dispatch_on_void_error", "");
        UtilFunctionsIR.breakInstruction(methodBody);

        UtilFunctionsIR.LabelCreator("division.0");
        UtilFunctionsIR.voidCallInstruction("print_div_by_zero_err_msg", "");
        UtilFunctionsIR.breakInstruction(methodBody);

        // bitcasting
        UtilFunctionsIR.LabelCreator(methodBody);
        String register = this.traverse(method.body);

        if (method.typeid.equals(method.body.type) == false) {
            System.out.println("method body: " + method.body.type);
            register = UtilFunctionsIR.convertInstruction(register, method.body.type, method.typeid, "bitcast");
        }

        String returnInst = "  " + "ret " + UtilFunctionImpl.typeOfattr(method.typeid, true) + " " + register;
        GlobalVariables.output.println(returnInst);
        GlobalVariables.output.println("}");

        ScopeTableHandler.scopeTable.exitScope();
    }

    // Visits the formals of the method
    public void traverse(AST.formal f) {
        ScopeTableHandler.insertVar(f.name, f.typeid);
        GlobalVariables.formalList.add(f.name);
        GlobalVariables.output.print(UtilFunctionImpl.typeOfattr(f.typeid, true) + " %" + f.name);
    }

}