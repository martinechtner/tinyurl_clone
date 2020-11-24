class TinyUrlsController < ApplicationController

  def index
  end

  def create
    url = tiny_url_params[:original_url]
    if url.present?
      tiny_url = TinyUrl.create(original_url: url)
      if tiny_url.persisted?
        redirect_to info_path(tiny_url.mini_url), notice: 'Successfully created an tiny url!'
      else
        redirect_to root_path(original_url: url), error: tiny_url.errors.full_messages.join(', ')
      end
    else
      redirect_to root_path(original_url: url), alert: 'You must provide a URL.'
    end
  end

  def info
    @tiny_url = TinyUrl.find_by(mini_url: params[:mini_url])

    unless @tiny_url.present?
      redirect_to root_path, alert: 'URL not found.'
    end
  end

  private

    def tiny_url_params
      params.require(:tiny_url).permit(:original_url)
    end
end
