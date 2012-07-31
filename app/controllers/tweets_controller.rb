class TweetsController < ApplicationController
  before_filter :scope_to_searchterm

  def index
    @tweets = Tweet.where(:searchterm_id => @searchterm.id).order("tweeted_at DESC").page(params[:page])
  end


  private
  
  def scope_to_searchterm
    @searchterm = Searchterm.find(params[:searchterm_id])
  end
end
