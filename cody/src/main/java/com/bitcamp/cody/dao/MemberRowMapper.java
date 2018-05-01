package com.bitcamp.cody.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bitcamp.cody.dto.MemberDto;

public class MemberRowMapper implements RowMapper<MemberDto> {

	@Override
	public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		MemberDto member = new MemberDto();
		member.setMember_idx(rs.getInt("member_idx"));
		member.setMember_id(rs.getString("member_id"));
		member.setMember_name(rs.getString("member_name"));
		member.setMember_pw(rs.getString("member_pw"));
		member.setMember_reg(rs.getDate("member_reg"));
		member.setMember_photo(rs.getString("member_photo"));
		member.setMember_birth(rs.getString("member_birth"));
		member.setMember_email(rs.getString("member_email"));
		member.setMember_ph(rs.getString("member_ph"));
		
		
		
		return member;
	}
	
	
	
	
	
	

}
