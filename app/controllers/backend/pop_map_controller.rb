class Backend::PopMapController < ApplicationController

  before_action do
    if current_admin != nil
        authenticate_admin!
      else
        authenticate_reseller!
    end
  end

  before_action :authenticate_admin!, only: [:edit]

  def index
    @list = PopMap.joins(:location, :country).includes(:location, :country).order(:name).all
  end

  def edit
    @pop_map = PopMap.find_by_id(params[:id])
    if request.get?
    else

      if params[:pop_map].present? && params[:pop_map][:price].present?
        params[:pop_map][:price] = params[:pop_map][:price].sub(',', '.')
      end

      if @pop_map.update(self.allowed_params)
        redirect_to backend_pop_map_index_path, flash: {notice: t('operation.created')}
      else
        flash[:error] = t('operation.error')
      end
    end
  end

  protected
  def allowed_params
    params.require(:pop_map).permit(:price)
  end
end
