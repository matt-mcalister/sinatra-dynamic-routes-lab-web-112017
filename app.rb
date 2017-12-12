require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!


  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{(@num * @num).to_s}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
    # result = ""
    # @num times do
    #    result += @phrase +"\n"
    # end
    erb :numberphrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    params[:word1] + " " + params[:word2] + " " + params[:word3] + " " + params[:word4] + " " + params[:word5] + "."
  end

  get '/:operation/:number1/:number2' do
    @op = params[:operation]

    case @op.downcase
    when "add"
      return "#{(params[:number1].to_i + params[:number2].to_i).to_s}"
    when "subtract"
      return "#{(params[:number1].to_i - params[:number2].to_i).to_s}"
    when "multiply"
      return "#{(params[:number1].to_i * params[:number2].to_i).to_s}"
    when "divide"
      return "#{(params[:number1].to_i / params[:number2].to_i).to_s}"
    else
      "invalid operation!"
    end
  end
end
