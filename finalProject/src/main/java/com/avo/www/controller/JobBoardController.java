package com.avo.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.context.annotation.Configuration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.avo.www.domain.ProductBoardVO;
import com.avo.www.service.JobBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@RequestMapping("/job/*")
public class JobBoardController {
   @Inject
   private JobBoardService jbsv;
   
//   @GetMapping("/list")
//   public void getList() {
//      log.info(">>>>> job list page >> ");
//   }

   @GetMapping("/list")
   public String getList(Model m, ProductBoardVO pbvo) {
	   log.info(">>>>> job list page >> ");
	   List<ProductBoardVO> list = jbsv.getList();
	   m.addAttribute("list",list);
	   
	   return ("/job/list");
   }
   
   @GetMapping("/register")
   public void getRegister() {
	   log.info(">>>>> job register page >> ");
   }
   
   @PostMapping("/register")
   public String postRegister(ProductBoardVO pbvo, RedirectAttributes re) {
	   log.info(">>>>> job postRegister page >> ");
	   
	   int isOk = jbsv.post(pbvo);
	   log.info(">>>>> board register >>" + (isOk > 0 ? "OK" : "FAIL"));
	   return "redirect:/job/list";
   }
   
	@GetMapping({ "/detail", "/modify" })
	public void detail(Model model, @RequestParam("proBno")long pbno) {
		log.info("pbno >> " + pbno);
//		String으로 지정하지 않고 void로 설정 시 알아서 detail이나 modify중 진입 경로대로 감
		log.info(">>>>> job get detail or modify page >> ");
		// 파일 내용도 포함해서 같이 가져가야 함
		ProductBoardVO pbvo = jbsv.getDetail(pbno);
		model.addAttribute("pbvo", pbvo);
		
	}
	
   
   

}