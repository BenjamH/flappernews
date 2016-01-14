class Post < ActiveRecord::Base
  has_many :comments

  before_save :default_upvote_count

  def as_json(options = {})
    super(options.merge(include: :comments))
  end

  def default_upvote_count
    self.upvotes ||= 0;
  end

end
