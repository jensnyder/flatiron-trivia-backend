class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :difficulty
  has_many :answers
end
