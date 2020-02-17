package org.js.movie.movieinfo.service;

import java.util.List;

import org.js.movie.movieinfo.domain.MovieInfoVO;

public interface MovieInfoService {
	
	public List<MovieInfoVO> list();
	
	public MovieInfoVO view(int id);
	
	public void write(MovieInfoVO vo);
	
}
