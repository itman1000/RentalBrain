'use strict'

{
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  const eliminate = document.getElementById('eliminate');
  const del = document.getElementById('del');
  const cancel = document.getElementById('cancel');

  console.log(eliminate);
  
  document.addEventListener("DOMContentLoaded", () => {
    eliminate.addEventListener("click", () => {
      modal.classList.remove('hidden2');
      mask.classList.remove('hidden2');
    });
  });

  document.addEventListener("DOMContentLoaded", () => {
    cancel.addEventListener("click", () => {
      modal.classList.add('hidden2');
      mask.classList.add('hidden2');
    });
  });
}