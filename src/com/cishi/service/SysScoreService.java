package com.cishi.service;

import com.cishi.beans.SysScore;

public interface SysScoreService {

	int addScore(SysScore sysScore);
	int addScore(String userId,Double score,String rateUserId);

	int addOrderScore(String userId,Double score,String orderId);
	
	Double loadScore(String userId);
}
