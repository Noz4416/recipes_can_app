class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q
  # before_action :genre_search


  def after_sign_in_path_for(resource)
    users_mypage_path
  end

  def after_sign_out_path_for(resouce)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

  def set_q
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page]).per(6)
  end

  def genre_search
    @genre = Genre.find(params[:genre_id])
    @recipes = @genre.recipes.includes([:user])
  end

end
