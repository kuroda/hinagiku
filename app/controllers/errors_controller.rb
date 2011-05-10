class ErrorsController < ApplicationController
  def not_found
    raise ActionController::RoutingError, "No route matches #{request.path.inspect}"
  end
end
