package com.terrier.persistence;

import java.util.Date;
import java.util.List;

import com.terrier.domain.Control_count_VO;
import com.terrier.domain.Dep_ctl_status_VO;
import com.terrier.domain.S_mgt_date_con_count_VO;
import com.terrier.domain.S_mgt_dep_date_con_count_VO;
import com.terrier.domain.S_mgt_emp_date_con_count_VO;
import com.terrier.domain.S_mgt_fi_count_VO;

public interface S_mgt_DAO {
	public Control_count_VO control_count(String status);
	public int dep_ctl_on_count(String department);
	public Control_count_VO dep_ctl_status(Dep_ctl_status_VO vo);
	public String nowDate()throws Exception;//날짜별 데이터 뽑을때 현재날짜 출력
	public Control_count_VO date_count_on_off(S_mgt_date_con_count_VO vo)throws Exception;//날짜값 전해주면 ON 카운트세기
	public Control_count_VO dep_date_conunt(S_mgt_dep_date_con_count_VO vo)throws Exception;//부서 날짜 값 전달해주면
	public Control_count_VO emp_date_conunt(S_mgt_emp_date_con_count_VO vo)throws Exception;//사번 날짜 값 전달
	public int fi_total(S_mgt_fi_count_VO vo)throws Exception;//파이그래프 부서별 이용률 계산

}
