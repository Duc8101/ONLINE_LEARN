
package Controller;

import Const.ConstValue;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/About", method = RequestMethod.GET)
public class AboutController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Index(HttpSession session) {
        Object admin = session.getAttribute(ConstValue.ROLE_ADMIN);
        if (admin == null) {
            return "About/Index";
        }
        return ConstValue.REDIRECT + "/ManagerUser";
    }
}
