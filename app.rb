require 'sinatra'

class MyApp
    run! if app_file == $0
    
    get '/' do
        'Hello Battle!'
    end
end