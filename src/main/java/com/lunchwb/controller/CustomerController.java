package com.lunchwb.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lunchwb.service.FaqService;
import com.lunchwb.service.InquiryService;
import com.lunchwb.vo.InquiryVo;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	@Autowired
	private FaqService faqService;
	@Autowired
	private InquiryService inquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	// ============================================ FAQ 폼 ============================================
	@GetMapping("/faq")
	public String faqForm(Model model) {
		logger.info("CustomerController > faqForm()");
		
		Map<String,Object> fMap = faqService.divFaqList();
		logger.info(fMap.toString());
		
		
		model.addAttribute("fMap",fMap);
		
		return "customer/FAQ";
	};
	
	@GetMapping("/manageFaq")
	public String manageFaqForm(Model model) {
		logger.info("CustomerController > manageFaqForm()");
		
		Map<String,Object> fMap = faqService.divFaqList();
		logger.info(fMap.toString());
		
		
		model.addAttribute("fMap",fMap);
		
		
		
		return "customer/manageFAQ";
	};
	
	
	
	
	
	// ============================================ 문의작성 폼 ============================================
	@GetMapping("/writeInquiry")
	public String writeInquiryForm() {
		logger.info("CustomerController > writeInquiryForm");
		
		
		return "customer/writeInquiry";
	};
	
	@PostMapping("/writeInquiry")
	public String writeInquiry(@ModelAttribute InquiryVo inqVo) {
		logger.info("CustomerController > writeInquiry");
		
		logger.info(inqVo.toString());
		
		int count = inquiryService.writeInquiry(inqVo);
		logger.info(count + "건 문의성공하였습니다.");
		
		
		
		
		return "redirect:/customer/reviewReport/"+inqVo.getUserNo();
	};
	
	// ============================================ 문의내역 폼 ============================================
	@GetMapping("/reviewReport/{userNo}")
	public String reviewReportForm(@PathVariable("userNo") int userNo, Model model) {
		logger.info("CustomerController > reviewReportForm()");
		List<InquiryVo> inqList= inquiryService.userInqList(userNo);
		
		logger.info(inqList.toString());
		
		model.addAttribute("inqList", inqList);
		
		return "customer/reviewReport";
	};
	
	@PostMapping("/reviewReport")
	public String reviewSearch() {
		logger.info("CustomerController > reviewSearch()");
		
		
		return "customer/reviewReport";
	};
	
	// ============================================ 문의상세보기 폼 ============================================
	@RequestMapping(value = "/readInquiry", method= {RequestMethod.GET,RequestMethod.POST})
	public String readInquiryForm() {
		logger.info("CustomerController > readInquiryForm");
		
		
		return "customer/readInquiry";
	};

}
