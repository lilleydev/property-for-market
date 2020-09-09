class RealtorsController < ApplicationController
  def index
    @realtors = Realtor.all
  end
end
