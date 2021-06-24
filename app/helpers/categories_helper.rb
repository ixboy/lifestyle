module CategoriesHelper
  def category_article(article, category)
    concat image_tag article.image, class: 'article-image'
    content_tag :div, class: 'article-snippet' do
      concat content_tag(:h3, category.name.titleize, class: 'article-snippet-category')
      concat content_tag(:h2, article.title, class: 'article-snippet-title')
      concat content_tag(:p, article.text.truncate_words(15, omission: '...'), class: 'article-snippet-text')
      concat content_tag(:p, "By:  #{User.find(article.user_id).name.titleize}", class: 'article-snippet-author')
      vote_button(current_user, article)
      vote_count(article)
    end
  end

  private

  def vote_button(user, article)
    return unless logged_in?

    concat button_to 'Vote!', article_votes_path(article[:id]),
                     params: { vote: { user_id: current_user.id, article_id: article.id } },
                     disabled: voted?(user, article), class: 'vote-btn'
  end

  def voted?(user, article)
    Vote.where(user_id: user.id, article_id: article.id).empty? ? false : true
  end

  def vote_count(article)
    votes = Vote.where(article_id: article.id).count
    concat content_tag(:p, votes, class: 'vote-count')
  end
end
