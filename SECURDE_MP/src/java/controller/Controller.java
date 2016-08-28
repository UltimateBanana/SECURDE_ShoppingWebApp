package controller;

import database.AccountManager;
import database.CreditCardManager;
import database.FeedbackManager;
import database.ProductManager;
import database.ReceiptItemManager;
import database.ReceiptManager;
import java.util.ArrayList;
import model.Account;
import model.CreditCard;
import model.Feedback;
import model.Product;
import model.Receipt;
import model.ReceiptItem;
import request.AccountRequest;
import request.ProductRequest;
import result.FeedbackResult;
import result.SalesResult;

public class Controller
{
    private AccountManager accountManager;
    private CreditCardManager creditCardManager;
    private FeedbackManager feedbackManager;
    private ProductManager productManager;
    private ReceiptItemManager receiptItemManager;
    private ReceiptManager receiptManager;

    public Controller()
    {
	this.accountManager = AccountManager.getInstance();
	this.creditCardManager = CreditCardManager.getInstance();
	this.feedbackManager = FeedbackManager.getInstance();
	this.productManager = ProductManager.getInstance();
	this.receiptItemManager = ReceiptItemManager.getInstance();
	this.receiptManager = ReceiptManager.getInstance();
    }
    
    // ACCOUNT
    public Account queryAccount( int accountId )
    {
	return accountManager.queryAccount(accountId);
    }
    
    public Account login( String username, String password )
    {
	return accountManager.queryAccountByCredentials(username, password);
    }
    
    public ArrayList<Account> queryAllAccounts( AccountRequest accountRequest )
    {
	return accountManager.queryAllAccounts(accountRequest);
    }
    
    public int register( Account account )
    {
	return accountManager.insertAccount(account);
    }
    
    public boolean changePassword( int accountId, String newPassword )
    {
	return accountManager.changePassword(accountId, newPassword);
    }
    
    public boolean updateAccount( Account account )
    {
	return accountManager.updateAccount(account);
    }
    
    public boolean lockAccount( int accountId )
    {
	return accountManager.lockAccount(accountId);
    }
    
    public boolean unlockAccount( int accountId )
    {
	return accountManager.unlockAccount(accountId);
    }
    
    // CREDITCARD
    public CreditCard queryCreditCardByAccount( int accountId )
    {
	return creditCardManager.queryCreditCardByAccount(accountId);
    }
    
    public CreditCard queryCreditCard( int accountId, String creditCardNumber )
    {
	return creditCardManager.queryCreditCard(accountId, creditCardNumber);
    }
    
    public boolean addCreditCard( int accountId, CreditCard creditCard )
    {
	return creditCardManager.insertCreditCard(accountId, creditCard);
    }
    
    public boolean updateCreditCard( int accountId, CreditCard creditCard )
    {
	return creditCardManager.updateCreditCard(accountId, creditCard);
    }
    
    public boolean deleteCreditCard( int accountId, String creditCardNumber )
    {
	return creditCardManager.deleteCreditCard(accountId, creditCardNumber);
    }
    
    // FEEDBACK
    public Feedback queryFeedback( int feedbackId )
    {
	return feedbackManager.queryFeedback(feedbackId);
    }
    
    public ArrayList<Feedback> queryAllFeedbackByReceiptItem( int receiptItemId )
    {
	return feedbackManager.queryAllFeedbackByReceiptItem(receiptItemId);
    }
    
    public ArrayList<FeedbackResult> queryAllFeedbackByProductId( int productId )
    {
	return feedbackManager.queryAllFeedbackByProduct(productId);
    }
    
    public int addFeedback( int receiptItemId, Feedback feedback )
    {
	return feedbackManager.insertFeedback(receiptItemId, feedback);
    }
    
    public boolean updateFeedback( Feedback feedback )
    {
	return feedbackManager.updateFeedback(feedback);
    }
    
    // PRODUCT
    public Product queryProduct( int productId )
    {
	return productManager.queryProduct(productId);
    }
    
    public ArrayList<Product> searchProducts( ProductRequest productRequest )
    {
	return productManager.searchProducts(productRequest);
    }
    
    public int addProduct( Product product )
    {
	return productManager.insertProduct(product);
    }
    
    public boolean updateProduct( Product product )
    {
	return productManager.updateProduct(product);
    }
    
    public boolean deleteProduct( int productId )
    {
	return productManager.deleteProduct(productId);
    }
    
    public boolean restoreProduct( int productId )
    {
	return productManager.restoreProduct(productId);
    }
    
    // RECEIPTITEM
    public ReceiptItem queryReceiptItem( int receiptItemId )
    {
	return receiptItemManager.queryReceiptItem(receiptItemId);
    }
    
    public ArrayList<ReceiptItem> queryAllReceiptItemByReceipt( int receiptId )
    {
	return receiptItemManager.queryAllReceiptItemByReceipt(receiptId);
    }
    
    public int addReceiptItem( int receiptId, ReceiptItem receiptItem )
    {
	return receiptItemManager.insertReceiptItem(receiptId, receiptItem);
    }
    
    public boolean updateReceiptItem( ReceiptItem receiptItem )
    {
	return receiptItemManager.updateReceiptItem(receiptItem);
    }
    
    // RECEIPT
    public Receipt queryReceipt( int receiptId )
    {
	return receiptManager.queryReceipt(receiptId);
    }
    
    public ArrayList<Receipt> queryAllReceiptByAccount( int accountId )
    {
	return receiptManager.queryAllReceiptByAccount(accountId);
    }
    
    public int addReceipt( int accountId, Receipt receipt )
    {
	return receiptManager.insertReceipt(accountId, receipt);
    }
    
    public boolean updateReceipt( Receipt receipt )
    {
	return receiptManager.updateReceipt(receipt);
    }
    
    // SALES
    public SalesResult queryTotalSales()
    {
	return receiptManager.queryTotalSales();
    }
    
    public ArrayList<SalesResult> queryTotalSalesPerCategory()
    {
	return receiptItemManager.queryTotalSalesPerCategory();
    }
    
    public ArrayList<SalesResult> queryTotalSalesPerProduct()
    {
	return receiptItemManager.queryTotalSalesPerProduct();
    }
}
