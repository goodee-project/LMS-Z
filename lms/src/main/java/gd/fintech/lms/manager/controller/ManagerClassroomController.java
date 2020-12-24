package gd.fintech.lms.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerClassroomService;
import gd.fintech.lms.vo.Classroom;

@Controller
public class ManagerClassroomController {
	@Autowired ManagerClassroomService managerClassroomService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//강의실 리스트 출력
	@GetMapping("/manager/classroomList/{currentPage}")
	public String classroomList(Model model,
				@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 2;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/(rowPerPage+1))*rowPerPage)+1;
		List<Classroom> classroomList = managerClassroomService.getClassroomList(beginRow, rowPerPage);
		int totalPage = managerClassroomService.getClassroomTotalCount();
		// 마지막 페이지
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("classroomList",classroomList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lastPage",lastPage);
		return "/manager/classroomList";
	}
	//강의실 추가 폼
	@GetMapping("/manager/insertClassroom")
	public String insertClassroom() {
		return "/manager/insertClassroom";
	}
	//강의실 추가 액션
	@PostMapping("/manager/insertClassroomAction")
	public String insertClassroomAction(Classroom classroom) {
		logger.debug("classroom : "+classroom.toString());
		managerClassroomService.insertClassroom(classroom);
		return "redirect:/manager/classroomList/1";
	}
	//강의실 삭제
	@GetMapping("/manager/deleteClassroom/{classroomNo}/{currentPage}")
	public String deleteClassroom(@PathVariable(value="classroomNo") int classroomNo,
			@PathVariable(name="currentPage") int currentPage) {
		managerClassroomService.deleteClassroom(classroomNo);
		return "redirect:/manager/classroomList/"+currentPage;
	}
}
