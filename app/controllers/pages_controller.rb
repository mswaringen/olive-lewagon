class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :sitemap,:aboutus]

  def home
    @ngos = Ngo.all
  end

  def sitemap
    @ngos = Ngo.all
  end

  def aboutus
  end
end
