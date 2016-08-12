package model;

public class Address
{
    public static final String COLUMN_HOUSE_NUMBER = "house_number" ;
    public static final String COLUMN_STREET = "street" ;
    public static final String COLUMN_SUBDIVISION = "subdivision" ;
    public static final String COLUMN_CITY = "city" ;
    public static final String COLUMN_POSTAL_CODE = "postal_code" ;
    public static final String COLUMN_COUNTRY = "country" ;
    
    private String houseNumber;
    private String street;
    private String subdivision;
    private String city;
    private String postalCode;
    private String country;

    public Address()
    {
    }

    public Address(String houseNumber, String street, String subdivision, String city, String postalCode, String country)
    {
	this.houseNumber = houseNumber;
	this.street = street;
	this.subdivision = subdivision;
	this.city = city;
	this.postalCode = postalCode;
	this.country = country;
    }

    public String getHouseNumber()
    {
	return houseNumber;
    }

    public void setHouseNumber(String houseNumber)
    {
	this.houseNumber = houseNumber;
    }

    public String getStreet()
    {
	return street;
    }

    public void setStreet(String street)
    {
	this.street = street;
    }

    public String getSubdivision()
    {
	return subdivision;
    }

    public void setSubdivision(String subdivision)
    {
	this.subdivision = subdivision;
    }

    public String getCity()
    {
	return city;
    }

    public void setCity(String city)
    {
	this.city = city;
    }

    public String getPostalCode()
    {
	return postalCode;
    }

    public void setPostalCode(String postalCode)
    {
	this.postalCode = postalCode;
    }

    public String getCountry()
    {
	return country;
    }

    public void setCountry(String country)
    {
	this.country = country;
    }
    
    @Override
    public String toString()
    {
	return houseNumber + " " + street + ", " + subdivision + ", " + city + ", " + postalCode + ", " + country;
    }
}
