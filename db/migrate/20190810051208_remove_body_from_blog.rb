class RemoveBodyFromBlog < ActiveRecord::Migration[6.0]
  def up
    Blog.find_each do |blog|
      blog.body.body = "<div>#{blog[:body]}</div>"
      blog.save!
    end

    remove_column :blogs, :body, :text
  end

  def down
    add_column :blogs, :body, :text
  end
end
