package org.js.movie.movieinfo.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.js.movie.movieinfo.domain.MovieInfoVO;
import org.js.movie.movieinfo.service.MovieInfoService;
import org.js.movie.movieinfo.utils.UploadFileUtils;
import org.js.movie.review.domain.ReviewVO;
import org.js.movie.review.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MovieInfoController {

	
	@Autowired
	MovieInfoService movieInfoService;
	
	@Autowired
	ReviewService reviewService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping (value = "/movie_info", method = RequestMethod.GET)
	public void getMovieInfo(@RequestParam("movieId") int movieId, Model model) throws Exception {
		
	
		MovieInfoVO vo = movieInfoService.view(movieId);
		
		log.info("####movie_info get####");
		model.addAttribute("view", vo);
		
		List<ReviewVO> reviewList = reviewService.readReview(movieId);
		model.addAttribute("reviewList", reviewList);
	}
	
	@RequestMapping (value ="/write_board", method = RequestMethod.GET)
	public void getMovieWrite() {
		
		log.info("######write_board get######");
	}
	
	@RequestMapping(value = "/write_board", method = RequestMethod.POST)
	public String posttWrite(MovieInfoVO vo, MultipartFile file) throws Exception{
		
		
		log.info("###upload path###");
		String imgUploadPath = uploadPath + File.separator + "movieImage";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		log.info("###upload path###");
		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
			fileName = uploadPath + File.separator + "image" + File.separator + "none.png";
		}

		vo.setPoster(File.separator + "movieImage" + ymdPath + File.separator + fileName);

		log.info("####upload post###");
		movieInfoService.write(vo);
			
		return "redirect:/";
	}
	
}
