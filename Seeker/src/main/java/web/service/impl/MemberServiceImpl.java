package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired MemberDao memberDao;
	
	@Override
	public boolean login(Member member) {
		
		int loginChk = memberDao.selectCntMember(member);
		
		//로그인 성공시
		if( loginChk > 0 ) {
			return true;
		}
		
		//로그인 실패시
		return false;
		
	}

	@Override
	public int getMemberNo(Member member) {
		return memberDao.selectMemberNoBymember(member);
	}

	@Override
	public int getMemberRank(Member member) {
		return memberDao.selectMemberRankBymember(member);
	}

	@Override
	public String getName(Member member) {
		return memberDao.selectNameBymember(member);
	}

	@Override
	public String getNick(Member member) {
		return memberDao.selectNickBymember(member);
	}

	@Override
	public String getEmail(Member member) {
		return memberDao.selectEmailBymember(member);
	}

	@Override
	public String getPhone(Member member) {
		return memberDao.selectPhoneBymember(member);
	}

	@Override
	public String getAddr1(Member member) {
		return memberDao.selectAddr1Bymember(member);
	}

	@Override
	public String getAddr2(Member member) {
		return memberDao.selectAddr2Bymember(member);
	}

	@Override
	public String getAddr3(Member member) {
		return memberDao.selectAddr3Bymember(member);
	}

	@Override
	public String getMdate(Member member) {
		return memberDao.selectMdateBymember(member);
	}

	@Override
	public boolean join(Member member) {
	
		//중복된 ID인지 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.insert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return true;
		}
		
		return false;

	}
	
}
