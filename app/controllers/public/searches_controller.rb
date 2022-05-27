class Public::SearchesController < ApplicationController

  def search
    @content = params[:content]
    @products = Product.search_for(@content)
  end
end
