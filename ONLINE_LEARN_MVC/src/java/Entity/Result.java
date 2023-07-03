package Entity;

import java.io.Serializable;

public class Result implements Serializable {

    private int ResultID;
    private int LessonID;
    private int UserID;
    private String DateRecord;
    private float score;
    private String status;

    public Result() {
    }

    public Result(int ResultID, int LessonID, int UserID, float score, String status) {
        this.ResultID = ResultID;
        this.LessonID = LessonID;
        this.UserID = UserID;
        this.score = score;
        this.status = status;
    }

    public Result(int LessonID, int UserID, float score, String status) {
        this.LessonID = LessonID;
        this.UserID = UserID;
        this.score = score;
        this.status = status;
    }

    public int getResultID() {
        return ResultID;
    }

    public void setResultID(int ResultID) {
        this.ResultID = ResultID;
    }

    public int getLessonID() {
        return LessonID;
    }

    public void setLessonID(int LessonID) {
        this.LessonID = LessonID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getDateRecord() {
        return DateRecord;
    }

    public void setDateRecord(String DateRecord) {
        this.DateRecord = DateRecord;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
