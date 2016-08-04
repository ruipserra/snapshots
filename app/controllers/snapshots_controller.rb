class SnapshotsController < ApplicationController

  def index
    @snapshots = Snapshot.by_insert_order
    @countdown_value = Snapshot::MAX_VAL
    @countdown_max = Snapshot::MAX_VAL
    @countdown_min = Snapshot::MIN_VAL
    @countdown_wait_ms = 1000
  end

end
