class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    search_options = {
      created_after: params[:created_after],
      created_before: params[:created_before],
    }
    @q = Article.ransack(params[:q])
    @article_results = @q.result(distinct: true)
  end
end
