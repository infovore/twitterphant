class SearchtermsController < ApplicationController
  before_filter :scope_to_searchterm, :except => %w{index}

  def index
    @searchterms = Searchterm.order("created_at DESC").page(params[:page])
  end

  def refresh
    @searchterm.refresh!
    redirect_to searchterm_tweets_path(@searchterm)
  end

  private

  def scope_to_searchterm
    @searchterm = Searchterm.find(params[:id])
  end
end
