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
		metaData.put("name", "IMG_8586.JPG");
		metaData.put("describe", "This is a picture named IMG_8586.JPG .");
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream("D:/IMG_8586.JPG");
			GridFSFile gridFSFile = gridFsOperations.store(inputStream, "IMG_8586.JPG", "image/jpg", metaData);
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
		List<GridFSDBFile> result = gridFsOperations.find(new Query().addCriteria(Criteria.where("filename").is("IMG_8586.JPG")));
		for (GridFSDBFile file : result) {
			try {
				DBObject bBObject = file.getMetaData();
				System.out.println("name:"+bBObject.get("name"));
				System.out.println("describe:"+bBObject.get("describe"));
				System.out.println("name:"+file.getFilename());
				System.out.println("contentType:"+file.getContentType());
				System.out.println("id:"+file.getId());
				
				//save as another image
				file.writeTo("D:/1.JPG");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Done");
	}
	
	/**
	 * 根据ID获取
	 * 
	 *
	 * @author Ethan Wong
	 * @datetime 2017年3月15日下午5:41:13
	 */
	@Test
	public void findFileByIdInGridFs(){
		GridFSDBFile gridFSDBFile = gridFsOperations.findOne(new Query().addCriteria(Criteria.where("_id").is("58c9085a153e402807789352")));
		System.out.println("id:"+gridFSDBFile.getId());
		System.out.println("filename:"+gridFSDBFile.getFilename());
		
		DBObject bBObject = gridFSDBFile.getMetaData();
		System.out.println("name:"+bBObject.get("name"));
		System.out.println("describe:"+bBObject.get("describe"));
	}
	
	/**
	 * 删除测试
	 * 
	 *
	 * @author Ethan Wong
	 * @datetime 2017年3月15日下午5:31:22
	 */
	@Test
	public void deleteFileInGridFs(){
		gridFsOperations.delete(new Query().addCriteria(Criteria.where("_id").is("58c908bf153e928667d93637")));
	}
}
