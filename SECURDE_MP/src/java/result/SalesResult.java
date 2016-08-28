package result;

public class SalesResult
{
    private String name;
    private double totalSales;

    public SalesResult(String name, double totalSales)
    {
	this.name = name;
	this.totalSales = totalSales;
    }

    public String getName()
    {
	return name;
    }

    public void setName(String name)
    {
	this.name = name;
    }

    public double getTotalSales()
    {
	return totalSales;
    }

    public void setTotalSales(double totalSales)
    {
	this.totalSales = totalSales;
    }
}
