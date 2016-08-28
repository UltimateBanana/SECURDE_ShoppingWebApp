package result;

import java.util.Calendar;
import model.Feedback;

public class FeedbackResult
{
    private String firstName;
    private String middleName;
    private String lastName;
    private String username;
    private Calendar date;
    private Feedback feedback;

    public FeedbackResult(String firstName, String middleName, String lastName, String username, Calendar date, Feedback feedback)
    {
	this.firstName = firstName;
	this.middleName = middleName;
	this.lastName = lastName;
	this.username = username;
	this.date = date;
	this.feedback = feedback;
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

    public Calendar getDate()
    {
	return date;
    }

    public void setDate(Calendar date)
    {
	this.date = date;
    }

    public Feedback getFeedback()
    {
	return feedback;
    }

    public void setFeedback(Feedback feedback)
    {
	this.feedback = feedback;
    }
}
