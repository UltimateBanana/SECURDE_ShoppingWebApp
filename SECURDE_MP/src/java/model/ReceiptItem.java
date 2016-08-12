package model;

import java.util.ArrayList;

public class ReceiptItem
{
    public static final String TABLE_NAME = "receiptitem" ;
    public static final String COLUMN_RECEIPT_ITEM_ID = "receipt_item_id" ;
    public static final String COLUMN_QUANTITY = "quantity" ;
    public static final String COLUMN_SUBTOTAL = "subtotal" ;
    
    private String receiptItemId;
    private Product product;
    private int quantity;
    private double subtotal;
    private ArrayList<Feedback> feedbacks;

    public ReceiptItem()
    {
    }

    public ReceiptItem(Product product, int quantity, double subtotal)
    {
	this.product = product;
	this.quantity = quantity;
	this.subtotal = subtotal;
	this.feedbacks = new ArrayList<>(0);
    }
    
    public ReceiptItem(Product product, int quantity, double subtotal, ArrayList<Feedback> feedbacks)
    {
	this.product = product;
	this.quantity = quantity;
	this.subtotal = subtotal;
	this.feedbacks = feedbacks;
    }

    public ReceiptItem(String receiptItemId, Product product, int quantity, double subtotal)
    {
	this.receiptItemId = receiptItemId;
	this.product = product;
	this.quantity = quantity;
	this.subtotal = subtotal;
	this.feedbacks = new ArrayList<>(0);
    }
    
    public ReceiptItem(String receiptItemId, Product product, int quantity, double subtotal, ArrayList<Feedback> feedbacks)
    {
	this.receiptItemId = receiptItemId;
	this.product = product;
	this.quantity = quantity;
	this.subtotal = subtotal;
	this.feedbacks = feedbacks;
    }

    public String getReceiptItemId()
    {
	return receiptItemId;
    }

    public void setReceiptItemId(String receiptItemId)
    {
	this.receiptItemId = receiptItemId;
    }

    public Product getProduct()
    {
	return product;
    }

    public void setProduct(Product product)
    {
	this.product = product;
    }

    public int getQuantity()
    {
	return quantity;
    }

    public void setQuantity(int quantity)
    {
	this.quantity = quantity;
    }

    public double getSubtotal()
    {
	return subtotal;
    }

    public void setSubtotal(double subtotal)
    {
	this.subtotal = subtotal;
    }

    public ArrayList<Feedback> getFeedbacks()
    {
	return feedbacks;
    }

    public void setFeedbacks(ArrayList<Feedback> feedbacks)
    {
	this.feedbacks = feedbacks;
    }
    
    
}
