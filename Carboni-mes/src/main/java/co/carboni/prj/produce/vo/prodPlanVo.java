package co.carboni.prj.produce.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class prodPlanVo {
	
	// 생산계획
	public String ppnum; // 생산계획번호
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	public Date ppdate; // 생산계획일자
	public String ppname; // 생산계획명
	public String ppstatus; // 계획상태
	public String ppnote; // 비고
	
	// 생산계획상세
	public String ppdnum; // 생산계획상세번호
	public int ppdam; // 기계획량
	public int uplam; // 미계획량
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	public Date ppddate; // 작업일자
	
	
}
