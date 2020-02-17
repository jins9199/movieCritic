package org.js.movie.member.service;

import java.util.List;
import org.js.movie.member.domain.MemberVO;

public interface MemberService {
	
	//회원 목록 조회
	public List<MemberVO> selectAll();
	
	//회원 가입
	public void insert(MemberVO vo);
	
	//개별 회원 조회
	public MemberVO selectOne(String memberId);
	
	//회원정보 수정
	public void update(MemberVO vo);
	
	//회원정보 삭제
	public void delete(String memberId);
	
	 
}
