class NoteSerializer < ActiveModel::Serializer
  embed :id
  attributes :id, :title, :body, :category_id
  has_one :category
end
