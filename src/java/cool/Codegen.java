package cool;

import java.io.PrintWriter;

public class Codegen{
	public Codegen(AST.program program, PrintWriter out){
        GlobalVariables.output = out;
		VisitorImplCodeGen visitor = new VisitorImplCodeGen();
		visitor.traverse(program);
		
	}
}
