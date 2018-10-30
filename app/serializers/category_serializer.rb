class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :questions, serializer: QuestionSerializer
end
