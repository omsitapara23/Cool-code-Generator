package cool;

class UtilFunctionsIR {

    public static String LabelCreator(String label) {
        StringBuilder builder = new StringBuilder("\n" + LabelGenerator(label, true) + ":");
        GlobalVariables.output.println(builder.toString());
        return LabelGenerator(label, true);
    }

    public static String LabelGenerator(String label, boolean isPresent) {
        if (isPresent) {
            return label;
        }
        if (GlobalVariables.labelCounterMap.containsKey(label)) {
            int value = GlobalVariables.labelCounterMap.get(label);
            GlobalVariables.labelCounterMap.put(label, GlobalVariables.labelCounterMap.get(label) + 1);
            label = label + "." + value;
        } else {
            GlobalVariables.labelCounterMap.put(label, 1);
        }
        return label;
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
        StringBuilder br = new StringBuilder("  ");

        br.append("store ").append(type).append(" ").append(register).append(", ").append(type + "*").append(" ")
                .append(size).append(", align ").append(alignment(type));

        GlobalVariables.output.println(br.toString());
    }

    // this function creates double Pointer Store Instruction
    public static void doublePointerStoreInstruction(String register, String size, String type) {
        String newType = UtilFunctionImpl.getIRNameForClass(type);

        StringBuilder br = new StringBuilder("  ");
        br.append("store ").append(newType).append("* ").append(register).append(", ").append(newType).append("** ")
                .append(size).append(", align ").append(alignment(newType));

        GlobalVariables.output.println(br.toString());
    }

    // this function creates the store instruction
    public static String loadInstruction(String size, String type) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;
        StringBuilder br = new StringBuilder("  ");

        br.append(regStore).append(" = load ").append(type).append(", ").append(type + "* ").append(size)
                .append(", align ").append(alignment(type));

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates binary Instruction
    public static String binaryInstruction(String opr, String fst, String snd, String type, boolean n2) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        String newType = UtilFunctionImpl.typeOfattr(type, true);

        StringBuilder br = new StringBuilder("  ");
        br.append(regStore).append(" = ").append(opr).append(" ");

        if (n2) {
            br.append("nsw ");
        }

        br.append(newType).append(" ").append(fst).append(", ").append(snd);

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates break instruction
    public static void breakInstruction(String type) {
        StringBuilder br = new StringBuilder("  ");

        br.append("br label %").append(type);

        GlobalVariables.output.println(br.toString());
    }

    // this function creates conditional break instruction
    public static void conditionalBreakInstruction(String register, String type1, String type2) {
        StringBuilder br = new StringBuilder("  ");

        br.append("br i1 ").append(register).append(", ").append("label %").append(type1).append(", label %")
                .append(type2);

        GlobalVariables.output.println(br.toString());
    }

    // this function checks for the incoming parameter to be LLVM Primitive or not
    public static boolean ifLLVMPrimitiveType(String type) {
        boolean condition = false;
        if ("i8*".equals(type) || "i32".equals(type) || "i64".equals(type) || "i8".equals(type) || "i1".equals(type))
            condition = true;
        return condition;
    }

    // this function creates s1 Instruction
    public static String convertInstruction(String register, String fromTypeToExpr, String toTypeFromExpr,
            String type) {
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        if (ifLLVMPrimitiveType(fromTypeToExpr) == false)
            fromTypeToExpr = UtilFunctionImpl.getIRNameForClass(fromTypeToExpr) + "*";

        if (ifLLVMPrimitiveType(toTypeFromExpr) == false)
            toTypeFromExpr = UtilFunctionImpl.getIRNameForClass(toTypeFromExpr) + "*";

        StringBuilder br = new StringBuilder("  ");

        br.append(regStore).append(" = ").append(type).append(" ").append(fromTypeToExpr).append(" ").append(register)
                .append(" to ").append(toTypeFromExpr);

        GlobalVariables.output.println(br.toString());
        return regStore;

    }

    // this function creates call instruction
    public static String CallInstruction(String type, String CalleeName, String params) {

        StringBuilder br = new StringBuilder("  ");
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        

        String newType = UtilFunctionImpl.typeOfattr(type, true);
        GlobalVariables.GlobalRegisterCounter++;
    
        br.append(regStore).append(" = call ").append(newType).append(" @").append(CalleeName).append("(")
                .append(params).append(")");

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates void call instruction
    public static void voidCallInstruction(String CalleeName, String params) {
        StringBuilder br = new StringBuilder("  ");

        br.append("call void @").append(CalleeName).append("(").append(params).append(")");

        GlobalVariables.output.println(br.toString());
    }

    // this function creates malloc instruction
    public static String mallocInstruction(String count) {
        // count is the count of bits
        String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
        GlobalVariables.GlobalRegisterCounter++;

        StringBuilder br = new StringBuilder("  ");

        br.append(regStore).append(" = call noalias i8* @malloc(i64 ").append(count).append(")");

        GlobalVariables.output.println(br.toString());

        return regStore;
    }

    // this function creates string get element pointer
    public static String stringGEP(String s) {
        if (GlobalVariables.GlobalStringToIRMap.containsKey(s) == true) {
            String regStore = "%" + GlobalVariables.GlobalRegisterCounter;
            GlobalVariables.GlobalRegisterCounter++;

            StringBuilder br = new StringBuilder("  ");

            br.append(regStore).append(" = getelementptr inbounds [").append(s.length() + 1).append(" x i8], [");

            br.append(s.length() + 1).append(" x i8]* ").append(GlobalVariables.GlobalStringToIRMap.get(s))
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

        StringBuilder br = new StringBuilder("  ");

        br.append(regStore).append(" = getelementptr inbounds ").append(newName).append(", ").append(newName)
                .append("* ").append(register).append(", ")
                .append(GlobalVariables.IndexOfVariablesForClassMap.get(className).get(point));

        GlobalVariables.output.println(br.toString());

        return regStore;

    }

    // this function creates type name get element pointer
    // register variable is previously bit casted to object
    public static String currentPointerRegister(String register) {
        StringBuilder br = new StringBuilder("  ");

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
        StringBuilder br = new StringBuilder("  ");
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
        StringBuilder br = new StringBuilder("  ");

        br.append("call void @").append(UtilFunctionImpl.getMangledNameWithClassAndFunction(className, className))
                .append("(").append(UtilFunctionImpl.getIRNameForClass(className)).append("* ").append(registerName)
                .append(")");

        GlobalVariables.output.println(br.toString());
    }

    // this function creates abort for primitive type
    public static String abortPrimitiveType(String className) {

        String fst = stringGEP("%s");
        String snd = stringGEP("ABORT Message called from class ");
        String third = stringGEP("\n");

        String regName = stringGEP(className);

        StringBuilder br = new StringBuilder("  ");
        br.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(snd).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br.toString());

        StringBuilder br1 = new StringBuilder("  ");
        br1.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(regName).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br1.toString());

        StringBuilder br2 = new StringBuilder("  ");
        br2.append("%").append(GlobalVariables.GlobalRegisterCounter).append(" = call i32 (i8*, ...) @printf(i8* ")
                .append(fst).append(", i8* ").append(third).append(")");
        GlobalVariables.GlobalRegisterCounter++;
        GlobalVariables.output.println(br2.toString());

        StringBuilder br3 = new StringBuilder("  ");
        br3.append("call void @exit(i32 0)");
        GlobalVariables.output.println(br3.toString());

        String regCall = mallocInstruction(GlobalVariables.mapClassSize.get(Constants.ROOT_TYPE).toString());
        String val = convertInstruction(regCall, "i8*", Constants.ROOT_TYPE, "bitcast");

        voidCallInstruction(
                UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.ROOT_TYPE, Constants.ROOT_TYPE),
                (UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* " + val));

        return val;
    }

    public static void stringOpMethods() {

        // concat method of String
        GlobalVariables.GlobalRegisterCounter = 0;

        GlobalVariables.output.println("\n; Class: String, Method: concat");

        GlobalVariables.output.println(
                "define i8* @" + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.STRING_TYPE, "concat")
                        + "(i8* %s1, i8* %s2) {");

        GlobalVariables.output.println("entry:");

        String string_1 = UtilFunctionsIR.CallInstruction("i64", "strlen", "i8* %s1");
        String string_2 = UtilFunctionsIR.CallInstruction("i64", "strlen", "i8* %s2");

        String concatResult = UtilFunctionsIR.binaryInstruction("add", string_1, string_2, "i64", true);
        concatResult = UtilFunctionsIR.binaryInstruction("add", concatResult, "1", "i64", true);

        String finalString = UtilFunctionsIR.mallocInstruction(concatResult);
        UtilFunctionsIR.CallInstruction(Constants.STRING_TYPE, "strcpy", "i8* " + finalString + ", i8* %s1");
        UtilFunctionsIR.CallInstruction(Constants.STRING_TYPE, "strcat", "i8* " + finalString + ", i8* %s2");

        GlobalVariables.output.println("  " + "ret i8* " + finalString);
        GlobalVariables.output.println("}");

        // substr method of String
        GlobalVariables.GlobalRegisterCounter = 0;

        GlobalVariables.output.println("\n; Class: String, Method: substr");

        GlobalVariables.output.println(
                "define i8* @" + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.STRING_TYPE, "substr")
                        + "(i8* %s1, i32 %index, i32 %len) {");
        GlobalVariables.output.println("entry:");

        String s1 = UtilFunctionsIR.convertInstruction("%len", "i32", "i64", "zext");
        String registerMem = UtilFunctionsIR.mallocInstruction(s1);
        String pointerToNewStr = "%" + GlobalVariables.GlobalRegisterCounter;

        GlobalVariables.GlobalRegisterCounter++;

        StringBuilder builder = new StringBuilder("  ");
        builder.append(pointerToNewStr).append(" = ").append("getelementptr inbounds ");
        builder.append("i8, i8* %s1, i32 %index");

        GlobalVariables.output.println(builder.toString());

        String callCopy = UtilFunctionsIR.CallInstruction(Constants.STRING_TYPE, "strncpy",
                "i8* " + registerMem + ", i8* " + pointerToNewStr + ", i64 " + s1);

        GlobalVariables.output.println("  " + "ret i8* " + registerMem);
        GlobalVariables.output.println("}");

    }

    public static void CmainMethod() {
        // generating the main method for c
        GlobalVariables.GlobalRegisterCounter = 0;
        StringBuilder cmethod = new StringBuilder();
        cmethod.append("\ndefine i32 @main() {\nentry:\n %main = alloca %class.Main, align 8\n call void @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction("Main", "Main") + "(%class.Main* %main)\n");
        cmethod.append(" %dummyretval = call " + UtilFunctionImpl.typeOfattr(GlobalVariables.mainRet, true) + " @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction("Main", "main") + "(%class.Main* %main)\n")
                .append(" ret i32 0");
        cmethod.append("}\n");
        GlobalVariables.output.print(cmethod.toString());
    }

    public static void voidDispatchError() {
        GlobalVariables.GlobalRegisterCounter = 0;
        StringBuilder voidDispatch = new StringBuilder();
        voidDispatch.append("\ndefine void @" + "print_dispatch_on_void_error" + "() {\nentry:\n");
        GlobalVariables.output.print(voidDispatch.toString());
        String s1 = stringGEP("%s");
        String s2 = stringGEP("VOID Dispatach Found ");
        GlobalVariables.output.println(" %" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + s1 + ", i8* " + s2 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        String s4 = stringGEP("\n");
        GlobalVariables.output.println(" %" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + s1 + ", i8* " + s4 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        GlobalVariables.output.println("  " + "call void @exit(i32 1)");

        GlobalVariables.output.println(" ret void");
        GlobalVariables.output.println("}");
    }

    public static void divByZeroError() {
        GlobalVariables.GlobalRegisterCounter = 0;
        StringBuilder voidDispatch = new StringBuilder();
        voidDispatch.append("\ndefine void @" + "print_div_by_zero_err_msg" + "() {\nentry:\n");
        GlobalVariables.output.print(voidDispatch.toString());

        String s1 = stringGEP("%s");
        String s2 = stringGEP("Exception Divide By Zero Found ");
        GlobalVariables.output.println(" %" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + s1 + ", i8* " + s2 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        String s4 = stringGEP("\n");
        GlobalVariables.output.println(" %" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + s1 + ", i8* " + s4 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        GlobalVariables.output.println("  " + "call void @exit(i32 1)");
        GlobalVariables.output.println(" ret void");
        GlobalVariables.output.println("}");
    }

    public static void generateDefaultMethods() {
        // generating IR for standard declarations present in C
        // malloc
        GlobalVariables.output.println("\n; malloc for C");
        GlobalVariables.output.println("declare noalias i8* @malloc(i64)");

        // printf used for out_int , out_string
        GlobalVariables.output.println("\n; printf for C");
        GlobalVariables.output.println("declare i32 @printf(i8*, ...)");

        // scanf used for in_int , in_string
        GlobalVariables.output.println("\n; scanf for C");
        GlobalVariables.output.println("declare i32 @scanf(i8*, ...)");

        // strlen used for length
        GlobalVariables.output.println("\n; strlen for C");
        GlobalVariables.output.println("declare i64 @strlen(i8*)");

        // strcat used for string concat
        GlobalVariables.output.println("\n; strcat for C");
        GlobalVariables.output.println("declare i8* @strcat(i8*, i8*)");

        // strcpy used for string copy
        GlobalVariables.output.println("\n; strcpy for C");
        GlobalVariables.output.println("declare i8* @strcpy(i8*, i8*)");

        // strncpy
        GlobalVariables.output.println("\n; strncpy for C");
        GlobalVariables.output.println("declare i8* @strncpy(i8*, i8*, i64)");

        // exit used for abort
        GlobalVariables.output.println("\n; exit for C");
        GlobalVariables.output.println("declare void @exit(i32)");

        // generating IR for defalut object methods
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println("\n; Class: Object, Method: type_name" + "\ndefine i8* @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.ROOT_TYPE, "type_name") + "("
                + UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* %this) {");
        GlobalVariables.output.println("entry:");
        GlobalVariables.output.println("  " + "ret i8* "
                + UtilFunctionsIR.stringGEP("Typename Function called ") + "\n}");

        // abort method for object
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println("\n; Class: Object, Method: abort" + "\ndefine "
                + UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.ROOT_TYPE, "abort") + "("
                + UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* %this) {");
        GlobalVariables.output.println("entry:");

        String params1 = UtilFunctionsIR.stringGEP("%s");

        String params2 = UtilFunctionsIR.stringGEP("ABORT Message called ");

        GlobalVariables.output.println("  " + "%" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + params1 + ", i8* " + params2 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        params2 = UtilFunctionsIR.stringGEP("\n");

        GlobalVariables.output.println("  " + "%" + GlobalVariables.GlobalRegisterCounter
                + " = call i32 (i8*, ...) @printf(i8* " + params1 + ", i8* " + params2 + ")");
        GlobalVariables.GlobalRegisterCounter++;

        // exit
        GlobalVariables.output.println("  " + "call void @exit(i32 0)");

        GlobalVariables.output.println(
                "  " + "ret " + UtilFunctionImpl.getIRNameForClass(Constants.ROOT_TYPE) + "* %this\n}");

        // generating IO methods
        // out_int method of class IO
        String mallocInst;
        String value;
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println(
                "\n; Class: IO, Method: out_int" + "\ndefine " + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE)
                        + "* @" + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, "out_int")
                        + "(" + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* %this, i32 %d) {");
        GlobalVariables.output.println("entry:");
        GlobalVariables.output.println(
                "  " + "%call = call i32 (i8*, ...) @printf(i8* " + UtilFunctionsIR.stringGEP("%d") + ", i32 %d)");
        mallocInst = UtilFunctionsIR.mallocInstruction("" + GlobalVariables.mapClassSize.get(Constants.IO_TYPE));
        value = UtilFunctionsIR.convertInstruction(mallocInst, "i8*", Constants.IO_TYPE, "bitcast");
        UtilFunctionsIR.voidCallInstruction(
                UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, Constants.IO_TYPE),
                UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* " + value);
        GlobalVariables.output
                .println("  " + "ret " + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* " + value + "\n}");

        // in_int method of class IO
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println("\n; Class: IO, Method: in_int" + "\ndefine i32 @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, "in_int") + "("
                + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* %this) {");
        GlobalVariables.output.println("entry:");
        String allocaInst1 = UtilFunctionsIR.allocaInstruction(Constants.INT_TYPE, null);
        GlobalVariables.output.println("  " + "%call = call i32 (i8*, ...) @scanf(i8* "
                + UtilFunctionsIR.stringGEP("%d") + ", i32* " + allocaInst1 + ")");
        value = UtilFunctionsIR.loadInstruction(allocaInst1, "i32");
        GlobalVariables.output.println("  " + "ret i32 " + value + "\n}");

        // out_string method of class IO
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println("\n; Class: IO, Method: out_string" + "\ndefine "
                + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, "out_string") + "("
                + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* %this, i8* %s) {");
        GlobalVariables.output.println("entry:");
        GlobalVariables.output.println(
                "  " + "%call = call i32 (i8*, ...) @printf(i8* " + UtilFunctionsIR.stringGEP("%s") + ", i8* %s)");
        mallocInst = UtilFunctionsIR.mallocInstruction("" + GlobalVariables.mapClassSize.get(Constants.IO_TYPE));
        value = UtilFunctionsIR.convertInstruction(mallocInst, "i8*", Constants.IO_TYPE, "bitcast");
        UtilFunctionsIR.voidCallInstruction(
                UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, Constants.IO_TYPE),
                UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* " + value);
        GlobalVariables.output
                .println("  " + "ret " + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* " + value + "\n}");

        // in_string method of class IO
        GlobalVariables.GlobalRegisterCounter = 0;
        GlobalVariables.output.println("\n; Class: IO, Method: in_string" + "\ndefine i8* @"
                + UtilFunctionImpl.getMangledNameWithClassAndFunction(Constants.IO_TYPE, "in_string") + "("
                + UtilFunctionImpl.getIRNameForClass(Constants.IO_TYPE) + "* %this) {");
        GlobalVariables.output.println("entry:");
        allocaInst1 = UtilFunctionsIR.allocaInstruction(Constants.STRING_TYPE, null);
        String valLoad = UtilFunctionsIR.loadInstruction(allocaInst1, "i8*");
        GlobalVariables.output.println("  " + "%call = call i32 (i8*, ...) @scanf(i8* "
                + UtilFunctionsIR.stringGEP("%1024[^\n]") + ", i8* " + valLoad + ")");
        value = UtilFunctionsIR.loadInstruction(allocaInst1, "i8*");
        GlobalVariables.output.println("  " + "ret i8* " + value + "\n}");

        stringOpMethods();
        voidDispatchError();
        divByZeroError();

    }

}