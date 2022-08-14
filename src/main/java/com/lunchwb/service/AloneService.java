package com.lunchwb.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.AloneDao;

@Service
public class AloneService {
	
	@Autowired
	private AloneDao aloneDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AloneService.class);
	
	
	
	

}
