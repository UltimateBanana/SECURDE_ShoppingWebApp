package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Receipt;
import model.ReceiptItem;
import result.SalesResult;

public class ReceiptManager
{
    private static ReceiptManager receiptManager = new ReceiptManager();
    private ReceiptItemManager receiptItemManager;
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private ReceiptManager()
    {
	receiptItemManager = ReceiptItemManager.getInstance();
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static ReceiptManager getInstance()
    {
	return receiptManager;
    }
    
    // QUERY
    public Receipt queryReceipt( int receiptId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Receipt.TABLE_NAME
		+ " WHERE " + Receipt.COLUMN_RECEIPT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, receiptId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(rs.getDate(Receipt.COLUMN_DATE));

		ArrayList<ReceiptItem> receiptItems = receiptItemManager.queryAllReceiptItemByReceipt(receiptId);

		return new Receipt(Integer.toString(rs.getInt(Receipt.COLUMN_RECEIPT_ID)),
				   calendar,
				   rs.getString(Receipt.COLUMN_CREDIT_CARD_NUMBER),
				   rs.getDouble(Receipt.COLUMN_PRICE),
				   receiptItems);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public ArrayList<Receipt> queryAllReceiptByAccount( int accountId )
    {
	ArrayList<Receipt> receipts = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Receipt.TABLE_NAME
		+ " WHERE " + Account.COLUMN_ACCOUNT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, accountId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(rs.getDate(Receipt.COLUMN_DATE));
	    
		ArrayList<ReceiptItem> receiptItems = receiptItemManager.queryAllReceiptItemByReceipt(rs.getInt(Receipt.COLUMN_RECEIPT_ID));
	    
		Receipt receipt = new Receipt(Integer.toString(rs.getInt(Receipt.COLUMN_RECEIPT_ID)),
					      calendar,
					      rs.getString(Receipt.COLUMN_CREDIT_CARD_NUMBER),
					      rs.getDouble(Receipt.COLUMN_PRICE),
					      receiptItems);
		
		receipts.add(receipt);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return receipts;
    }
    
    // INSERT
    public int insertReceipt( int accountId, Receipt receipt )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + Receipt.TABLE_NAME
		+ " ( " + Account.COLUMN_ACCOUNT_ID + ", " + Receipt.COLUMN_CREDIT_CARD_NUMBER + ", " + Receipt.COLUMN_DATE + ", " + Receipt.COLUMN_PRICE + " ) "
		+ " VALUES ( ?, ?, ?, ? );";
	
	try
	{
	    ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    ps.setInt(1, accountId);
	    ps.setString(2, receipt.getCreditCardNumber());
	    ps.setDate(3, new java.sql.Date(receipt.getDate().getTimeInMillis()));
	    ps.setDouble(4, receipt.getPrice());
	    
	    int affectedRows = ps.executeUpdate();
	    int genId;
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating receipt failed, no rows affected.");
	    }
	    
	    try( ResultSet generatedKeys = ps.getGeneratedKeys() )
	    {
		if( generatedKeys.next() )
		{
		    genId = generatedKeys.getInt(1);
		    
		    if( receipt.getReceiptItems() != null || receipt.getReceiptItems().size() != 0 )
		    {
			for( int i = 0; i < receipt.getReceiptItems().size(); i++ )
			{
			    receiptItemManager.insertReceiptItem(genId, receipt.getReceiptItems().get(i));
			}
		    }
		    receipt.setReceiptId(Integer.toString(genId));
		    
		    return genId;
		}
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return -999;
    }
    
    // UPDATE
    public boolean updateReceipt( Receipt receipt )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Receipt.TABLE_NAME
		+ " SET " + Receipt.COLUMN_CREDIT_CARD_NUMBER + " = ?, " + Receipt.COLUMN_DATE + " = ?, " + Receipt.COLUMN_PRICE + " = ? "
		+ " WHERE " + Receipt.COLUMN_RECEIPT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, receipt.getCreditCardNumber());
	    ps.setDate(2, new java.sql.Date(receipt.getDate().getTimeInMillis()));
	    ps.setDouble(3, receipt.getPrice());
	    ps.setInt(4, Integer.parseInt(receipt.getReceiptId()));
	    
	    ps.executeUpdate();
	    
	    for( int i = 0; i < receipt.getReceiptItems().size(); i++ )
	    {
		receiptItemManager.updateReceiptItem(receipt.getReceiptItems().get(i));
	    }
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE
    
    // RESTORE
    
    // SALES - Total Sales
    public SalesResult queryTotalSales()
    {
	PreparedStatement ps;
	String sql = "SELECT SUM(" + Receipt.COLUMN_PRICE + ") AS 'total_sales' "
		+ " FROM " + Receipt.TABLE_NAME + ";";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		return new SalesResult("ALL", rs.getDouble("total_sales"));
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return new SalesResult("ALL", 0);
    }
}
