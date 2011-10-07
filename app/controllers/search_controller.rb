class SearchController < ApplicationController
  
  layout 'application'
  
  def search
    @result = []
    render 'travel'
  end
  
end