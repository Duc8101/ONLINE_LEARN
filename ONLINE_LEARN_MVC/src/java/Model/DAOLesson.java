package Model;

import Entity.Lesson;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DAOLesson extends ConnectDatabase {

    public List<Lesson> getListLesson(int CourseID) {
        List<Lesson> list = new ArrayList<>();
        String sql = "select * from Lesson where CourseID = " + CourseID + "";
        ResultSet result = getData(sql);
        try {
            while (result.next()) {
                int LessonID = result.getInt(1);
                String LessonName = result.getString(2);
                int LessonNo = result.getInt(4);
                Lesson lesson = new Lesson(LessonID, LessonName, CourseID, LessonNo);
                list.add(lesson);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return list;
    }
}
