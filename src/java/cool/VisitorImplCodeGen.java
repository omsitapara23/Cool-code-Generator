package cool;

import java.util.HashMap;
import java.util.Map;

class VisitorImplCodeGen {
    /*
     * NOTE: to know about the individual visit functions Check Visitor.java
     */

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
        } else if (expression instanceof AST.dispatch) {
            AST.dispatch exp = (AST.dispatch) expression;
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
        } else if (expression instanceof AST.let) {
            AST.let exp = (AST.let) expression;
            return this.traverse(exp);
        } else if (expression instanceof AST.typcase) {
            AST.typcase exp = (AST.typcase) expression;
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
        } else if (expression instanceof AST.let) {
            AST.let exp = (AST.let) expression;
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
        } else {
            AST.bool_const exp = (AST.bool_const) expression;
            return this.traverse(exp);
        }

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

                String GepForType = UtilFunctionsIR.typeNameGEP(newType);
                String GepString = UtilFunctionsIR.stringGEP(expression.e1.type);
                UtilFunctionsIR.storeInstruction(GepString, GepForType, "i8*");

            }

            else {
                newType = UtilFunctionsIR.convertInstruction(returnString, expression.e1.type, varToStoreType,
                        UtilFunctionsIR.BITCAST);
            }
        }

        if (GlobalVariables.formalList.contains(expression.name)) {
            // directly taking the function parameter
            varToStore = "%" + expression.name + " .addr";
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
            ir = UtilFunctionsIR.convertInstruction(callInst, "i64", "i32", UtilFunctionsIR.TRUNC);

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
                String labelIfThen = UtilFunctionsIR.LabelGenerator("if.then", false);

                String labelIfElse = UtilFunctionsIR.LabelGenerator("if.else", false);

                String labelIfEnd = UtilFunctionsIR.LabelGenerator("if.end", false);

                // null comparison
                String compare = UtilFunctionsIR.binaryInstruction(UtilFunctionsIR.EQ, traverseCaller, "null",
                        expression.caller.type, false, false);

                UtilFunctionsIR.conditionalBreakInstruction(compare, labelIfThen, labelIfElse);

                UtilFunctionsIR.LabelCreator(labelIfThen);
                UtilFunctionsIR.voidCallInstruction(Constants.FUNCTION_VOID_CALL, "i32 " + expression.lineNo);
                GlobalVariables.output.println(UtilFunctionsIR.INDENT + "call void @exit(i32 1)");

                UtilFunctionsIR.breakInstruction(labelIfEnd);

                UtilFunctionsIR.LabelCreator(labelIfElse);
                UtilFunctionsIR.breakInstruction(labelIfEnd);

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


            // method is not present in the same class, so bitcast is needed
            if(expression.caller.type.equals(nearestMethod) == false)
            {
                traverseCaller = UtilFunctionsIR.convertInstruction(traverseCaller, expression.caller.type, nearestMethod, UtilFunctionsIR.BITCAST);
            }

            StringBuilder br = new StringBuilder();
            br.append(UtilFunctionImpl.typeOfattr(nearestMethod, true)).append(" ").append(traverseCaller);

            // traversing for formals of expression.actuals
            for(AST.expression formal : expression.actuals)
            {
                br.append(", ").append(UtilFunctionImpl.typeOfattr(formal.type, true));
                br.append(" ").append(this.traverse(formal)); 
            }

            // invoking the method

            return(UtilFunctionsIR.CallInstruction(expression.type, UtilFunctionImpl.getMangledNameWithClassAndFunction(nearestMethod, expression.name), br.toString()));


        } else {
            return defaultMethodIR;

        }

    }

    

    // Visits 'expression.ID([expression [[, expression]]∗])' expression
    public void traverse(AST.dispatch expression) {
        // expression.caller.accept(this);
        this.traverse(expression.caller);
        String callingClass = expression.caller.type;
        System.out.println(callingClass);
        // class contains no method - INT or Bool
        if (InheritanceGraph.classWithNoMethodType.contains(callingClass)) {
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                    "Method is not defined '" + expression.name + "'");
            return;
        }

        for (AST.expression e : expression.actuals)
            // e.accept(this);
            this.traverse(e);

        String methodMangled = UtilFunctionImpl.getMangledNameWithExpression(callingClass, expression.actuals,
                expression.name);
        System.out.println("methodMangled = " + methodMangled);
        String typeMethod;
        if (!GlobalVariables.mapMangledNames.containsKey(methodMangled)) {
            typeMethod = null;
            while (typeMethod == null) {
                System.out
                        .println(callingClass + "   " + GlobalVariables.inheritanceGraph.giveClassIndex(callingClass));
                callingClass = GlobalVariables.inheritanceGraph.inheritanceGraph
                        .get(GlobalVariables.inheritanceGraph.giveClassIndex(callingClass)).getASTClass().parent;
                if (callingClass != null) {
                    methodMangled = UtilFunctionImpl.getMangledNameWithExpression(callingClass, expression.actuals,
                            expression.name);
                    System.out.println("methodMangledinside = " + methodMangled);
                    if (GlobalVariables.mapMangledNames.containsKey(methodMangled)) {
                        typeMethod = GlobalVariables.mapMangledNames.get(methodMangled);
                        System.out.println("typeMangled = " + typeMethod);
                    }
                } else {
                    System.out.println("breaking");
                    break;
                }

            }
        } else {
            typeMethod = GlobalVariables.mapMangledNames.get(methodMangled);
            System.out.println("typeMangled2 = " + typeMethod);
        }
        if (typeMethod == null) {
            // method is not found
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                    "Method signature undefined for '" + expression.name + "'");
            // to run without errors
            expression.type = Constants.ROOT_TYPE;

        } else {
            expression.type = typeMethod;
        }

    }

    // Visits 'if expression then expression else expression fi' expression
    public String traverse(AST.cond expression) {

        // generating labels for different branches that we are going to construct.
        String labelIfThen = UtilFunctionsIR.LabelGenerator("if.then", false);

        String labelIfElse = UtilFunctionsIR.LabelGenerator("if.else", false);

        String labelIfEnd = UtilFunctionsIR.LabelGenerator("if.end", false);

        String joinTypeResult = UtilFunctionImpl.joinTypesOf(expression.ifbody.type, expression.elsebody.type,
        GlobalVariables.inheritanceGraph.inheritanceGraph
                .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.ifbody.type)),
        GlobalVariables.inheritanceGraph.inheritanceGraph
                .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.elsebody.type)));

        String allocaReturn = UtilFunctionsIR.allocaInstruction(joinTypeResult, null);

        String compare = this.traverse(expression.predicate);

        String convertIns = UtilFunctionsIR.convertInstruction(compare, "i8", "i1", UtilFunctionsIR.TRUNC);

        UtilFunctionsIR.conditionalBreakInstruction(convertIns, labelIfThen, labelIfElse);

        // generating for if-then

        UtilFunctionsIR.LabelCreator(labelIfThen);
        String ifbody = this.traverse(expression.ifbody);
        if(expression.ifbody.type.equals(joinTypeResult) == false)
        {
            ifbody = UtilFunctionsIR.convertInstruction(ifbody, expression.ifbody.type, joinTypeResult, UtilFunctionsIR.BITCAST);
        }
        if(!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult))
        {
            UtilFunctionsIR.storeInstruction(UtilFunctionsIR.loadInstruction(ifbody, UtilFunctionImpl.typeOfattr(joinTypeResult, false) ), allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }
        else
        {
            UtilFunctionsIR.storeInstruction(ifbody, allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }

        UtilFunctionsIR.breakInstruction(labelIfEnd);


        // generating for if-else

        UtilFunctionsIR.LabelCreator(labelIfElse);
        String elsebody = this.traverse(expression.elsebody);
        if(expression.elsebody.type.equals(joinTypeResult) == false)
        {
            elsebody = UtilFunctionsIR.convertInstruction(elsebody, expression.elsebody.type, joinTypeResult, UtilFunctionsIR.BITCAST);
        }
        if(!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult))
        {
            UtilFunctionsIR.storeInstruction(UtilFunctionsIR.loadInstruction(elsebody, UtilFunctionImpl.typeOfattr(joinTypeResult, false) ), allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }
        else
        {
            UtilFunctionsIR.storeInstruction(elsebody, allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false));
        }

        UtilFunctionsIR.breakInstruction(labelIfEnd);

        //generating for if-end
        UtilFunctionsIR.LabelCreator(labelIfEnd);
        if(!InheritanceGraph.restrictedInheritanceType.contains(joinTypeResult))
        {
            return allocaReturn;
        }
        else
        {
            return(UtilFunctionsIR.loadInstruction(allocaReturn, UtilFunctionImpl.typeOfattr(joinTypeResult, false)));
        }
    }

    // Visits 'while expression loop expression pool' expression
    public void traverse(AST.loop expression) {

        // accepting for loop body and predicate
        // expression.predicate.accept(this);
        // expression.body.accept(this);
        this.traverse(expression.predicate);
        this.traverse(expression.body);
        if (expression.predicate.type.compareTo(Constants.BOOL_TYPE) != 0) {
            String errString = new StringBuilder().append(" loop predicate type does not match will bool type")
                    .toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }

        // to prevent errors
        expression.type = Constants.ROOT_TYPE;
    }

    // Visits '{ [expression{}]+ }' expression
    public void traverse(AST.block expression) {

        for (AST.expression e : expression.l1) {
            // e.accept(this);
            this.traverse(e);
        }
        // type of block is defined as type of last expression
        expression.type = expression.l1.get(expression.l1.size() - 1).type;

    }

    // Visits 'let ID : TYPE [<-expression] in expression' expression
    // NOTE: muliple ID declaration is converted to nested let by parser
    public void traverse(AST.let expression) {

        // let expression defines a new scope
        ScopeTableHandler.scopeTable.enterScope();

        if (expression.name.compareTo("self") != 0) {
            if (GlobalVariables.inheritanceGraph.containsClass(expression.typeid) == false) {
                // the defined type does not exist
                String errString = new StringBuilder().append("'").append(expression.typeid).append("' is not defined ")
                        .toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                        errString);

                // to run the code without errors
                expression.typeid = Constants.ROOT_TYPE;

            }

            ScopeTableHandler.insertVar(expression.name, expression.typeid);

            // assignment is possible
            if (!(expression.value instanceof AST.no_expr)) {
                // expression is visited
                // expression.value.accept(this);
                this.traverse(expression.value);

                // assignment and variable type checking
                if (expression.typeid.equals(expression.value.type) || Constants.ROOT_TYPE.equals(expression.typeid)) {

                } else if (!InheritanceGraph.restrictedInheritanceType.contains(expression.typeid)
                        && !InheritanceGraph.restrictedInheritanceType.contains(expression.value.type)) {
                    if (!UtilFunctionImpl.typeChecker(expression.typeid, expression.value.type,
                            GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.typeid)),
                            GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.value.type)))) {
                        String errString = new StringBuilder().append("Type of attribute '")
                                .append(expression.value.type).append("' and expression type '").append(expression.type)
                                .append("' do not equate").toString();
                        GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                                errString);

                    }
                } else {
                    String errString = new StringBuilder().append("Type of attribute '").append(expression.value.type)
                            .append("' and expression type '").append(expression.type).append("' do not equate")
                            .toString();
                    GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                            errString);
                }

            }
        } else {
            // 'let' expression cannot bound 'self'
            String errString = new StringBuilder().append(" expression name cannot be of type 'self'").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);

        }

        // accepting for 'let' body
        // expression.body.accept(this);
        this.traverse(expression.body);
        expression.type = expression.body.type;
        ScopeTableHandler.scopeTable.exitScope();

    }

    // Visits 'case expression of [ID : TYPE => expression{}]+ esac' expression
    public void traverse(AST.typcase expression) {

        // join of all branches gives us the type of typecase expression
        // expression.predicate.accept(this);
        this.traverse(expression.predicate);

        // here we accept and then joining types of all other branches
        for (int i = 0; i < expression.branches.size(); i++) {
            // expression.branches.get(i).accept(this);
            this.traverse(expression.branches.get(i));

            // for first index we need to compute separately
            if (i == 0) {
                expression.type = expression.branches.get(i).value.type;
            } else {
                if (expression.type.equals(expression.branches.get(i).value.type)) {
                    expression.type = expression.branches.get(i).value.type;
                } else if (InheritanceGraph.restrictedInheritanceType.contains(expression.type)
                        || InheritanceGraph.restrictedInheritanceType.contains(expression.branches.get(i).value.type)) {
                    expression.type = Constants.ROOT_TYPE;
                } else {
                    expression.type = UtilFunctionImpl.joinTypesOf(expression.type,
                            expression.branches.get(i).value.type,
                            GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.type)),
                            GlobalVariables.inheritanceGraph.inheritanceGraph.get(GlobalVariables.inheritanceGraph
                                    .giveClassIndex(expression.branches.get(i).value.type)));
                }

            }
        }
    }

    // Visits 'ID : TYPE => expression{}'
    // This is not an expression, but used inside case
    public void traverse(AST.branch branch) {

        // defines a new scope
        ScopeTableHandler.scopeTable.enterScope();
        if (branch.name.compareTo("self") != 0) {
            if (GlobalVariables.inheritanceGraph.containsClass(branch.type)) {
                String errString = new StringBuilder().append(" Type '").append(branch.type).append("' is not defined")
                        .toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, branch.getLineNo(), errString);

                branch.type = Constants.ROOT_TYPE;
            }
            ScopeTableHandler.insertVar(branch.name, branch.type);

        } else {
            // 'case' cannot bound a 'self' type
            String errString = new StringBuilder().append(" 'case' name cannot be of type 'self'").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, branch.getLineNo(), errString);
        }
        // branch.value.accept(this);
        this.traverse(branch.value);
        ScopeTableHandler.scopeTable.exitScope();
    }

    // Visits 'new TYPE' expression
    public void traverse(AST.new_ expression) {

        if (GlobalVariables.inheritanceGraph.containsClass(expression.typeid)) {
            expression.type = expression.typeid;
        } else {
            String errString = new StringBuilder().append(" Type '").append(expression.typeid)
                    .append("' is not defined").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);

            // to run without errors
            expression.type = Constants.ROOT_TYPE;
        }
    }

    // Visits 'isvoid expression' expression
    public void traverse(AST.isvoid expression) {

        // expression.e1.accept(this);
        this.traverse(expression.e1);

        // assigning type to bool type
        expression.type = Constants.BOOL_TYPE;
    }

    // Visits 'expression + expression' expression
    public void traverse(AST.plus expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);

        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("Addition called on non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.INT_TYPE;
    }

    // Visits 'expression - expression' expression
    public void traverse(AST.sub expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);

        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("Subtraction called on non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.INT_TYPE;
    }

    // Visits 'expression * expression' expression
    public void traverse(AST.mul expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);

        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("Multiplication called on non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.INT_TYPE;
    }

    // Visits 'expression / expression' expression
    public void traverse(AST.divide expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);
        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("Division called on non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.INT_TYPE;
    }

    // Visits 'not expression' expression
    public void traverse(AST.comp expression) {
        // expression.e1.accept(this);
        this.traverse(expression.e1);
        if (!Constants.BOOL_TYPE.equals(expression.e1.type)) {
            String errString = new StringBuilder().append("Compliment of bool type found").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.BOOL_TYPE;
    }

    // Visits 'expression < expression' expression
    public void traverse(AST.lt expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);
        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("cannot comapre two non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.BOOL_TYPE;
    }

    // Visits 'expression <= expression' expression
    public void traverse(AST.leq expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);
        if (!Constants.INT_TYPE.equals(expression.e1.type) || !Constants.INT_TYPE.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("cannot comapre two non int types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.BOOL_TYPE;
    }

    public void traverse(AST.eq expression) {
        // expression.e1.accept(this);
        // expression.e2.accept(this);
        this.traverse(expression.e1);
        this.traverse(expression.e2);
        System.out.println(expression.e1.type + "   " + expression.e2.type);
        if (!expression.e1.type.equals(expression.e2.type)) {
            String errString = new StringBuilder().append("cannot comapre two diffrent types").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.BOOL_TYPE;
    }

    // Visits '~expression' expression
    public void traverse(AST.neg expression) {
        // expression.e1.accept(this);
        this.traverse(expression.e1);
        if (!Constants.INT_TYPE.equals(expression.e1.type)) {
            String errString = new StringBuilder().append("cannot negate non int type").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        }
        expression.type = Constants.INT_TYPE;
    }

    // Visits 'ID' expression
    public void traverse(AST.object expression) {
        if (expression.name.equals("self")) {
            expression.type = GlobalVariables.presentClass;
        } else {
            String ty = ScopeTableHandler.scopeTable.lookUpGlobal(ScopeTableHandler.getMangledNameVar(expression.name));
            if (ty == null) {
                expression.type = Constants.ROOT_TYPE;
                String errString = new StringBuilder().append("No defination for '").append(expression.name)
                        .append("' found").toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                        errString);
            } else
                expression.type = ty;
        }

    }

    // Visits integer expression
    public void traverse(AST.int_const expression) {
        expression.type = Constants.INT_TYPE;
    }

    // Visits string expression
    public void traverse(AST.string_const expression) {
        expression.type = Constants.STRING_TYPE;
    }

    // Visits bool expression
    public void traverse(AST.bool_const expression) {
        expression.type = Constants.BOOL_TYPE;
    }

    public void traverse(AST.program prog) {

        GlobalVariables.inheritanceGraph = new InheritanceGraph();

        // traversing for all AST class
        for (AST.class_ className : prog.classes) {
            if (GlobalVariables.GlobalStringToIRMap.containsKey(className.name) == false) {
                GlobalVariables.GlobalStringToIRMap.put(className.name,
                        "@.str. " + GlobalVariables.GlobalStringCounter);
                GlobalVariables.GlobalStringCounter++;
            }
            GlobalVariables.inheritanceGraph.addNewClass(className);
        }

        GlobalVariables.inheritanceGraph.connectGraph();

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
            // buildingBlocks.setLength(0);

            GlobalVariables.output.println(buildingBlocks.append(itr.getValue())
                    .append(" = private unnamed_addr constant [").append(itr.getKey().length() + 1).append(" x i8] c\"")
                    .append(itr.getKey()).append("\\00\", align 1").toString());
        }

        GlobalVariables.output.println();
        GlobalVariables.output.println(": Class Declarations");
        GraphNode root = GlobalVariables.inheritanceGraph.getRootNode();
        GlobalVariables.output.println(UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + " = type {i8*}");
        GlobalVariables.IndexOfVariablesForClassMap.put(Constants.ROOT_TYPE, new HashMap<>());

        for (GraphNode curr : root.getChildren()) {
            UtilFunctionImpl.DFSprintClassToIR(curr);
        }
        GlobalVariables.output.println();

        DFSVisitor(GlobalVariables.inheritanceGraph.getRootNode());

        // generateConstructors
        // generate DEFAULt methodss

    }

    private void DFSVisitor(GraphNode node) {
        ScopeTableHandler.scopeTable.enterScope();

        if (!(InheritanceGraph.restrictedInheritanceType.contains(node.getASTClass().name)
                || node.getASTClass().name == Constants.ROOT_TYPE))
            this.traverse(node.getASTClass());

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
                    String mangeledName = UtilFunctionImpl.getMangledNameWithClass(1, newClass.name, m.formals, m.name);
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
                this.traverse(method);
            }
        }

    }

    // Visits the attributes of the class
    public void traverse(AST.attr attribute) {
        if (attribute.name.equals("self")) {
            ScopeTableHandler.scopeTable.remove(ScopeTableHandler.getMangledNameVar(attribute.name));
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(),
                    "Attribute with name 'self' cannot be defined.");

            // attribute.value.accept(this);

        } else if (!GlobalVariables.inheritanceGraph.containsClass(attribute.typeid)) {
            String errString = new StringBuilder().append("Attribute '").append(attribute.name).append("' type '")
                    .append(attribute.typeid).append("' has not been defined.").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(), errString);

            // For this case, we set the type id of attribute to ROOT_TYPE
            // this is done to continue compilation
            ScopeTableHandler.insertVar(attribute.name, Constants.ROOT_TYPE);

            // attribute.value.accept(this);
            this.traverse(attribute.value);
            // this.traverse(attribute.value);

        } else {

            // attribute.value.accept(this);
            this.traverse(attribute.value);

            // check for no expression here------------------------
            System.out.println(
                    attribute.typeid + "  " + attribute.value.type + attribute.getLineNo() + "  " + attribute.value);
            System.out.println(GlobalVariables.inheritanceGraph.giveClassIndex(attribute.typeid) + "   "
                    + GlobalVariables.inheritanceGraph.giveClassIndex(attribute.value.type));
            if (!(attribute.value instanceof AST.no_expr)) {
                if (attribute.typeid.equals(attribute.value.type) || Constants.ROOT_TYPE.equals(attribute.typeid)) {

                } else if (!InheritanceGraph.restrictedInheritanceType.contains(attribute.typeid)
                        && !InheritanceGraph.restrictedInheritanceType.contains(attribute.value.type)) {
                    if (!UtilFunctionImpl.typeChecker(attribute.typeid, attribute.value.type,
                            GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(attribute.typeid)),
                            GlobalVariables.inheritanceGraph.inheritanceGraph
                                    .get(GlobalVariables.inheritanceGraph.giveClassIndex(attribute.value.type)))) {
                        String errString = new StringBuilder().append("Attribute '").append(attribute.name)
                                .append("' type '").append(attribute.typeid)
                                .append("' does not match to its expression.").toString();
                        GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(),
                                errString);
                    }
                } else {
                    String errString = new StringBuilder().append("Attribute '").append(attribute.name)
                            .append("' type '").append(attribute.typeid).append("' does not match to its expression.")
                            .toString();
                    GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(),
                            errString);

                }
            }

        }

    }

    // Visits the method of the class
    public void traverse(AST.method method) {
        // a new scope, as local variables in a function hides the scope of the
        // member variables of the class
        ScopeTableHandler.scopeTable.enterScope();

        GlobalVariables.GlobalRegisterCounter = 0;

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
            UtilFunctionsIR.allocaInstruction(UtilFunctionImpl.typeOfattr(f.typeid, true), f.name + " .addr");
            UtilFunctionsIR.storeInstruction("%" + f.name, "%" + f.name + " .addr",
                    UtilFunctionImpl.typeOfattr(f.typeid, true));

        }

        // bitcasting
        String register = this.traverse(method.body);
        if (method.typeid.equals(method.body.type) == false) {
            register = UtilFunctionsIR.convertInstruction(register, method.body.type, method.typeid,
                    UtilFunctionsIR.BITCAST);
        }

        String returnInst = UtilFunctionsIR.INDENT + "ret " + UtilFunctionImpl.typeOfattr(method.typeid, true) + " "
                + register;
        GlobalVariables.output.println(returnInst);
        GlobalVariables.output.println("}");

        ScopeTableHandler.scopeTable.exitScope();
    }

    // Visits the formals of the method
    public void traverse(AST.formal f) {
        ScopeTableHandler.scopeTable.insert(f.name, f.typeid);
        GlobalVariables.formalList.add(f.name);
        GlobalVariables.output.print(UtilFunctionImpl.typeOfattr(f.typeid, true) + " %" + f.name);
    }

}