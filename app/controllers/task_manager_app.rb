

class TaskManagerApp < Sinatra::Base

  get '/' do
    'hello, world!'
    erb :dashboard
  end

  get '/tasks' do #READ
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do #CREATE - displays a form
    erb :new
  end

  post '/tasks' do #CREATE - takes the data from form
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id| #READ
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  # get '/tasks/:id' do 
  #   @task = TaskManager.find(params[:id].to_i)
  #   erb :show
  # end   THIS is an alternate the the get above

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect "/tasks"
  end

  not_found do
    erb :error
  end

end