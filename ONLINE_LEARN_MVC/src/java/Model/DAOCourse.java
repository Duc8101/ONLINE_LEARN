package Model;

import Const.ConstValue;
import Entity.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DAOCourse extends ConnectDatabase {

    public int getNumberPage(int CategoryID, int UserID) {
        String sql;
        // if not teacher course
        if (UserID == 0) {
            if (CategoryID == 0) {
                sql = "select count(c.CourseID) from Course c";
            } else {
                sql = "select count(c.CourseID) from Course c where c.CategoryID = " + CategoryID;
            }
        } else {
            sql = "select count(c.CourseID) from Course c where c.UserID = " + UserID;
        }
        // get data
        ResultSet result = getData(sql);
        double number = 0;
        try {
            // if get data successful
            if (result.next()) {
                number = result.getInt(1);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        if (number <= ConstValue.MAX_COURSE_IN_PAGE) {
            number = 1;
        } else if ((number / ConstValue.MAX_COURSE_IN_PAGE) > (Math.round(number / ConstValue.MAX_COURSE_IN_PAGE))) {
            number = Math.floor(number / ConstValue.MAX_COURSE_IN_PAGE) + 1;
        } else {
            number = Math.round(number / ConstValue.MAX_COURSE_IN_PAGE);
        }
        return (int) number;
    }

    public List<Course> getListCourse(int CategoryID, int page, String properties, String flow) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Course]\n";
        // if not sort
        if (properties == null && flow == null) {
            // if choose category
            if (CategoryID != 0) {
                sql = sql + "where [CategoryID] = " + CategoryID + "\n";
            }
            sql = sql + "order by [CourseID]\n";
        } else {
            // if choose category
            if (CategoryID != 0) {
                sql = sql + "where [CategoryID] = " + CategoryID + "\n";
            }
            sql = sql + "order by [" + properties + "] " + flow + "\n";
        }
        sql = sql + "	offset (" + ConstValue.MAX_COURSE_IN_PAGE + "*" + (page - 1) + ") row fetch next " + ConstValue.MAX_COURSE_IN_PAGE + " row only";
        // get data
        ResultSet result = getData(sql);
        try {
            // loop for traverse all row
            while (result.next()) {
                int CourseID = result.getInt(1);
                String CourseName = result.getString(2);
                String image = result.getString(3);
                double price = result.getDouble(4);
                int CatID = result.getInt(5);
                int UserID = result.getInt(6);
                String description = result.getString(7);
                Course course = new Course(CourseID, CourseName, image, price, CatID, UserID, description);
                list.add(course);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }
}