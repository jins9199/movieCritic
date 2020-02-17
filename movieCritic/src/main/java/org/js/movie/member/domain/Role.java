package org.js.movie.member.domain;

import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Role implements GrantedAuthority {
	
	private static final long serialVersionUID = 7464267597005842862L;
	
	private String memberId;
	private String role;

	
	@Override
	public String getAuthority() {
		
		return this.role;
	}

}
