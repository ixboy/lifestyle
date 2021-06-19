module ArticlesHelper
  def display_errors(article)
    return unless article.errors.full_messages.any?

    content_tag :p, "Article could not be saved. #{article.errors.full_messages.join('. ')}", class: 'errors'
  end

  def article_item(article)
    concat link_to Category.find(article.category_id).name.titleize,
                   category_path(Category.find(article.category_id)), class: 'category-title'
    concat image_tag article.image, class: 'category-article-image'
    link_to article.title, article, class: 'category-article-title'
  end

  def author_name(article)
    User.find(article.user_id).name.titleize
  end

  def category_link(article)
    link_to Category.find(article.category_id).name.titleize,
            category_path(Category.find(article.category_id)),
            class: 'category-link'
  end
end
