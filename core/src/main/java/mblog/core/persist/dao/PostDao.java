/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.persist.dao;

import mblog.core.persist.dao.custom.PostDaoCustom;
import mblog.core.persist.entity.PostPO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * @author langhsu
 *
 */
public interface PostDao extends JpaRepository<PostPO, Long>, JpaSpecificationExecutor<PostPO>, PostDaoCustom {
	/**
	 * 查询指定用户
	 * @param pageable
	 * @param authorId
	 * @return
	 */
	Page<PostPO> findAllByAuthorIdOrderByCreatedDesc(Pageable pageable, long authorId);

	// findLatests
	List<PostPO> findTop10ByOrderByCreatedDesc();

	// findHots
	List<PostPO> findTop10ByOrderByViewsDesc();

	List<PostPO> findAllByIdIn(Collection<Long> id);

	List<PostPO> findTop5ByFeaturedGreaterThanOrderByCreatedDesc(int featured);

	@Query("select coalesce(max(weight), 0) from PostPO")
	int maxWeight();

	@Modifying
	@Transactional
	@Query("update PostPO set views = views + :increment where id = :id")
	void updateViews(@Param("id") long id, @Param("increment") int increment);

	@Modifying
	@Transactional
	@Query("update PostPO set favors = favors + :increment where id = :id")
	void updateFavors(@Param("id") long id, @Param("increment") int increment);

	@Modifying
	@Transactional
	@Query("update PostPO set comments = comments + :increment where id = :id")
	void updateComments(@Param("id") long id, @Param("increment") int increment);
	
}
