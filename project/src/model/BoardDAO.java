package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	ResultSet rs;
	Connection conn;
	PreparedStatement pstmt;

	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertHelpBoard(BoardVO VO) {
		getCon();
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		
		try {

			String refsql = "select max(ref) from helpboard";

			pstmt = conn.prepareStatement(refsql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}

			String sql = "insert into helpboard values(helpboard_seq.nextval,?,?,?,?,?,?,?,sysdate,0,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, VO.getId());
			pstmt.setString(2, VO.getWriter());
			pstmt.setString(3, VO.getSubject());
			pstmt.setString(4, VO.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, VO.getContent());

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<BoardVO> getAllHelpBoard(int start, int end) {

		Vector<BoardVO> vec = new Vector<>();
		getCon();

		try {
			String sql = "select * from (select A.*,Rownum Rnum from(select * from helpboard order by num desc)A)"
					+ "where Rnum >=? and Rnum <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO VO = new BoardVO();
				VO.setNum(rs.getInt(1));
				VO.setId(rs.getString(2));
				VO.setWriter(rs.getString(3));
				VO.setSubject(rs.getString(4));
				VO.setPassword(rs.getString(5));
				VO.setRef(rs.getInt(6));
				VO.setRe_step(rs.getInt(7));
				VO.setRe_level(rs.getInt(8));
				VO.setReg_date(rs.getDate(9).toString());
				VO.setReadcount(rs.getInt(10));
				VO.setContent(rs.getString(11));

				vec.add(VO);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}
	
	

	public void insertHelpReBoard(BoardVO bvo) {

		int ref = bvo.getRef();
		int re_step = bvo.getRe_step();
		int re_level = bvo.getRe_level();

		getCon();

		try {
			String refsql = "select max(ref) from board";
			pstmt = conn.prepareStatement(refsql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}

			String levelsql = "update helpreboard set re_step=re_step+1 where num=? and ref=? and re_step > ?";
			// 쿼리 삽입 객체 선언
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, bvo.getNum());
			pstmt.setInt(2, ref);
			pstmt.setInt(3, re_step);
			// 쿼리 실행
			pstmt.executeUpdate();
			// 답변글 데이터를 저장
			String sql = "insert into helpreboard values(?,?,?,sysdate,helpreboard_seq.nextval,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// ?에 값을 대입
			pstmt.setInt(1, bvo.getNum());
			pstmt.setString(2, bvo.getId());
			pstmt.setString(3, bvo.getWriter());
			pstmt.setInt(4, re_step + 1);
			pstmt.setInt(5, re_level + 1);
			pstmt.setString(6, bvo.getContent());
			// 쿼리를 실행
			pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Vector<BoardVO> getAllHelpReBoard(int num) {

		Vector<BoardVO> vec = new Vector<>();
		getCon();

		try {
			String sql = "select * from helpreboard where num=? order by ref asc,re_step asc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setId(rs.getString(2));
				bvo.setWriter(rs.getString(3));
				bvo.setReg_date(rs.getDate(4).toString());
				bvo.setRef(rs.getInt(5));
				bvo.setRe_step(rs.getInt(6));
				bvo.setRe_level(rs.getInt(7));
				bvo.setContent(rs.getString(8));

				vec.add(bvo);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}

	public int getAllCount() {
		getCon();
		int count = 0;

		try {

			String sql = "select count(*) from helpboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public BoardVO getOneHelpBoard(int num) {
		BoardVO bvo = new BoardVO();
		getCon();

		try {
			String readsql = "update helpboard set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql = "select * from helpboard where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bvo.setNum(rs.getInt(1));
				bvo.setId(rs.getString(2));
				bvo.setWriter(rs.getString(3));
				bvo.setSubject(rs.getString(4));
				bvo.setPassword(rs.getString(5));
				bvo.setRef(rs.getInt(6));
				bvo.setRe_step(rs.getInt(7));
				bvo.setRe_level(rs.getInt(8));
				bvo.setReg_date(rs.getDate(9).toString());
				bvo.setReadcount(rs.getInt(10));
				bvo.setContent(rs.getString(11));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bvo;
	}
	
	public BoardVO getOneHelpBoardNocount(int num) {
		BoardVO bvo = new BoardVO();
		getCon();

		try {
			String sql = "select * from helpboard where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bvo.setNum(rs.getInt(1));
				bvo.setId(rs.getString(2));
				bvo.setWriter(rs.getString(3));
				bvo.setSubject(rs.getString(4));
				bvo.setPassword(rs.getString(5));
				bvo.setRef(rs.getInt(6));
				bvo.setRe_step(rs.getInt(7));
				bvo.setRe_level(rs.getInt(8));
				bvo.setReg_date(rs.getDate(9).toString());
				bvo.setReadcount(rs.getInt(10));
				bvo.setContent(rs.getString(11));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bvo;
	}
	

	public void deleteHelpBoard(int num) {
		getCon();

		try {
			String sql = "delete from helpboard where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql2 = "delete from helpreboard where num=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteHelpReBoard(BoardVO bvo) {
		getCon();

		try {
			String sql2 = "delete from helpreboard where num=? and ref=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, bvo.getNum());
			pstmt.setInt(2, bvo.getRef());
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateHelpBoard(BoardVO bvo) {
		getCon();

		try {
			String sql = "update helpboard set subject=?, writer=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getSubject());
			pstmt.setString(2, bvo.getWriter());
			pstmt.setString(3, bvo.getContent());
			pstmt.setInt(4, bvo.getNum());
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateHelpReBoard(BoardVO bvo) {
		getCon();

		try {
			String sql = "update helpreboard set content=? where num=? and ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getContent());
			pstmt.setInt(2, bvo.getNum());
			pstmt.setInt(3, bvo.getRef());

			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	//밑에부터 검색
	public Vector<BoardVO> getAllHelpBoardSearch(int start, int end,String search) {

		Vector<BoardVO> vec = new Vector<>();
		getCon();

		try {
			String sql = "select * from (select A.*,Rownum Rnum from(select * from helpboard where subject like ? order by num desc)A)"
					+ "where Rnum >=? and Rnum <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO VO = new BoardVO();
				VO.setNum(rs.getInt(1));
				VO.setId(rs.getString(2));
				VO.setWriter(rs.getString(3));
				VO.setSubject(rs.getString(4));
				VO.setPassword(rs.getString(5));
				VO.setRef(rs.getInt(6));
				VO.setRe_step(rs.getInt(7));
				VO.setRe_level(rs.getInt(8));
				VO.setReg_date(rs.getDate(9).toString());
				VO.setReadcount(rs.getInt(10));
				VO.setContent(rs.getString(11));

				vec.add(VO);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}
	
	public int getAllCount(String search) {
		getCon();
		int count = 0;

		try {

			String sql = "select count(*) from helpboard where subject like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}
	
	
	// 여기까지 문의

	public void insertEventBoard(BoardVO bvo) {
		getCon();

		try {
			String sql = "insert into eventboard values(eventboard_seq.nextval,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getSubject());
			pstmt.setString(2, bvo.getPassword());
			pstmt.setString(3, bvo.getContent());
			pstmt.setString(4, bvo.getStartdate());
			pstmt.setString(5, bvo.getEnddate());
			pstmt.setString(6, bvo.getImgname());
			pstmt.setString(7, bvo.getImgname2());

			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Vector<BoardVO> getAllEventBoard1(int startRow, int endRow) {
		getCon();
		Vector<BoardVO> vec = new Vector<>();

		try {
			String sql = "select * from (select A.*,Rownum Rnum from(select num,subject,password,content,\r\n" + 
					"TO_CHAR(startdate,'YYYY/MM/DD'),TO_CHAR(enddate, 'YYYY/MM/DD'),imgname,imgname2 from eventboard\r\n" + 
					"where enddate > sysdate-1 order by num desc)A)where Rnum >=? and Rnum <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setSubject(rs.getString(2));
				bvo.setPassword(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setStartdate(rs.getString(5));
				bvo.setEnddate(rs.getString(6));
				bvo.setImgname(rs.getString(7));
				bvo.setImgname2(rs.getString(8));
				bvo.setRownum(rs.getInt(9));

				vec.add(bvo);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}
	
	
	
	public Vector<BoardVO> getAllEventBoard() {
		getCon();
		Vector<BoardVO> vec = new Vector<>();

		try {
			String sql = "select num,subject,password,content,TO_CHAR(startdate, 'YYYY/MM/DD'),TO_CHAR(enddate, 'YYYY/MM/DD'),imgname,imgname2 from eventboard where enddate > sysdate-1 order by num desc";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setSubject(rs.getString(2));
				bvo.setPassword(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setStartdate(rs.getString(5));
				bvo.setEnddate(rs.getString(6));
				bvo.setImgname(rs.getString(7));
				bvo.setImgname2(rs.getString(8));

				vec.add(bvo);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}

	public Vector<BoardVO> getAllEventEndBoard1(int startRow, int endRow) {
		getCon();
		Vector<BoardVO> vec = new Vector<>();

		try {			
			String sql = "select * from (select A.*,Rownum Rnum from(select num,subject,password,content,\r\n" + 
					"TO_CHAR(startdate,'YYYY/MM/DD'),TO_CHAR(enddate, 'YYYY/MM/DD'),imgname,imgname2 from eventboard\r\n" + 
					"where enddate < sysdate-1 order by num desc)A)where Rnum >=? and Rnum <= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setSubject(rs.getString(2));
				bvo.setPassword(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setStartdate(rs.getString(5));
				bvo.setEnddate(rs.getString(6));
				bvo.setImgname(rs.getString(7));
				bvo.setImgname2(rs.getString(8));
				bvo.setRownum(rs.getInt(9));

				vec.add(bvo);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}
	
	public Vector<BoardVO> getAllEndEventBoard() {
		getCon();
		Vector<BoardVO> vec = new Vector<>();

		try {
			String sql = "select num,subject,password,content,TO_CHAR(startdate, 'YYYY/MM/DD'),TO_CHAR(enddate, 'YYYY/MM/DD'),imgname,imgname2 from eventboard where enddate < sysdate-1 order by num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setSubject(rs.getString(2));
				bvo.setPassword(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setStartdate(rs.getString(5));
				bvo.setEnddate(rs.getString(6));
				bvo.setImgname(rs.getString(7));
				bvo.setImgname2(rs.getString(8));

				vec.add(bvo);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}

	public BoardVO getOneEventBoard(int num) {
		getCon();

		BoardVO bvo = new BoardVO();
		try {
			String sql = "select num,subject,password,content,TO_CHAR(startdate, 'YYYY/MM/DD'),TO_CHAR(enddate, 'YYYY/MM/DD'),imgname,imgname2 from eventboard where num=? order by num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				bvo.setNum(rs.getInt(1));
				bvo.setSubject(rs.getString(2));
				bvo.setPassword(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setStartdate(rs.getString(5));
				bvo.setEnddate(rs.getString(6));
				bvo.setImgname(rs.getString(7));
				bvo.setImgname2(rs.getString(8));

			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bvo;
	}

	public int getAllEventCount() {
		getCon();
		int count = 0;

		try {

			String sql = "select count(*) from eventboard";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public void updateEventBoard(BoardVO bvo) {
		getCon();

		try {
			String sql = "update Eventboard set subject=?, content=?, startdate=?, enddate=?, imgname=?, imgname2=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getSubject());
			pstmt.setString(2, bvo.getContent());
			pstmt.setString(3, bvo.getStartdate());
			pstmt.setString(4, bvo.getEnddate());
			pstmt.setString(5, bvo.getImgname());
			pstmt.setString(6, bvo.getImgname2());
			pstmt.setInt(7, bvo.getNum());
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteEventBoard(int num) {
		getCon();

		try {
			String sql = "delete Eventboard where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
}
