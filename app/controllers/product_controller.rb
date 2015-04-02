class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def new
    # nothing needed.  Just a form. can we use same form as create!?
    # form creates
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
  end

  def create

    name = params[:name]
    description = params[:description]
    pricing = params[:pricing]

    product = Product.new
    product[:name] = name
    product[:description] = description
    product[:pricing] = pricing
    product.save
    if product.errors then
      flash[:alert] = 'Error creating the new item'
    else
      flash[:notice] = 'New item created just fine'
    end

    redirect_to('/')
  end

  def update
    # note - recommended to use integer field and then acts_as_dollars to conver 234 to 2.34
    id = params[:id]
    name = params[:name]
    description = params[:description]
    pricing = params[:pricing]
    # should be coming in as float from HTML5 number field.
    # pricing = '%.2f' % pricing.delete( "$" ).to_f

    product = Product.find(id)
    product[:name] = name
    product[:description] = description
    product[:pricing] = pricing

    puts ":::: prod: "+pricing.to_s

    if !product.valid? then
      flash[:alert] = product.errors.full_messages
    else
      product.save # assume no db errors right now
      flash[:notice] = name+' updated successfully'
    end
    redirect_to('/')

  end

  def destroy
     id = params[:id]
     if id then
       if Product.destroy(id).errors.any? then
          flash[:alert] = Product.destroy.errors.full_messages
       else
          flash[:notice] = 'The product was removed from your inventory'
       end
     else
        flash[:alert] = 'The product ID was not a numeric value'
     end
     redirect_to('/')
  end

end
