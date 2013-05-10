class ListsController < ApplicationController
  before_filter :authorize

  respond_to :html, :xml

  def index
    @lists = List.order('id DESC').page(params[:page]).per(100)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def create
    @list = List.new(list_params)
    flash[:notice] = 'List was successfully created.' if @list.save
    respond_with(@list, :location => lists_path)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def import
    @list = List.find(params[:id])
    if request.post?
      lines = params[:emails].split("\r\n")
      lines.each do |line|
        name = line.split(',')[0]
        email = line.split(',')[1]
        if subscriber = Subscriber.find_by_email(email)
          if !@list.subscribers.exists?(subscriber.id)
            @list.subscribers << subscriber
            @list.save
          end
        else
          @list.subscribers.create(name: name, email: email)
        end
      end
      redirect_to lists_path, notice: "Subscribers were successfully imported."
    end
  end

  private

  def list_params
    params[:list].permit(:name, :from)
  end

end
