package Model;

import Const.ConstValue;
import Entity.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DAOCourse extends ConnectDatabase {

    private List<Course> getList(String sql) {
        List<Course> list = new ArrayList<>();
        ResultSet result = getData(sql);
        try {
            while (result.next()) {
                int CourseID = result.getInt(1);
                String CourseName = result.getString(2);
                String image = result.getString(3);
                int CategoryID = result.getInt(4);
                int UserID = result.getInt(5);
                String description = result.getString(6);
                Course course = new Course(CourseID, CourseName, image, CategoryID, UserID, description);
                list.add(course);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }

    public int getNumberPage(int CategoryID, int UserID) {
        String sql = "SELECT * FROM [dbo].[Course]\n";
        // if not teacher course
        if (UserID == 0) {
            if (CategoryID != 0) {
                sql = sql + " where [CategoryID] = " + CategoryID;
            }
        } else {
            sql = sql + "where [UserID] = " + UserID;
        }
        double number = this.getList(sql).size();
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
        String sql = "SELECT * FROM [dbo].[Course]\n";
        // if choose category
        if (CategoryID != 0) {
            sql = sql + "where [CategoryID] = " + CategoryID + "\n";
        }
        // if not sort
        if (properties == null && flow == null) {
            sql = sql + "order by [CourseID]\n";
        } else {
            sql = sql + "order by [" + properties + "] " + flow + "\n";
        }
        sql = sql + "	offset (" + ConstValue.MAX_COURSE_IN_PAGE + "*" + (page - 1) + ") row fetch next " + ConstValue.MAX_COURSE_IN_PAGE + " row only";
        return this.getList(sql);
    }

    public List<Course> getListCourse(int UserID, String role) {
        String sql;
        if (role.equals(ConstValue.ROLE_STUDENT)) {
            sql = "SELECT c.* FROM ( [dbo].[Course] c join [dbo].[Enroll_Course] e\n"
                    + "on c.CourseID = e.CourseID ) join [dbo].[User] u on e.UserID = u.ID\n"
                    + "where u.ID = " + UserID;
        } else {
            sql = "SELECT * FROM [dbo].[Course]\n"
                    + "where [UserID] = " + UserID;
        }
        return this.getList(sql);
    }

    public Course getCourse(int CourseID) {
        String sql = "SELECT * FROM [dbo].[Course]\n"
                + "where [CourseID] = " + CourseID;;
        return this.getList(sql).isEmpty() ? null : this.getList(sql).get(0);
    }

    public static void main(String[] args) {
        DAOCourse dao = new DAOCourse();
        List<Course> list = dao.getListCourse(0, 1, null, null);
        System.out.println(list.size());
    }

}
