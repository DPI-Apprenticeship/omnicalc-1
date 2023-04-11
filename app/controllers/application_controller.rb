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
    apr = params.fetch("apr").to_f.round(4)

    @apr = apr.to_s(:percentage, { :precision => 4 })
    @years = params.fetch("years_pay").to_i
    principal = params.fetch("principal").to_f
    @principal = principal.to_s(:currency) 
    
    rate = ( apr / 12.0 ) / 100
    n = -1 * (@years * 12)
    numerator = rate * principal
    denominator = 1 - ( 1 + rate ) ** n
    @payment = (numerator / denominator).to_s(:currency)
    render({ :template => "calculation_templates/monthly_payment.html.erb" }) 
  end

  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb" })
  end  

  def calculate_root
    @num = params.fetch("number").to_f
    @square_num = Math.sqrt(@num).round(3)
    render({ :template => "calculation_templates/root_results.html.erb"})
  end  

end
