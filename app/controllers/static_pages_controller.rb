class StaticPagesController < ApplicationController

  def home
    @posts = Post.all
  end

  def about
  end

  def schedule
  end

  def shows
  end

  def personalities
  end

  def media
  end

  def win
  end

  def events
  end

  def get_involved
  end

  def sports
  end

  def connect
  end
end
