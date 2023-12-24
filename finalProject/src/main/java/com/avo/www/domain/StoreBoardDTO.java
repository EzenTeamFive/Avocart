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
@AllArgsConstructor
@NoArgsConstructor
public class StoreBoardDTO {
	private ProductBoardVO pvo;
	private List<FileVO> flist;
	private List<StoreMenuVO> mlist;
}
