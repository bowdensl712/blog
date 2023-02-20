# frozen_string_literal: true

# HTTP認証を行い、set_searchメソッドを実行する
class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'shh', password: 'secret'

  before_action :set_search
end
