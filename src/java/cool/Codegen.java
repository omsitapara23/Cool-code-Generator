package cool;

import java.io.PrintWriter;

public class Codegen{
	public Codegen(AST.program program, PrintWriter out){
		out.println("; ModuleID = '" + "omisbest" + "'");
        out.println("source_filename = \"" + "omisbest" + "\"");
        out.println();
        GlobalVariables.output = out;
		VisitorImplCodeGen visitor = new VisitorImplCodeGen();
		System.out.println( "  : " +  ((AST.method)program.classes.get(0).features.get(3)).body);
		visitor.traverse(program);
		
	}
}
