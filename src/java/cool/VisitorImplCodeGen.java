package cool;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import cool.AST;
import cool.GlobalVariables;
import cool.InheritanceGraph;
import cool.ScopeTable;
import cool.ScopeTableHandler;

import java.util.HashSet;
import java.lang.StringBuilder;

class VisitorImplCodeGen {
    /*
     * NOTE: to know about the individual visit functions Check Visitor.java
     */

    // Expression visitors

    // Used for no_expression
    public void traverse(AST.expression expression) {
        if (expression instanceof AST.no_expr) {
            AST.no_expr exp = (AST.no_expr) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.assign) {
            AST.assign exp = (AST.assign) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.assign) {
            AST.assign exp = (AST.assign) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.static_dispatch) {
            AST.static_dispatch exp = (AST.static_dispatch) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.dispatch) {
            AST.dispatch exp = (AST.dispatch) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.cond) {
            AST.cond exp = (AST.cond) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.loop) {
            AST.loop exp = (AST.loop) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.block) {
            AST.block exp = (AST.block) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.let) {
            AST.let exp = (AST.let) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.typcase) {
            AST.typcase exp = (AST.typcase) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.new_) {
            AST.new_ exp = (AST.new_) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.isvoid) {
            AST.isvoid exp = (AST.isvoid) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.plus) {
            AST.plus exp = (AST.plus) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.sub) {
            AST.sub exp = (AST.sub) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.mul) {
            AST.mul exp = (AST.mul) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.divide) {
            AST.divide exp = (AST.divide) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.comp) {
            AST.comp exp = (AST.comp) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.let) {
            AST.let exp = (AST.let) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.lt) {
            AST.lt exp = (AST.lt) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.leq) {
            AST.leq exp = (AST.leq) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.eq) {
            AST.eq exp = (AST.eq) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.neg) {
            AST.neg exp = (AST.neg) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.object) {
            AST.object exp = (AST.object) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.int_const) {
            AST.int_const exp = (AST.int_const) expression;
            this.traverse(exp);
        } else if (expression instanceof AST.string_const) {
            AST.string_const exp = (AST.string_const) expression;
            this.traverse(exp);
        } else {
            AST.bool_const exp = (AST.bool_const) expression;
            this.traverse(exp);
        }

    }

    public void traverse(AST.no_expr expression) {
        expression.type = "_no_type";

    }

    // Visits 'ID <- expression' expression
    public void traverse(AST.assign expression) {
        // assignment expression
        // expression.e1.accept(this);
        this.traverse(expression.e1);

        if (expression.name.equals("self")) {
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                    "'self' cannot be assigned");
        } else {
            String typeExpr = ScopeTableHandler.scopeTable
                    .lookUpGlobal(ScopeTableHandler.getMangledNameVar(expression.name));
            // attribute not present in the scope table
            if (typeExpr == null) {
                String errStr = new StringBuilder().append("Attribute '").append(expression.name)
                        .append("' is not defined").toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errStr);
            }
            // checking for assigment
            else if (typeExpr.equals(expression.e1.type) || typeExpr.equals(Constants.ROOT_TYPE)) {

            } else if (InheritanceGraph.restrictedInheritanceType.contains(typeExpr)
                    || InheritanceGraph.restrictedInheritanceType.contains(expression.e1.type)) {
                String errStr = new StringBuilder().append("Attribute '").append(expression.name)
                        .append("' is not consistent with type of expression").toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errStr);
            } else if (!UtilFunctionImpl.typeChecker(typeExpr, expression.e1.type,
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(typeExpr)),
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.e1.type)))) {
                String errStr = new StringBuilder().append("Attribute '").append(expression.name)
                        .append("' is not consistent with type of expression").toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errStr);

            }

        }
        // all correct :-)
        expression.type = expression.e1.type;

    }

    // Visits 'expression@TYPE.ID([expression [[, expression]]∗])' expression
    public void traverse(AST.static_dispatch expression) {
        // expression.caller.accept(this);
        this.traverse(expression.caller);

        String caller = expression.caller.type;
        for (AST.expression expr : expression.actuals) {
            // expr.accept(this);
            this.traverse(expr);
        }

        // return type not defined
        if (GlobalVariables.inheritanceGraph.containsClass(expression.typeid) == false) {
            String errString = new StringBuilder().append("Type undefined '").append(expression.typeid).append("'")
                    .toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
        } else if (expression.typeid.equals(caller) || Constants.ROOT_TYPE.equals(expression.typeid)) {

        } else if (InheritanceGraph.restrictedInheritanceType.contains(expression.typeid)
                || InheritanceGraph.restrictedInheritanceType.contains(caller)) {
            String errString = new StringBuilder().append("Type mismatch for caller '").append(caller)
                    .append("' expected '").append(expression.typeid + "'").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
            expression.type = Constants.ROOT_TYPE;

        } else if (!UtilFunctionImpl.typeChecker(expression.typeid, caller,
                GlobalVariables.inheritanceGraph.inheritanceGraph
                        .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.typeid)),
                GlobalVariables.inheritanceGraph.inheritanceGraph
                        .get(GlobalVariables.inheritanceGraph.giveClassIndex(caller)))) {
            String errString = new StringBuilder().append("Type mismatch for caller '").append(caller)
                    .append("' expected '").append(expression.typeid + "'").toString();
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(), errString);
            expression.type = Constants.ROOT_TYPE;
        }

        else {
            String methodMangled = UtilFunctionImpl.getMangledNameWithExpression(expression.typeid, expression.actuals,
                    expression.name);
            if (!GlobalVariables.mapMangledNames.containsKey(methodMangled)) {
                String errString = new StringBuilder().append("Undefined method '").append(expression.name)
                        .append("' for dispatch").toString();
                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                        errString);
                expression.type = Constants.ROOT_TYPE;
            } else {
                expression.type = GlobalVariables.mapMangledNames.get(methodMangled);
            }
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
    public void traverse(AST.cond expression) {

        // expression.predicate.accept(this);
        // expression.ifbody.accept(this);
        // expression.elsebody.accept(this);
        this.traverse(expression.predicate);
        this.traverse(expression.ifbody);
        this.traverse(expression.elsebody);

        if (expression.predicate.type.equals(Constants.BOOL_TYPE) == false) {
            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, expression.getLineNo(),
                    "Return type of condtion predicate is not BOOL ");
        }
        if (expression.ifbody.type.equals(expression.elsebody.type)) {
            expression.type = expression.ifbody.type;
        } else if (InheritanceGraph.restrictedInheritanceType.contains(expression.ifbody.type)
                || InheritanceGraph.restrictedInheritanceType.contains(expression.elsebody.type)) {
            expression.type = Constants.ROOT_TYPE;
        } else {
            expression.type = UtilFunctionImpl.joinTypesOf(expression.ifbody.type, expression.elsebody.type,
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.ifbody.type)),
                    GlobalVariables.inheritanceGraph.inheritanceGraph
                            .get(GlobalVariables.inheritanceGraph.giveClassIndex(expression.elsebody.type)));
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

        if(GlobalVariables.presentClass.equals("Main") && ("main").equals(method.name))
        {
            GlobalVariables.mainRet = method.typeid;
        }
        GlobalVariables.formalList.clear();
        GlobalVariables.output.println("\n; Class: "+GlobalVariables.presentClass+", Method: "+method.name);
        GlobalVariables.output.print("define " + UtilFunctionImpl.typeOfattr(method.typeid, true) + " @" + 
            UtilFunctionImpl.getMangledNameWithClassAndFunction(GlobalVariables.presentClass, method.name) + "(");
        GlobalVariables.output.print(UtilFunctionImpl.getIRNameForClass(GlobalVariables.presentClass)+"* %this");

        for(AST.formal fm: method.formals) {
            GlobalVariables.output.print(", ");
            this.traverse(fm);
        }

        GlobalVariables.output.println(") {");
        UtilFunctionsIR.LabelCreator("entry");

        //WRITE BELOW FUNCTIONS
        ScopeTableHandler.scopeTable.exitScope();
    }

    // Visits the formals of the method
    public void traverse(AST.formal f) {
        ScopeTableHandler.scopeTable.insert(f.name, f.typeid);
        GlobalVariables.formalList.add(f.name);
        GlobalVariables.output.print(UtilFunctionImpl.typeOfattr(f.typeid, true) + " %" + f.name);
    }

}