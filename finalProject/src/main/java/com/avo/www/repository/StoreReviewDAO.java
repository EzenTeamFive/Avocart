package com.avo.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface StoreReviewDAO {

	List<Integer> getAllReviewCnt(@Param("emailList") List<String> emailList);
}
