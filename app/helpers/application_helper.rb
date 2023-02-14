module ApplicationHelper
    def set_language(value)
        cookies[:lanuage] = value
    end
end
