package Controller;

import Const.ConstValue;
import Entity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/Home", method = RequestMethod.GET)
public class HomeController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Index(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Boolean admin = (Boolean) session.getAttribute(ConstValue.ROLE_ADMIN);
        if (user == null || admin == null) {
            return "Home/Index";
        }
        return ConstValue.REDIRECT + "/ManagerUser";
    }
}
