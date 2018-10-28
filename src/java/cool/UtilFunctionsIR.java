package cool;



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
        label = LabelGenerator(label,true);
        builder.append(label).append(":");
        GlobalVariables.output.println(builder.toString());
        return label;
    }

    public static String LabelGenerator(String label, boolean isExisting) {
        String finalLabel = label;
        if(isExisting) {
            return finalLabel;
        }
        // if(Global.labelToCountMap.containsKey(label)) {
        //     int value = Global.labelToCountMap.get(label);
        //     finalLabel = label + "." + value;
        //     Global.labelToCountMap.put(label, Global.labelToCountMap.get(label) + 1);
        // }
        // else {
        //     finalLabel = label;
        //     Global.labelToCountMap.put(label,1); // TODO : check this
        // }
        return finalLabel;
    }

}