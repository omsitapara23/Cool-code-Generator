package cool;

import java.util.*;
import java.lang.StringBuilder;
import java.io.PrintWriter;


public class GlobalVariables 
{
    // stores the current filename of the class
    public static String presentFilename;

    // Our inheritance graph formed after parsing all the classes.
    public static InheritanceGraph inheritanceGraph;

    //denotes the presentClass while visiting AST classes
    public static String presentClass;

    // reports an error
    public static ErrorReporter errorReporter;

    // mapping our function mangled names with its types
    public static Map<String, String> mapMangledNames;



    /* The below data structures defined are for code generation */


    // Mapping global string constants to name of register
    public static Map<String, String> GlobalStringToIRMap;

    // defines total number of global string constants
    public static int GlobalStringCounter;
    public static int GlobalRegisterCounter;

    /*//EDIIIIT THIS*/

    public static Map<String,Map<String,String>> IndexOfVariablesForClassMap;

    //mapping class to size of struct
    public static Map <String, Integer> mapClassSize;

    public static int intSize;
    public static int boolSize;
    public static int ioSize;
    public static int objectSize;
    public static int stringSize;

    public static Set<String> mangledFunctionNames;

    // this writer writes our IR output
    public static PrintWriter output;

    public static String mainRet;

    public static Set<String> formalList;

    static
    {
        presentClass = "";
        presentFilename = "";
        mapMangledNames = new HashMap<>();
        GlobalStringToIRMap = new HashMap<>();
        GlobalStringCounter = 0;
        GlobalRegisterCounter = 0;
        IndexOfVariablesForClassMap = new  HashMap<>();


    }
}