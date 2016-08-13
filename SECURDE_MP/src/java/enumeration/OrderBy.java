package enumeration;

public enum OrderBy
{
    ASC, DESC;
    
    public static OrderBy translateOrderByStringToSQL( String order )
    {
	switch( order.toUpperCase() )
	{
	    case "ASCENDING": return ASC;
	    case "DESCENDING": return DESC;
	    default: break;
	}
	
	return ASC;
    }
}
