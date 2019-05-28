class NgosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @ngos = Ngo.all
  end

  def show
    @ngo = Ngo.find(params[:id])
  end
end
