package Const;

import java.util.*;

public class ConstValue {

    public static final int MAX_LENGTH_USERNAME = 50;
    public static final int MAX_LENGTH_PASSWORD = 50;
    public static final String FORMAT_PHONE = "^[0-9]{10}+$";
    public static final String FORMAT_USERNAME = "^[a-zA-Z][a-zA-Z0-9]+$";
    public static final int MAX_LENGTH_PHONE = 10;
    public static final String ROLE_STUDENT = "Student";
    public static final String ROLE_TEACHER = "Teacher";
    public static final String ROLE_ADMIN = "Admin";
    public static final String STATUS_PASSED = "PASSED";
    public static final String STATUS_NOT_PASSED = "NOT PASSED";
    public static final String GENDER_MALE = "Male";
    public static final String GENDER_FEMALE = "Female";
    public static final String GENDER_OTHER = "Other";
    public static final String AVATAR = "https://i.pinimg.com/564x/31/ec/2c/31ec2ce212492e600b8de27f38846ed7.jpg";
    public static final String ORDER_BY_ASC = "asc";
    public static final String ORDER_BY_DESC = "desc";
    public static final int MAX_COURSE_IN_PAGE = 6;
    public static final String FORMAT_EMAIL = "^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})+$";
    public static final int MAX_USER_ADDRESS = 100;

    public static final List<String> getAllGender() {
        List<String> list = new ArrayList<>();
        list.add(GENDER_FEMALE);
        list.add(GENDER_MALE);
        list.add(GENDER_OTHER);
        return list;
    }
    public static final String CONTEXT_PATH = "/ONLINE_LEARN_MVC";
    public static final String USERNAME_ADMIN = "admin";
    public static final String PASSWORD_ADMIN = "999@";
    public static final String REDIRECT = "redirect:";
}
