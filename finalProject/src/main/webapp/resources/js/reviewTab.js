async function spreadReviewFromServer(page, type, sort){
    try{
        const resp = await fetch('/store/reviewPage/'+page+'/'+type);
        const result = await resp.json();
        return result;
    }catch(err){
        console.log(err);
    }
}

// 스타 레이팅을 동적으로 계산하는 함수
function setStarRating(rating) {
    var fillStars = document.getElementById('fillStars');
    var widthPercentage = (rating / 5) * 100; // 5점 만점 기준으로 비율 계산
    fillStars.style.width = widthPercentage + '%';
}

//페이지가 처음 로드될 때 전체 리뷰 표시
function getReviewList(page = 1, type = 'joongo') {
    spreadReviewFromServer(page, type).then(result => {
    	const reviewData = result;
    	console.log(reviewData);
    	
    	//리뷰 총합 계산
    	const totalScore = reviewData.reviewList.reduce((sum, review) => sum + review.reScore, 0);
    	console.log("총합"+totalScore);
    	
    	//리뷰 개수
    	const reviewCount = reviewData.reviewList.length;
    	console.log("개수"+reviewCount);
    	
    	//리뷰 평균
    	const averageScore = reviewCount > 0 ? totalScore / reviewCount : 0;
        console.log("평균"+averageScore);
        
        
        // 리뷰 평균에 따라 동적으로 스타 레이팅 업데이트
        setStarRating(averageScore);
        
        const ul = document.getElementById('ulZone');

      
    });
}
