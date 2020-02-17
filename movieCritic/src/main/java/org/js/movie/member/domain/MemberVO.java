package org.js.movie.member.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberVO {
	private int id;
	private String memberId;
	private String memberPw;
	private String email;
	private String nickname;
	private String phoneNumber;
	private int enabled;
	
	public MemberVO(String memberId, String memberPw, int enabled) {
		
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.enabled = enabled;
	}
	
}
	
	