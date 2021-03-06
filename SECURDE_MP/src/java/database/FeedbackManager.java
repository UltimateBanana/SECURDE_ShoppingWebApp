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
import model.Feedback;
import model.Product;
import model.Receipt;
import model.ReceiptItem;
import result.FeedbackResult;

public class FeedbackManager
{
    private static FeedbackManager feedbackManager = new FeedbackManager();
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private FeedbackManager()
    {
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static FeedbackManager getInstance()
    {
	return feedbackManager;
    }
    
    // QUERY
    public Feedback queryFeedback( int feedbackId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Feedback.TABLE_NAME
		+ " WHERE " + Feedback.COLUMN_FEEDBACK_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, feedbackId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    if( rs.next() )
	    {
		return new Feedback(Integer.toString(rs.getInt(Feedback.COLUMN_FEEDBACK_ID)),
				    rs.getString(Feedback.COLUMN_FEEDBACK));
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(FeedbackManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public ArrayList<Feedback> queryAllFeedbackByReceiptItem( int receiptItemId )
    {
	ArrayList<Feedback> feedbacks = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Feedback.TABLE_NAME
		+ " WHERE " + ReceiptItem.COLUMN_RECEIPT_ITEM_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, receiptItemId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next())
	    {
		Feedback feedback = new Feedback(Integer.toString(rs.getInt(Feedback.COLUMN_FEEDBACK_ID)),
						 rs.getString(Feedback.COLUMN_FEEDBACK));
		
		feedbacks.add(feedback);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(FeedbackManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return feedbacks;	
    }
    
    public ArrayList<FeedbackResult> queryAllFeedbackByProduct( int productId )
    {
	ArrayList<FeedbackResult> feedbackResults = new ArrayList<>(0);
	PreparedStatement ps;
	String sql = "SELECT A." + Account.COLUMN_FIRST_NAME + ", A." + Account.COLUMN_MIDDLE_NAME + ", A." + Account.COLUMN_LAST_NAME 
			+ ", A." + Account.COLUMN_USERNAME + ", R." + Receipt.COLUMN_DATE 
			+ ", F." + Feedback.COLUMN_FEEDBACK_ID + ", F." + Feedback.COLUMN_FEEDBACK 
		+ " FROM " + Account.TABLE_NAME + " A, " + Feedback.TABLE_NAME + " F, " + Product.TABLE_NAME + " P, " + Receipt.TABLE_NAME + " R, " + ReceiptItem.TABLE_NAME + " RI "
		+ " WHERE A." + Account.COLUMN_ACCOUNT_ID + " = R." + Account.COLUMN_ACCOUNT_ID
		    + " AND R." + Receipt.COLUMN_RECEIPT_ID + " = RI." + Receipt.COLUMN_RECEIPT_ID 
		    + " AND RI." + ReceiptItem.COLUMN_RECEIPT_ITEM_ID + " = F." + ReceiptItem.COLUMN_RECEIPT_ITEM_ID
		    + " AND RI." + Product.COLUMN_PRODUCT_ID + " = P." + Product.COLUMN_PRODUCT_ID
		    + " AND P." + Product.COLUMN_PRODUCT_ID + " = ? "
		+ " ORDER BY R." + Receipt.COLUMN_DATE + " DESC, A." + Account.COLUMN_USERNAME + " ASC, A." + Account.COLUMN_FIRST_NAME + " ASC, A." 
		    + Account.COLUMN_MIDDLE_NAME + " ASC, A." + Account.COLUMN_LAST_NAME + " ASC, F." + Feedback.COLUMN_FEEDBACK + " ASC;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, productId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while( rs.next() )
	    {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(rs.getDate(Receipt.COLUMN_DATE));
		
		Feedback feedback = new Feedback(Integer.toString(rs.getInt(Feedback.COLUMN_FEEDBACK_ID)),
						 rs.getString(Feedback.COLUMN_FEEDBACK));
		
		FeedbackResult feedbackResult = new FeedbackResult(rs.getString(Account.COLUMN_FIRST_NAME),
								   rs.getString(Account.COLUMN_MIDDLE_NAME),
								   rs.getString(Account.COLUMN_LAST_NAME),
								   rs.getString(Account.COLUMN_USERNAME),
								   calendar, 
								   feedback);
		
		feedbackResults.add(feedbackResult);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(FeedbackManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return feedbackResults;
    }
    
    // INSERT
    public int insertFeedback( int receiptItemId, Feedback feedback )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + Feedback.TABLE_NAME
		+ " ( " + ReceiptItem.COLUMN_RECEIPT_ITEM_ID + ", " + Feedback.COLUMN_FEEDBACK + " ) "
		+ " VALUES ( ?, ? );";
	
	try
	{
	    ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    ps.setInt(1, receiptItemId);
	    ps.setString(2, feedback.getFeedback());
	    
	    int affectedRows = ps.executeUpdate();
	    int genId;
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating feedback failed, no rows affected.");
	    }
	    
	    try ( ResultSet generatedKeys = ps.getGeneratedKeys() )
	    {
		if( generatedKeys.next() )
		{
		    genId = generatedKeys.getInt(1);
		    
		    feedback.setFeedbackId(Integer.toString(genId));
		    
		    return genId;
		}
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(FeedbackManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return -999;
    }
    
    // UPDATE
    public boolean updateFeedback( Feedback feedback )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Feedback.TABLE_NAME
		+ " SET " + Feedback.COLUMN_FEEDBACK + " = ? "
		+ " WHERE " + Feedback.COLUMN_FEEDBACK_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, feedback.getFeedback());
	    ps.setInt(2, Integer.parseInt(feedback.getFeedbackId()));
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(FeedbackManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE
    
    // RESTORE
}
