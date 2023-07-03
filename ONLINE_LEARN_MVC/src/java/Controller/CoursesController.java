package Controller;

import Const.ConstValue;
import Entity.Course;
import Entity.User;
import Model.DAOCourse;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
@RequestMapping(value = "/Courses", method = RequestMethod.GET)
public class CoursesController {

    private final DAOCourse daoCourse = new DAOCourse();

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
        List<Course> list = this.daoCourse.getListCourse(CategoryID, pageSelected, properties, flow);
        map.put("number", numberPage);
        map.put("pageSelected", pageSelected);
        map.put("flow", flow);
        map.put("properties", properties);
        map.put("list", list);
        map.put("CategoryID", CategoryID);
        map.put("previous", preURL);
        map.put("next", nextURL);
        return map;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView Index(HttpSession session, int CategoryID, int page, String properties, String flow) {
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT)) {
            int pageSelected = page == 0 ? 1 : page;
            Map<String, Object> map = this.getData(CategoryID, pageSelected, properties, flow);
            return new ModelAndView("Courses/Index", map);
        }
        return new ModelAndView(ConstValue.REDIRECT + "/Error");
    }
}