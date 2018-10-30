class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :correct
  belongs_to :question
end
