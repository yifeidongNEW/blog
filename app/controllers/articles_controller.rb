class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new()
        p "卧槽这个controller可以热更新？"
    end

    def create
        # render plain: params[:article].inspect

        @article = Article.new(params.require(:article).permit(:title, :text, :isprivate))
        
        @article.save
        redirect_to @article
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :isprivate)
        end
end
