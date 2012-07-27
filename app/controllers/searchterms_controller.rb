class SearchtermsController < ApplicationController
  before_filter :scope_to_searchterm, :except => %w{index new create}

  def index
    @searchterms = Searchterm.order("created_at DESC").page(params[:page])
  end

  def new
    @searchterm = Searchterm.new
  end

  def create
    @searchterm = Searchterm.create(params[:searchterm])
    if @searchterm.save
      redirect_to searchterms_path
    else
      render :new
    end
  end

  def destroy
    @searchterm.destroy
    flash[:success] = "Search term deleted."
    redirect_to searchterms_path    
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
