package org.js.movie.movieinfo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.js.movie.movieinfo.domain.MovieInfoVO;
import org.springframework.stereotype.Repository;

@Repository("MovieInfoDao")
public class MovieInfoDAOImpl implements MovieInfoDAO {
	
	@Inject
	private SqlSession sql;
	
	//movie list
	@Override
	public List<MovieInfoVO> list() {

		return sql.selectList("MovieInfoMapper.list");
	}
	
	//movie info
	@Override
	public MovieInfoVO view(int movieId) {
		
		return sql.selectOne("MovieInfoMapper.view", movieId);
	}

	//movie write
	@Override
	public void write(MovieInfoVO vo) {
		
		sql.insert("MovieInfoMapper.write", vo);
	}
}
