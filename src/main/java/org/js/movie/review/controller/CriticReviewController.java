package org.js.movie.review.controller;

import java.util.List;
import java.util.Map;

import org.js.movie.movieinfo.domain.Criteria;
import org.js.movie.movieinfo.domain.MovieInfoVO;
import org.js.movie.movieinfo.domain.PageMaker;
import org.js.movie.movieinfo.service.MovieInfoService;
import org.js.movie.review.domain.CriticReviewVO;
import org.js.movie.review.service.CriticReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CriticReviewController {
	
	@Autowired
	CriticReviewService criticReviewService;

	@Autowired
	MovieInfoService movieInfoService;
	
	@RequestMapping(value="/view_critic_review/deletion", method=RequestMethod.GET)
	public String getDeleteReview(@RequestParam("reviewId") int reviewId, @RequestParam("movieId") int movieId) {
		log.info("############delete review");
		criticReviewService.deleteCriticReview(reviewId);
		
		return "redirect:../view_critic_review?movieId="+movieId;
	}
	
	@RequestMapping(value = "/view_critic_review", method=RequestMethod.GET)
	public String getViewReview(CriticReviewVO criticReviewVO, Model model, Criteria criteria) {
		log.info("리뷰 목록 및 작성 페이지 진입");
		
		List<CriticReviewVO> reviewList = criticReviewService.readCriticReview(criticReviewVO.getMovieId());
		if(!reviewList.equals(null)) {
			int totalCount = reviewList.size();
			log.info("totalCount  : " + totalCount);
			int positiveCount=0;
			int mixedCount=0;
			int negativeCount=0;
			int totalScore=0;
			
			for(CriticReviewVO revList : reviewList) {
				totalScore += revList.getRating();
				
				if(revList.getRating() < 4) {
					negativeCount++;
				}
				else if(4<=revList.getRating() && revList.getRating()<=6) {
					mixedCount++;
				}
				else if(7<=revList.getRating() && revList.getRating()<=10) {
					positiveCount++;
				}
			}
			int maxCount = Math.max(negativeCount, Math.max(positiveCount, mixedCount));
			double scoreAverage = Math.round((totalScore*10.0/totalCount))/10.0;

			log.info("totalScore : " + totalScore);
			log.info("negative: " + negativeCount);
			log.info("positive : " + positiveCount);
			log.info("mixed : " + mixedCount);
			log.info("scoreAverage: " + scoreAverage);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("negativeCount", negativeCount);
			model.addAttribute("mixedCount", mixedCount);
			model.addAttribute("positiveCount", positiveCount);
			model.addAttribute("maxCount", maxCount);
			model.addAttribute("scoreAverage", scoreAverage);
			model.addAttribute("reviewList", reviewList);

			} else {
				log.info("reviewList : " + reviewList.toString()); 
			}
		
		MovieInfoVO vo = movieInfoService.view(criticReviewVO.getMovieId());
		log.info("vo : "+ vo.toString());
		model.addAttribute("view", vo);
		
		//페이징 시작
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);//시작페이지 , 페이지당 게시글수 초기화
		log.info("##########");
		pageMaker.setTotalCount(criticReviewService.countTotalList(criticReviewVO.getMovieId())); //총 게시글 수 초기화

		log.info("totalCount : " + pageMaker.getTotalCount());
		List<Map<String, Object>> infoList = criticReviewService.pagingList(criteria); //리스트 불러오기
		

		int maxBoardNumber = infoList.size();
		log.info("Max boardNumber :" + maxBoardNumber);
		
		log.info("################## list 확인: " + infoList);

		model.addAttribute("list", infoList);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
		
		return "view_critic_review";
	}
	//movieId 값을 받와야하해서 경로에 movieId를 포함시키는게 나을지.. 아니면 다른방법?
	@RequestMapping(value= "/view_critic_review", method=RequestMethod.POST)
	public String postViewReview(Model model, CriticReviewVO criticReviewVO) {
		// movieId에 해당하는 값이 없음 로직 추가.. get방식으로 불러올 때 로 넣고 
		//post에서는 input hidden으로 보내는 걸로 함. criticReviewVO에 바인딩됨. 커맨드객체
		//content도 바인딩, writer는 직접 넣어주고, rating
		
		criticReviewVO.setWriter(SecurityContextHolder.getContext().getAuthentication().getName());
		log.info("writer :" + criticReviewVO.getWriter());
		log.info("criticReviewVO : " + criticReviewVO.toString());
		criticReviewService.insertCriticReview(criticReviewVO);
		
		return "redirect:../view_critic_review?movieId="+criticReviewVO.getMovieId();
	}
	
	@RequestMapping(value= "/view_critic_review.update", method=RequestMethod.POST)
	public String updateViewReview(CriticReviewVO criticReviewVO) {
		
		criticReviewVO.setWriter(SecurityContextHolder.getContext().getAuthentication().getName());
		log.info("writer :" + criticReviewVO.getWriter());
		log.info("criticReviewVO : " + criticReviewVO.toString());
		criticReviewService.updateCriticReview(criticReviewVO);
		log.info("?????"+criticReviewVO);
		return "redirect:../view_critic_review?movieId="+criticReviewVO.getMovieId();
	}
	
}
