package enumeration;

public enum AccessLevel
{
    ADMINISTRATOR, ACCOUNTING_MANAGER, PRODUCT_MANAGER, USER;
    
    public static AccessLevel translateAccessLevelStringToEnum( String accessLevel )
    {
	if( accessLevel != null )
	{
	    switch( accessLevel.toUpperCase() )
	    {
		case "ADMINISTRATOR": return AccessLevel.ADMINISTRATOR;
		case "ACCOUNTING_MANAGER": return AccessLevel.ACCOUNTING_MANAGER;
		case "PRODUCT_MANAGER": return AccessLevel.PRODUCT_MANAGER;
		case "USER": return AccessLevel.USER;
		default: break;
	    }
	}
	return null;
    }
}
