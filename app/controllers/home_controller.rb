class HomeController < ApplicationController
  def index
      require 'net/http'
      require 'json'

      @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=82007&distance=0&API_KEY=A3E9205E-A146-4691-B947-F802E7DE5C12'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

      # check for emprty return result
      if @output.empty?
          @final_output = "Error"
      elsif !@output
          @final_output = "Error"
      else
           @final_output = @output[0]['AQI']
      end

      if @final_output == "Error"
          @api_color = "silver"
      elsif @final_output <= 50
          @api_color ="green"
          @api_description = "Good (0-50)"
      elsif @final_output >= 51 && @final_output <=100
          @api_color ="yellow"
          @api_description = "Moderate (51-100)"
      elsif @final_output >= 101 && @final_output <=150
          @api_color ="orange"
          @api_description = "Unhealthy for Sensitive Groups (USG) (101-150)"
      elsif @final_output >= 151 && @final_output <=200
          @api_color ="red"
          @api_description = "Unhealthy (151-200)"
      elsif @final_output >= 201 && @final_output <300
          @api_color ="purple"
          @api_description = "Very Unhealthy (201-300)"
      else @final_output >= 301 && @final_output <=500
          @api_color ="magenta"
          @api_description = "Hazardous 300-500)"

      end
  end

  def zipcode
      @zip_query = params[:zipcode]

      if params[:zipcode] == ""
          @zip_query = "Hey you forgot to enter a zipcode"
      elsif params[:zipcode]
        # do API stuff
        require 'net/http'
        require 'json'

        @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=0&API_KEY=A3E9205E-A146-4691-B947-F802E7DE5C12'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)

        # check for emprty return result
        if @output.empty?
            @final_output = "Error"
        elsif !@output
            @final_output = "Error"
        else
             @final_output = @output[0]['AQI']
        end

        if @final_output == "Error"
            @api_color = "silver"
        elsif @final_output <= 50
            @api_color ="green"
            @api_description = "Good (0-50)"
        elsif @final_output >= 51 && @final_output <=100
            @api_color ="yellow"
            @api_description = "Moderate (51-100)"
        elsif @final_output >= 101 && @final_output <=150
            @api_color ="orange"
            @api_description = "Unhealthy for Sensitive Groups (USG) (101-150)"
        elsif @final_output >= 151 && @final_output <=200
            @api_color ="red"
            @api_description = "Unhealthy (151-200)"
        elsif @final_output >= 201 && @final_output <300
            @api_color ="purple"
            @api_description = "Very Unhealthy (201-300)"
        else @final_output >= 301 && @final_output <=500
            @api_color ="magenta"
            @api_description = "Hazardous 300-500)"

        end














      end

  end

end
