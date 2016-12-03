package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.service.CourseService;

@Controller
public class CourseController {
	private CourseService courseService;
	
	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	// 학기별 학점 
	@RequestMapping("/semestercredit")
	public String showSemesterCredit (Model model) {
		List<Course> courses = courseService.getSemesterCredit();
		model.addAttribute("course", courses);
		return "semestercredit";
	}
	
	// 이수학점 조회 
	@RequestMapping("/searchcredit")
	public String showSearchCredit (Model model){
		List<Course> courses = courseService.getSearchCredit();
		model.addAttribute("course", courses);
		return "searchcredit";
	}
	// 수강신청 
	@RequestMapping("/addcourse")
	public String showAddCourse (Model model){
		model.addAttribute("course", new Course());
		return "addcourse";
		
	}
	// valid addCourse
	@RequestMapping("/validcourse")
	public String showValidCourse (Model model, @Valid Course course, BindingResult result){
		
		if (result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			
			for (ObjectError error:errors){
				System.out.println(error.getDefaultMessage());
			}
			return "addcourse";
		}
		//추가
		if (courseService.insertCourse(course)) {
			return "searchcourse";
		}
		// 에러일경우 
		else {
			return "dberror";
		}
	}

	// 링크 
	@RequestMapping("/semestercreditlink")
	public String semestercreditlink (Model model, Course course){
		List<Course> courses = courseService.getSemesterCreditLink(course);
		model.addAttribute("course", courses);
		return "semestercreditlink";
	}
	
	// 신청조회 
	@RequestMapping("/searchcourse")
	public String showSearchCourse (Model model){
		List<Course> courses = courseService.getSearchCourse();
		model.addAttribute("course", courses);
		return "searchcourse";
	}
	
}
