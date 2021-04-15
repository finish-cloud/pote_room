class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image])
  end

  before_action :set_search

  def set_search
    @q = Room.ransack(params[:q])
    @Room = @q.result
    @search_articles = @q.result.order(id: "DESC")
    @count = @search_articles.count
  end
end
