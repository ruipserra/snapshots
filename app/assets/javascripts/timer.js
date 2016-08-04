(function() {
  'use strict';

  var Timer = Snapshots.Timer = function(el, waitMs) {
    this.el = el;
    this.waitMs = parseInt(this.el.getAttribute('data-wait-ms'));
    this.maxTime = parseInt(this.el.getAttribute('data-max-time'));
    this.minTime = parseInt(this.el.getAttribute('data-min-time'));
    this.currentTime = parseInt(this.el.value);
    this.interval = setInterval(this.decrement.bind(this), this.waitMs);
  };

  Timer.prototype.decrement = function() {
    this.currentTime--;

    if (this.currentTime < this.minTime) {
      this.currentTime = this.maxTime;
    }

    this.el.value = this.currentTime;
  };

})();
