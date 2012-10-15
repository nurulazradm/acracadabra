class WelcomeController < ApplicationController
  def home
    @recipients = ENV['RECIPIENTS']
  end
end
