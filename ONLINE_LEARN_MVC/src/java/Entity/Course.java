package Entity;

public class Course {

    private int CourseID;
    private String CourseName;
    private String image;
    private double price;
    private int CategoryID;
    private int UserID;
    private String description;

    public Course() {
    }

    public Course(int CourseID, String CourseName, String image, double price, int CategoryID, int UserID, String description) {
        this.CourseID = CourseID;
        this.CourseName = CourseName;
        this.image = image;
        this.price = price;
        this.CategoryID = CategoryID;
        this.UserID = UserID;
        this.description = description;
    }

    public Course(String CourseName, String image, double price, int CategoryID, int UserID, String description) {
        this.CourseName = CourseName;
        this.image = image;
        this.price = price;
        this.CategoryID = CategoryID;
        this.UserID = UserID;
        this.description = description;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
