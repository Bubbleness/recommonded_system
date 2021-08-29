package com.ssm.web.service;
import java.io.File;
import java.io.FileWriter;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.bean.MovieScore;
import com.ssm.bean.UserFilteringResult;
import com.ssm.util.common.BaseService;
import com.ssm.web.dao.MovieScoreMapper;
import com.ssm.web.dao.UserFilteringResultMapper;

@Service
@Transactional
public class UserFilteringResultService extends BaseService<UserFilteringResult> {

	final static int					NEIGHBORHOOD_NUM	= 4;
	final static int					RECOMMENDER_NUM		= 10;
	static int							resultIndex			= 0;

	@Autowired
	private UserFilteringResultMapper	userFilteringResultMapper;
	@Autowired
	MovieScoreMapper					movieScoreMapper;

	//需要多个用户对多个视频进行评分, 然后运行才能出结果
	//执行协同过滤
	public void updateUserFilteringResult() {
		if (resultIndex++ % 3 != 0) {
			//eturn;
		}
		try {

			//获取用户的评分数据
			File file = new File(System.getProperty("user.dir") + File.separator + "item.csv");
			System.out.println(file.getAbsolutePath());
			FileWriter out = null;
			//获取所有视频的评分数据
			List<MovieScore> uplist = movieScoreMapper.selectAll();
			out = new FileWriter(file);
			//生成用户id - 视频id - 用户对其的评分  数据项
			for (MovieScore up : uplist) {
				out.append(up.getUserId() + "," + up.getMovieId() + "," + up.getSocre() + "\r\n");
			}
			out.flush();
			out.close();

			//DataModel 是用户喜好信息的抽象接口
			//它的具体实现支持从任意类型的数据源抽取用户喜好信息
			//Taste 默认提供 JDBCDataModel 和 FileDataModel
			//分别支持从数据库和文件中读取用户的喜好信息。
			DataModel model = new FileDataModel(file);

			/*计算用户的相似度：相似度算法有很多种，欧几里得、皮尔逊等等。
			* 这里采用了欧几里得距离计算法
			* */
			//UserSimilarity 和 ItemSimilarity
			//UserSimilarity 用于定义两个用户间的相似度，它是基于协同过滤的推荐引擎的核心部分
			//可以用来计算用户的“邻居”，这里我们将与当前用户口味相似的用户称为他的邻居
			//ItemSimilarity 类似的，计算Item之间的相似度。
			//EuclideanDistanceSimilarity：基于欧几里德距离计算相似度
			UserSimilarity user = new EuclideanDistanceSimilarity(model);

			/**
			 * 计算最近邻域或者邻居有两种算法：基于固定数量的邻居和基于相似度的邻居
			 * 这里使用基于固定数量的邻居
			 */
			//UserNeighborhood 用于基于用户相似度的推荐方法中
			//推荐的内容是基于找到与当前用户喜好相似的邻居用户的方式产生的
			//UserNeighborhood 定义了确定邻居用户的方法，具体实现一般是基于 UserSimilarity 计算得到的
			//NearestNUserNeighborhood：对每个用户取固定数量 N 的最近邻居
			NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, model);

			/**
			 * 构建推荐器，协同过滤推荐有两种，分别是基于用户的和基于物品的
			 * 这里使用基于用户的协同过滤推荐
			 */
			//Recommender 是推荐引擎的抽象接口，Taste 中的核心组件
			//提供一个 DataModel，它可以计算出对不同用户的推荐内容
			//实际应用中，主要使用它的实现类 GenericUserBasedRecommender 或者 GenericItemBasedRecommender
			//分别实现基于用户相似度的推荐引擎或者基于内容的推荐引擎。
			//关联数据模型和相似度算法模型，进行具体的计算
			Recommender r = new GenericUserBasedRecommender(model, neighbor, user);

			//为用户推荐相关的视频
			//推荐的视频是当前用户还未评分的视频
			LongPrimitiveIterator iter = model.getUserIDs();
			int max = 10;
			int index = 0;
			userFilteringResultMapper.delete(null);
			while (iter.hasNext()) {
				index = 0;
				Long uid = iter.nextLong();
				List<RecommendedItem> list = r.recommend(uid, RECOMMENDER_NUM);
				System.out.printf("uid:%s", uid);
				String productids = "";
				for (RecommendedItem ritem : list) {
					System.out.printf("(%s,%f)", ritem.getItemID(), ritem.getValue());
					productids += ritem.getItemID() + ",";
					if (index >= max) {
						break;
					}
				}
				System.out.println();
				if (StringUtils.isNotBlank(productids)) {
					productids = productids.substring(0, productids.length() - 1);
					UserFilteringResult res = new UserFilteringResult();
					res.setMemberid(uid.intValue());
					res.setProductids(productids);
					userFilteringResultMapper.insert(res);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
