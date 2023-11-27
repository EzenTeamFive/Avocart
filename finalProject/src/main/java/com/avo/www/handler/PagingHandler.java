package com.avo.www.handler;

import java.util.List;

<<<<<<< HEAD
//import com.avo.www.domain.CommunityCmtVO;
=======

import com.avo.www.domain.CommunityCmtVO;
import com.avo.www.domain.CommunityReCmtVO;
>>>>>>> ecc99f14047d2fdeae62d5c51af9403f117ccb3f
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingHandler {

   private int startPage;
   private int endPage;
   private int realEndPage;
   
   private int totalCount;
   private PagingVO pgvo;
   
   private List<ProductBoardVO> prodList;
<<<<<<< HEAD
//   private List<CommunityCmtVO> cmtList;
=======
   private List<CommunityCmtVO> cmtList;
   private List<CommunityReCmtVO> reCmtList;

>>>>>>> ecc99f14047d2fdeae62d5c51af9403f117ccb3f
   
   public PagingHandler(PagingVO pgvo, int totalCount, int minus) {
      
      this.pgvo = pgvo;
      this.totalCount = totalCount;
      
      this.endPage = 
            (int)Math.ceil(pgvo.getPageNo() / (double)pgvo.getQty()) * pgvo.getQty();
     this.startPage = endPage - minus;
     
     this.realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
     if(this.realEndPage < this.endPage) {
         this.endPage = this.realEndPage;
      }
<<<<<<< HEAD
=======
     
     
>>>>>>> ecc99f14047d2fdeae62d5c51af9403f117ccb3f
   }
   
   // 게시글 페이징용
   public PagingHandler(PagingVO pgvo, int totalCount, List<ProductBoardVO> prodList) {
      this(pgvo, totalCount, 7);
      this.prodList = prodList;
   }
   
   //댓글 페이징용
<<<<<<< HEAD
//   public PagingHandler(int totalCount, PagingVO pgvo, List<CommunityCmtVO> cmtList) {
//      this(pgvo, totalCount, 9);
//      this.cmtList = cmtList;
//   }
   
=======
   public PagingHandler(int totalCount, PagingVO pgvo, List<CommunityCmtVO> cmtList, List<CommunityReCmtVO> reCmtList) {
      this(pgvo, totalCount, 9);
      this.cmtList = cmtList;
      this.reCmtList = reCmtList;
   }

>>>>>>> ecc99f14047d2fdeae62d5c51af9403f117ccb3f
}