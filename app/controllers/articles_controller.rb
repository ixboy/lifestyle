class ArticlesController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @articles = Article.all
    @most_voted = Vote.count_by_article
    @votes_by_category = Vote.count_by_category
    @categories = Category.prioritize(@votes_by_category).ids
    @featured = Article.find(@most_voted)
    @first = Article.last_by_category(@categories, 0)
    @second = Article.last_by_category(@categories, 1)
    @third = Article.last_by_category(@categories, 2)
    @fourth = Article.last_by_category(@categories, 3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @category = Category.all.map { |c| [c.name, c.id] }
  end

  def edit; end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def require_login
    return unless current_user.nil?

    flash[:alert] = 'Please login to Create an Article'
    redirect_to login_path
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
