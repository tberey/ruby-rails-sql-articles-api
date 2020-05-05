module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC'); # Query db and order artciles by date.
                render json: {status: 'SUCCESS', message:'Loaded articles', data:articles}, status: :ok
            end

            # Handle GET Request.
            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded article', data:article}, status: :ok
            end

            # Handle Create/POST Request.
            def create
                article = Article.new(article_params)

                if article.save
                    render json: {status: 'SUCCESS', message:'Saved article', data:article}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Article was not saved!', data:article.errors}, status: :unprocessable_entity
                end
            end
            
            # Handle DELETE Request.
            def destroy
                article = Article.find(params[:id])

                article.destroy
                if article.destroy
                    render json: {status: 'SUCCESS', message:'Deleted article', data:article}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Article was not deleted!', data:article.errors}, status: :unprocessable_entity
                end
            end

            # 
            def update
                article = Article.find(params[:id])

                if article.update_attributes(article_params)
                    render json: {status: 'SUCCESS', message:'Updated article', data:article}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Article was not updated!', data:article.errors}, status: :unprocessable_entity
                end
            end

            # Allow and specify the url paramters to be handled with a request.
            private
            def article_params
                params.permit(:title, :body)
            end
        end
    end
end