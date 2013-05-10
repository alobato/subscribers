class CampaignsController < ApplicationController
  before_filter :authorize

  respond_to :html, :xml

  def index
    @campaigns = Campaign.order('id DESC').page(params[:page]).per(100)
  end

  def new
    @campaign = Campaign.new
    respond_with(@campaign)
  end

  def create
    @campaign = Campaign.new(campaign_params)
    flash[:notice] = 'Campaign was successfully created.' if @campaign.save
    respond_with(@campaign, location: campaigns_path)
  end

  def edit
    @campaign = Campaign.find(params[:id])
    respond_with(@campaign)
  end

  def update
    @campaign = Campaign.find(params[:id])
    flash[:notice] = 'Campaign was successfully updated.' if @campaign.update_attributes(campaign_params)
    respond_with(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

  def preview
    @campaign = Campaign.find(params[:id])
    render layout: nil
  end

  def deliveries
    @campaign = Campaign.find(params[:id])
    @deliveries = @campaign.deliveries
  end

  def schedule
    @campaign = Campaign.find(params[:id])
    if request.post?
      schedule_at = Time.zone.local(
        params[:schedule][:"at(1i)"].to_i,
        params[:schedule][:"at(2i)"].to_i,
        params[:schedule][:"at(3i)"].to_i,
        params[:schedule][:"at(4i)"].to_i,
        params[:schedule][:"at(5i)"].to_i
      )
      SenderWorker.perform_at(schedule_at, @campaign.id)
      redirect_to campaign_path(@campaign), notice: 'Campaign was successfully scheduled.'
    end
  end

  private

  def campaign_params
    params[:campaign].permit(:list_id, :name, :from, :reply_to, :subject, :body, :body_txt)
  end

end
