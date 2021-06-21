package com.funding.sprout.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AdminDao;
import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Notifiy;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adDao;

	@Override
	public Admin adminlogin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> list(Criteria cri) throws Exception { // �˻� ������ ��ü ȸ�� ��ȸ
		return adDao.list(cri);
	}
	
	@Override
	public int listCount() throws Exception { // ���� �� ��ȸ
		return adDao.listCount();
	}
	
	@Override
	public List<User> selectUserId(User user) throws Exception { // ���� ���̵� ��ȸ
		return adDao.selectUserId(user);
	}
	
	@Override
	public List<User> selectUserName(User user) throws Exception { // ���� �̸� ��ȸ
		return adDao.selectUserName(user);
	}
	
	@Override
	public List<User> selectUserNick(User user) throws Exception { // ���� �г��� ��ȸ
		return adDao.selectUserNick(user);
	}

	@Override
	public void userStop(String userNo) { // ȸ�� ���� ��Ż
		adDao.userStop(userNo);
	}
	
	@Override
	public List<Board> freeBoardList(Criteria cri) throws Exception { // ���� �Խ��� ��ȸ
		return adDao.freeBoardList(cri);
	}
	
	@Override
	public List<Board> reviewBoardList(Criteria cri) throws Exception { // �ı� �Խ��� ��ȸ
		return adDao.reviewBoardList(cri);
	}
	
	@Override
	public List<Board> questionBoardList(Criteria cri) throws Exception { // �������� �Խ��� ��ȸ
		return adDao.questionBoardList(cri);
	}

	@Override
	public List<Board> shareBoardList(Criteria cri) throws Exception { // �������� �Խ��� ��ȸ
		return adDao.shareBoardList(cri);
	}
	
	@Override
	public List<Board> eventBoardList(Criteria cri) throws Exception { // �̺�Ʈ �Խ��� ��ȸ
		return adDao.eventBoardList(cri);
	}

	@Override
	public int freeBoardCount() throws Exception { // ���� �Խ��� �� �� ��ȸ
		return adDao.freeBoardCount();
	}
	
	@Override
	public int reviewBoardCount() throws Exception { // ���� �Խ��� �� �� ��ȸ
		return adDao.reviewBoardCount();
	}
	
	@Override
	public int questionBoardCount() throws Exception { // ���� �Խ��� �� �� ��ȸ
		return adDao.questionBoardCount();
	}
	
	@Override
	public int shareBoardCount() throws Exception { // ���� �Խ��� �� �� ��ȸ
		return adDao.shareBoardCount();
	}
	
	@Override
	public int eventBoardCount() throws Exception { // ���� �Խ��� �� �� ��ȸ
		return adDao.eventBoardCount();
	}
	
	@Override
	public List<Board> selectFBoardId(Board board) throws Exception { // ���� �Խ��� �ۼ��� ��ȸ
		return adDao.selectFBoardId(board);
	}
	
	@Override
	public List<Board> selectFBoardTitle(Board board) throws Exception { // ���� �Խ��� ���� ��ȸ
		return adDao.selectFBoardTitle(board);
	}
	
	@Override
	public List<Board> selectRBoardId(Board board) throws Exception { // �ı� �Խ��� �ۼ��� ��ȸ
		return adDao.selectRBoardId(board);
	}
	
	@Override
	public List<Board> selectRBoardTitle(Board board) throws Exception { // �ı� �Խ��� ���� ��ȸ
		return adDao.selectRBoardTitle(board);
	}
	
	@Override
	public List<Board> selectQBoardId(Board board) throws Exception { // �������� �Խ��� �ۼ��� ��ȸ
		return adDao.selectQBoardId(board);
	}

	@Override
	public List<Board> selectQBoardTitle(Board board) throws Exception { // �������� �Խ��� ���� ��ȸ
		return adDao.selectQBoardTitle(board);
	}

	@Override
	public List<Board> selectSBoardId(Board board) throws Exception { // �������� �Խ��� �ۼ��� ��ȸ
		return adDao.selectSBoardId(board);
	}
	
	@Override
	public List<Board> selectSBoardTitle(Board board) throws Exception { // �������� �Խ��� ���� ��ȸ
		return adDao.selectSBoardTitle(board);
	}	
	
	@Override
	public List<Board> selectEBoardId(Board board) throws Exception { // �̺�Ʈ �Խ��� �ۼ��� ��ȸ
		return adDao.selectEBoardId(board);
	}	
		
	@Override
	public List<Board> selectEBoardTitle(Board board) throws Exception { // �̺�Ʈ �Խ��� ���� ��ȸ
		return adDao.selectEBoardTitle(board);
	}
		
	@Override
	public void deleteFBoardList(String boardNo) { // ���� �Խ��� �� ����
		adDao.deleteFBoardList(boardNo);
	}
	
	@Override
	public void deleteRBoardList(String boardNo) { // �ı� �Խ��� �� ����
		adDao.deleteRBoardList(boardNo);
	}
	
	@Override
	public void deleteQBoardList(String boardNo) { // �������� �Խ��� �� ����
		adDao.deleteQBoardList(boardNo);
	}
	
	@Override
	public void deleteSBoardList(String boardNo) { // �������� �Խ��� �� ����
		adDao.deleteSBoardList(boardNo);
	}
	
	@Override
	public void deleteEBoardList(String boardNo) { // �̺�Ʈ �Խ��� �� ����
		adDao.deleteEBoardList(boardNo);
	}
	
	@Override
	public int userStart() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> getQNAByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getQNACount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Faq> getFAQByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getFAQCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQdelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notifiy> getNotifyByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Notifydelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Report> getPeportByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReportCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
