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
    @page = Page.find_by_title 'Food'
    session[:dishes] = @dishes
  end

  def update_dishes
    content = params[:content]
    page_text = content[:food_header]
    @page = Page.find_by_title 'Food'
    @page[:text] = page_text[:value]
    @page.save!

    (0..3).each do |n|
      dish_title = content["dish_title_#{n}"][:value]
      dish_text = content["dish_text_#{n}"][:value]
      dish_img = content["dish_img_#{n}"][:attributes][:src]
      logger.info "Saving Dish Image: #{dish_img}, Title: #{dish_title}"
      dish = session[:dishes][n]
      dish[:name] = dish_title
      dish[:text] = dish_text
      dish[:image] = dish_img
      dish.save! 
      
    end
    render :text => '{}'

  end

  private

  def find_page
    @title = params[:title].capitalize
    logger.info "Page Title: #{@title}"
    @page = Page.find_by_title @title
  end

 
end
