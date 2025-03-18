// app/assets/javascripts/comments.js
document.addEventListener('DOMContentLoaded', function() {
  const editCommentButtons = document.querySelectorAll('.edit-comment-btn');

  editCommentButtons.forEach(button => {
    button.addEventListener('click', function() {
      const commentId = this.dataset.commentId;
      const commentCard = document.getElementById(`comment-${commentId}`);
      const commentContent = commentCard.querySelector('.comment-content');
      const commentEditForm = commentCard.querySelector('.comment-edit-form');

      // Toggle the visibility of the comment content and the edit form
      commentContent.classList.toggle('d-none');
      commentEditForm.classList.toggle('d-none');
    });
  });
});
