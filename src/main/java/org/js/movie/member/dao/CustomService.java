package org.js.movie.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.js.movie.member.domain.CustomMemberVO;
import org.js.movie.member.domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomService implements UserDetailsService {

	@Autowired
	private MemberDAO dao;
	
	@Override  // return cMember.
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		
		
		log.info("CustomService 진입");
		CustomMemberVO cMember = dao.login(memberId);	//로그인시 id에 맞는 정보들이 cMember에 담김.
		log.info("login 시작" + cMember);
		
		
		if(cMember!=null) {
			Role nowRole = new Role();
			nowRole = dao.selectRole(memberId);
			Role giveRole = new Role(); 
			
			log.info("nowRole : " + nowRole);
			log.info("Authorities : " + cMember);
			log.info("memberId : " +memberId);
			
			//문자열 비교 .equals("")
			/*
			 * if(memberId.equals("admin")) { log.info("hi"); }
			 */
			//getAuthorities..(this.role = role)
			
			if(memberId.equals("admin") && cMember.getAuthorities()== null && nowRole == null ){
			
				log.info("admin Authorities : " + cMember.getAuthorities());
				
				giveRole.setRole("ROLE_ADMIN");
				
				giveRole.setMemberId(memberId); //dao에 insert 위해서 memberId setting.
				/*
				 * Authentication auth; Authentication authentication =
				 * SecurityContextHolder.getContext().getAuthentication(); if (authentication ==
				 * null) cMember = null; else cMember = (CustomMemberVO)
				 * authentication.getPrincipal();
				 */
	
				
				List<Role> roles = new ArrayList<Role>();
	
				roles.add(giveRole); //리스트에 role 객체를 넣음 형변환해서		
				log.debug("giveRole : " + giveRole.toString());
				
				cMember.setAuthorities(roles);
				log.info("getAuthorities 확인 : " + cMember.getAuthorities());
				
				log.info("adminRole: " + giveRole.toString());
	
				
				dao.insertRole(giveRole);//DB에 현재 아이디와 그에 맞는 role값 넣음.
			
			
				
			} else if(memberId.equals("admin") && nowRole != null) {
				log.info("권한이 이미 있음");
				giveRole.setRole("ROLE_ADMIN");
				giveRole.setMemberId(memberId);
				List<Role> roles = new ArrayList<Role>();
				roles.add(giveRole); //리스트에 role 객체를 넣음 형변환해서	
	
				cMember.setAuthorities(roles);
				log.info("getAuthorities 확인: " + cMember.getAuthorities());
				
				/*
				 * Authentication authentication =
				 * SecurityContextHolder.getContext().getAuthentication();
				 */
	
				log.info("auth.. : " );
			} else if(!memberId.equals("admin") && cMember != null && nowRole == null) {
				  
				log.info("user Authorities : " + cMember.getAuthorities());
				  
				giveRole.setRole("ROLE_USER");
				log.info("getAuthorities 확인 : " + cMember.getAuthorities());
				
				giveRole.setMemberId(cMember.getMemberId()); 
				List<Role> roles = new ArrayList<Role>();
				  
				roles.add(giveRole); 
				
				cMember.setAuthorities(roles); //authorities를 중간에 설정? 아니면 db에서 조회? 
				log.info("getAuthorities 확인 : " + cMember.getAuthorities());
				
				log.info("userRole : " + giveRole.toString());
				  
				dao.insertRole(giveRole);
				  
			} else if(!memberId.equals("admin") && cMember != null && nowRole != null) { 
				
				log.info("권한이 이미 있음");
				giveRole.setRole("ROLE_USER");
				giveRole.setMemberId(memberId);
				List<Role> roles = new ArrayList<Role>();
				roles.add(giveRole); //리스트에 role 객체를 넣음 형변환해서	
	
				cMember.setAuthorities(roles);
				log.info("getAuthorities 확인: " + cMember.getAuthorities());
	
				log.info("auth.. : " );
			  
			}
		}//if(cMember!=null) 끝
			else if(cMember==null){ 
			log.info("회원이 아님"); 
			throw new UsernameNotFoundException(memberId); 
		}
		
		 
		
		return cMember;
	}
	
	
	public void onAuthenticationBinding(CustomMemberVO memberVO, User facebookUser) throws NullPointerException { 
		memberVO.setMemberId(facebookUser.getId()); 
		memberVO.setEmail(facebookUser.getEmail());  
		memberVO.setNickname(facebookUser.getName());
		Role fbRole = new Role ();
		fbRole.setRole("ROLE_USER");
		List<Role> listRole = new ArrayList<Role>();
		listRole.add(fbRole);
		
		memberVO.setAuthorities(listRole); 
		memberVO.setAccountNonExpired(true); 
		memberVO.setAccountNonLocked(true); 
		memberVO.setCredentialsNonExpired(true); 
		memberVO.setEnabled(true); // Token 생성하고 로그인 세션 생성 
		
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken( memberVO, null, memberVO.getAuthorities() ); 
		SecurityContextHolder.getContext().setAuthentication(authenticationToken);
	}

}
