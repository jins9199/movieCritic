package org.js.movie.review.service;

import java.util.List;

import org.js.movie.review.domain.ReviewVO;

public interface ReviewService {

	//리뷰  조회
	public List<ReviewVO> readReview(int movieId);
}
