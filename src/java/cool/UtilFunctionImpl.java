package cool;

import java.util.ArrayList;
import java.util.List;
import java.util.*;

import cool.AST;
import cool.GlobalVariables;
import cool.InheritanceGraph;
import cool.ScopeTable;
import cool.ScopeTableHandler;

import java.lang.StringBuilder;

class UtilFunctionImpl {
    public static String getMangledNameWithExpression(String className, List<AST.expression> expressions,
            String functionName) {
        StringBuilder mangledName = new StringBuilder();

        // Adding class name to mangledName
        mangledName.append("_C");
        if (className == null)
            mangledName.append(0);
        else
            mangledName.append(className.length()).append(className);

        // Adding function name to mangledName
        mangledName.append("_F");
        if (functionName == null)
            mangledName.append(0);
        else
            mangledName.append(functionName.length()).append(functionName);

        // Adding arguments to mangledName
        if (expressions != null) {
            mangledName.append("_A").append(expressions.size()).append("_");
            int total = 0;
            for (AST.expression tempexpression : expressions) {
                total++;
                mangledName.append(total).append("N").append(tempexpression.type.length()).append(tempexpression.type);
            }

            if (expressions.size() > 0)
                mangledName.append("_FT");
            else
                mangledName.append("_FF");

        }

        else {
            mangledName.append("_AN0_FF");
        }

        mangledName.append("_");
        return mangledName.toString();
    }

    public static String getMangledNameWithClassAndFunction(String className, String functionName) {
        String mangledName = new StringBuilder().append("_C").append(className).append(className.length()).append("_F")
                .append(functionName).append(functionName.length()).append("_").toString();
        return mangledName;
    }

    public static String getMangledNameWithClass(int condition, String name, List<AST.formal> formals,
            String functionName) {
        StringBuilder mangledName = new StringBuilder();

        // if condition == 1 , name = className else name = type
        if (condition == 1) {
            // Adding class name to mangledName
            mangledName.append("_C");
            if (name == null)
                mangledName.append(0);
            else
                mangledName.append(name.length()).append(name);
        } else {
            // Adding type name to mangledName
            mangledName.append("_T");
            if (name == null)
                mangledName.append(0);
            else
                mangledName.append(name.length()).append(name);
        }

        System.out.println(mangledName.toString());
        // Adding function name to mangledName
        mangledName.append("_F");
        if (functionName == null)
            mangledName.append(0);
        else
            mangledName.append(functionName.length()).append(functionName);

        // Adding arguments to mangledName
        if (formals != null) {
            mangledName.append("_A").append(formals.size()).append("_");
            int total = 0;
            for (AST.formal tempFormal : formals) {
                total++;
                mangledName.append(total).append("N").append(tempFormal.typeid.length()).append(tempFormal.typeid);
            }

            if (formals.size() > 0)
                mangledName.append("_FT");
            else
                mangledName.append("_FF");

        }

        else {
            mangledName.append("_AN0_FF");
        }
        System.out.println(mangledName.toString());
        mangledName.append("_");
        return mangledName.toString();
    }

    public static void checkForMethodRedination() {
        for (GraphNode tempNode : GlobalVariables.inheritanceGraph.getNodeList()) {
            AST.class_ newClass = tempNode.getASTClass();
            ArrayList<String> methods = new ArrayList<>();
            for (AST.feature newfeature : newClass.features) {
                if (newfeature instanceof AST.method) {
                    AST.method m = (AST.method) newfeature;
                    if (methods.contains(m.name)) {
                        String errStr = new StringBuilder().append("Redefination found for method '").append(m.name)
                                .append("' in class '").append(newClass.name).append("'").toString();
                        GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, m.getLineNo(), errStr);
                    }

                    methods.add(m.name);

                }
            }
        }
    }

    public static void AttrChecker(AST.attr attribute) {
        if (ScopeTableHandler.scopeTable.lookUpGlobal(ScopeTableHandler.getMangledNameVar(attribute.name)) == null) {
            // first time variable declared so no error yahooo!!
            ScopeTableHandler.insertVar(attribute.name, attribute.typeid);
        }
        // redefination found
        else {
            // multiple defination in same class
            if (ScopeTableHandler.scopeTable.lookUpLocal(ScopeTableHandler.getMangledNameVar(attribute.name)) != null) {
                String errStr = new StringBuilder().append("Multiple defination found for Attribute '")
                        .append(attribute.name).append("' in class '").append(GlobalVariables.presentClass).append("'")
                        .toString();

                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(), errStr);

            }
            // already defined in one of the parent class
            else {
                String errStr = new StringBuilder().append("Attribute '").append(attribute.name).append("' in class '")
                        .append(GlobalVariables.presentClass).append("' already defined in one of the parent class.")
                        .toString();

                GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, attribute.getLineNo(), errStr);
            }
        }
    }

    public static void MethodChecker(AST.method method) {
        // if return type of the method is not defined
        // the return type can be any object to the class defined
        if (GlobalVariables.inheritanceGraph.containsClass(method.typeid) == false) {
            String errStr = new StringBuilder().append("Return type for method '").append(method.name)
                    .append("' in class '").append(GlobalVariables.presentClass).append("' has not been defined")
                    .toString();

            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, method.getLineNo(), errStr);
            // assiging the return type of method as object
            method.typeid = Constants.ROOT_TYPE;
        }

        String methodMangeled = ScopeTableHandler.getMangledParamsAndReturnType(method.formals, method.typeid);
        String methodScopeName = ScopeTableHandler.scopeTable
                .lookUpGlobal(ScopeTableHandler.getMangledNameFunction(method.name));

        // function redefination clashing with the defination of parent class.

        if (methodScopeName != null && methodMangeled.compareTo(methodScopeName) != 0) {
            String errStr = new StringBuilder().append("Method '").append(method.name).append("' in class '")
                    .append(GlobalVariables.presentClass)
                    .append("' does not match with its declaration in parent class.").toString();

            GlobalVariables.errorReporter.report(GlobalVariables.presentFilename, method.getLineNo(), errStr);
        }

        ScopeTableHandler.insertFunc(method.name, method.typeid, method.formals);

    }

    public static boolean FuncHasArguments(String mangledName) {
        if (mangledName == null)
            return false;
        String Args = mangledName.substring(mangledName.lastIndexOf("_") - 3, mangledName.lastIndexOf("_") + 1);
        System.out.println(Args);
        return "_FT_".equals(Args);
    }

    public static boolean DefaultClass(String className) {
        if (Constants.ROOT_TYPE.equals(className) || Constants.IO_TYPE.equals(className)
                || Constants.STRING_TYPE.equals(className)) {
            return true;

        } else {
            return false;

        }
    }

    public static ArrayList<String> fillAncesstor(GraphNode g) {
        ArrayList<String> Ancesstors = new ArrayList<>();
        while (g.hasParent()) {
            Ancesstors.add(g.getParent().getASTClass().name);
            g = g.getParent();
        }

        return Ancesstors;
    }

    public static String findLCA(GraphNode gtp1, GraphNode gtp2) {

        ArrayList<String> AncesstorA;
        ArrayList<String> AncesstorB;
        AncesstorA = fillAncesstor(gtp1);
        AncesstorB = fillAncesstor(gtp2);

        Boolean check = false;
        int i = AncesstorA.size() - 1, j = AncesstorB.size() - 1;
        for (; i >= 0 && j >= 0; i--, j--) {
            if (AncesstorA.get(i) != AncesstorB.get(j))
                break;
        }

        return AncesstorA.get(i + 1);

    }

    public static String joinTypesOf(String typeA, String typeB, GraphNode gtp1, GraphNode gtp2) {
        if (typeA.equals(typeB))
            return typeA;
        else if (InheritanceGraph.restrictedInheritanceType.contains(typeA)
                || InheritanceGraph.restrictedInheritanceType.contains(typeB)) {
            return Constants.ROOT_TYPE;
        }

        String LCA = findLCA(gtp1, gtp2);
        return LCA;

    }

    public static boolean typeChecker(String tp1, String tp2, GraphNode gtp1, GraphNode gtp2) {
        // checking if the type1 is global or both the types are equal
        if (tp1.equals(Constants.ROOT_TYPE) || tp2.equals(tp1)) {
            return true;
        }
        // checking for assigment as : Int <- String these are semantically incorrect in
        // cool
        else if (InheritanceGraph.restrictedInheritanceType.contains(tp1)
                || InheritanceGraph.restrictedInheritanceType.contains(tp2)) {
            return false;
        }

        // checking if type1 is any parent type of type2
        while (gtp2.hasParent()) {
            gtp2 = gtp2.getParent();
            if (gtp1.equals(gtp2)) {
                return true;
            }
        }

        return false;
    }

    public static int SizeForClass(String type) {
        if (Constants.INT_TYPE.equals(type)) {
            return 4;
        } else if (Constants.BOOL_TYPE.equals(type)) {
            return 1;
        } else {
            return 8;
        }
    }

    public static String typeOfattr(String type) {
        if (Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        } else if (Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if (Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if ("i64".equals(type)) {
            return "i64";
        } else if ("i1".equals(type)) {
            return "i1";
        }
        return UtilFunctionImpl.getIRNameForClass(type) + "*";
    }

    public static void defaultStringsAppend() {
        if (GlobalVariables.GlobalStringToIRMap.containsKey("\n") == false) {
            GlobalVariables.GlobalStringToIRMap.put("\n", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("") == false) {
            GlobalVariables.GlobalStringToIRMap.put("", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("%d") == false) {
            GlobalVariables.GlobalStringToIRMap.put("%d", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("%d\n") == false) {
            GlobalVariables.GlobalStringToIRMap.put("%d\n", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("%s") == false) {
            GlobalVariables.GlobalStringToIRMap.put("%s", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("%1024[^\n]") == false) {
            GlobalVariables.GlobalStringToIRMap.put("%1024[^\n]", "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.ERROR_DIVIDE_BY_ZERO) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.ERROR_DIVIDE_BY_ZERO,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.ERROR_VOID_CALL) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.ERROR_VOID_CALL,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.ABORT_MSSG) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.ABORT_MSSG,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.ROOT_TYPE) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.ROOT_TYPE,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.IO_TYPE) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.IO_TYPE, "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.STRING_TYPE) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.STRING_TYPE,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.INT_TYPE) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.INT_TYPE, "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey(Constants.BOOL_TYPE) == false) {
            GlobalVariables.GlobalStringToIRMap.put(Constants.BOOL_TYPE,
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

    }

    public static String getIRNameForClass(String className) {
        return "%class." + className;
    }

    public static void DFSprintClassToIR(GraphNode curr) {
        AST.class_ curr_class = curr.getASTClass();
        // The initial size
        int class_size = 8;

        if (InheritanceGraph.restrictedInheritanceType.contains(curr_class.name))
            return;
        StringBuilder printStr = new StringBuilder(UtilFunctionImpl.getIRNameForClass(curr_class.name));
        class_size += GlobalVariables.mapClassSize.get(curr.getParent().getASTClass().name);
        printStr.append(" = type { ").append(UtilFunctionImpl.getIRNameForClass(curr.getParent().getASTClass().name));

        Map<String, String> currClassIndexMap = new HashMap<>();

        Map<String, String> currClassParentIndexMap = GlobalVariables.IndexOfVariablesForClassMap
                .get(curr.getParent().getASTClass().name);

        for (Map.Entry<String, String> entry : currClassParentIndexMap.entrySet()) {
            currClassIndexMap.put(entry.getKey(), " i32 0," + entry.getValue());
        }

        // looping on the variables declared inside the class
        int curr_index = 0;
        for (AST.feature curr_f : curr_class.features) {
            if (curr_f instanceof AST.attr) {
                curr_index++;
                AST.attr curr_attr = (AST.attr) curr_f;
                class_size += UtilFunctionImpl.SizeForClass(curr_attr.typeid);
                printStr.append(", ").append(UtilFunctionImpl.typeOfattr(curr_attr.typeid));
                currClassIndexMap.put(curr_attr.name, " i32 0, i32 " + curr_index);

            } else {
                AST.method curr_method = (AST.method) curr_f;
                GlobalVariables.mangledFunctionNames
                        .add(UtilFunctionImpl.getMangledNameWithClassAndFunction(curr_class.name, curr_method.name));
            }

        }

        printStr.append(" }");
        GlobalVariables.output.println(printStr.toString());
        GlobalVariables.IndexOfVariablesForClassMap.put(curr_class.name, currClassIndexMap);
        GlobalVariables.mapClassSize.put(curr_class.name, class_size);

        for(GraphNode n : curr.getChildren())
        {
            DFSprintClassToIR(n);
        }

    }

}