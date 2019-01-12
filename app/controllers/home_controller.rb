class HomeController < ApplicationController
  def index
  end

  def new_clients
  end

  def services
  end

  def returning_clients
  end

  def about
    preparers = Preparer.order(id: :asc).active.as_json(only: [:first_name, :last_name, :job_title, :image_url, :bio])
    @preparers = {}
    preparers.each_with_index { |p, i| @preparers.store(i, p) }
    @preparers
  end

end
