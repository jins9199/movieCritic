package org.js.movie.review.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	
//	CREATE TABLE tbl_review (
//		    reviewId int not null,
//		    movieId INT,
//		    content  varchar(2000),
//		    writer  varchar(50) ,
//		    regDate  DATE DEFAULT NOW(),
//		    rating  INT,
//		    FOREIGN KEY(movieId) REFERENCES tbl_movieInfo(movieId),
//		    primary key(replyId, movieId)
//		    );
	
	private int reviewId;
	private int movieId;
	private String content;
	private String writer;
	private Date regDate;
	private int rating;

}
