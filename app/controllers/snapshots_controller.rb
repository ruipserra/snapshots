class SnapshotsController < ApplicationController

  def index
    @snapshots = Snapshot.by_insert_order
    @countdown_value = Countdown::MAX_VAL
    @countdown_max = Countdown::MAX_VAL
    @countdown_min = Countdown::MIN_VAL
    @countdown_wait_ms = Countdown::WAIT_MS
  end

  def create
    @snapshot = Snapshot.new(permitted_params)

    if @snapshot.save
      render json: @snapshot.to_json, status: :created
    else
      render json: { errors: @snapshot.errors.full_messages },
        status: :unprocessable_entity
    end
  end

private

  def permitted_params
    params.require(:snapshot).permit(:seconds)
  end
end
