class HomeController < ApplicationController

  def index
    @rates = ExchangeRate.get_exchange_rates
  end
end
