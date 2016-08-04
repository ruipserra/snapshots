(function() {
  var Snapshot = Snapshots.Snapshot = function(seconds) {
    this.seconds = seconds;
  };

  Snapshot.prototype.createRemote = function(opts) {
    var noop = function() {};
    var opts = opts || {};

    var xhr = LiteAjax.ajax('/snapshots', {
      method: 'POST',
      json: true,
      data: this.buildJson(),
      accepts: 'application/json',
      success: opts.onSuccess || noop,
      error: opts.onError || noop,
    });
  };

  Snapshot.prototype.buildJson = function() {
    return { seconds: this.seconds };
  };

})();
