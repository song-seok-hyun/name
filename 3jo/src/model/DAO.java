package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class DAO {
	String id="scott";
	String pwd="tiger";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	
	private static DAO instance=new DAO();
	public static DAO getInstance() {
		
		return instance;
	}
	
	
	Connection getConnection() {
		Connection conn=null;
		Context initContext;
		
		try {
			initContext=new InitialContext();
			DataSource ds=(DataSource)initContext.lookup("java:/comp/env/jdbc/Oracle11g");
			conn=ds.getConnection();
		}catch(NamingException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void insertMember(VO member) {
		String sql="insert into moviemember values(?,?,?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getAge());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getAdmin());
			
			System.out.println("updateCount="+pstmt.executeUpdate());
			
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
	
	public int userCheck(String userid,String pwd) {
		int result=1;
		Connection conn=null;
		String sql="select * from moviemember where id=?";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs=pstmt.executeQuery();
					
			if(rs.next()) {
				// 비밀번호가 일치하면
				if(pwd.equals(rs.getString("pass"))) {
						result=1; //  로그인 성공
				}else { // 비밀번호 불일치 로그인 실패
					result=0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public VO getMember(String id) {
		VO member=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from moviemember where id=?";
	
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new VO();
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setAge(rs.getString("age"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setAdmin(rs.getString("admin"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return member;
	}
	
	
	
	public void getcon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url,id,pwd);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public VO oneSelectMember(String id) {
		VO member=new VO();
		
		try {
			getcon();
			
			String sql="select * from moviemember where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPass(rs.getString(2));
				member.setAge(rs.getString(3));
				member.setName(rs.getString(4));
				member.setTel(rs.getString(5));
				member.setEmail(rs.getString(6));
				member.setAdmin(rs.getString(7));
				
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	public void updateMember(VO bean) {
		getcon();
		try {
			String sql="update moviemember set email=?,tel=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			
			pstmt.executeUpdate();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public String getPass(String id) {
		String pass1="";
		try {
			getcon();//db연결
			String sql="select pass from moviemember where id=?"; //id값으로 pass찾기
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				pass1=rs.getString(1);
			}
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return pass1;
	}
	
	public void deleteMember(String id) {
		getcon();
		try {
	
			String sql="delete from moviemember where id=?"; //id값으로 pass찾기
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public boolean changePassword(String id, String passwd1) {

		boolean flag = false;
		String sql = "update moviemember set pass=? WHERE id=?"; 

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, passwd1);
			pstmt.setString(2, id);

			int i = pstmt.executeUpdate();

			if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		/*
		 * finally { JdbcUtil.close(conn); JdbcUtil.close(pstmt); }
		 */
		return flag;
	}
	
	public int confirmID(String id) {
		int result=-1;
		String sql="select id from moviemember where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			}else {
				result=-1; 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;		
	}
	
	public int search_confirmID(String name, String email) {
		int result=-1;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from moviemember where name=? and email=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			}else {
				result=-1; 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;		
	}
	
	public VO getId(String name, String email) {		
		VO member=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from moviemember where name=? and email=?";
	
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new VO();
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setAge(rs.getString("age"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setAdmin(rs.getString("admin"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return member;
	}
	public int search_confirmPW(String id, String email) {
		int result=-1;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from moviemember where id=? and email=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			}else {
				result=-1; 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;		
	}
	
	public String getPw_tem(String id) {
		getcon();

		String sql="update moviemember set pass=? where id=?";
		
		Random ran =new Random();
		
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<6; i++) {
			if(ran.nextBoolean()) {
				buffer.append(((int)(ran.nextInt(10))));
			}else {
				buffer.append((char)((int)(Math.random()*26)+65));	
			}
		}
						
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, buffer.toString());
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return buffer.toString();
	}
	
	
	
}
