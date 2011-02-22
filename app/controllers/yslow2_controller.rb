class Yslow2Controller < ApplicationController

  def show
    @domain = Yslow2.find(params[:id]).url.name
    @yscores = Yslow2.find(params[:id])
    @stats = JSON.parse(@yscores.stats).sort
    @components = JSON.parse(@yscores.comps)
  end
  
end
