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
    @dishes = Dish.all.order(:id)
    session[:dishes] = @dishes.map { |dish| dish.name }
  end

  def update_dishes
    content = params[:content]
    page_text = content[:food_header]

    (0..3).each do |n|
      dish_full = content["dish_text_#{n}"][:value].split('.')
      dish_title = dish_full[0]
      dish_text = dish_full[1]
      dish_img = content["dish_img_#{n}"][:attributes][:src]
      logger.info "Saving Dish Image: #{dish_img}, Title: #{dish_title}"
      dish = Dish.find_by_name session[:dishes][n]
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
