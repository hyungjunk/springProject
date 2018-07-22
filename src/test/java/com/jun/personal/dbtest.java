package com.jun.personal;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jun.service.MovBoardServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class dbtest {

	@Inject
	private SqlSessionFactory session;
	
	@Inject
	private MovBoardServiceImpl service;
	
	@Test
	public void test() throws Exception {
		System.out.println(service.read(1));
	}
	
}
