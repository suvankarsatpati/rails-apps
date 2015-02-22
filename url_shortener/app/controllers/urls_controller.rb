class UrlsController < ApplicationController
  before_action :set_url, only: [:destroy]

  def index
  	@urls = Url.all
  	@url = Url.new
  end

  def new
    @url = Url.new
    respond_to do |format|
      format.html 
    end
  end

  def create
    @url = Url.new(url_params)

    @url.long_url = @url.long_url
    @url.short_url = shorten(@url.long_url)

    respond_to do |format|
      if @url.save
        format.html { redirect_to root_path, notice: 'Url successfully shortened' }
      else
        format.html{ redirect_to :back, :notice => 'There was an error in creating shorted url'}
      end
    end  
  end

  def shorten(url)
  	 unique_id = SecureRandom.urlsafe_base64(4)
  	 shorted_url = "http://#{request.remote_ip}:#{request.port}/#{unique_id}"
  end

	def destroy
		@url.destroy
		respond_to do |format|
		  format.html { redirect_to urls_url }
  	end
	end

  private

  	def set_url
  		@url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:long_url)
    end
end
