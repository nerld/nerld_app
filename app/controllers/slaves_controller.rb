class SlavesController < ApplicationController
  def switch_toggle
    switch_slave = Slave.find(params[:id])
    command = switch_slave.commands.create(:input => 1)
    render json: command.as_json
  end
end
