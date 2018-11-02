package cool;

public class Semantic extends Visitor{
	private boolean errorFlag = false;
	public void reportError(String filename, int lineNo, String error){
		errorFlag = true;
		System.err.println(filename+":"+lineNo+": "+error);
	}
	public boolean getErrorFlag(){
		return errorFlag;
	}

/*
	Don't change code above this line
*/
	public Semantic(AST.program program){
		//Write Semantic analyzer code here

		GlobalVariables.errorReporter = new ErrorReporter() {
			@Override
			public void report(String filename, int lineNo, String error) {
				reportError(filename, lineNo, error);
			}
		};
		System.out.println( "  : " + program.classes.size());
		Visitor visitor = new Visitor();
		visitor.traverse(program);
	}
}
