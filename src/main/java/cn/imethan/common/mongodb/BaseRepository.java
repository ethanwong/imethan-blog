package cn.imethan.common.mongodb;

import java.io.Serializable;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.query.MongoEntityInformation;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * BaseRepository.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年9月30日下午6:06:15
 */
@NoRepositoryBean
public interface BaseRepository<T, ID extends Serializable> extends MongoRepository<T, ID> {	

	/**
	 * Get {@link MongoOperations}.
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年10月1日上午5:38:14
	 */
	public MongoOperations getMongoOperations();

	/**
	 * Get {@link MongoEntityInformation}.
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年10月1日上午5:39:49
	 */
	public MongoEntityInformation<T, ID> getMongoEntityInformation();

}
