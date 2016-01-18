package cn.imethan.common.mongodb;

import java.io.Serializable;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.repository.query.MongoEntityInformation;
import org.springframework.data.mongodb.repository.support.SimpleMongoRepository;

/**
 * BaseRepositoryImpl.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年9月30日下午6:08:09
 */
public class BaseRepositoryImpl<T, ID extends Serializable> extends SimpleMongoRepository<T, ID>implements BaseRepository<T, ID> {

	private MongoOperations mongoOperations;
	private MongoEntityInformation<T, ID> metadata;

	public BaseRepositoryImpl(MongoEntityInformation<T, ID> metadata, MongoOperations mongoOperations) {
		super(metadata, mongoOperations);
		this.mongoOperations = mongoOperations;
		this.metadata = metadata;
	}



	@Override
	public MongoOperations getMongoOperations() {
		return mongoOperations;
	}


	@Override
	public MongoEntityInformation<T, ID> getMongoEntityInformation() {
		return metadata;
	}

}