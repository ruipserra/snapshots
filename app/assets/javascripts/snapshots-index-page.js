(function() {
  'use strict';

  var SnapshotsIndexPage = Snapshots.SnapshotsIndexPage = function() {
    this.timer = new Snapshots.Timer(document.querySelector('.js-countdown'));
    this.tableUpdater = new Snapshots.TableUpdater(document.querySelector('.js-snapshots-table'));
    this.addBtn = new Snapshots.AddSnapshotButton(document.querySelector('.js-add-button'), this.timer, this.tableUpdater);
  };

})();
