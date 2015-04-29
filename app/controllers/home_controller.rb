class HomeController < ApplicationController

  def index
    @rates = ExchangeRate.get_exchange_rate
  end
end
