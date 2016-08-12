package request;

public class AccountRequest
{
    private boolean isLocked;
    
    public AccountRequest()
    {
	isLocked = false;
    }

    public int isLocked()
    {
	if( isLocked )
	{
	    return 1;
	}
	else
	{
	    return 0;
	}
    }

    public void setIsLocked(boolean isLocked)
    {
	this.isLocked = isLocked;
    }
}
