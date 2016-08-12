package request;

import enumeration.Category;
import enumeration.Operators;
import enumeration.OrderBy;

public class ProductRequest
{
    private String name;
    private Category category;
    private double price;
    private String operator;
    private OrderBy order;
    private int isDeleted;
    
    public ProductRequest()
    {
	this.name = null;
	this.category = Category.translateCategoryStringToEnum("");
	this.price = -1;
	this.operator = Operators.translateOperatorStringToSQL("");
	this.order = OrderBy.translateOrderByStringToSQL("");
	this.isDeleted = -1;
    }

    public String getName()
    {
	return name;
    }

    public void setName(String name)
    {
	this.name = name;
    }

    public String getCategory()
    {
	if( category == null )
	{
	    return null;
	}
	else
	{
	    return category.toString();
	}
    }

    public void setCategory(String category)
    {
	this.category = Category.translateCategoryStringToEnum(category);
    }

    public double getPrice()
    {
	return price;
    }

    public void setPrice(double price)
    {
	this.price = price;
    }

    public String getOperator()
    {
	return operator;
    }

    public void setOperator(String operator)
    {
	this.operator = Operators.translateOperatorStringToSQL(operator);
    }

    public String getOrder()
    {
	return order.toString();
    }

    public void setOrder(String order)
    {
	this.order = OrderBy.translateOrderByStringToSQL(order);
    }

    public int isDeleted()
    {
	return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted)
    {
	if( isDeleted )
	{
	    this.isDeleted = 1;
	}
	else
	{
	    this.isDeleted = 0;
	}
    }
}
