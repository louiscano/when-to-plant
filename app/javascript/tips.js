// document.addEventListener('DOMContentLoaded', function() {
//   document.querySelectorAll('.edit-tip-btn').forEach(function(button) {
//     button.addEventListener('click', function() {
//       const tipId = button.getAttribute('data-tip-id');
//       document.querySelectorAll('.tip-edit-form').forEach(function(form) {
//         if (form.getAttribute('data-tip-id') === tipId) {
//           form.classList.toggle('d-none');
//         } else {
//           form.classList.add('d-none');
//         }
//       });
//     });
//   });
// });


// app/assets/javascripts/comments.js
document.addEventListener('DOMContentLoaded', function() {
  const editTipButtons = document.querySelectorAll('.edit-tip-btn');
console.log(editTipButtons);
  editTipButtons.forEach(button => {
    button.addEventListener('click', function() {
      const tipId = this.dataset.tipId;
      const tipCard = document.getElementById(`tip-${tipId}`);
      const tipContent = tipCard.querySelector('.tip-content');
      const tipEditForm = tipCard.querySelector('.tip-edit-form');

      // Toggle the visibility of the tip content and the edit form
      tipContent.classList.toggle('d-none');
      tipEditForm.classList.toggle('d-none');
    });
  });
});
