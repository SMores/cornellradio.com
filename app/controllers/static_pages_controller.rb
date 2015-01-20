class StaticPagesController < ApplicationController

  def home
    @posts = Post.all.limit(5)
    @podcasts = Podcast.all.limit(5)
  end

  def about
  end

  def schedule
    # render layout: 'bare'
  end

  def media
    @posts = Post.all(order: :created_at, limit: 10)
    @podcasts = Podcast.all(order: :created_at, limit: 10)
  end

  def win
  end

  def events
  end

  def get_involved
  end

  def sports
    redirect_to 'http://www.bigredsportsnetwork.org/'
  end

  def connect
  end
end
