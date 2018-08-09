class HomeController < ApplicationController
  def index
  StartScrap.new.perform
end
end
