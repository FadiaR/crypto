class HomeController < ApplicationController
  def index
    StartScrap.new.perform
  end
  def show
  end
end
