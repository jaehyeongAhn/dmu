package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuSearchVO;
import com.museum.vo.DmuTicketVO;

@Repository
public class DmuSearchDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//검색 결과
	public ArrayList<DmuTicketVO> search(String keyword, String dpage){
		/*ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
		String sql = "SELECT DID, DPLACE, DTITLE, TO_CHAR(DSTART, 'YYYY-MM-DD'), TO_CHAR(DEND, 'YYYY-MM-DD'), "
				+ " DFILE, DSFILE, DCODE, DTIME, DPRICE, DTARGET, DNUM "
				+ " FROM DMU_TICKET WHERE DTITLE LIKE '%' || ? || '%'";
		if(!dpage.equals("all")) {
			sql += " AND DCODE = ?";
		}
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, keyword);
			if(!dpage.equals("all")) {
				pstmt.setString(2, dpage);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DmuTicketVO vo = new DmuTicketVO();
				
				vo.setDid(rs.getString(1));
				vo.setDplace(rs.getString(2));
				vo.setDtitle(rs.getString(3));
				vo.setDstart(rs.getString(4));
				vo.setDend(rs.getString(5));
				vo.setDfile(rs.getString(6));
				vo.setDsfile(rs.getString(7));
				vo.setDcode(rs.getString(8));
				vo.setDtime(rs.getString(9));
				vo.setDprice(rs.getString(10));
				vo.setDtarget(rs.getString(11));
				vo.setDnum(rs.getInt(12));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;*/

		Map<String, String> param = new HashMap<String, String>();
		param.put("keyword", keyword);
		param.put("dpage", dpage);
		
		List<DmuTicketVO> list = sqlSession.selectList("mapper.search.search", param);
		return (ArrayList<DmuTicketVO>)list; 
	}
	
	
	//전체 수
	public DmuSearchVO totalCount(String keyword) {
		return sqlSession.selectOne("mapper.search.totalcount", keyword);
	}
}
