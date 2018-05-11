package com.bitcamp.cody.service;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.bitcamp.cody.dao.LoginDao;
import com.bitcamp.cody.dto.MemberDto;


public class MemberService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;  
	// Dao 인터페이로 자동 자동 메퍼 생성을 위해 템플릿 클래스 이용
	
	private LoginDao dao;
	
	@Autowired
	MultipartService_member service;
	
	public String idChk(String id) {
		// Member 객체를 dao 통해서 받는다. 
		
		// 런타임시에(실행중) 메퍼 생성을 위한 처리 
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		
		MemberDto member = dao.selectById(id);
		
		return member == null ? "Y":"N";
	}
	
	
	
	public MemberDto loginChk(String id, String pw) {
		// Member 객체를 dao 통해서 받는다. 
		
		// 런타임시에(실행중) 메퍼 생성을 위한 처리 
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		
		MemberDto member = dao.selectById(id);
		System.out.println("svc : " + member);
		
		// 비밀번호 체크
		if(member != null && !member.matchMember_pw(pw)) {
			member = null;
		}
		
		
		
		return member;
	}

	public MemberDto selectById(String id) {
		
		return dao.selectById(id);
	}
	
	
	
 public int memberModify(MemberDto member,  HttpServletRequest request) throws IllegalStateException, IOException {
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		System.out.println(member.toString());
		service.multipart(member, request);
		
	
      System.out.println("실행전 : " + member.getMember_idx());
		
		// 업로드한 파일의 데이터를 Member에 등록

		// dao 요청 : 데이터 저장 요청		
		int resultCnt = dao.modifyMember(member);
							
		System.out.println("실행후 : " + member.getMember_idx());
		
		

		return resultCnt;
 }
		

		/*@Autowired
		private SimpleRegistrationNotifier notifier;

		@Autowired
		private SimpleRegistrationNotifier2 notifier2;

	*/
		public int memberReg(MemberDto member,  HttpServletRequest request) throws IllegalStateException, IOException {
			
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			
			service.multipart(member, request);
			
			
			System.out.println("실행전 : " + member.getMember_idx());
			
			// 업로드한 파일의 데이터를 Member에 등록

			// dao 요청 : 데이터 저장 요청		
			int resultCnt = dao.insertMember(member);
								
			System.out.println("실행후 : " + member.getMember_idx());
			
			// 메일 발송		
			// notifier.sendMail(member);
			
			//notifier2.sendMail(member);
			//notifier2.sendMailAttach(member);
			

			return resultCnt;
		}
		
		
		
		
		public int deleteMember(String id) {
			
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			
			int result = dao.deleteMember(id);
			
			return result;
		}
		
		
		

}
