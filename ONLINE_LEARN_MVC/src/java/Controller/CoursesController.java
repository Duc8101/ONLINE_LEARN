package Controller;

import Const.ConstValue;
import Entity.*;
import Model.*;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/Courses", method = RequestMethod.GET)
public class CoursesController {

    private final DAOCourse daoCourse = new DAOCourse();
    private final DAOCategory daoCategory = new DAOCategory();
    private final DAOEnrollCourse daoEnroll = new DAOEnrollCourse();
    private final DAOLesson daoLesson = new DAOLesson();
    private final DAOUser daoUser = new DAOUser();

    private Map<String, Object> getData(int CategoryID, int pageSelected, String properties, String flow) {
        Map<String, Object> map = new HashMap<>();
        int numberPage = this.daoCourse.getNumberPage(CategoryID, 0);
        int prePageSelected = pageSelected - 1;
        int nextPageSelected = pageSelected + 1;
        String preURL = ConstValue.CONTEXT_PATH + "/Courses";
        String nextURL = ConstValue.CONTEXT_PATH + "/Courses";
        // if not sort
        if (properties == null && flow == null) {
            // if not choose category
            if (CategoryID == 0) {
                preURL = preURL + "?page=" + prePageSelected;
                nextURL = nextURL + "?page=" + nextPageSelected;
            } else {
                preURL = preURL + "?CategoryID=" + CategoryID + "&page=" + prePageSelected;
                nextURL = nextURL + "?CategoryID=" + CategoryID + "&page=" + nextPageSelected;
            }
        } else {
            // if not choose category
            if (CategoryID == 0) {
                preURL = preURL + "?properties=" + properties + "&flow=" + flow + "&page=" + prePageSelected;
                nextURL = nextURL + "?properties=" + properties + "&flow=" + flow + "&page=" + nextPageSelected;
            } else {
                preURL = preURL + "?CategoryID=" + CategoryID + "&properties=" + properties + "&flow=" + flow + "&page=" + prePageSelected;
                nextURL = nextURL + "?CategoryID=" + CategoryID + "&properties=" + properties + "&flow=" + flow + "&page=" + nextPageSelected;
            }
        }
        List<Course> listCourse = this.daoCourse.getListCourse(CategoryID, pageSelected, properties, flow);
        List<Category> listCategory = this.daoCategory.getAllCategory();
        map.put("number", numberPage);
        map.put("pageSelected", pageSelected);
        map.put("flow", flow);
        map.put("properties", properties);
        map.put("listCourse", listCourse);
        map.put("CategoryID", CategoryID);
        map.put("previous", preURL);
        map.put("next", nextURL);
        map.put("listCategory", listCategory);
        map.put("daoLesson", this.daoLesson);
        map.put("daoCourse", this.daoCourse);
        map.put("daoUser", this.daoUser);
        return map;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView Index(HttpSession session, Integer CategoryID, Integer page, String properties, String flow) {
        User user = (User) session.getAttribute("user");
        int pageSelected = page == null ? 1 : page;
        int CatID = CategoryID == null ? 0 : CategoryID;
        Map<String, Object> map = this.getData(CatID, pageSelected, properties, flow);
        if (user != null) {
            List<Course> listEnroll = this.daoCourse.getListCourse(user.getID(), user.getRoleName());
            map.put("listEnroll", listEnroll);
        }
        return new ModelAndView("Courses/Index", map);
//        if (user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT)) {
//
//        }
//        return new ModelAndView(ConstValue.REDIRECT + "/Error");
    }

    @RequestMapping(value = "/Detail", method = RequestMethod.GET)
    public ModelAndView Detail(HttpSession session, Integer CourseID) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT)) {
            Course course = this.daoCourse.getCourse(CourseID);
            // if not find course
            if (course == null) {
                return new ModelAndView(ConstValue.REDIRECT + "/Courses");
            }
            List<Lesson> list = this.daoLesson.getListLesson(CourseID);
            Map<String, Object> map = new HashMap<>();
            map.put("list", list);
            map.put("course", course);
            map.put("daoCourse", this.daoCourse);
            map.put("daoUser", this.daoUser);
            if (user != null) {
                List<Course> listEnroll = this.daoCourse.getListCourse(user.getID(), user.getRoleName());
                map.put("listEnroll", listEnroll);
            }
            return new ModelAndView("Courses/Detail", map);
        }
        return new ModelAndView(ConstValue.REDIRECT + "/Error");
    }
}
