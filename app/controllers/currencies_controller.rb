class CurrenciesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    render json: Money::Currency.all, each_serializer: CurrencySerializer
  end
end
