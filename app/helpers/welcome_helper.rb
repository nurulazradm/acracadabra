module WelcomeHelper
  def show_result(recipients)
    if recipients.blank?
      render partial: 'error'
    else
      render partial: 'success'
    end
  end
end
