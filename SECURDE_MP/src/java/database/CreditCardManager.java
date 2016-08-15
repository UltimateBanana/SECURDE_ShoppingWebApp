package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.CreditCard;

public class CreditCardManager
{
    private static CreditCardManager creditCardManager = new CreditCardManager();
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private CreditCardManager()
    {
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static CreditCardManager getInstance()
    {
	return creditCardManager;
    }
    
    // QUERY
    public CreditCard queryCreditCardByAccount( int accountId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + CreditCard.TABLE_NAME
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		return new CreditCard(rs.getString(CreditCard.COLUMN_CREDIT_CARD_NUMBER),
				      rs.getString(CreditCard.COLUMN_SECURITY_PIN),
				      rs.getInt(CreditCard.COLUMN_CREDIT_LIMIT));
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(CreditCardManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public CreditCard queryCreditCard( int accountId, String creditCardNumber )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + CreditCard.TABLE_NAME
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ? AND " + CreditCard.COLUMN_CREDIT_CARD_NUMBER + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    ps.setString(2, creditCardNumber);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		return new CreditCard(rs.getString(CreditCard.COLUMN_CREDIT_CARD_NUMBER),
				      rs.getString(CreditCard.COLUMN_SECURITY_PIN),
				      rs.getInt(CreditCard.COLUMN_CREDIT_LIMIT));
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(CreditCardManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    // INSERT
    public boolean insertCreditCard( int accountId, CreditCard creditCard )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + CreditCard.TABLE_NAME
		+ " ( " + Account.COLUMN_ACCOUNT_ID + ", " + CreditCard.COLUMN_CREDIT_CARD_NUMBER + ", " + CreditCard.COLUMN_SECURITY_PIN + ", " + CreditCard.COLUMN_CREDIT_LIMIT + " ) "
		+ " VALUES ( ?, ?, ?, ? );";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    ps.setString(2, creditCard.getCreditCardNumber());
	    ps.setString(3, creditCard.getSecurityPin());
	    ps.setInt(4, creditCard.getCreditLimit());
	    
	    int affectedRows = ps.executeUpdate();
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating creditcard failed, no rows affected.");
	    }
	    else
	    {
		return true;
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(CreditCardManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // UPDATE
    public boolean updateCreditCard( int accountId, CreditCard creditCard )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + CreditCard.TABLE_NAME
		+ " SET " + CreditCard.COLUMN_CREDIT_LIMIT + " = ? "
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ? AND " + CreditCard.COLUMN_CREDIT_CARD_NUMBER + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, creditCard.getCreditLimit());
	    ps.setInt(2, accountId);
	    ps.setString(3, creditCard.getCreditCardNumber());
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(CreditCardManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE
    public boolean deleteCreditCard( int accountId, String creditCardNumber )
    {
	PreparedStatement ps;
	String sql = "DELETE FROM " + CreditCard.TABLE_NAME
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ? AND " + CreditCard.COLUMN_CREDIT_CARD_NUMBER + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    ps.setString(2, creditCardNumber);
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(CreditCardManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // RESTORE
}
