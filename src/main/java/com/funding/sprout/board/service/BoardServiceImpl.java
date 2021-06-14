package com.funding.sprout.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.funding.sprout.board.dao.BoardDao;
import com.funding.sprout.vo.Board;

@Service("boService")
public class BoardServiceImpl implements BoardService {
	
	private BoardDao boDao;

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> selectSearch() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int addReadCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board updateBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBoard() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int ReportSend() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board getLike() {
		// TODO Auto-generated method stub
		return null;
	}

}
