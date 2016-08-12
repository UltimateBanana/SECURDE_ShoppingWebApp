package model;

public class Feedback
{
    public static final String TABLE_NAME = "feedback" ;
    public static final String COLUMN_FEEDBACK_ID = "feedback_id" ;
    public static final String COLUMN_FEEDBACK = "feedback" ;
    
    private String feedbackId;
    private String feedback;

    public Feedback()
    {
    }

    public Feedback(String feedback)
    {
	this.feedback = feedback;
    }

    public Feedback(String feedbackId, String feedback)
    {
	this.feedbackId = feedbackId;
	this.feedback = feedback;
    }

    public String getFeedbackId()
    {
	return feedbackId;
    }

    public void setFeedbackId(String feedbackId)
    {
	this.feedbackId = feedbackId;
    }

    public String getFeedback()
    {
	return feedback;
    }

    public void setFeedback(String feedback)
    {
	this.feedback = feedback;
    }
}
