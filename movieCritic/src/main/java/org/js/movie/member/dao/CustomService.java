package org.js.movie.member.dao;

import org.js.movie.member.domain.CustomMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomService implements UserDetailsService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		
		CustomMember cMember = dao.login(memberId);
		
		if(cMember==null) {
			throw new UsernameNotFoundException(memberId);

			 
	    }
		return cMember;
	}

}
