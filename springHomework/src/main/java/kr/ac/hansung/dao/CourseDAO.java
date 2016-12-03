package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Course;

@Repository
public class CourseDAO {

	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	// 이수 학점 조회	
	public List<Course> getsemestercredit(){
		String sqlStatement = "select year, term, sum(credit) as credit from courses group by year, term";
		return jdbcTemplateObject.query(sqlStatement, new RowMapper<Course>() {
		    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
			      Course course = new Course();
			      course.setYear(rs.getInt("year"));
				  course.setTerm(rs.getInt("term"));
				  course.setCredit(rs.getInt("credit"));
			      return course;
			    }
			  });
	}
	
	
	// 이수 학점 상세보기
		public List<Course> getsemestercreditlink(Course course){
			int year = course.getYear();
			int term = course.getTerm();
			
			String sqlStatement = "select year, term, subject, credit as credit from courses where year="+year+" and term ="+ term;
			return jdbcTemplateObject.query(sqlStatement, new RowMapper<Course>() {
			    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
			      Course course = new Course();
			      course.setYear(rs.getInt("year"));
				  course.setTerm(rs.getInt("term"));
				  course.setSubject(rs.getString("subject"));
				  course.setCredit(rs.getInt("credit"));
			      return course;
			    }
			  });
		}
	
	
	// 이수 구분별 학점내역
	public List<Course> getsearchcredit(){
		String sqlStatement = "select separation, sum(credit) as credit from courses as sumcredit group by separation";
		return jdbcTemplateObject.query(sqlStatement, new RowMapper<Course>() {
		    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		      Course course = new Course();
			  course.setSeparation(rs.getString("separation"));
			  course.setCredit(rs.getInt("credit"));
		      return course;
		    }
		  });
	}

	// 수강 신청
	public Boolean insertCourse(Course course){
		String subjectCode = course.getSubjectCode();
		String sqlStatement = "update applyCourse set isApply = 1 where subjectCode = ?";
		return (jdbcTemplateObject.update(sqlStatement, new Object[] {subjectCode}) == 1);
	}
	
	// 수강내역 조회 
	public List<Course> searhCourse(){
		String sqlStatement = "select year, term, subject, separation, credit from applyCourse where isApply = 1";
		return jdbcTemplateObject.query(sqlStatement, new RowMapper<Course>() {
		    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		      Course course = new Course();
		      course.setYear(rs.getInt("year"));
			  course.setTerm(rs.getInt("term"));
			  course.setSubject(rs.getString("subject"));
			  course.setSeparation(rs.getString("separation"));
			  course.setCredit(rs.getInt("credit"));
		      return course;
		    }
		  });
	}

	// 레코드 읽어서 오브젝트에 저장하기(데이터 하나)
	public Course getcourse(String name) {
		String sqlStatement = "select year, term, from courses where name =?";
		return jdbcTemplateObject.queryForObject(sqlStatement, new Object[] { name }, new CourseMapper());
	}
	
	
	// 레코드 읽어서 오브젝트에 저장하기(multiple)
	public List<Course> getcourses() {
		String sqlStatement = "select * from courses";
		return jdbcTemplateObject.query(sqlStatement, new CourseMapper());
	}

	public boolean delete(int id){
		String sqlStatement = "delete from courses where id = ?";		
		return (jdbcTemplateObject.update(sqlStatement, new Object[]{id})==1);
	}
}
