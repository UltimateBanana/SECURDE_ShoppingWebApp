package model;

import enumeration.AccessLevel;
import java.util.ArrayList;

public class Account
{
    public static final String TABLE_NAME = "account";
    public static final String COLUMN_ACCOUNT_ID = "account_id";
    public static final String COLUMN_ACCESS_LEVEL = "access_level";
    public static final String COLUMN_FIRST_NAME = "first_name";
    public static final String COLUMN_MIDDLE_NAME = "middle_name";
    public static final String COLUMN_LAST_NAME = "last_name";
    public static final String COLUMN_USERNAME = "username";
    public static final String COLUMN_PASSWORD = "password";
    public static final String COLUMN_EMAIL = "email";
    public static final String COLUMN_BILLING_ADDRESS = "billing_" ;
    public static final String COLUMN_SHIPPING_ADDRESS = "shipping_" ;
    public static final String COLUMN_IS_LOCKED = "is_locked";
    
    private String accountId;
    private AccessLevel accessLevel;
    private String firstName;
    private String middleName;
    private String lastName;
    private String username;
    private String password;
    private String email;
    private CreditCard creditCard;
    private Address billingAddress;
    private Address shippingAddress;
    private ArrayList<Receipt> receipts;
    private boolean isLocked;
    
    public Account()
    {
    }

    public Account(AccessLevel accessLevel, String firstName, String middleName, String lastName, String username, String password, String email, Address billingAddress, Address shippingAddress)
    {
	this.accessLevel = accessLevel;
	this.firstName = firstName;
	this.middleName = middleName;
	this.lastName = lastName;
	this.username = username;
	this.password = password;
	this.email = email;
	this.creditCard = null;
	this.billingAddress = billingAddress;
	this.shippingAddress = shippingAddress;
	this.receipts = new ArrayList<>(0);
	this.isLocked = false;
    }

    public Account(String accountId, AccessLevel accessLevel, String firstName, String middleName, String lastName, String username, String password, String email, CreditCard creditCard, Address billingAddress, Address shippingAddress, ArrayList<Receipt> receipts, boolean isLocked)
    {
	this.accountId = accountId;
	this.accessLevel = accessLevel;
	this.firstName = firstName;
	this.middleName = middleName;
	this.lastName = lastName;
	this.username = username;
	this.password = password;
	this.email = email;
	this.creditCard = creditCard;
	this.billingAddress = billingAddress;
	this.shippingAddress = shippingAddress;
	this.receipts = receipts;
	this.isLocked = isLocked;
    }

    public String getAccountId()
    {
	return accountId;
    }

    public void setAccountId(String accountId)
    {
	this.accountId = accountId;
    }

    public AccessLevel getAccessLevel()
    {
	return accessLevel;
    }

    public void setAccessLevel(AccessLevel accessLevel)
    {
	this.accessLevel = accessLevel;
    }

    public String getFirstName()
    {
	return firstName;
    }

    public void setFirstName(String firstName)
    {
	this.firstName = firstName;
    }

    public String getMiddleName()
    {
	return middleName;
    }

    public void setMiddleName(String middleName)
    {
	this.middleName = middleName;
    }

    public String getLastName()
    {
	return lastName;
    }

    public void setLastName(String lastName)
    {
	this.lastName = lastName;
    }

    public String getUsername()
    {
	return username;
    }

    public void setUsername(String username)
    {
	this.username = username;
    }

    public String getPassword()
    {
	return password;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    public CreditCard getCreditCard()
    {
	return creditCard;
    }

    public void setCreditCard(CreditCard creditCard)
    {
	this.creditCard = creditCard;
    }

    public Address getBillingAddress()
    {
	return billingAddress;
    }

    public void setBillingAddress(Address billingAddress)
    {
	this.billingAddress = billingAddress;
    }

    public Address getShippingAddress()
    {
	return shippingAddress;
    }

    public void setShippingAddress(Address shippingAddress)
    {
	this.shippingAddress = shippingAddress;
    }

    public ArrayList<Receipt> getReceipts()
    {
	return receipts;
    }

    public void setReceipts(ArrayList<Receipt> receipts)
    {
	this.receipts = receipts;
    }

    public boolean isLocked()
    {
	return isLocked;
    }

    public void setIsLocked(boolean isLocked)
    {
	this.isLocked = isLocked;
    }
}
