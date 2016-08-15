package database;

import enumeration.AccessLevel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Address;
import model.CreditCard;
import model.Receipt;
import request.AccountRequest;

public class AccountManager
{
    private static AccountManager accountManager = new AccountManager();
    private CreditCardManager creditCardManager;
    private ReceiptManager receiptManager;
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private AccountManager()
    {
	creditCardManager = CreditCardManager.getInstance();
	receiptManager = ReceiptManager.getInstance();
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static AccountManager getInstance()
    {
	return accountManager;
    }
    
    // QUERY
    public Account queryAccount( int accountId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Account.TABLE_NAME
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		Address billingAddress = new Address(rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_STREET),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_SUBDIVISION),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_CITY),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_COUNTRY));

		Address shippingAddress = new Address(rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_STREET),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_SUBDIVISION),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_CITY),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_COUNTRY));

		CreditCard creditCard = creditCardManager.queryCreditCardByAccount(accountId);

		ArrayList<Receipt> receipts = receiptManager.queryAllReceiptByAccount(accountId);

		int locked = rs.getInt(Account.COLUMN_IS_LOCKED);
		boolean isLocked;

		if( locked == 0 )
		{
		    isLocked = false;
		}
		else
		{
		    isLocked = true;
		}

		return new Account(Integer.toString(rs.getInt(Account.COLUMN_ACCOUNT_ID)),
				   AccessLevel.translateAccessLevelStringToEnum(rs.getString(Account.COLUMN_ACCESS_LEVEL)),
				   rs.getString(Account.COLUMN_FIRST_NAME),
				   rs.getString(Account.COLUMN_MIDDLE_NAME),
				   rs.getString(Account.COLUMN_LAST_NAME),
				   rs.getString(Account.COLUMN_USERNAME),
				   rs.getString(Account.COLUMN_PASSWORD),
				   rs.getString(Account.COLUMN_EMAIL),
				   creditCard,
				   billingAddress,
				   shippingAddress,
				   receipts,
				   isLocked);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public Account queryAccountByCredentials( String username, String password )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Account.TABLE_NAME
		+ " WHERE " + Account.COLUMN_USERNAME + " = ? AND " + Account.COLUMN_PASSWORD + " = ?";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, username);
	    ps.setString(2, password);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		Address billingAddress = new Address(rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_STREET),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_SUBDIVISION),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_CITY),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						     rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_COUNTRY));

		Address shippingAddress = new Address(rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_STREET),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_SUBDIVISION),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_CITY),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_COUNTRY));

		CreditCard creditCard = creditCardManager.queryCreditCardByAccount(rs.getInt(Account.COLUMN_ACCOUNT_ID));

		ArrayList<Receipt> receipts = receiptManager.queryAllReceiptByAccount(rs.getInt(Account.COLUMN_ACCOUNT_ID));

		int locked = rs.getInt(Account.COLUMN_IS_LOCKED);
		boolean isLocked;

		if( locked == 0 )
		{
		    isLocked = false;
		}
		else
		{
		    isLocked = true;
		}

		return new Account(Integer.toString(rs.getInt(Account.COLUMN_ACCOUNT_ID)),
				   AccessLevel.translateAccessLevelStringToEnum(rs.getString(Account.COLUMN_ACCESS_LEVEL)),
				   rs.getString(Account.COLUMN_FIRST_NAME),
				   rs.getString(Account.COLUMN_MIDDLE_NAME),
				   rs.getString(Account.COLUMN_LAST_NAME),
				   rs.getString(Account.COLUMN_USERNAME),
				   rs.getString(Account.COLUMN_PASSWORD),
				   rs.getString(Account.COLUMN_EMAIL),
				   creditCard,
				   billingAddress,
				   shippingAddress,
				   receipts,
				   isLocked);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public String queryUser(String username){
        String sql = "SELECT *"
                + " FROM " + Account.TABLE_NAME
                + " WHERE " + Account.COLUMN_USERNAME + " = ?";
        String id = "";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                id = String.valueOf(rs.getInt(Account.COLUMN_ACCOUNT_ID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public ArrayList<Account> queryAllAccounts( AccountRequest accountRequest )
    {
	ArrayList<Account> accounts = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Account.TABLE_NAME
		+ " WHERE " + Account.COLUMN_IS_LOCKED + " = IFNULL(?, " + Account.COLUMN_IS_LOCKED + " );";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    
	    // if filter is null, pass null, else pass filter value
	    if( accountRequest.isLocked() == -1 )
	    {
		ps.setString(1, null);
	    }
	    else
	    {
		ps.setInt(1, accountRequest.isLocked());
	    }
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		Address billingAddress = new Address(rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						 rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_STREET),
						 rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_SUBDIVISION),
						 rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_CITY),
						 rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						 rs.getString(Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_COUNTRY));
	    
		Address shippingAddress = new Address(rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_HOUSE_NUMBER),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_STREET),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_SUBDIVISION),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_CITY),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_POSTAL_CODE),
						     rs.getString(Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_COUNTRY));

		CreditCard creditCard = creditCardManager.queryCreditCardByAccount(rs.getInt(Account.COLUMN_ACCOUNT_ID));

		ArrayList<Receipt> receipts = receiptManager.queryAllReceiptByAccount(rs.getInt(Account.COLUMN_ACCOUNT_ID));

		int locked = rs.getInt(Account.COLUMN_IS_LOCKED);
		boolean isLocked;

		if( locked == 0 )
		{
		    isLocked = false;
		}
		else
		{
		    isLocked = true;
		}

		Account account =  new Account(Integer.toString(rs.getInt(Account.COLUMN_ACCOUNT_ID)),
					       AccessLevel.translateAccessLevelStringToEnum(rs.getString(Account.COLUMN_ACCESS_LEVEL)),
					       rs.getString(Account.COLUMN_FIRST_NAME),
					       rs.getString(Account.COLUMN_MIDDLE_NAME),
					       rs.getString(Account.COLUMN_LAST_NAME),
					       rs.getString(Account.COLUMN_USERNAME),
					       rs.getString(Account.COLUMN_PASSWORD),
					       rs.getString(Account.COLUMN_EMAIL),
					       creditCard,
					       billingAddress,
					       shippingAddress,
					       receipts,
					       isLocked);
		accounts.add(account);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return accounts;
    }
    
    // INSERT
    public int insertAccount( Account account )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + Account.TABLE_NAME
		+ " ( " + Account.COLUMN_ACCESS_LEVEL + ", " + Account.COLUMN_FIRST_NAME + ", " + Account.COLUMN_MIDDLE_NAME + ", " + Account.COLUMN_LAST_NAME + ", " 
			+ Account.COLUMN_USERNAME + ", " + Account.COLUMN_PASSWORD + ", " + Account.COLUMN_EMAIL + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_HOUSE_NUMBER + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_STREET + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_SUBDIVISION + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_CITY + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_POSTAL_CODE + ", " 
			+ Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_COUNTRY  + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_HOUSE_NUMBER + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_STREET + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_SUBDIVISION + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_CITY + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_POSTAL_CODE + ", " 
			+ Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_COUNTRY + ", " + Account.COLUMN_IS_LOCKED + " ) "
		+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );";
	
	int isLocked;
	
	if( account.isLocked() )
	{
	    isLocked = 1;
	}
	else
	{
	    isLocked = 0;
	}
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, account.getAccessLevel().toString());
	    ps.setString(2, account.getFirstName());
	    ps.setString(3, account.getMiddleName());
	    ps.setString(4, account.getLastName());
	    ps.setString(5, account.getUsername());
	    ps.setString(6, account.getPassword());
	    ps.setString(7, account.getEmail());
	    ps.setString(8, account.getBillingAddress().getHouseNumber());
	    ps.setString(9, account.getBillingAddress().getStreet());
	    ps.setString(10, account.getBillingAddress().getSubdivision());
	    ps.setString(11, account.getBillingAddress().getCity());
	    ps.setInt(12, Integer.parseInt(account.getBillingAddress().getPostalCode()));
	    ps.setString(13, account.getBillingAddress().getCountry());
	    ps.setString(14, account.getShippingAddress().getHouseNumber());
	    ps.setString(15, account.getShippingAddress().getStreet());
	    ps.setString(16, account.getShippingAddress().getSubdivision());
	    ps.setString(17, account.getShippingAddress().getCity());
	    ps.setInt(18, Integer.parseInt(account.getShippingAddress().getPostalCode()));
	    ps.setString(19, account.getShippingAddress().getCountry());
	    ps.setInt(20, isLocked);
	    
	    int affectedRows = ps.executeUpdate();
	    int genId;
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating account failed, no rows affected.");
	    }
	    
	    try( ResultSet generatedKeys = ps.getGeneratedKeys() )
	    {
		if( generatedKeys.next() )
		{
		    genId = generatedKeys.getInt(1);
		    
		    account.setAccountId(Integer.toString(genId));
		    
		    return genId;
		}
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return -999;
    }
    
    // UPDATE
    public boolean updateAccount( Account account )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Account.TABLE_NAME
		+ " SET " + Account.COLUMN_ACCESS_LEVEL + " = ?, " + Account.COLUMN_FIRST_NAME + " = ?, " + Account.COLUMN_MIDDLE_NAME + " = ?, " + Account.COLUMN_LAST_NAME + " = ?, " 
			  + Account.COLUMN_USERNAME + " = ?, " + Account.COLUMN_PASSWORD + " = ?, " + Account.COLUMN_EMAIL + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_HOUSE_NUMBER + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_STREET + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_SUBDIVISION + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_CITY + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_POSTAL_CODE + " = ?, " 
			  + Account.COLUMN_BILLING_ADDRESS + Address.COLUMN_COUNTRY  + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_HOUSE_NUMBER + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_STREET + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_SUBDIVISION + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_CITY + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_POSTAL_CODE + " = ?, " 
			  + Account.COLUMN_SHIPPING_ADDRESS + Address.COLUMN_COUNTRY + " = ? "
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, account.getAccessLevel().toString());
	    ps.setString(2, account.getFirstName());
	    ps.setString(3, account.getMiddleName());
	    ps.setString(4, account.getLastName());
	    ps.setString(5, account.getUsername());
	    ps.setString(6, account.getPassword());
	    ps.setString(7, account.getEmail());
	    ps.setString(8, account.getBillingAddress().getHouseNumber());
	    ps.setString(9, account.getBillingAddress().getStreet());
	    ps.setString(10, account.getBillingAddress().getSubdivision());
	    ps.setString(11, account.getBillingAddress().getCity());
	    ps.setInt(12, Integer.parseInt(account.getBillingAddress().getPostalCode()));
	    ps.setString(13, account.getBillingAddress().getCountry());
	    ps.setString(14, account.getShippingAddress().getHouseNumber());
	    ps.setString(15, account.getShippingAddress().getStreet());
	    ps.setString(16, account.getShippingAddress().getSubdivision());
	    ps.setString(17, account.getShippingAddress().getCity());
	    ps.setInt(18, Integer.parseInt(account.getShippingAddress().getPostalCode()));
	    ps.setString(19, account.getShippingAddress().getCountry());
	    ps.setInt(20, Integer.parseInt(account.getAccountId()));
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE / LOCK
    public boolean lockAccount( int accountId )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Account.TABLE_NAME
		+ " SET " + Account.COLUMN_IS_LOCKED + " = ?"
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, 1);
	    ps.setInt(2, accountId);
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // RESTORE
    public boolean unlockAccount( int accountId )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Account.TABLE_NAME
		+ " SET " + Account.COLUMN_IS_LOCKED + " = ?"
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, 0);
	    ps.setInt(2, accountId);
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
}
