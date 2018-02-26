class ArticlesController < ApplicationController


    def index
        @articles = Article.all

    end

    def show
        begin
            @article = Article.find(params[:id])
        rescue => ex
            p ex.class.to_s
            # 边界条件
            if ex.class.to_s == "ActiveRecord::RecordNotFound" then
                # 没找到
                render_response_status_page(404)
                return
            end
        end

        # 私有，则换个方法显示
        if @article.isprivate then
            render json: @article
        end
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
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

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)

            #render json: @article
            #render json: @article,layout: false

            #render xml: @article

            #render plain: "OK"

            redirect_to @article
        else
            render :edit
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :isprivate,:author_name)
        end
end
