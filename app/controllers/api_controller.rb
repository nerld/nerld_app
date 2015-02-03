class ApiController < ApplicationController
  def register_slave
    id = params[:id]
    address = params[:address]
    type = params[:type]
    state = params[:state]

    remote_lab = RemoteLab.find(id)
    slave = remote_lab.slaves.find_or_create_by(address: address)
    slave.update(s_type: type, state: state)

    render json: slave.as_json
  end

  def get_commands
    commands = Command.where(:completed => false).joins(:slave).where(:slaves => {:remote_lab_id => params[:id]})
    ret_commands = []
    commands.each do |c|
      ret_command = {address: c.slave.address, input: c.input, type: c.slave.s_type, id: c.id}
      ret_commands.append(ret_command)
    end

    render json: ret_commands.as_json
  end

  def complete_command
    command = Command.find(params[:id])
    command.update(completed: true)
    render json: command.as_json
  end

end
