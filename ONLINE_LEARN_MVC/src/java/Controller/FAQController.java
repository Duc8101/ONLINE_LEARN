package Controller;

import Const.ConstValue;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/FAQ", method = RequestMethod.GET)
public class FAQController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Index(HttpSession session) {
        Boolean admin = (Boolean) session.getAttribute(ConstValue.ROLE_ADMIN);
        if (admin == null) {
            return "FAQ/Index";
        }
        return ConstValue.REDIRECT + "/ManagerUser";
    }
}
