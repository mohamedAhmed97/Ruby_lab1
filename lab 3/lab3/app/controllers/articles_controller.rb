class ArticlesController < ApplicationController
    check_authorization
    load_and_authorize_resource param_method: :article_params
    
    #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    #index
    def index
        @articles = Article.all
    end    
    #show page    
    def show
        @article = Article.find(params[:id])
    end 
    #update
    def edit
        @article = Article.find(params[:id])
    end
    #update
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    #page of create article    
    def new
        @article = Article.new
    end
    #create 
    def create
        # die dump your request
        #render plain: params[:article].inspect
        @article=Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end 
    #destroy
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end 
     #get request from form
     private
        def article_params
        params.require(:article).permit(:title, :text,:user_id).merge(user_id: current_user.id)
        end 
       
         
end
