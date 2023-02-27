# frozen_string_literal: true

# HTTP認証を行い、Localeを設定する
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def pick_locale(selected_locale)
    params[:locale] = selected_locale
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
