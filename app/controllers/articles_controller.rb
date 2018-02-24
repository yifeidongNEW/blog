class ArticlesController < ApplicationController


    def index
        @articles = Article.all

    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article].inspect

        @article = Article.new(article_params)
        @article.create_time = Time.now
        @article.edit_time = Time.now

        if @article.save then
            redirect_to @article
        else
            render 'new'
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :isprivate,:author_name)
        end
end
