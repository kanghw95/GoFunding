package com.funding.sprout.user.controller;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoOAuthApi20 extends DefaultApi20 {

	protected KakaoOAuthApi20() {
	}

	private static class InstanceHolder {
		private static final KakaoOAuthApi20 INSTANCE = new KakaoOAuthApi20();
	}

	public static KakaoOAuthApi20 instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://kauth.kakao.com/oauth/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://kauth.kakao.com/oauth/authorize";
	}
}
