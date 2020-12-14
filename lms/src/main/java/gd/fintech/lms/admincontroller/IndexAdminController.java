package gd.fintech.lms.admincontroller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.adminservice.IndexAdminService;
import gd.fintech.lms.vo.ManagerQueue;

@Controller
public class IndexAdminController {

	@Autowired IndexAdminService indexAdminService;
		// 운영자 승인 대기 리스트 출력
		@GetMapping(value = {"/admin/index"})
		public String index(Model model) {
			// 승인대기 중인 운영자 전체 리스트 출력
			List<ManagerQueue> managerQueueList = indexAdminService.getManagerQueueList();
			model.addAttribute("managerQueueList",managerQueueList);
			return "admin/index";
		}
		// 운영자 승인
		@GetMapping("/admin/approved/{managerId}")
		public String allow(@PathVariable(name="managerId") String managerId) {
			//승인하려는 운영자 정보 가져오기
			ManagerQueue managerQueue = indexAdminService.getManagerQueueOne(managerId);
			if(managerQueue != null) {
				indexAdminService.addManagerInformation(managerQueue);
				indexAdminService.removeManagerQueue(managerId);
				return "redirect:/admin/index";
			}else {
				return "redirect:/admin/index";
			}
		}
		// 운영자 승인 거부
		@GetMapping("/admin/disavowal/{managerId}")
		public String disavowal(@PathVariable(name="managerId") String managerId) {
			indexAdminService.removeManagerQueue(managerId);
			return "redirect:/admin/index";
		}
}
