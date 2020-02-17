package org.js.movie.member.service;

import java.util.List;

import org.js.movie.member.dao.CustomService;
import org.js.movie.member.domain.CustomMember;
import org.js.movie.member.domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CustomProvider implements AuthenticationProvider {
	
	@Autowired
	private CustomService service;

	@Autowired
	private 
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = (String) authentication.getPrincipal(); // 입력한memberId 
		String password = (String) authentication.getCredentials(); //Object -> String 
		
		CustomMember member = (CustomMember) service.loadUserByUsername(username);
		
		if(!matchPassword(password, member.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!member.isEnabled()) {
            throw new BadCredentialsException(username);
        }
		
		List<Role> authorities = (List<Role>) member.getAuthorities();
		
		return new UsernamePasswordAuthenticationToken(member, password, authorities);
	}
	
	private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }

	@Override
	public boolean supports(Class<?> authentication) {

		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
