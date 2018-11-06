class CustomersController < ApplicationController
  require 'csv'
  def index
    @customers = Customer.all
  end

  def upload
    csv.foreach(params[:leads].path, headers:true) do |lead|
      customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
    end
    redirect_to customers_path
  end

end
