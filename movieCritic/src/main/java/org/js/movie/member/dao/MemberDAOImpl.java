package org.js.movie.member.dao;

import java.util.List;

import org.js.movie.member.domain.CustomMember;
import org.js.movie.member.domain.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public List<MemberVO> selectAll() {

		return sql.selectList("MemberMapper.selectAll");
	}

	@Override
	public void insert(MemberVO vo) {

		sql.insert("MemberMapper.insert", vo);
	}

	@Override
	public MemberVO selectOne(String memberId) {

		return sql.selectOne("MemberMapper.selectOne");
	}

	@Override
	public void update(MemberVO vo) {

		sql.update("MemberMapper.update", vo);
	}

	@Override
	public void delete(String memberId) {

		sql.delete("MemberMapper.delete");
	}
	
	/*
	 * @Override public MemberVO login(MemberVO vo) { return
	 * sql.selectOne("MemberMapper.login", vo); }
	 */
	@Override
	public CustomMember login(String memberId) {
		
		return sql.selectOne("MemberMapper.login", memberId);
	}


}
