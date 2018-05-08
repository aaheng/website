function upLike(commentId) {
    $.post("/discuss/likeComment", {commentId: commentId},
        function (data) {
            if (data.code == 999) {
                //未登录
                window.location.href = 'http://localhost:8080/toLogin';
            } else if (data.code == 200) {
                //更新点赞数量
                /*$("#js-voteCount").html(data.result);
                //将按钮颜色加深
                $("#likeButton").addClass('pressed');
                $("#dislikeButton").removeClass('pressed');*/
                window.location.reload();
            } else {
                alert(data.msg);
            }
        }, "json");
}
function downDislike(commentId) {
    $.post("/discuss/dislikeComment", {commentId: commentId},
        function (data) {
            if (data.code == 999) {
                //未登录
                window.location.href = 'http://localhost:8080/toLogin';
            } else if (data.code == 200) {
                //更新点赞数量
                /*$("#js-voteCount").html(data.result);
                //将按钮颜色加深
                $("#likeButton").addClass('pressed');
                $("#dislikeButton").removeClass('pressed');*/
                window.location.reload();
            } else {
                alert(data.msg);
            }
        }, "json");
}