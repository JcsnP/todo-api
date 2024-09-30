class ApplicationController < ActionController::API
  def page
    params[:page].to_i < 1 ? 1 : params[:page].to_i
  end

  def limit
    params[:limit].to_i < 1 ? 10 : params[:limit].to_i
  end

  def offset
    (page - 1) * limit
  end

  def render_ok(data = { message: "ok" })
    render status: :ok, json: data
  end
end
