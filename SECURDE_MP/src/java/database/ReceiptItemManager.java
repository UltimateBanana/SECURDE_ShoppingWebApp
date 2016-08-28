package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.Product;
import model.Receipt;
import model.ReceiptItem;
import result.SalesResult;

public class ReceiptItemManager
{
    private static ReceiptItemManager receiptItemManager = new ReceiptItemManager();
    private FeedbackManager feedbackManager;
    private ProductManager productManager;
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private ReceiptItemManager()
    {
	feedbackManager = FeedbackManager.getInstance();
	productManager = ProductManager.getInstance();
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static ReceiptItemManager getInstance()
    {
	return receiptItemManager;
    }
    
    // QUERY
    public ReceiptItem queryReceiptItem( int receiptItemId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + ReceiptItem.TABLE_NAME
		+ " WHERE " + ReceiptItem.COLUMN_RECEIPT_ITEM_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, receiptItemId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		Product product = productManager.queryProduct(rs.getInt(Product.COLUMN_PRODUCT_ID));
		ArrayList<Feedback> feedbacks = feedbackManager.queryAllFeedbackByReceiptItem(receiptItemId);

		return new ReceiptItem(Integer.toString(rs.getInt(ReceiptItem.COLUMN_RECEIPT_ITEM_ID)),
				       product,
				       rs.getInt(ReceiptItem.COLUMN_QUANTITY),
				       rs.getDouble(ReceiptItem.COLUMN_SUBTOTAL),
				       feedbacks);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public ArrayList<ReceiptItem> queryAllReceiptItemByReceipt( int receiptId )
    {
	ArrayList<ReceiptItem> receiptItems = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + ReceiptItem.TABLE_NAME
		+ " WHERE " + Receipt.COLUMN_RECEIPT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, receiptId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		Product product = productManager.queryProduct(rs.getInt(Product.COLUMN_PRODUCT_ID));
		ArrayList<Feedback> feedbacks = feedbackManager.queryAllFeedbackByReceiptItem(rs.getInt(ReceiptItem.COLUMN_RECEIPT_ITEM_ID));

		ReceiptItem receiptItem =  new ReceiptItem(Integer.toString(rs.getInt(ReceiptItem.COLUMN_RECEIPT_ITEM_ID)),
							   product,
							   rs.getInt(ReceiptItem.COLUMN_QUANTITY),
							   rs.getDouble(ReceiptItem.COLUMN_SUBTOTAL),
							   feedbacks);
		
		receiptItems.add(receiptItem);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return receiptItems;
    }
    
    // INSERT
    public int insertReceiptItem( int receiptId, ReceiptItem receiptItem )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + ReceiptItem.TABLE_NAME
		+ " ( " + Receipt.COLUMN_RECEIPT_ID + ", " + Product.COLUMN_PRODUCT_ID + ", " + ReceiptItem.COLUMN_QUANTITY + ", " + ReceiptItem.COLUMN_SUBTOTAL + " ) "
		+ " VALUES ( ?, ?, ?, ? );";
	
	try
	{
	    ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    ps.setInt(1, receiptId);
	    ps.setInt(2, Integer.parseInt(receiptItem.getProduct().getProductId()));
	    ps.setInt(3, receiptItem.getQuantity());
	    ps.setDouble(4, receiptItem.getSubtotal());
	    
	    int affectedRows = ps.executeUpdate();
	    int genId;
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating receiptitem failed, no rows affected.");
	    }
	    
	    try( ResultSet generatedKeys = ps.getGeneratedKeys() )
	    {
		if( generatedKeys.next() )
		{
		    genId = generatedKeys.getInt(1);
		    
		    for( int i = 0; i < receiptItem.getFeedbacks().size(); i++ )
		    {
			feedbackManager.insertFeedback(genId, receiptItem.getFeedbacks().get(i));
		    }
		    
		    receiptItem.setReceiptItemId(Integer.toString(genId));
		    
		    return genId;
		}
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return -999;
    }
    
    // UPDATE
    public boolean updateReceiptItem( ReceiptItem receiptItem )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + ReceiptItem.TABLE_NAME
		+ " SET " + Product.COLUMN_PRODUCT_ID + " = ?, " + ReceiptItem.COLUMN_QUANTITY + " = ?, " + ReceiptItem.COLUMN_SUBTOTAL + " = ? "
		+ " WHERE " + ReceiptItem.COLUMN_RECEIPT_ITEM_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, Integer.parseInt(receiptItem.getProduct().getProductId()));
	    ps.setInt(2, receiptItem.getQuantity());
	    ps.setDouble(3, receiptItem.getSubtotal());
	    ps.setInt(4, Integer.parseInt(receiptItem.getReceiptItemId()));
	    
	    ps.executeUpdate();
	    
	    for( int i = 0; i < receiptItem.getFeedbacks().size(); i++ )
	    {
		feedbackManager.updateFeedback(receiptItem.getFeedbacks().get(i));
	    }
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE
    
    // RESTORE
    
    // SALES - Total Sales Per Category
    public ArrayList<SalesResult> queryTotalSalesPerCategory()
    {
	ArrayList<SalesResult> salesResults = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT P." + Product.COLUMN_CATEGORY + ", SUM(RI." + ReceiptItem.COLUMN_SUBTOTAL + ") AS 'total_sales_category'"
		+ " FROM " + ReceiptItem.TABLE_NAME + " RI, " + Product.TABLE_NAME + " P "
		+ " WHERE RI." + Product.COLUMN_PRODUCT_ID + " = P." + Product.COLUMN_PRODUCT_ID
		+ " GROUP BY P." + Product.COLUMN_CATEGORY
		+ " ORDER BY P." + Product.COLUMN_CATEGORY + ";";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		SalesResult salesResult = new SalesResult(rs.getString(Product.COLUMN_CATEGORY), rs.getDouble("total_sales_category"));
		
		salesResults.add(salesResult);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return salesResults;
    }
    
    // SALES - Total Sales Per Product
    public ArrayList<SalesResult> queryTotalSalesPerProduct()
    {
	ArrayList<SalesResult> salesResults = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT P." + Product.COLUMN_NAME + ", SUM(RI." + ReceiptItem.COLUMN_SUBTOTAL + ") AS 'total_sales_product'"
		+ " FROM " + ReceiptItem.TABLE_NAME + " RI, " + Product.TABLE_NAME + " P "
		+ " WHERE RI." + Product.COLUMN_PRODUCT_ID + " = P." + Product.COLUMN_PRODUCT_ID
		+ " GROUP BY P." + Product.COLUMN_NAME
		+ " ORDER BY P." + Product.COLUMN_NAME + ";";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		SalesResult salesResult = new SalesResult(rs.getString(Product.COLUMN_NAME), rs.getDouble("total_sales_product"));
		
		salesResults.add(salesResult);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ReceiptItemManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return salesResults;
    }
}
