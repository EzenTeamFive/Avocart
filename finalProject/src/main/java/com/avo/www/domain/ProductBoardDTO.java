package com.avo.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductBoardDTO {
	
	private ProductBoardVO pbvo;
	private BuyItemVO bivo;
	private List<FileVO> pflist;
	private List<LikeItemVO> likeList;

}
