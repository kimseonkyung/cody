package com.bitcamp.cody.dao;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import com.bitcamp.cody.dto.MemberDto;

public class MemberDao {
	
	private JdbcTemplate jdbcTemplate;
	
	// 생성자 방식으로 의존 설정
	public MemberDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 저장 메서드 ( 회원 가입 )
	public int insertMember(MemberDto member) {
		
		String sql = "insert into member (member_id, member_pw, member_name, member_birth, member_email, member_ph, member_photo) "
				+ " values ( ?, ?, ?, ?, ?, ?, ?)";
		
		int resultCnt = jdbcTemplate.update(
				sql, 
				member.getMember_id(), 
				member.getMember_name(), 
				member.getMember_pw(),
				member.getMember_photo());
		        member.getMember_birth();
		        member.getMember_email();
		        member.getMember_ph();
		        
		
		return resultCnt;
	}
	

	public MemberDto selectById(String id) {
		
		String sql = "select * from member where member_id = ?";		
		List<MemberDto> result = jdbcTemplate.query(sql, new MemberRowMapper(),id);
		return result.isEmpty() ? null : result.get(0);
	}
	
	
	public List<MemberDto> selectMembers() {
		
		String sql = "select * from member";
		List<MemberDto> result = jdbcTemplate.query(sql, new MemberRowMapper());
		
		return result;
	}
	
	
    

	

}
