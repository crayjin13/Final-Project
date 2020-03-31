package com.itwill.staily.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.staily.mypage.mapper.FriendMapper;
import com.itwill.staily.mypage.model.dto.Friend;
import com.itwill.staily.util.Member;

public class FriendServiceImpl implements FriendService {
	@Autowired
	private FriendMapper friendMapper;
	
	@Override
	public List<Friend> selectList(int mNo) throws Exception {
		return friendMapper.selectList(mNo);
	}

	@Override
	public boolean createFriend(Friend friend) throws Exception {
		return friendMapper.createFriend(friend);
	}

	@Override
	public boolean deleteFriend(int fNo) throws Exception {
		return friendMapper.deleteFriend(fNo);
	}

	@Override
	public Member findFriend(int mNo) throws Exception {
		return friendMapper.findFriend(mNo);
	}

}
