#Response timer ia a rack appplication
# you need to add  config.autoload_paths += %W(#{config.root}/lib) to config/application.rb 
# otherwise you will receive the following error when you run rake middleware: uninitialized constant ResponseTimer
#next we need to go to our environment.config file 
#and specify to use this new class as middleware
class ResponseTimer
	#All middleware takes an initialize method 
	# app is actually the rails application, 
	# it will going to execute when middleware is called 
	def initialize(app)
		@app = app
	end

	# A Rack application is a Ruby object (not a class) 
	# that responds to call. It takes exactly one argument, the environment 
	# and returns an Array of exactly three values: The status, the headers, and the body.

	# for rails specific 

	#def call(env)
    #    start = Time.now
	#	status, headers, response = @app.call(env)
	#	stop = Time.now
	#	[status, headers, ["<h1>Page Load Time #{stop - start}<h1>" + response.body]]
		#[200, {"Content-Type" => "text/html"}, ["Hello Rack"]]
	#end
    
	# generalized way
	 
    def call(env)
    	@start = Time.now
    	@status, @headers, @response = @app.call(env)
    	@stop = Time.now
    	[@status, @headers, self]
  	end
  
  	def each(&block)
    	block.call("<h1>Page Load Time #{@stop - @start}<h1>\n") if @headers["Content-Type"].include? "text/html"
    	@response.each(&block)
  	end
end