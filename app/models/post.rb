class Post < ApplicationRecord
  validates:title, {presence:true}
  validates:comment, {length:{maximum:250}}
  validates:user_id, {presence:true}

  def user
    return User.find_by(id: self.user_id)
  end
end
