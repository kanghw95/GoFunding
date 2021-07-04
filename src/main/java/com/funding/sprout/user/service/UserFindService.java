package com.funding.sprout.user.service;

import com.funding.sprout.vo.User;

public interface UserFindService {

	public User findId(User user); //아이디 찾기

	public User findPwd(User user); //비밀번호 찾기
}
