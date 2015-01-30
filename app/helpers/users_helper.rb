module UsersHelper
	def display_error(field)
    if @registration.errors[field].any?
        raw @registration.errors[field].first+"<br>"
    end
end
end
