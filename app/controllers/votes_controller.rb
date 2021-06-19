class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @article = Article.find(vote_params[:article_id])
    @category = Category.find(@article.category_id)

    if @vote.save
      redirect_to category_path(@category.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:article_id, :user_id)
  end
end
