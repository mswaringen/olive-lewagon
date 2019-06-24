class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :aboutus, :faq]

  def home
    @ngos = Ngo.all
  end

  def aboutus
  end

  def sitemap
    @ngos = Ngo.all
  end
end
