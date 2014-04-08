module Mercury
  module Authentication

    def can_edit?
      session[:user_id] != nil
    end

  end
end
