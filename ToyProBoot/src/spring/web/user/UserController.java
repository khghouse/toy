package spring.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.domain.User;
import spring.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	public UserController() {
		super();
		System.out.println(getClass() + " Default Constructor Call");
	}

	@RequestMapping(value = "/login")
	public @ResponseBody
	String login(User user, HttpSession session) throws Exception {

		System.out.println(" /login Start!! ");
		User dbVo = userService.loginUser(user);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", dbVo);

		session.setAttribute("user", dbVo);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonUser = objectMapper.writeValueAsString(dbVo);
		System.out.println("jsonUser >> " + jsonUser);
		
		System.out.println(" /login End!! ");

		return jsonUser;
	}

	@RequestMapping(value = "/checkUser/{userId}")
	public @ResponseBody
	String checkUser(@PathVariable String userId) throws Exception {
		
		System.out.println(" /checkUser Start!!");
		
		Boolean result = userService.checkDuplication(userId);
		System.out.println(" result value true면 계정 없고 false면 있음 >> "+ result);
		
		ObjectMapper objectMapper = new ObjectMapper();

		String jsonResult = objectMapper.writeValueAsString(result);
		
		System.out.println(" /checkUser End!!");
		
		return jsonResult;
	}

	@RequestMapping(value = "/join")
	public void join(User user) throws Exception {

		System.out.println(" /join Start!!");

		userService.addUser(user);

		System.out.println(" /join End!!");

	}

};