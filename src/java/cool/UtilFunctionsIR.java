package cool;

import cool.GlobalVariables;

class UtilFunctionsIR {
    public static final String INDENT = "  ";

    public static final String BITCAST = "bitcast";
    public static final String TRUNC = "trunc";
    public static final String ADD = "add";
    public static final String SUB = "sub";
    public static final String MUL = "mul";
    public static final String DIV = "sdiv";
    public static final String ZEXT = "zext";
    public static final String SLT = "icmp slt";
    public static final String SGE = "icmp sge";
    public static final String SGT = "icmp sgt";
    public static final String SLE = "icmp sle";
    public static final String EQ = "icmp eq";
    public static final String XOR = "xor";
    public static final String UNDEF = "undef";

    public static String LabelCreator(String label) {
        StringBuilder builder = new StringBuilder("\n");
        label = LabelGenerator(label, true);
        builder.append(label).append(":");
        GlobalVariables.output.println(builder.toString());
        return label;
    }

    public static String LabelGenerator(String label, boolean isExisting) {
        String finalLabel = label;
        if (isExisting) {
            return finalLabel;
        }
        // if(Global.labelToCountMap.containsKey(label)) {
        // int value = Global.labelToCountMap.get(label);
        // finalLabel = label + "." + value;
        // Global.labelToCountMap.put(label, Global.labelToCountMap.get(label) + 1);
        // }
        // else {
        // finalLabel = label;
        // Global.labelToCountMap.put(label,1); // TODO : check this
        // }
        return finalLabel;
    }

    public static int alignment(String type) {
        if (type.length() > 0) {
            // check if the type if of pointer type
            if (type.charAt(type.length() - 1) == '*')
                return 8;
            return 4;

        } else
            return -1;
    }

    // this function creates the store instruction
    public static void storeInstruction(String register, String size, String type) {
        StringBuilder br = new StringBuilder(INDENT);

        br.append("store ").append(type).append(" ").append(register).append(", ").append(type + "*").append(" ")
                .append(size).append(", align").append(alignment(type));

        GlobalVariables.output.println(br.toString());
    }

    // this function creates double Pointer Store Instruction
    public static void doublePointerStoreInstruction(String register, String size, String type) {
        String newType = UtilFunctionImpl.getIRNameForClass(type);

        StringBuilder br = new StringBuilder(INDENT);
        br.append("store ").append(newType).append("* ").append(register).append(", ").append(newType).append("** ")
                .append(size).append(", align ").append(alignment(newType));

        GlobalVariables.output.println(newType.toString());
    }

    // this function creates the store instruction
    public static String loadInstruction(String size, String type) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;
        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = load ").append(type).append(", ").append(type + "* ").append(size)
                .append(", align").append(alignment(type));

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates binary Instruction
    public static String binaryInstruction(String opr, String fst, String snd, String type, boolean n1, boolean n2) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newType = UtilFunctionImpl.typeOfattr(type, true);

        StringBuilder br = new StringBuilder(INDENT);
        br.append(regStore).append(" = ").append(opr).append(" ");

        if (n1) {
            br.append("nuw ");
        }
        if (n2) {
            br.append("nsw ");
        }

        br.append(newType).append(" ").append(fst).append(", ").append(snd);

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates break instruction
    public static void breakInstruction(String type) {
        StringBuilder br = new StringBuilder(INDENT);

        br.append("br label %").append(type);

        GlobalVariables.output.println(br.toString());
    }

    // this function creates conditional break instruction
    public static void conditionalBreakInstruction(String register, String type1, String type2) {
        StringBuilder br = new StringBuilder(INDENT);

        br.append("br i1 ").append(register).append(", ").append("label %").append(type1).append(", label %")
                .append(type2);

        GlobalVariables.output.println(br.toString());
    }

    // this function checks for the incoming parameter to be LLVM Primitive or not
    public static boolean ifLLVMPrimitiveType(String type) {
        boolean condition = false;
        if (type.equals("i8") || type.equals("i8*") || type.equals("i1") || type.equals("i32") || type.equals("i64"))
            condition = true;
        return condition;
    }

    // this function creates convert Instruction
    public static String convertInstruction(String register, String fromTypeToExpr, String toTypeFromExpr,
            String type) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        if (ifLLVMPrimitiveType(fromTypeToExpr) == false)
            fromTypeToExpr = UtilFunctionImpl.getIRNameForClass(fromTypeToExpr) + "*";

        if (ifLLVMPrimitiveType(toTypeFromExpr) == false)
            toTypeFromExpr = UtilFunctionImpl.getIRNameForClass(toTypeFromExpr) + "*";

        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = ").append(type).append(" ").append(fromTypeToExpr).append(" ").append(register)
                .append(" to ").append(toTypeFromExpr);

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates phi node
    public static String phiNode(String type, String n1, String type1, String n2, String type2) {

        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newType = UtilFunctionImpl.typeOfattr(type, true);

        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = phi ").append(newType).append(" [ ").append(n1).append(", %").append(type1)
                .append(" ] , [ ").append(n2).append(", %").append(type2).append(" ]");

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates call instruction
    public static String CallInstruction(String type, String CalleeName, String params) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newType = UtilFunctionImpl.typeOfattr(type, true);

        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = call ").append(newType).append(" @").append(CalleeName).append("(")
                .append(params).append(")");

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates void call instruction
    public static void voidCallInstruction(String CalleeName, String params) {
        StringBuilder br = new StringBuilder(INDENT);

        br.append("call void @").append(CalleeName).append("(").append(params).append(")");

        GlobalVariables.output.println(br.toString());
    }

    // this function creates malloc instruction
    public static String mallocInstruction(String count) {
        // count is the count of bits
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = call noalias i8* @malloc(i64 ").append(count).append(")");

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates string get element pointer
    public static String stringGEP(String s) {
        if (GlobalVariables.GlobalStringToIRMap.containsKey(s) == true) {
            String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
            GlobalVariables.GlobalRegisterCounter++;

            StringBuilder br = new StringBuilder(INDENT);

            br.append(regStore).append(" = getelementptr inbounds [").append(s.length() + 1).append(" x i8], [")
                    .append(s.length() + 1).append(" x i8]* ").append(GlobalVariables.GlobalStringToIRMap.get(s))
                    .append(", i32 0, i32 0");

            GlobalVariables.output.println(br.toString());

            return regStore;
        } else
            return null;
    }

    // this function creates class attribute get element pointer
    public static String classAttributeGEP(String className, String register, String point) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newName = UtilFunctionImpl.getIRNameForClass(className);

        StringBuilder br = new StringBuilder(INDENT);

        br.append(regStore).append(" = getelementptr inbounds ").append(newName).append(", ").append(newName)
                .append("* ").append(register).append(", ")
                .append(GlobalVariables.IndexOfVariablesForClassMap.get(className).get(point));

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates type name get element pointer
    // register variable is previously bit casted to object
    public static String typeNameGEP(String register) {
        StringBuilder br = new StringBuilder(INDENT);

        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newName = UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE);

        br.append(regStore).append(" = getelementptr inbounds ").append(newName).append(", ").append(newName)
                .append("* ").append(register).append(", i32 0, i32 0");

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates alloca Instruction
    public static String allocaInstruction(String className, String registerName) {
        StringBuilder br = new StringBuilder(INDENT);
        String regStore;
        if (registerName == null) {
            regStore = "%" + GlobalVariables.GlobalRegisterCounter;
            GlobalVariables.GlobalRegisterCounter++;

            String newName = UtilFunctionImpl.typeOfattr(className, false);

            br.append(regStore).append(" = alloca ").append(newName).append(", align 8");

        } else {
            regStore = "%" + registerName;
            br.append(regStore).append(" = alloca ").append(className).append(", align 8");
        }

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates constructor call
    public static void constructorCall(String className, String registerName) {
        StringBuilder br = new StringBuilder(INDENT);

        br.append("call void @").append(UtilFunctionImpl.getMangledNameWithClassAndFunction(className, className))
                .append("(").append(UtilFunctionImpl.getIRNameForClass(className)).append("* ").append(registerName)
                .append(")");

        GlobalVariables.output.println(br.toString());
    }

    // this function creates abort for primitive type
    public static String abortPrimitiveType(String className) {

        String fst = stringGEP("%s");
        String snd = stringGEP(Constants.ABORT_MSSG);
        String third = stringGEP("\n");

        String regName = stringGEP(className);

        StringBuilder br = new StringBuilder(INDENT);
        br.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(snd).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br.toString());

        StringBuilder br1 = new StringBuilder(INDENT);
        br1.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(regName).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br1.toString());

        StringBuilder br2 = new StringBuilder(INDENT);
        br2.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(third).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br2.toString());

        StringBuilder br3 = new StringBuilder(INDENT);
        br3.append("call void @exit(i32 0)");
        GlobalVariables.output.println(br3.toString());

        String regCall = mallocInstruction(GlobalVariables.mapClassSize.get(Constants.ROOT_TYPE).toString());
        String val = convertInstruction(regCall, "i8*", Constants.ROOT_TYPE, BITCAST);

        
        voidCallInstruction(
                UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.ROOT_TYPE, Constants.ROOT_TYPE),
                (UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* " + val));

        return val;
    }

}