class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @q = Article.ransack(params[:q])
        @articles = @q.result(distinct: true)
    end
end
