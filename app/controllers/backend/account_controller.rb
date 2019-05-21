class Backend::AccountController < ApplicationController

  before_action do
    if current_admin != nil
      authenticate_admin!
    else
      authenticate_reseller!
    end
  end

  def index
    @list = Account.order(:created_at)

    if reseller_signed_in?
      @list = @list.for_reseller(current_reseller.id)
    end

  end

  def buy
    if request.get?
      @account = Account.new
    else
      @account = Account.new(self.allowed_params)
      @account.payment_method = 'contract'
      @account.reseller_id = current_reseller.id

      if @account.save
        redirect_to backend_account_index_path, flash: {notice: t('operation.created')}
      else
        flash[:error] = t('operation.error')
      end
    end
  end

  def show
    @account = Account

    if reseller_signed_in?
      @account = @account.for_reseller(current_reseller.id)
    end

    @account = @account.find_by_id(params[:id])
    redirect_to backend_account_index_path, flash: {error: t('operation.record_not_present')} unless @account
  end

  protected
  def allowed_params
    params.require(:account).permit(:name, :qty, accesses: [])
  end

end
