class PortfoliosController < ApplicationController
  def create
    unless current_user.portfolios.last.nil?
      current_user.portfolios.last.inactive!
    end
    @portfolio = Portfolio.create!(ngo_id: params[:ngo_id], user: current_user, status: :active)
    redirect_to new_round_up_path
  end
end
