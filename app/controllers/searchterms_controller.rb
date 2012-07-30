require 'csv'

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

  def export
    tweets = @searchterm.tweets.order("created_at ASC")
    #
    csv_string = CSV.generate do |csv|
      csv << ["Tweeted at", "User", "Tweet URL", "Content"] 
      tweets.each do |tweet|
        csv << [tweet.tweeted_at, tweet.from_user_name, tweet.url, tweet.text]
      end
    end
    send_data(csv_string, :type => 'text/csv; charset=utf-8; header=present', :filename => "#{@searchterm.slugify}.csv")  
    
  end

  private

  def scope_to_searchterm
    @searchterm = Searchterm.find(params[:id])
  end
end
