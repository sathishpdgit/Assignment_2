module Products
  class ProductsAPI < Grape::API
 
    format :json
 
    desc "Product List", {
        :notes => <<-NOTE
        Get All Products
         __________________
        NOTE
    }
 
    get do
      Product.all
    end
 
 
    desc "Product By Id", {
        :notes => <<-NOTE
        Get Product By Id
         __________________
        NOTE
    }
 
    params do
      requires :id, type: Integer, desc: "Product id"
    end
 
    get ':id' do
      begin
        product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        error!({ status: :not_found }, 404)
      end
    end
 
    desc "Delete Product By Id", {
        :notes => <<-NOTE
        Delete Product By Id
         __________________
        NOTE
    }
 
    params do
      requires :id, type: Integer, desc: "Product id"
    end
 
    delete ':id' do
      begin
        product = Product.find(params[:id])
        { status: :success } if product.delete
      rescue ActiveRecord::RecordNotFound
        error!({ status: :error, message: :not_found }, 404)
      end
    end
 
    desc "Update Product By Id", {
        :notes => <<-NOTE
        Update Product By Id
                        __________________
        NOTE
    }
 
    params do
      requires :id, type: Integer, desc: "Product id"
      requires :name, type: String, desc: "Product name"
      requires :desi, type: String, desc: "Product desi"
      requires :sale, type: String, desc: "Product sale"
      requires :add, type: String, desc: "Product add"
      requires :phone, type: String, desc: "Product phone"
      requires :city, type: String, desc: "Product city"
      optional :old_desi, type: String, desc: "Product old desi"
      requires :short_description, type: String, desc: "Product old desi"
      optional :full_description, type: String, desc: "Product old desi"
    end
 
    put ':id' do
      begin
        product = Product.find(params[:id])
        if product.update({
                              name: params[:name],
                              desi: params[:desi],
                              sale: params[:sale],
                              add: params[:add],
                              phone: params[:phone],
                              city: params[:city],
                              old_desi: params[:old_desi],
                              short_description: params[:short_description],
                              
                          })
          { status: :success }
        else
          error!({ status: :error, message: product.errors.full_messages.first }) if product.errors.any?
        end
 
 
      rescue ActiveRecord::RecordNotFound
        error!({ status: :error, message: :not_found }, 404)
      end
    end
 
 
    desc "Create Product", {
        :notes => <<-NOTE
        Create Product
         __________________
        NOTE
    }
 
    params do
      requires :name, type: String, desc: "Product name"
      requires :desi, type: String, desc: "Product desi"
      requires :sale, type: String, desc: "Product sale"
      requires :add, type: String, desc: "Product add"
      requires :phone, type: String, desc: "Product phone"
      requires :city, type: String, desc: "Product city"
      optional :old_desi, type: String, desc: "Product old desi"
      requires :short_description, type: String, desc: "Product old desi"
    
    end
 
    post do
      begin
        product =  Product.create({
                                      name: params[:name],
                                      desi: params[:desi],
                                      sale: params[:sale],
                                      add: params[:add],
                                      phone: params[:phone],
                                      city: params[:city],
                                      old_desi: params[:old_desi],
                                      short_description: params[:short_description],
                                      
                                  })
        if product.save
          { status: :success }
        else
          error!({ status: :error, message: product.errors.full_messages.first }) if product.errors.any?
        end
 
 
      rescue ActiveRecord::RecordNotFound
        error!({ status: :error, message: :not_found }, 404)
      end
    end
  end
end