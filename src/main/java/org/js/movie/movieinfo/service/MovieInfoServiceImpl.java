package org.js.movie.movieinfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.js.movie.movieinfo.dao.MovieInfoDAO;
import org.js.movie.movieinfo.domain.Criteria;
import org.js.movie.movieinfo.domain.MovieInfoVO;
import org.springframework.stereotype.Service;

@Service("MovieInfoService")
public class MovieInfoServiceImpl implements MovieInfoService {
	
	@Inject
	private MovieInfoDAO dao;
	
	@Override
	public void updateMovieInfo(MovieInfoVO vo) {
		dao.updateMovieInfo(vo);
	}
	
	@Override
	public List<MovieInfoVO> indexList(){
		return dao.indexList();
	}
	
	@Override
	public List<MovieInfoVO> indexList2(){

		return dao.indexList2();
	}
	
	@Override
	public List<MovieInfoVO> listAll(){
		
		return dao.listAll();
	}
	
	@Override
	public List<MovieInfoVO> list(HashMap<String, String> conditions) {

		return dao.list(conditions);
	}
	
	@Override
	public MovieInfoVO view(int movieId) {
		
		return dao.view(movieId);
	}
	
	@Override
	public void write(MovieInfoVO vo) {
		dao.write(vo);
	}

	@Override
	public int countTotalList(HashMap<String, String> conditions) {

		return dao.countTotalList(conditions);
	}
	
	
	@Override
	public List<MovieInfoVO> getConditionalList(HashMap<String, String> conditions){
		
		
		return dao.getConditionalList(conditions);
		
	}
	
	@Override
	public List<MovieInfoVO> searchByTitle(String searchKeyword){
		
		return dao.searchByTitle(searchKeyword);
	}

	@Override
	public void deleteMovie(int movieId) {
		
		dao.deleteMovie(movieId);
	}


}
