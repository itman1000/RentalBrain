'use strict';

{
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  const destroyModals = document.querySelectorAll('.destroy-modal');
  const cancel = document.getElementById('cancel');
  
  document.addEventListener("turbo:load", () => {
    destroyModals.forEach(destroyModal => {
      destroyModal.addEventListener("click", () => {
        modal.classList.remove('hidden2');
        mask.classList.remove('hidden2');
      });
    });
  });
  
  document.addEventListener("turbo:load", () => {
    cancel.addEventListener("click", () => {
      modal.classList.add('hidden2');
      mask.classList.add('hidden2');
    });
  });
}