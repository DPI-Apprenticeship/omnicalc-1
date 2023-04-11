class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @result = rand(@min..@max) 
    render({ :template => "calculation_templates/random_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" }) 
  end

  def calculate_payment
    @apr = params.fetch("apr").to_i
    @years = params.fetch("years_pay").to_i
    @principal = params.fetch("principal").to_f
    #@result = params.fetch("payment").to_s

    monthly_interest_rate = (@apr / 100) / 12
    total_number_of_payments = @years * 12
    numerator = monthly_interest_rate * (1 + monthly_interest_rate) ** total_number_of_payments
    denominator = ((1 + monthly_interest_rate) ** total_number_of_payments) - 1
    #payment = @principal * (numerator / denominator).round(4)

    render({ :template => "calculation_templates/monthly_payment.html.erb" }) 
  end

end
