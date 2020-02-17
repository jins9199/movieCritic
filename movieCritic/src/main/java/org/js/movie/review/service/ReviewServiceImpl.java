package org.js.movie.review.service;

import java.util.List;

import org.js.movie.review.dao.ReviewDAO;
import org.js.movie.review.domain.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	
	//리뷰 조회
	@Override
	public List<ReviewVO> readReview(int movieId) {

		return dao.readReview(movieId);
	}

}
