package com.terrier.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.terrier.domain.Control_count_VO;
import com.terrier.domain.S_mgt_date_con_count_VO;
import com.terrier.domain.S_mgt_depTotal;
import com.terrier.domain.S_mgt_dep_date_con_count_VO;
import com.terrier.domain.S_mgt_emp_date_con_count_VO;
import com.terrier.domain.S_mgt_fi_count_VO;
import com.terrier.service.S_mgt_Service;

@RestController
@RequestMapping("terrier/*")
public class Statistics_Data {
	
	@Inject
	S_mgt_Service s_mgt_service;
	
	@RequestMapping(value="statistics_management/dateSerach_on_off",method=RequestMethod.POST)//날짜 통계
	public ResponseEntity<Control_count_VO> dateSerach_on_off(@RequestBody S_mgt_date_con_count_VO vo) throws Exception
	{//해당 메소드는 2번움직인다 ajax를 2번하기떄문에measurement_mgt 스크립트 확인해보면 알수있음
		Control_count_VO on_off=s_mgt_service.date_count_on_off(vo);//on에 대한 정보를 뽑기위해서			
		ResponseEntity<Control_count_VO> entity=null;
		try 
		{
			entity=new ResponseEntity<Control_count_VO>(on_off,HttpStatus.OK);
		}
		catch (Exception e)
		{
			entity=new ResponseEntity<Control_count_VO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="statistics_management/emp_dateSerach_on_off",method=RequestMethod.POST)//날짜 통계
	public ResponseEntity<Control_count_VO> emp_dateSerach_on_off(@RequestBody S_mgt_emp_date_con_count_VO vo) throws Exception
	{
		Control_count_VO on_off=s_mgt_service.emp_date_conunt(vo);//on에 대한 정보를 뽑기위해서			
		ResponseEntity<Control_count_VO> entity=null;
		try 
		{
			entity=new ResponseEntity<Control_count_VO>(on_off,HttpStatus.OK);
		}
		catch (Exception e)
		{
			entity=new ResponseEntity<Control_count_VO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="statistics_management/fi_total_off",method=RequestMethod.POST)//파이 1번쨰 통계
	public ResponseEntity<S_mgt_depTotal> fi_total(@RequestBody S_mgt_fi_count_VO vo) throws Exception
	{
		S_mgt_fi_count_VO vo1=new S_mgt_fi_count_VO();
		vo1.setController("OFF");
		vo1.setDep("기술");		
		int total_vo1=s_mgt_service.fi_total(vo1);//기술 off 카운터
		
		S_mgt_fi_count_VO vo2=new S_mgt_fi_count_VO();
		vo2.setController("OFF");
		vo2.setDep("총무");		
		int total_vo2=s_mgt_service.fi_total(vo2);//총무 off 카운터
		
		S_mgt_fi_count_VO vo3=new S_mgt_fi_count_VO();
		vo3.setController("OFF");
		vo3.setDep("생산");		
		int total_vo3=s_mgt_service.fi_total(vo3);//생산 off 카운터
		
		S_mgt_fi_count_VO vo4=new S_mgt_fi_count_VO();
		vo4.setController("OFF");
		vo4.setDep("인사");		
		int total_vo4=s_mgt_service.fi_total(vo4);//인사 off 카운터
		
/*		int to1;//기술
		int to2;//총무
		int to3;//생산
		int to4;//인사
*/		
		S_mgt_depTotal total=new S_mgt_depTotal();
		total.setTo1(total_vo1);
		total.setTo2(total_vo2);
		total.setTo3(total_vo3);
		total.setTo4(total_vo4);		
		System.out.println(total.getTo1());
		System.out.println(total.getTo2());
		System.out.println(total.getTo3());
		System.out.println(total.getTo4());
		
		
		ResponseEntity<S_mgt_depTotal> entity=null;
		try 
		{
			entity=new ResponseEntity<S_mgt_depTotal>(total,HttpStatus.OK);
		}
		catch (Exception e)
		{
			entity=new ResponseEntity<S_mgt_depTotal>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	@RequestMapping(value="statistics_management/dep_dateSerach_on_off",method=RequestMethod.POST)//부서,날짜 통계
	public ResponseEntity<Control_count_VO> dep_dateSerach_on_off(@RequestBody S_mgt_dep_date_con_count_VO vo) throws Exception
	{//해당 메소드는 2번움직인다 ajax를 2번하기떄문에measurement_mgt 스크립트 확인해보면 알수있음
		Control_count_VO on_off=s_mgt_service.dep_date_conunt(vo);//on에 대한 정보를 뽑기위해서			
		ResponseEntity<Control_count_VO> entity=null;
		try 
		{
			entity=new ResponseEntity<Control_count_VO>(on_off,HttpStatus.OK);
		}
		catch (Exception e)
		{
			entity=new ResponseEntity<Control_count_VO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	/*		private int wifi;
  	private int bluetooth;
  	private int tethering;
  	private int camera;
  	private int voiceRecord;*/


}
