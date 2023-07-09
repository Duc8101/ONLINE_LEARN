package Model;

import Const.ConstValue;
import Entity.Course;
import Entity.EnrollCourse;
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
        List<Course> list = this.getList(sql);
        return list;
    }

    public List<Course> getListCourse(int UserID, String role) {
        List<Course> listCourse;
        if (role.equals(ConstValue.ROLE_STUDENT)) {
            listCourse = new ArrayList<>();
            DAOEnrollCourse daoEnroll = new DAOEnrollCourse();
            List<EnrollCourse> listEnroll = daoEnroll.getListEnrollCourse(UserID);
            for (EnrollCourse enroll : listEnroll) {
                Course course = this.getCourse(enroll.getCourseID());
                if (course != null) {
                    listCourse.add(course);
                }
            }
        } else {
            String sql = "SELECT * FROM [dbo].[Course]\n"
                    + "where [UserID] = " + UserID;
            listCourse = this.getList(sql);
        }
        return listCourse;
    }

    public Course getCourse(int CourseID) {
        String sql = "SELECT * FROM [dbo].[Course]\n"
                + "where [CourseID] = " + CourseID;
        List<Course> list = this.getList(sql);
        return list.isEmpty() ? null : list.get(0);
    }

    public static void main(String[] args) {
        DAOCourse dao = new DAOCourse();
        List<Course> list = dao.getListCourse(0, 1, null, null);
        System.out.println(list.size());
    }

}
