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

import mblog.core.persist.entity.UserPO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * @author langhsu
 */
public interface UserDao extends JpaRepository<UserPO, Long>, JpaSpecificationExecutor<UserPO> {
    UserPO findByUsername(String username);

    UserPO findByEmail(String email);
    
    List<UserPO> findTop12ByOrderByFansDesc();

    Page<UserPO> findAllByOrderByIdDesc(Pageable pageable);

    List<UserPO> findAllByIdIn(Set<Long> ids);

    @Modifying
    @Transactional
    @Query("update UserPO set posts = posts + :increment where id = :id")
    int updatePosts(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Transactional
    @Query("update UserPO set comments = comments + :increment where id = :id")
    int updateComments(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Transactional
    @Query("update UserPO set follows = follows + :increment where id = :id")
    int updateFollows(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Transactional
    @Query("update UserPO set fans = fans + :increment where id = :id")
    int updateFans(@Param("id") long id, @Param("increment") int increment);

    @Modifying
    @Transactional
    @Query("update UserPO set favors = favors + :increment where id = :id")
    int updateFavors(@Param("id") long id, @Param("increment") int increment);

}
