class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    #render plain: params[:article].inspect
    #if @article.save
      #redirect_to @article
    #else
      #render 'new'
    #end
    respond_to do |format|
      if @article.save
        flash[:success] = 'New article was successfully created.'
        format.html { redirect_to @article }
      else
        flash[:danger] = 'There was a problem creating the article.'
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    #if @article.update(article_params)
      #redirect_to @article
    #else
      #render 'edit'
    #end
    respond_to do |format|
      if @article.update(article_params)
        flash[:success] = 'New article was successfully updated.'
        format.html { redirect_to @article }
      else
        flash[:danger] = 'There was a problem updating the article.'
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  # private: need to be at end of class
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
