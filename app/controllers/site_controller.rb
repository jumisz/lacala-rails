class SiteController < ApplicationController
 

  def page
  	find_page
  	logger.info "Page Found: #{@page.text}"
  end

  def update_page
    find_page
    page_text = (params[:content]) [:page_text]
    logger.info "page_text: #{page_text}"
    @page[:text] = page_text[:value]
    @page.save!
    render :text => '{}'
  end

  def dishes
    @dishes = Dish.all


  end

  private

  def find_page
    @title = params[:title].capitalize
    logger.info "Page Title: #{@title}"
    @page = Page.find_by_title @title
  end

 
end
