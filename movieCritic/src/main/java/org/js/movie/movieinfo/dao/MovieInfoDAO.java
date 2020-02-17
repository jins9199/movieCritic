package org.js.movie.movieinfo.dao;

import java.util.List;

import org.js.movie.movieinfo.domain.MovieInfoVO;

public interface MovieInfoDAO {
	
//	movie list
	public List<MovieInfoVO> list();
	
//	movie info
	public MovieInfoVO view(int movieId);
	
//	movie write
	public void write(MovieInfoVO vo);
}
