package com.cishi.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cishi.beans.SysScore;
import com.cishi.dao.SysScoreMapper;
import com.cishi.service.SysScoreService;
import com.cishi.util.TokenGenerator;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.HeaderTokenizer.Token;

@Service("sysScoreService")
public class SysScoreServiceImpl extends BaseServiceImpl implements SysScoreService{

	@Resource
	public SysScoreMapper sysScoreMapper;
	
	@Override
	public int addScore(SysScore sysScore) {
		return sysScoreMapper.insertSelective(sysScore);
	}

	
	@Override
	public int addScore(String userId, Double score, String rateUserId) {
		SysScore sysScore = new SysScore();
		sysScore.setScore(score);
		sysScore.setUserId(userId);
		sysScore.setRaterUserId(rateUserId);
		return this.addScore(sysScore);
	}


	@Override
	public int addOrderScore(String userId, Double score, String orderId) {
		SysScore sysScore = new SysScore();
		sysScore.setId(TokenGenerator.generateKey());
		sysScore.setTaskId(orderId);
		sysScore.setUserId(userId);
		sysScore.setScore(score);
		return this.addScore(sysScore);
	}


	@Override
	public Double loadScore(String userId) {
		/*SysScoreExample se = new SysScoreExample();
		SysScoreExample.Criteria criteria = se.createCriteria();
		criteria.andDelFlagEqualTo((byte)0);
		criteria.andUserIdEqualTo(userId);
		List<SysScore> sysScoreList = sysScoreMapper.selectByExample(se);*/
		String sql = "select avg(score) avg from sys_score where del_flag=0 and user_id='"+userId+"'";
		List<Double> list = jdbcTemplate.query(sql, new RowMapper<Double>() {

			@Override
			public Double mapRow(ResultSet arg0, int arg1) throws SQLException {
				Double avg = arg0.getDouble("avg");
				return avg;
			}
		});
		if(list==null && list.size()==0){
			return (double)0;
		}
		return list.get(0);
	}

}
