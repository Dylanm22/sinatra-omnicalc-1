require "sinatra"
require "sinatra/reloader"

get("/") do


  erb(:home_page)
end



get("/square/new")do 

erb(:square)

end

get("/square/results")do
@the_num = params.fetch("user_number").to_f

@the_result = @the_num * @the_num
erb(:square_results)
end

get("/square_root/new")do 

erb(:square_root)

end 

get("/square_root/results")do 

@the_num = params.fetch("user_number").to_f

@the_root = Math.sqrt(@the_num)
erb(:square_root_results)
end 


get("/random/new")do




erb(:random_num)

end

get("/random/results")do


@min_num = params.fetch("min_number").to_f
@max_num = params.fetch("max_number").to_f

@rand_num = rand(@min_num..@max_num)

erb(:random_num_result)

end


get("/payment/new")do 

erb(:payment)
end 


get("/payment/results")do

@apr = params.fetch("user_apr").to_f

@num_of_years= params.fetch("user_num_years").to_f

@prin = params.fetch("user_principals").to_f



@apr_result = @apr.to_fs(:percentage, {:precision => 4})

 
@apr = @apr / 100

@apr = @apr / 12

@num_of_years = @num_of_years * 12

top = @apr * @prin
 
bottom = 1.0 - (1.0 +@apr)** -@num_of_years


 @payment = top / bottom

 @payment = @payment.round(2)
  
 @payment = @payment.to_fs(:currency)
erb(:payment_results)
end
