'use strict';

{
  window.onpageshow = function(event) {
    if (event.popstate) {
       window.location.reload();
    }
  };
}