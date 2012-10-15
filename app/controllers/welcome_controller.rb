class WelcomeController < ApplicationController
  def home
    @recipients = ENV['RECIPIENTS']
  end

  def not_found
    render file: "public/404.html", status: 404, layout: false
  end
end
