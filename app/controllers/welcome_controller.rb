class WelcomeController < ApplicationController
  def index
    @updates = []
    @updates += Release.order(updated_at: :desc).take(5)
    @updates += Artist.order(updated_at: :desc).take(5)
    @updates = @updates.sort_by { |a| a.updated_at }.
                        reverse.
                        map { |a| {name: a.name, id: a.id, klass: a.class} }
  end

  def about
  end

  def contact
  end
end
