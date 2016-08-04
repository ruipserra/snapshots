(function() {
  'use strict';

  var TableUpdater = Snapshots.TableUpdater = function(el) {
    this.el = el;
    this.tbody = this.el.getElementsByTagName('tbody')[0];
  };

  TableUpdater.prototype.addSnapshot = function(value) {
    var newRow = this.createRow(value);
    this.tbody.appendChild(newRow);
  };

  TableUpdater.prototype.createRow = function(value) {
    var row = document.createElement('tr');
    var valueCell = document.createElement('td');
    valueCell.textContent = value;
    row.appendChild(valueCell);

    return row;
  };

})();
