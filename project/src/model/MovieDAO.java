package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MovieDAO {
	
	String id="scott";
	String pass="tiger";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	//oracle.jdbc.driver.OracleDriver jdbc:oracle:thin:@localhost:1521:xe
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static MovieDAO instance=new MovieDAO();
	
	
public static MovieDAO getInstance() {
		
		return instance;
	}
	
	public void getcon()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url,id,pass);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public void insertMovie(MovieVO movie) {
		
		
		try {
			getcon();
			
			String sql="insert into movie values(movie_seq.nextval,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, movie.getMovieName());
			pstmt.setInt(2,movie.getFilmRate());
			pstmt.setString(3, movie.getImg());
			pstmt.setString(4, movie.getUrl());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public Vector<MovieVO> allSelectMovie()
	{
		Vector<MovieVO> v=new Vector<MovieVO>();
		
		try {
			getcon();
			String sql="select * from movie order by num asc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MovieVO mvo = new MovieVO();
				mvo.setNum(rs.getInt(1));
				mvo.setMovieName(rs.getString(2));
				mvo.setFilmRate(rs.getInt(3));
				mvo.setImg(rs.getString(4));
				mvo.setUrl(rs.getString(5));
				v.add(mvo);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public Vector<MovieTimeSeatVO> allSelectMovieTimeSeat(String id)
	{
		Vector<MovieTimeSeatVO> v=new Vector<MovieTimeSeatVO>();
		
		try {
			getcon();
			String sql="select * from movietimeseat where id =? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MovieTimeSeatVO mvo = new MovieTimeSeatVO();
				mvo.setId(rs.getString(1));
				mvo.setMovieName(rs.getString(2));
				mvo.setMovieDate(rs.getString(3));
				mvo.setMovieTime(rs.getString(4));
				mvo.setSeatNum(rs.getString(5));
				v.add(mvo);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public void DeleteOneTicket(String id,String name,String date,String time,String seat)
	{
		getcon();
		
		try
		{
			String sql="delete from movietimeseat where id =? and moviename =? and moviedate =? and movietime =? and seatnum =? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, date);
			pstmt.setString(4, time);
			pstmt.setString(5, seat);
			rs=pstmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
public void insertMovieTime(MovieTimeVO movie) {
		
		
		try {
			getcon();
			
			String sql="insert into movieTime values(?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, movie.getNum());
			pstmt.setString(2,movie.getDate());
			pstmt.setString(3, movie.getTime());
			pstmt.setInt(4,movie.getDateNum());
			pstmt.setInt(5,movie.getTimeNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


public Vector<MovieTimeVO> SelectOneMovieDate(int num)
{
	Vector<MovieTimeVO> v=new Vector<MovieTimeVO>();
	getcon();
	
	try {
		
		String sql="select distinct moviedate,moviedatenum from movietime where num =? order by moviedatenum asc";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MovieTimeVO mvo = new MovieTimeVO();
			mvo.setDate(rs.getString(1));
			mvo.setDateNum(Integer.parseInt(rs.getString(2)));
			v.add(mvo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return v;
}

public Vector<MovieTimeVO> SelectOneMovieTime(int num,String date)
{
	Vector<MovieTimeVO> v=new Vector<MovieTimeVO>();
	getcon();
	
	try {
		
		String sql="select * from movietime where num =? and moviedate =? order by movietimenum asc";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, date);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MovieTimeVO mvo = new MovieTimeVO();
			mvo.setNum(rs.getInt(1));
			mvo.setDate(rs.getString(2));
			mvo.setTime(rs.getString(3));
			mvo.setDateNum(rs.getInt(4));
			mvo.setTimeNum(rs.getInt(5));
			v.add(mvo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return v;
}

public void DeleteOneMovie(int num)
{
	getcon();
	
	try
	{
		String sql="delete from movie where num =?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}

public void DeleteMovieTime(MovieTimeVO movie)
{
	getcon();
	
	try
	{
		String sql="delete from movietime where num = ? and moviedate = ? and movietime = ? ";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, movie.getNum());
		pstmt.setString(2, movie.getDate());
		pstmt.setString(3, movie.getTime());
		
		pstmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}

public Vector<MovieTimeVO> SelectOneDateAllMovieNum(String date)
{
	Vector<MovieTimeVO> v=new Vector<MovieTimeVO>();
	getcon();
	
	try {
		
		String sql="select distinct num from movietime where moviedate = ? order by num asc";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, date);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MovieTimeVO mvo = new MovieTimeVO();
			mvo.setNum(rs.getInt(1));
			v.add(mvo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return v;
}

public Vector<MovieVO> SelectOneMovieName(int num)
{
	Vector<MovieVO> v=new Vector<MovieVO>();
	getcon();
	
	try {
		
		String sql="select name,rate from movie where num =? order by num asc";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MovieVO mvo = new MovieVO();
			mvo.setMovieName(rs.getString(1));
			mvo.setFilmRate(rs.getInt(2));
			v.add(mvo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return v;
}

public Vector<MovieTimeVO> SelectAllDate()
{
	Vector<MovieTimeVO> v=new Vector<MovieTimeVO>();
	getcon();
	
	try {
		
		String sql="select DISTINCT moviedate  from movietime order by moviedate asc";
		
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			MovieTimeVO mvo = new MovieTimeVO();
			mvo.setDate(rs.getString(1));
			v.add(mvo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return v;
	
}

public void insertMovieTimeSeat(MovieTimeSeatVO movie) {
	
	
	try {
		getcon();
		
		String sql="insert into movieTimeseat values(?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, movie.getId());
		pstmt.setString(2, movie.getMovieName());
		pstmt.setString(3,movie.getMovieDate());
		pstmt.setString(4, movie.getMovieTime());
		pstmt.setString(5, movie.getSeatNum());

		
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

	
}