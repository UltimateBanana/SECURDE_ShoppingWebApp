package request;

public class AccountRequest
{
    private int isLocked;
    
    public AccountRequest()
    {
	isLocked = -1;
    }

    public int isLocked()
    {
	return isLocked;
    }

    public void setIsLocked(boolean isLocked)
    {
	if( isLocked )
	{
	    this.isLocked = 1;
	}
	else
	{
	    this.isLocked = 0;
	}
    }
}
