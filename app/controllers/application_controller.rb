# frozen_string_literal: true

# HTTP認証を行う
class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'shh', password: 'secret'
end
