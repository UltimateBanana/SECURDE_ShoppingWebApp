package model;

public class CreditCard
{
    public static final String TABLE_NAME = "creditcard";
    public static final String COLUMN_CREDIT_CARD_NUMBER = "credit_card_number";
    public static final String COLUMN_SECURITY_PIN = "security_pin";
    public static final String COLUMN_CREDIT_LIMIT = "credit_limit";
    
    private String creditCardNumber;
    private String securityPin;
    private int creditLimit;

    public CreditCard()
    {
    }

    public CreditCard(String creditCardNumber, String securityPin, int creditLimit)
    {
	this.creditCardNumber = creditCardNumber;
	this.securityPin = securityPin;
	this.creditLimit = creditLimit;
    }

    public String getCreditCardNumber()
    {
	return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber)
    {
	this.creditCardNumber = creditCardNumber;
    }

    public String getSecurityPin()
    {
	return securityPin;
    }

    public void setSecurityPin(String securityPin)
    {
	this.securityPin = securityPin;
    }

    public int getCreditLimit()
    {
	return creditLimit;
    }

    public void setCreditLimit(int creditLimit)
    {
	this.creditLimit = creditLimit;
    }
}
