package org.js.movie.review.dao;

import java.util.List;

import org.js.movie.review.domain.ReviewVO;

public interface ReviewDAO {
	
	//리뷰 조회
	public List<ReviewVO> readReview(int movieId);
	
}
