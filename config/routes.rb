Rails.application.routes.draw do
  get 'face_prices/index'

  root 'application#index'

  # 商品录入
  resources :products do
    collection do
      get 'suit'
    end
  end

  # 返回产品属性列表，及每个属性的中英文名称
  get 'category_attributes', to: 'api/v1/category_attributes#index'

  # 获取产品分类树型结构，用于产品表单的分类选择
  get 'product_categories/tree'

  # 价格管理
  resources :domestic_prices
  resources :export_prices, only: [:index, :create]
  resources :face_prices
  post 'export_prices/single_price', as: 'single_price'

  # 素材管理
  get 'product_images/creatable_skus', as: 'creatable_skus'
  resources :product_images, param: :sku_id

  # 商品管理
  resources :site_skus, only: [:index]
  get 'sku/:sku_id/site_skus', to: 'site_skus#site_skus', as: 'sku_site_skus'
  put 'sku/:sku_id/site_skus', to: 'site_skus#update_site_skus'

  # 商品馆管理
  resources :product_halls, only: [:index]

  # 宝贝管理
  resources :baby_managements
  get 'baby_managements/:sku_id/site_skus' => 'baby_managements#site_skus'

  # 系列图管理
  resources :series_images, only: [:index, :create]

  get 'translations', to: 'translations#index'
  get 'translations/export', to: 'translations#export'

  # 用户帐号
  resources :users

  #常见问题
  get 'problems', to: 'problems#index'
  get 'problems/tree', to: 'problems#tree'
  post 'problems/create', to: 'problems#create'

  #购物须知
  get 'guides', to: 'guides#index'
  get 'guides/tree', to: 'guides#tree'
  post 'guides/create', to: 'guides#create'


  # 用户登陆登出
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  namespace :api do
    namespace :duplicator do
      controller :index do
        get 'meta'
        get 'schema'
        get 'max_updated_at'
        post 'updated'
        post 'records'
      end
    end

    get '/docs', to: redirect('/api/docs/v1')
    mount EasySwaggerUi::Engine => 'docs'

    namespace 'v1' do
      # 产品分类
      get 'product_categories' => 'product_categories#index'

      # 产品列表、详情
      get 'products' => 'products#index'
      get 'products/:sku_id' => 'products#show'
    end
  end
end
