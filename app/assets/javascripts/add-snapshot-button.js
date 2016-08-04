(function() {
  'use strict';

  var AddSnapshotButton = Snapshots.AddSnapshotButton = function(el, timer, tableUpdater) {
    this.el = el;
    this.timer = timer;
    this.tableUpdater = tableUpdater;

    this.bindEventListeners();
  };

  AddSnapshotButton.prototype.bindEventListeners = function() {
    this.el.addEventListener('click', this.onClick.bind(this));
  };

  AddSnapshotButton.prototype.onClick = function(e) {
    var newSnapshot = new Snapshots.Snapshot(this.timer.currentTime);
    var _this = this;

    newSnapshot.createRemote({
      onSuccess: function(xhr) {
        var response = JSON.parse(xhr.response);
        _this.tableUpdater.addSnapshot(response.seconds);
      },

      onError: function(xhr) {
        console.error(xhr);
      },
    })
  };

})();
