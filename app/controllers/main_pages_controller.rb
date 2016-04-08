class MainPagesController < ApplicationController
  def home
    if user_signed_in? 
      redirect_to current_user
      flash[:success] = "Has sido redirigido a tu pagina principal"
    end
  end
end
