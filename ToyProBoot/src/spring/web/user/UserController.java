package spring.web.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println(getClass()+" Default Constructor Call");
	}
	
	// success
	@RequestMapping(value="/getUser/{userId}")
	public @ResponseBody String getUser(@ModelAttribute("user") User user, @PathVariable String userId) throws Exception{
		
		Boolean result = userService.checkDuplication(userId);
		ObjectMapper objectMapper = new ObjectMapper();
		
		System.out.println(result+"result value");
		String jsonResult = objectMapper.writeValueAsString(result);
		return jsonResult;
	}
	
	@RequestMapping(value="/login")
	public @ResponseBody String login(@ModelAttribute("user") User user, HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		//request.setCharacterEncoding("UTF-8");
		//response.setCharacterEncoding("UTF-8");
		System.out.println(" /login Start!! ");
		User dbVo = userService.loginUser(user);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user", dbVo);
		
		session.setAttribute("user", dbVo);

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonUser = objectMapper.writeValueAsString(dbVo);
		System.out.println("jsonUser >> "+jsonUser);
		System.out.println(" /login End!! ");
		
		return jsonUser;
	}
	
	@RequestMapping(value="/checkUser")
	public @ResponseBody String checkUser(@RequestParam("userId") String userId, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println(" /checkUser Start!! ");
		
		Boolean result = userService.checkDuplication(userId);
		
		PrintWriter out = response.getWriter();
		out.write("out.write test ");
		System.out.println(" /checkUser End!! ");
		
		return null;
	}
	
	@RequestMapping(value="/join")
	public void join(User user) throws Exception{
		
		System.out.println(" /join Start!! \n"+user+"user Value");
		userService.addUser(user);
		System.out.println(" /join End!!");
	}
	
}