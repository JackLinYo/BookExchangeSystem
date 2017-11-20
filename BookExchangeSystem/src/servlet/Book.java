package servlet;

public class Book {
	private String bookname = "";
	private String author="";
	private String isbn="";
	private String description="";
	private String department="";
	private  int locationID=0;
	private String sellorlend="";
    private String condition="";
    private String price="0";
    private String email="";

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public String getSellorlend() {
        return sellorlend;
    }

    public void setSellorlend(String sellorlend) {
        this.sellorlend = sellorlend;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        if(price==null){this.price="0";}
        else{this.price = price;}
    }





}
