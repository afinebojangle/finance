class CapmController < ApplicationController
  respond_to :html, :js
  
  def index
    @capm_regression = Capm_regression.new
  end

  def stock
  end
  
  def capm_graph
    @capm_regression = Capm_regression.new(capm_regression_params)
    
    @capm_graph = @capm_regression.capm_regress
    
    respond_with(@capm_graph) do |format|
      format.html {redirect_to capm_index_path}
    end
  end
  
  private
  
  def capm_regression_params
    params.require(:capm_regression).permit(:ticker, :index, :start_date, :end_date)
  end
  
  
end
