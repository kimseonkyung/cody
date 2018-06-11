package com.bitcamp.cody.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		MemberDto member = dao.selectById(id);
		
		return member;
	}
	
	
	
	
	
    public MemberDto selectByIdx(int idx) {
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		MemberDto member = dao.selectByIdx2(idx);
		System.out.println("member : "+member);
		return member;
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
		
		
		
		public ArrayList<String> findId(MemberDto member) throws Exception {
			// TODO Auto-generated method stub
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			List<MemberDto> list = dao.findId(member);
			ArrayList<String> findId = new ArrayList<String>();  
			for(int i =0; i <list.size(); i ++) {
				String email = list.get(i).getMember_email();
				findId.add(email);

			}
			return findId;
		}


		public ArrayList<String> findpw(MemberDto member) throws Exception {
			// TODO Auto-generated method stub
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			List<MemberDto> list = dao.findpw(member);
			ArrayList<String> findpw = new ArrayList<String>();  
			for(int i =0; i <list.size(); i ++) {
				String pw = list.get(i).getMember_pw();
				findpw.add(pw);

			}
			return findpw;
		}
		
		
		
		
		
		
		
		
		
		public String idchk(String str) throws Exception {
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
		  // TODO Auto-generated method stub
		  System.out.println("인증 중");
		  if(dao.idchk(str) == null) {
		    return "T";
		  }else {
		    return "F";
		  }


		}

		
		 public MemberDto kakaock(MemberDto member) {
		      dao = sqlSessionTemplate.getMapper(LoginDao.class);
		      MemberDto memberck = dao.selectById(member.getMember_id());
		      int cks =0;
		      System.out.println("체크");
		      if(memberck!=null) {
		         //아이디 있음
		         //memberck 값이 존재
		         //아이디 있으면 0;
		   
		         
		      }else {

		         member.setMember_ph("");
		         memberck = null;
		         cks = dao.insertMember(member);
		   
		         
		         //회원가입 가능 
		         //insert 성공시 1 값      
		   
		      }
		      
		      return memberck;
		   
		   }

		   public MemberDto memberCk(String member_id) {
		      dao = sqlSessionTemplate.getMapper(LoginDao.class);
		      MemberDto member = dao.selectById(member_id);
		      if(member ==null) {
		         // 없으면 
		         member =null;
		      }else {
		      
		      }
		   
		      return member;
		   }
		
		
		
		
		
		
		
		
		

}
