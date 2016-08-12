package model;

import enumeration.Category;

public class Product
{
    public static final String TABLE_NAME = "product" ;
    public static final String COLUMN_PRODUCT_ID = "product_id" ;
    public static final String COLUMN_NAME = "name" ;
    public static final String COLUMN_DESCRIPTION = "description" ;
    public static final String COLUMN_CATEGORY = "category" ;
    public static final String COLUMN_PRICE = "price" ;
    public static final String COLUMN_IS_DELETED = "is_deleted";
    
    private String productId;
    private String name;
    private String description;
    private Category category;
    private double price;
    private boolean isDeleted;
    
    public Product()
    {
    }

    public Product(String name, String description, Category category, double price)
    {
	this.name = name;
	this.description = description;
	this.category = category;
	this.price = price;
	this.isDeleted = false;
    }

    public Product(String productId, String name, String description, Category category, double price, boolean isDeleted)
    {
	this.productId = productId;
	this.name = name;
	this.description = description;
	this.category = category;
	this.price = price;
	this.isDeleted = isDeleted;
    }

    public String getProductId()
    {
	return productId;
    }

    public void setProductId(String productId)
    {
	this.productId = productId;
    }

    public String getName()
    {
	return name;
    }

    public void setName(String name)
    {
	this.name = name;
    }

    public String getDescription()
    {
	return description;
    }

    public void setDescription(String description)
    {
	this.description = description;
    }

    public Category getCategory()
    {
	return category;
    }

    public void setCategory(Category category)
    {
	this.category = category;
    }

    public double getPrice()
    {
	return price;
    }

    public void setPrice(double price)
    {
	this.price = price;
    }

    public boolean isDeleted()
    {
	return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted)
    {
	this.isDeleted = isDeleted;
    }
}
