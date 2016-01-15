class ChangeColumnPostsUpvoteDefault < ActiveRecord::Migration

  def up
    Post.where(upvotes: nil).update_all(upvotes: 0)
    change_column_default :posts, :upvotes, 0
  end

  def down
    change_column_default :posts, :upvotes, nil
  end

end