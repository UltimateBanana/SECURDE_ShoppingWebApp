package model;

import java.util.ArrayList;
import java.util.Calendar;

public class Receipt
{
    public static final String TABLE_NAME = "receipt" ;
    public static final String COLUMN_RECEIPT_ID = "receipt_id" ;
    public static final String COLUMN_DATE = "date" ;
    public static final String COLUMN_CREDIT_CARD_NUMBER = "credit_card_number";
    public static final String COLUMN_PRICE = "total_price" ;
    
    private String receiptId;
    private Calendar date;
    private String creditCardNumber;
    private double price;
    private ArrayList<ReceiptItem> receiptItems;

    public Receipt()
    {
    }

    public Receipt(Calendar date, String creditCardNumber, double price)
    {
	this.date = date;
	this.creditCardNumber = creditCardNumber;
	this.price = price;
	this.receiptItems = new ArrayList<>(0);
    }
    
    public Receipt(Calendar date, String creditCardNumber, double price, ArrayList<ReceiptItem> receiptItems)
    {
	this.date = date;
	this.creditCardNumber = creditCardNumber;
	this.price = price;
	this.receiptItems = receiptItems;
    }

    public Receipt(String receiptId, Calendar date, String creditCardNumber, double price)
    {
	this.receiptId = receiptId;
	this.date = date;
	this.creditCardNumber = creditCardNumber;
	this.price = price;
	this.receiptItems = new ArrayList<>(0);
    }
    
    public Receipt(String receiptId, Calendar date, String creditCardNumber, double price, ArrayList<ReceiptItem> receiptItems)
    {
	this.receiptId = receiptId;
	this.date = date;
	this.creditCardNumber = creditCardNumber;
	this.price = price;
	this.receiptItems = receiptItems;
    }

    public String getReceiptId()
    {
	return receiptId;
    }

    public void setReceiptId(String receiptId)
    {
	this.receiptId = receiptId;
    }

    public Calendar getDate()
    {
	return date;
    }

    public void setDate(Calendar date)
    {
	this.date = date;
    }

    public String getCreditCardNumber()
    {
	return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber)
    {
	this.creditCardNumber = creditCardNumber;
    }

    public double getPrice()
    {
	return price;
    }

    public void setPrice(double price)
    {
	this.price = price;
    }

    public ArrayList<ReceiptItem> getReceiptItems()
    {
	return receiptItems;
    }

    public void setReceiptItems(ArrayList<ReceiptItem> receiptItems)
    {
	this.receiptItems = receiptItems;
    }
    
    
}
