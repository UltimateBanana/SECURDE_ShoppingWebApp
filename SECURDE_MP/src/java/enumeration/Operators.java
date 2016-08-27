package enumeration;

public enum Operators
{
    ;
	
    public static String translateOperatorStringToSQL( String operator )
    {
	if( operator != null )
	{
	    switch( operator.toUpperCase() )
	    {
		case "EQUAL TO": return " = ";
		case "NOT EQUAL TO": return " != ";
		case "GREATER THAN": return " > ";
		case "GREATER THAN OR EQUAL TO": return " >= ";
		case "LESS THAN": return " < ";
		case "LESS THAN OR EQUAL TO": return " <= ";
		default: break;
	    }
	}
	
	return " = ";
    }
}
