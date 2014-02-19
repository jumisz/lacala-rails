class SiteController < ApplicationController
 

  def page
  	title = params[:title].capitalize
  	logger.info "Page Title: #{title}"
  	@page = Page.find_by_title title
  	logger.info "Page Found: #{@page.text}"
  end

 
end
