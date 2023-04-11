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
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper) 
    render({ :template => "calculation_templates/random_results.html.erb" })
  end

  def blank_payment_form
    #params[:apr] && params[:years] && params[:principal]
    #@apr = params[:apr].to_f
    #@years = params[:years]to_i
    #@principal = params[:principal].to_f

    @apr = params.fetch("apr").to_f
    @years = params.fetch("years_pay").to_i
    @principal = params.fetch("principal").to_f
    @result = fetch("monthly_payment").to_i

    monthly_interest_rate = (@apr / 100) / 12
    total_number_of_payments = @years * 12
    numerator = monthly_interest_rate * (1 + monthly_interest_rate) ** total_number_of_payments
    denominator = ((1 + monthly_interest_rate) ** total_number_of_payments) - 1
    monthly_payment = @principal * (numerator / denominator).round(2)

    render({ :template => "calculation_templates/payment_form.html.erb" }) 
  end

  def calculate_payment
    render({ :template => "calculation_templates/monthly_payment.html.erb" }) 
  end

end
