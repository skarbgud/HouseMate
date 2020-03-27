package com.homa.persistence;

import java.util.List;

import com.homa.domain.ReplyVO;

public interface ReplyDAO {
	
	//댓글 조회
	public List<ReplyVO> readReply(int fb_num) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	//특정 댓글 조회
	public ReplyVO readReplySelect(int c_num) throws Exception;
	
	//댓글 수정
	public void replyUpdate(ReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void replyDelete(ReplyVO vo) throws Exception;
}
