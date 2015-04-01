require 'sinatra'
require 'haml'

get '/' do 
	haml :hello, locals: { foo: "bar" }
end

