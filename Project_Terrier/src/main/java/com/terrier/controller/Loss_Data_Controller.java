package com.terrier.controller;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.L_mgt_controller_VO;
import com.terrier.domain.L_mgt_lf_data_VO;
import com.terrier.domain.L_mgt_lf_log_VO;
import com.terrier.domain.Reply_VO;
import com.terrier.domain.User_VO;
import com.terrier.service.GpsToAddress;
import com.terrier.service.L_mgt_Service;
import com.terrier.websocket.L_mgt_socketHandler;

@RestController
@RequestMapping("terrier/*")
public class Loss_Data_Controller {
	
	@Inject
	L_mgt_Service l_mgt_service;
	
	@Inject
	GpsToAddress gps;
	
	@Inject
	L_mgt_socketHandler l_mgt_handler;
	
	@RequestMapping(value="loss_management/controll_view",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> controll_view(@RequestParam("emp_num") String emp_num) throws Exception
	{
		ResponseEntity<Map<String, Object>> response = null; 
		try {
			L_mgt_controller_VO c_vo = l_mgt_service.info(emp_num);
			System.out.println(c_vo);
			
			C_mgt_Gps_VO g_vo = gps.getGps_Adress(emp_num,0);
			System.out.println(g_vo);
			
			Map<String,Object> vo = new HashMap<String,Object>();
			vo.put("c_vo", c_vo);
			vo.put("g_vo", g_vo);
			
			response = new ResponseEntity<Map<String,Object>>(vo,HttpStatus.OK);
		}
		catch(Exception e) {
			
			Map<String,Object> test_vo = new HashMap<String,Object>();
			test_vo.put("test", "test");
			
			response = new ResponseEntity<Map<String,Object>>(test_vo,HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/mdm_to_web",method=RequestMethod.POST)
	public ResponseEntity<String> mdm_to_web(@RequestParam("data") String data) throws Exception
	{
		System.out.println(data);
		
		String send_data = "";
		String d1[] = data.split(",");
		send_data += d1[2] + "-";
		send_data += d1[0] + "-";
		send_data += d1[1].replaceAll("\\D", "");;
		
		l_mgt_handler.sendMessage(send_data);
		
		ResponseEntity<String> response = null; 
		try {
			response = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/dynamic_html",method=RequestMethod.GET)
	public ResponseEntity<Employee_VO> dynamic_html(@RequestParam("emp_num") String emp_num) throws Exception
	{
		ResponseEntity<Employee_VO> response = null; 
		
		Employee_VO vo = l_mgt_service.emp_dynamic(emp_num);
		try {
			response = new ResponseEntity<Employee_VO>(vo,HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<Employee_VO>(vo,HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/unlock",method=RequestMethod.GET)
	public ResponseEntity<String> unlock(@RequestParam("emp_num") String emp_num) throws Exception
	{
		ResponseEntity<String> response = null; 
		
		l_mgt_service.l_unlock(emp_num);
		try {
			response = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<String>("BAD",HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/lf_controll_view",method=RequestMethod.GET)
	public ResponseEntity<L_mgt_lf_data_VO> lf_controll_view(@RequestParam("emp_num") String emp_num) throws Exception
	{
		ResponseEntity<L_mgt_lf_data_VO> response = null; 
		
		String l_lf_date = l_mgt_service.l_lf_date(emp_num);
		List<L_mgt_lf_log_VO> l_lf_log = l_mgt_service.l_lf_log(l_lf_date, emp_num);
		String l_lf_numval = l_mgt_service.l_camera_auth(emp_num);
		
		L_mgt_lf_data_VO vo = new L_mgt_lf_data_VO();
		vo.setDate(l_lf_date);
		vo.setLog_vo(l_lf_log);
		vo.setNum_val(l_lf_numval);
		
		try {
			response = new ResponseEntity<L_mgt_lf_data_VO>(vo,HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<L_mgt_lf_data_VO>(vo,HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/loss_check",method=RequestMethod.GET)
	public ResponseEntity<String> loss_check(@RequestParam("bno") String bno) throws Exception
	{
		ResponseEntity<String> response = null; 
		
		l_mgt_service.l_loss_check(bno);
		try {
			response = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<String>("BAD",HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
}
