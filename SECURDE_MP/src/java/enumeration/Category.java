package enumeration;

public enum Category
{
    BOOTS, SANDALS, SHOES, SLIPPERS;
    
    public static Category translateCategoryStringToEnum( String category )
    {
	switch( category.toUpperCase() )
	{
	    case "BOOTS": return Category.BOOTS;
	    case "SANDALS": return Category.SANDALS;
	    case "SHOES": return Category.SHOES;
	    case "SLIPPERS": return Category.SLIPPERS;
	    default: break;
	}
	
	return null;
    }
}
