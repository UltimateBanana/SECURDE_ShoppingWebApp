package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import enumeration.Category;
import java.sql.Statement;
import model.Product;
import request.ProductRequest;

public class ProductManager
{
    private static ProductManager productManager = new ProductManager();
    private DatabaseConnector databaseConnector;
    private Connection connection;
    
    private ProductManager()
    {
	databaseConnector = DatabaseConnector.getInstance();
	connection = databaseConnector.getConnection();
    }
    
    public static ProductManager getInstance()
    {
	return productManager;
    }
    
    // QUERY
    public Product queryProduct( int productId )
    {
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Product.TABLE_NAME
		+ " WHERE " + Product.COLUMN_PRODUCT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, productId);
	    
	    ResultSet rs = ps.executeQuery();
	    
	    rs.next();
	    
	    int deleted = rs.getInt(Product.COLUMN_IS_DELETED);
	    boolean isDeleted;
	    
	    if( deleted == 0 )
	    {
		isDeleted = false;
	    }
	    else
	    {
		isDeleted = true;
	    }
	    
	    return new Product(Integer.toString(rs.getInt(Product.COLUMN_PRODUCT_ID)),
			       rs.getString(Product.COLUMN_NAME),
			       rs.getString(Product.COLUMN_DESCRIPTION),
			       Category.translateCategoryStringToEnum(rs.getString(Product.COLUMN_CATEGORY)),
			       rs.getDouble(Product.COLUMN_PRICE),
			       isDeleted);
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return null;
    }
    
    public ArrayList<Product> searchProducts( ProductRequest productRequest )
    {
	ArrayList<Product> products = new ArrayList<>(0);
	
	PreparedStatement ps;
	String sql = "SELECT *"
		+ " FROM " + Product.TABLE_NAME
		+ " WHERE " + Product.COLUMN_NAME + " LIKE IFNULL(?, " + Product.COLUMN_NAME + ") AND " 
		            + Product.COLUMN_CATEGORY + " = IFNULL(?, " + Product.COLUMN_CATEGORY + ") AND " 
		            + Product.COLUMN_PRICE + " " + productRequest.getOperator() + " IFNULL(?, " + Product.COLUMN_PRICE + ") AND "
			    + Product.COLUMN_IS_DELETED + " = IFNULL(?, " + Product.COLUMN_IS_DELETED + ") " 
		+ " ORDER BY " + Product.COLUMN_NAME + " " + productRequest.getOrder() + ", " 
		               + Product.COLUMN_CATEGORY + " " + productRequest.getOrder()
		               + ", " + Product.COLUMN_PRICE + " " + productRequest.getOrder() + ";";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    
	    // if filter is null, pass null, else pass filter value
	    if( productRequest.getName() == null )
	    {
		ps.setString(1, null);
	    }
	    else
	    {
		ps.setString(1, "%" + productRequest.getName() + "%");
	    }
	    
	    
	    if( productRequest.getCategory() == null )
	    {
		ps.setString(2, null);
	    }
	    else
	    {
		ps.setString(2, productRequest.getCategory());
	    }
	    
	    if( productRequest.getPrice() == -1 )
	    {
		ps.setString(3, null);
	    }
	    else
	    {
		ps.setDouble(3, productRequest.getPrice());
	    }

	    if( productRequest.isDeleted() == -1 )
	    {
		ps.setString(4, null);
	    }
	    else
	    {
		ps.setInt(4, productRequest.isDeleted());
	    }
	    
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next())
	    {
		int deleted = rs.getInt(Product.COLUMN_IS_DELETED);
		boolean isDeleted;

		if( deleted == 0 )
		{
		    isDeleted = false;
		}
		else
		{
		    isDeleted = true;
		}

		Product product =  new Product(Integer.toString(rs.getInt(Product.COLUMN_PRODUCT_ID)),
					       rs.getString(Product.COLUMN_NAME),
					       rs.getString(Product.COLUMN_DESCRIPTION),
					       Category.translateCategoryStringToEnum(rs.getString(Product.COLUMN_CATEGORY)),
					       rs.getDouble(Product.COLUMN_PRICE),
					       isDeleted);
		
		products.add(product);
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return products;
    }
    
    // INSERT
    public int insertProduct( Product product )
    {
	PreparedStatement ps;
	String sql = "INSERT INTO " + Product.TABLE_NAME
		+ " ( " + Product.COLUMN_NAME + ", " + Product.COLUMN_DESCRIPTION + ", " + Product.COLUMN_CATEGORY + ", " + Product.COLUMN_PRICE + ", " + Product.COLUMN_IS_DELETED + " ) "
		+ " VALUES ( ?, ?, ?, ?, ? );";
	
	int isDeleted;
	
	if( product.isDeleted() )
	{
	    isDeleted = 1;
	}
	else
	{
	    isDeleted = 0;
	}
	
	try
	{
	    ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    ps.setString(1, product.getName());
	    ps.setString(2, product.getDescription());
	    ps.setString(3, product.getCategory().toString());
	    ps.setDouble(4, product.getPrice());
	    ps.setInt(5, isDeleted);
	    
	    int affectedRows = ps.executeUpdate();
	    int genId;
	    
	    if( affectedRows == 0 )
	    {
		throw new SQLException("Creating product failed, no rows affected.");
	    }
	    
	    try( ResultSet generatedKeys = ps.getGeneratedKeys() )
	    {
		if( generatedKeys.next() )
		{
		    genId = generatedKeys.getInt(1);
		    
		    product.setProductId(Integer.toString(genId));
		    
		    return genId;
		}
	    }
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return -999;
    }
    
    // UPDATE
    public boolean updateProduct( Product product )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Product.TABLE_NAME
		+ " SET " + Product.COLUMN_NAME + " = ?, " + Product.COLUMN_DESCRIPTION + " = ?, " + Product.COLUMN_CATEGORY + " = ?, " + Product.COLUMN_PRICE + " = ? "
		+ " WHERE " + Product.COLUMN_PRODUCT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setString(1, product.getName());
	    ps.setString(2, product.getDescription());
	    ps.setString(3, product.getCategory().toString());
	    ps.setDouble(4, product.getPrice());
	    ps.setInt(5, Integer.parseInt(product.getProductId()));
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // DELETE
    public boolean deleteProduct( int productId )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Product.TABLE_NAME
		+ " SET " + Product.COLUMN_IS_DELETED + " = ? "
		+ " WHERE " + Product.COLUMN_PRODUCT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, 1);
	    ps.setInt(2, productId);
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
    
    // RESTORE
    public boolean restoreProduct( int productId )
    {
	PreparedStatement ps;
	String sql = "UPDATE " + Product.TABLE_NAME
		+ " SET " + Product.COLUMN_IS_DELETED + " = ? "
		+ " WHERE " + Product.COLUMN_PRODUCT_ID + " = ?;";
	
	try
	{
	    ps = connection.prepareStatement(sql);
	    ps.setInt(1, 0);
	    ps.setInt(2, productId);
	    
	    ps.executeUpdate();
	    
	    return true;
	}
	catch (SQLException ex)
	{
	    Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
	}
	
	return false;
    }
}
