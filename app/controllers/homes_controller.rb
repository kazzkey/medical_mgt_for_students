class HomesController < ApplicationController
  before_action :authenticate!, only: %i[index]

  def index
  end
end
