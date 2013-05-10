class SubscribersController < ApplicationController
  before_filter :authorize

  respond_to :html, :xml

  def index
    @list = List.find(params[:list_id])
    @subscribers = @list.subscribers.order('id DESC').page(params[:page]).per(100)
  end

  def new
    @list = List.find(params[:list_id])
    @subscriber = @list.subscribers.build
    respond_with(@subscriber)
  end

  def create
    @list = List.find(params[:list_id])
    @subscriber = @list.subscribers.build(subscriber_params)
    flash[:notice] = 'Subscriber was successfully created.' if @subscriber.save
    respond_with(@subscriber, location: list_subscribers_path(@list))
  end

  def edit
    @list = List.find(params[:list_id])
    @subscriber = @list.subscribers.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @subscriber = @list.subscribers.find(params[:id])
    flash[:notice] = 'Subscriber was successfully updated.' if @subscriber.update_attributes(subscriber_params)
    respond_with(@subscriber, location: list_subscribers_path(@list))
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.subscribers.find(params[:id]).destroy
    redirect_to list_subscribers_path(@list)
  end

  private

  def subscriber_params
    params[:subscriber].permit(:name, :email)
  end

end
