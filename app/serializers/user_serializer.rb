class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
  
end
