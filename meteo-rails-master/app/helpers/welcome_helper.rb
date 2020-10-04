    module WelcomeHelper
   
    require 'net/http'
    require 'open-uri'
    require 'json'

    def getJson(city)
        begin
            tmp_url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city}&appid="
            tmp_key = ENV["OPENWEATHERMAP_API_KEY"]
            url = "#{tmp_url}#{tmp_key}&cnt=16&units=metric"
            result = JSON.parse(open(url).read)
            return result
        rescue
            redirect_to :back, notice: "city not match"
        end
    end


    def getJsonDetail(city, dt)
        tmp_url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city}&appid="
        tmp_key = ENV["OPENWEATHERMAP_API_KEY"]
        url = "#{tmp_url}#{tmp_key}&cnt=16&units=metric"
        result = JSON.parse(open(url).read)
        result["list"].each do |d|
            if d['dt'] == dt
                object = d
                return object
            end
        end
    end

end

## http://api.openweathermap.org/data/2.5/forecast/daily?q=Milano&appid=dfd27c7cecf587aaad67f67cdfedcd26&units=metric&cnt=16