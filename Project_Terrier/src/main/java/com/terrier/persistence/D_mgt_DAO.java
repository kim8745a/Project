package com.terrier.persistence;

import java.util.List;

import com.terrier.domain.C_mgt_AppList_VO;
import com.terrier.domain.C_mgt_AppLog_VO;
import com.terrier.domain.C_mgt_ControlLog_VO;
import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.C_mgt_controller_VO;
import com.terrier.domain.C_mgt_userinfo_VO;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.Location_emp_num_VO;

public interface D_mgt_DAO {
	public List<Employee_VO> emp_list()throws Exception;//사원 리스트
	public List<Employee_VO> emp_search_list(Employee_VO vo)throws Exception;//사원 검색 리스트
	public C_mgt_userinfo_VO info(String emp_num) throws Exception;//c_mgt에 출력할 사용자 정보
	public C_mgt_controller_VO controller(String emp_num)throws Exception;//c_mgt에 제어확인
	public List<C_mgt_AppList_VO> applist(String emp_num)throws Exception;//어플리스트 출력
	public List<C_mgt_AppLog_VO> applog(String emp_num)throws Exception;//어플리케이션 로그출력
	public C_mgt_Gps_VO gps(Location_emp_num_VO vo)throws Exception;
	public List<C_mgt_ControlLog_VO> controllog(String emp_num) throws Exception; //c_mgt 제어로그
}
