class SnapshotsController < ApplicationController

  def index
    @snapshots = Snapshot.by_insert_order
    @countdown_value = Snapshot::MAX_VAL
  end

end
