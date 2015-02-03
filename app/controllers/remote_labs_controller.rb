class RemoteLabsController < ApplicationController
  before_action :set_remote_lab, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @remote_labs = RemoteLab.all
    respond_with(@remote_labs)
  end

  def show
    respond_with(@remote_lab)
  end

  def new
    @remote_lab = RemoteLab.new
    respond_with(@remote_lab)
  end

  def edit
  end

  def create
    @remote_lab = RemoteLab.new(remote_lab_params)
    flash[:notice] = 'RemoteLab was successfully created.' if @remote_lab.save
    respond_with(@remote_lab)
  end

  def update
    flash[:notice] = 'RemoteLab was successfully updated.' if @remote_lab.update(remote_lab_params)
    respond_with(@remote_lab)
  end

  def destroy
    @remote_lab.destroy
    respond_with(@remote_lab)
  end

  private
    def set_remote_lab
      @remote_lab = RemoteLab.find(params[:id])
    end

    def remote_lab_params
      params.require(:remote_lab).permit(:title, :version, :author, :school, :user_id, :lab_type, :password, :allowable_time)
    end
end
