class ApplicationController < ActionController::API
  rescue_from Exception, with: :handle_exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from ActionController::ActionControllerError, with: :route_not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def route_not_found(error = 'Api not found')
    render json: { error: 404, message: error }, status: :not_found
  end

  def bad_request(error)
    render json: { error: 400, message: error.message }, status: :bad_request
  end

  def statement_invalid(error)
    render json: { error: 400, message: error.message }, status: :bad_request
  end

  def record_not_found(error)
    render json: { error: 400, message: error.message }, status: :not_found
  end

  def handle_exception(error)
    Raven.capture_exception(error)
    render json: { error: 500, message: error.message }, status: :internal_server_error
  end

  protected

  def meta_attributes(collection, extra_meta = {})
    has_records = collection.presence
    {
      page: has_records && collection.current_page || 0,
      per_page: has_records && collection.per_page || 0,
      next_page: has_records && collection.next_page || nil,
      prev_page: has_records && collection.previous_page || nil,
      total_pages: has_records && collection.total_pages || 0,
      total: has_records && collection.total_entries || 0
    }.merge(extra_meta)
  end
end
