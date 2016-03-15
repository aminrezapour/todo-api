class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
  
end
