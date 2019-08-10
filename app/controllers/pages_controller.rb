class PagesController < ApplicationController
  def home
  end

  def about
    @skills = Skill.order(percent_utilized: :desc)
  end

  def contact
  end
end
