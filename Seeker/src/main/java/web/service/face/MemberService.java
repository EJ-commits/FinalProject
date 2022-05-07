package web.service.face;

import web.dto.Member;

public interface MemberService {
	
	/**
	 * 로그인 인증 처리
	 * 	  
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Member member);

	/**
	 * 로그인한 회원의 정보 처리
	 * 	  
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인한 회원의 정보
	 */
	public int getMemberNo(Member member);

	public int getMemberRank(Member member);

	public String getName(Member member);

	public String getNick(Member member);

	public String getEmail(Member member);

	public String getPhone(Member member);

	public String getAddr1(Member member);

	public String getAddr2(Member member);

	public String getAddr3(Member member);

	public String getMdate(Member member);

	/**
	 * 신규 회원 가입
	 * 	  
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Member member);
	
}
