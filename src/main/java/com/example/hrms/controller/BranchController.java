package com.example.hrms.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.hrms.entity.Branch;
import com.example.hrms.service.BranchService;

@Controller
public class BranchController {
	@Autowired
	private BranchService bs;
	
	@GetMapping("/branch")
	public ModelAndView home()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("branch");
		List<Branch> branches = bs.read();
		mv.addObject("branches", branches);
		mv.addObject("branch", new Branch());
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/branch", params = "add")
	public ModelAndView create(@Valid Branch branch, BindingResult br) {
		if(br.hasErrors())
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("branch");
			List<Branch> branches = bs.read();
			mv.addObject("branches", branches);
			mv.addObject("branch", branch);
			return mv;
		}
		bs.create(branch);
		return home();
	}
	
	

	@GetMapping("/branch/{bid}")
	public ModelAndView read(@PathVariable("bid") String bid) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("branch");
		Branch branch = bs.read(bid);
		List<Branch> branches = bs.read();
		mv.addObject("branches", branches);
		mv.addObject("branch", branch);
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/branch", params = "update")
	public ModelAndView update(Branch branch) {
		bs.update(branch);
		return home();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/branch", params = "delete")
	public ModelAndView delete(String bid) {
		bs.delete(bid);
		return home();
	}
	
}
