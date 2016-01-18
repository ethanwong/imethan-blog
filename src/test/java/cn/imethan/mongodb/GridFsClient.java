package cn.imethan.mongodb;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsOperations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSFile;

/**
 * GridFsClient.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2016年1月18日下午3:03:02
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/main/applicationContext.xml", "classpath:/mongodb/applicationContext-mongodb.xml" })
public class GridFsClient {
	
	@Autowired
	private GridFsOperations gridFsOperations;
	
	/**
	 * 保存测试
	 * 
	 * @author Ethan Wong
	 * @datetime 2016年1月18日下午3:51:28
	 */
	@Test
	public void storeFileToGridFs() {
		DBObject metaData = new BasicDBObject();
		metaData.put("extra1", "anything 1");
		metaData.put("extra2", "anything 2");
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream("C:/Users/ETHAN/Pictures/e.png");
			GridFSFile gridFSFile = gridFsOperations.store(inputStream, "e.png", "image/png", metaData);
			System.out.println("gridFSFile:"+gridFSFile.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("Done");
	}
	
	/**
	 * 读取测试
	 * 
	 * @author Ethan Wong
	 * @datetime 2016年1月18日下午3:51:28
	 */
	@Test
	public void findFilesInGridFs() {
		List<GridFSDBFile> result = gridFsOperations.find(new Query().addCriteria(Criteria.where("filename").is("e.png")));
		for (GridFSDBFile file : result) {
			try {
				System.out.println(file.getFilename());
				System.out.println(file.getContentType());
				//save as another image
				file.writeTo("C:/Users/ETHAN/Pictures/e1.png");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Done");
	}
}
