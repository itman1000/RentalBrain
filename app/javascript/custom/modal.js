'use strict';

{
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  const eliminate = document.getElementById('eliminate');
  const del = document.getElementById('del');
  const cancel = document.getElementById('cancel');
  
  // document.addEventListener("turbo:load", () => {
    eliminate.addEventListener("click", () => {
      modal.classList.remove('hidden2');
      mask.classList.remove('hidden2');
    });
  // });
  
  // document.addEventListener("turbo:load", () => {
    cancel.addEventListener("click", () => {
      modal.classList.add('hidden2');
      mask.classList.add('hidden2');
    });
  // });


  // eliminate.addEventListener("turbo:frame-render", () => {
  //   modal.classList.remove('hidden2');
  //   mask.classList.remove('hidden2');
  // });

  // cancel.addEventListener("turbo:frame-render", () => {
  //   modal.classList.add('hidden2');
  //   mask.classList.add('hidden2');
  // });

}