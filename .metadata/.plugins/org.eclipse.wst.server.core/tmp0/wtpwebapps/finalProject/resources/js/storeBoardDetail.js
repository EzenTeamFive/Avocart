//확인 클릭 시 게시글 삭제
document.addEventListener('click', (e) => {
    if(e.target.id == 'delBtn') {
       if(!confirm("게시글을 삭제하시겠습니까?")) {
            e.preventDefault();
            return;
       }
    }
})