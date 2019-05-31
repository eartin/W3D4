# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  responder_id     :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response
  validate :not_respond_to_own_poll

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice 

  has_one :question,
    through: :answer_choice,
    source: :question


    def not_duplicate_response
      errors[:response] << 'has duplicate' if response_already_answered?
    end

    def sibling_responses
      self.question.responses.where.not(id: self.id)
    end

    def response_already_answered?
      sibling_responses.pluck(:responder_id).include?(self.responder_id)
    end

    def not_respond_to_own_poll
      unless self.question.poll.author_id != self.responder_id
        errors[:response] << 'can\'t respond to own poll'
      end
    end
end
