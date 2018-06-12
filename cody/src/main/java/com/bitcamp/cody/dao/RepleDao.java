package com.bitcamp.cody.dao;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.cody.dto.RepleDto;

public interface RepleDao {

	List<RepleDto> selectList(int idx);

	RepleDto selectByIdx(int idx);
	
	List<RepleDto> childReple(int idx);
	// 첫댓글 저장
	int repleInsert(RepleDto reple);

	// 첫댓글 저장시 그룹값 증가
	int maxSelect();

	// 마지막에 추가된 댓글 찾기
	int maxIdx();
	
	// 대댓글 저장
	int re_repleInsert(RepleDto reple);

	// 대댓글 저장시 댓글의 순서 변경
	int reorderPlus(RepleDto reple);
	
	// 댓글 삭제
	int repleDelete(int idx);

	// 알림 확인후 수신여부값 모두 변경
	int receptionUpdate();

	// 알림 확인후 수신여부값 변경
	int recepUpdate(int idx);
	
	// 알림 수신여부 확인하기
	int selectReception();

	// 알림 리스트 정보 가져오기
	List<RepleDto> noticeList(HashMap<String, Object> params);

	// 첫댓글 저장된 댓글찾기
	RepleDto selectinfo(RepleDto reple);

	int repleUpdate(RepleDto re);

	// 알림글 총 개수
	int totalCnt(int idx);

	int repleAllDelete(int idx);

	

}
