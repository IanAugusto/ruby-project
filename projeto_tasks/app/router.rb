# router.rb
require_relative 'controllers/loginController'

class Router
  def initialize
    @routes = {}
    @LoginController = LoginController.new
  end

  def get(path, &block)
    @routes["GET #{path}"] = block
  end

  def post(path, &block)
    @routes["POST #{path}"] = block
  end

  def run(request)
    method, path = request.split
    route_key = "#{method} #{path}"

    if @routes.key?(route_key)
      @routes[route_key].call
    else
      route_not_found
    end
  end

  private

  def route_not_found
    '404 Not Found'
  end

  def LoginController
    @login_controller
  end
end
