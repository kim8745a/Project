package com.terrier.service;

import java.util.List;

import com.terrier.domain.C_mgt_AppList_VO;
import com.terrier.domain.C_mgt_AppLog_VO;
import com.terrier.domain.C_mgt_ControlLog_VO;
import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.C_mgt_controller_VO;
import com.terrier.domain.C_mgt_userinfo_VO;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.Location_emp_num_VO;

public interface D_mgt_Service {
	public List<Employee_VO> emp_list()throws Exception; // 단말 관리 - 사원 리스트 출력
	public List<Employee_VO> emp_search_list(Employee_VO vo)throws Exception; // 단말 관리 - 사원 검색
	public C_mgt_userinfo_VO info(String e_num)throws Exception;//c_mgt 사용자정보 출력
	public C_mgt_controller_VO controller(String e_num)throws Exception;//c_mgt 컨트롤제어
	public List<C_mgt_AppList_VO> applist(String e_num)throws Exception;//c_mgt 어플리스크
	public List<C_mgt_AppLog_VO> applog(String emp_num) throws Exception;//c_mgt 어플로그
	public C_mgt_Gps_VO gps(Location_emp_num_VO vo)throws Exception;//사용자 위치정보
	public List<C_mgt_ControlLog_VO> controllog(String e_num) throws Exception; //c_mgt 제어로그
}
