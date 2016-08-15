package enumeration;

public enum AccessLevel
{
    ADMINISTRATOR, ACCOUNTING_MANAGER, PRODUCT_MANAGER, USER;
    
    public static AccessLevel translateAccessLevelStringToEnum( String accessLevel )
    {
	switch( accessLevel )
	{
	    case "ADMINISTRATOR": return AccessLevel.ADMINISTRATOR;
	    case "ACCOUNTING MANAGER": return AccessLevel.ACCOUNTING_MANAGER;
	    case "PRODUCT MANAGER": return AccessLevel.PRODUCT_MANAGER;
	    case "USER": return AccessLevel.USER;
	    default: break;
	}
	
	return null;
    }
}
