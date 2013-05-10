class DeliveriesController < ApplicationController

  def open
    if delivery = Delivery.find_by_token(params[:token])
      delivery.open!(request)
    end
    image = File.read(File.join(Rails.root, "public/1x1.gif"))
    send_data image, type: "image/gif", disposition: "inline"
  end

  def click
    if delivery = Delivery.find_by_token(params[:token])
      delivery.click!(request)
    end
    redirect_to "#{params[:link]}" if params[:link].index("http://www.#{Rails.application.config.subscribers_domain}") == 0
  end

  def unsubscribe
    if delivery = Delivery.find_by_token(params[:token])
      delivery.unsubscribe!(request)
      render text: 'Inscrição cancelada com sucesso!'
    else
      render text: 'Erro'
    end
  end

end
