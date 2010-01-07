module PostsHelper
  def admin_new_post_link
    if current_user && current_user.is_admin?
      link_to "Post New Blog Entry", new_post_path
    end
  end

  def admin_edit_post_links(post)
    s = ''
    if current_user && current_user.is_admin?
      s << '['
      s << (link_to "Delete", post, :method => :delete, :confirm => "Are you sure?")
      s << ', ' << (link_to "Edit", edit_post_path(post))
      s << ']'
    end
  end
  
end
