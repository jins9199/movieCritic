package org.js.movie.member.dao;

import java.util.List;

import org.js.movie.member.domain.CustomMember;
import org.js.movie.member.domain.MemberVO;


public interface MemberDAO {
	

	//전체 회원 조회
	public List<MemberVO> selectAll();
	
	//회원 가입
	public void insert(MemberVO vo);
	
	//개별 회원 조회
	public MemberVO selectOne(String memberId);
	
	//회원정보 수정
	public void update(MemberVO vo);
	
	//회원정보 삭제
	public void delete(String memberId);
	
	/*
	 * //로그인 public MemberVO login(MemberVO vo);
	 */
	
	//시큐리티
	public CustomMember login(String memberId);
	
	

}