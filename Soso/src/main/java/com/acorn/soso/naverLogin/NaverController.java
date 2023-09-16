package com.acorn.soso.naverLogin;

import java.io.IOException;

import javax.servlet.http.HttpSession;
 
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.soso.users.dto.UsersDto;
import com.acorn.soso.users.service.UsersService;
import com.github.scribejava.core.model.OAuth2AccessToken;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverController {
	
	//네이버 서비스를 DI준비한다.
	@Autowired
	private NaverService service;
	
	//회원가입 및 조회를 위해 userService를 DI한다.
	@Autowired
	private UsersService userService;
 
	/* NaverLogin */
	private String apiResult = null;
	
	@GetMapping("/naver/index")
	public String index() {
		return "naver/index";
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "naver/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = service.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
 
		return "naver/login";
	}
 
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		OAuth2AccessToken oauthToken;
        oauthToken = service.getAccessToken(session, code, state);
 
        //1. 로그인 사용자 정보를 읽어온다.
		apiResult = service.getUserProfile(oauthToken);  //String형식의 json데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		 "message":"success",
		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String profile = (String)response_obj.get("profile_image");
		String email = (String)response_obj.get("email");
		String id = (String)response_obj.get("id");
		
		/*
		 * 네이버 프로필 값을 가져왔으니 회원가입이나 로그인은 쉬울 것.
		 * 0.getUser같은 메소드로 유저 정보 가져와서 해당 유저가 있는지 확인(현재 getUser는 id로 값을 가져오므로, email로 가져오는거 하나 추가하자)
		 * 1. 있으면 -> 마찬가지로 가입된 아이디 얻어와서 세션영역에 id를 등록하면 된다.
		 * 2. 없으면 ->얻어온 값을 기반으로 해서 가입을 시켜준다. 자동으로 가입시켜주지 말고,가입 창으로 이동하게 하자. 
		 */
		
		//email을 매개로 해서 정보를 얻어온다.
		UsersDto dto = userService.getInfo2(email);
		//만약 dto의 결과가 null이라면
		if(dto==null) {
			//모델에 필요한 데이터를 넣어준다.
			model.addAttribute("nickname", nickname);
			model.addAttribute("email", email);
			return "users/signup_form";
		//dto가 null이 아니라면(회원가입되어있다는 뜻);
		}else {
			//아이디를 가져와서
			String logginId = dto.getId();
			session.setAttribute("id", logginId);
			//최상단으로 리턴해준다.
			return "main";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "naver/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
			System.out.println("여기는 logout");
			session.invalidate();
 
			return "redirect : home";
		}
	
}