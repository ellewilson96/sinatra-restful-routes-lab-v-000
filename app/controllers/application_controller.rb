class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipes = @Recipe.create(params)
    redirect to 'recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.save
      erb :show
  end

  delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @post.delete
  erb :deleted
end

end
