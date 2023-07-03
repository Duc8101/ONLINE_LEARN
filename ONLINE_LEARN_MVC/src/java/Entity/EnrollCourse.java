package Entity;

import java.io.Serializable;

public class EnrollCourse implements Serializable {

    private int EnrollID;
    private String date;
    private int CourseID;
    private int UserID;

    public EnrollCourse() {
    }

    public EnrollCourse(int EnrollID, String date, int CourseID, int UserID) {
        this.EnrollID = EnrollID;
        this.date = date;
        this.CourseID = CourseID;
        this.UserID = UserID;
    }

    public int getEnrollID() {
        return EnrollID;
    }

    public void setEnrollID(int EnrollID) {
        this.EnrollID = EnrollID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

}
