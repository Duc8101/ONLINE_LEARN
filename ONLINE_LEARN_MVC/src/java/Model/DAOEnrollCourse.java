package Model;

import Entity.EnrollCourse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DAOEnrollCourse extends ConnectDatabase {

    public List<EnrollCourse> getListEnrollCourse(int UserID) {
        String sql = "SELECT * FROM [dbo].[Enroll_Course]\n"
                + "where [UserID] = " + UserID;
        List<EnrollCourse> list = new ArrayList<>();
        ResultSet result = getData(sql);
        try {
            while (result.next()) {
                int EnrollID = result.getInt(1);
                String date = result.getString(2);
                int CourseID = result.getInt(3);
                EnrollCourse enroll = new EnrollCourse(EnrollID, date, CourseID, UserID);
                list.add(enroll);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }
}
