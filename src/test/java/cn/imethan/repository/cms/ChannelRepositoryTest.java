package cn.imethan.repository.cms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.imethan.repository.jpa.cms.ChannelRepository;

/**
 * ChannelRepositoryTest.java
 *
 * @author suncco
 * @time 2014年3月12日下午2:39:27
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ChannelRepositoryTest {
	
	@Autowired
	private ChannelRepository channelRepository;
	
	@Test
	public void test(){
		
	}
	
	

}


