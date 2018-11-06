package cool;

import java.util.ArrayList;
import java.util.List;
import java.util.*;

import cool.AST;
import cool.GlobalVariables;
import cool.InheritanceGraph;
import cool.ScopeTable;

import java.lang.StringBuilder;

class UtilFunctionImpl {

    public static String getMangledNameWithClassAndFunction(String className, String functionName) {
        String mangledName = new StringBuilder().append("_C").append(className).append(className.length()).append("_F")
                .append(functionName).append(functionName.length()).append("_").toString();
        return mangledName;
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

    // cond is true - return by adding '*' else without it
    public static String typeOfattr(String type, boolean cond) {
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
        if (cond)
            return UtilFunctionImpl.getIRNameForClass(type) + "*";
        else
            return UtilFunctionImpl.getIRNameForClass(type);
    }

    public static String primitiveValue(String type) {
        if (Constants.INT_TYPE.equals(type)) {
            return "0";
        } else if (Constants.BOOL_TYPE.equals(type)) {
            return "0";
        } else if (Constants.STRING_TYPE.equals(type)) {
            return UtilFunctionsIR.stringGEP("");
        } else {
            return "undef";
        }
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

        if (GlobalVariables.GlobalStringToIRMap.containsKey("Exception Divide By Zero Found ") == false) {
            GlobalVariables.GlobalStringToIRMap.put("Exception Divide By Zero Found ",
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("VOID Dispatach Found ") == false) {
            GlobalVariables.GlobalStringToIRMap.put("VOID Dispatach Found ",
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("ABORT Message called ") == false) {
            GlobalVariables.GlobalStringToIRMap.put("ABORT Message called ",
                    "@.str." + GlobalVariables.GlobalStringCounter);
            GlobalVariables.GlobalStringCounter++;
        }

        if (GlobalVariables.GlobalStringToIRMap.containsKey("Typename Function called ") == false) {
            GlobalVariables.GlobalStringToIRMap.put("Typename Function called ",
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

        if (InheritanceGraph.restrictedInheritanceType.contains(curr.getASTClass().name))
            return;
        
        AST.class_ curr_class = curr.getASTClass();
        // The initial size
        int class_size = 8;

        class_size += GlobalVariables.mapClassSize.get(curr.getParent().getASTClass().name);

        StringBuilder printStr = new StringBuilder(UtilFunctionImpl.getIRNameForClass(curr_class.name)).append(" = type { ").append(UtilFunctionImpl.getIRNameForClass(curr.getParent().getASTClass().name));

        Map<String, String> currClassParentIndexMap = GlobalVariables.IndexOfVariablesForClassMap
                .get(curr.getParent().getASTClass().name);

        Map<String, String> currClassIndexMap = new HashMap<>();

        for (Map.Entry<String, String> entry : currClassParentIndexMap.entrySet())
        {
            currClassIndexMap.put(entry.getKey(), " i32 0," + entry.getValue());
        }

        // looping on the variables declared inside the class
        int curr_index = 0;
        for (AST.feature curr_f : curr_class.features) {
            if (curr_f instanceof AST.attr) {
                AST.attr curr_attr = (AST.attr) curr_f;
                printStr.append(", ").append(UtilFunctionImpl.typeOfattr(curr_attr.typeid, true));
                class_size += UtilFunctionImpl.SizeForClass(curr_attr.typeid);
                curr_index++;
                currClassIndexMap.put(curr_attr.name, " i32 0, i32 " + curr_index);

            } else {
                GlobalVariables.mangledFunctionNames
                        .add(UtilFunctionImpl.getMangledNameWithClassAndFunction(curr_class.name, ((AST.method)curr_f).name));
            }

        }

        printStr.append(" }");
        GlobalVariables.output.println(printStr.toString());
        GlobalVariables.IndexOfVariablesForClassMap.put(curr_class.name, currClassIndexMap);
        GlobalVariables.mapClassSize.put(curr_class.name, class_size);

        for (GraphNode n : curr.getChildren()) {
            DFSprintClassToIR(n);
        }

    }

}