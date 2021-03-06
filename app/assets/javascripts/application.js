// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require vanilla-ujs
//= require polyfills/es5
//= require_self
//= require ./timer
//= require ./table-updater
//= require ./add-snapshot-button
//= require ./snapshot
//= require ./snapshots-index-page

(function() {
  'use strict';

  // Namespace for application code
  window.Snapshots = {};

  document.addEventListener("DOMContentLoaded", function() {
    new Snapshots.SnapshotsIndexPage();
  });
})();
