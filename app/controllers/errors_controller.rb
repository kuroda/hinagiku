class ErrorsController < ApplicationController
  skip_before_filter :reject_visitors
  
  def not_found
    raise ActionController::RoutingError, "No route matches #{request.path.inspect}"
  end
end