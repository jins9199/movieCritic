package org.js.movie.member.service;

import java.util.List;

import org.js.movie.member.dao.MemberDAO;
import org.js.movie.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	/*
	 * @Autowired BCryptPasswordEncoder passwordEncoder;
	 */

	@Override
	public List<MemberVO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public void insert(MemberVO vo) {

		log.info("회원 가입 서비스 시작");

		/*
		 * String bcryptPassword = passwordEncoder.encode(vo.getMemberPw());
		 * vo.setMemberPw(bcryptPassword); log.info("bcryptPassword : " +
		 * vo.getMemberPw()); log.info("######### 암호화 완료");
		 */
		dao.insert(vo);
		log.info("vo : " + vo);
		log.info("######### 회원가입 등록됨");
	}

	@Override
	public MemberVO selectOne(String memberId) {

		return dao.selectOne(memberId);
	}

	@Override
	public void update(MemberVO vo) {

		dao.update(vo);
	}

	@Override
	public void delete(String memberId) {
		
		dao.delete(memberId);
	}
	 

}
