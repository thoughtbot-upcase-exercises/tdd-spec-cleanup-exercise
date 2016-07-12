class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :team, presence: true
  validates :user, presence: true

  after_save :mark_user_as_invited

  def event_log_statement
    if !new_record?
      invitation_description
    elsif valid?
      "PENDING - #{invitation_description}"
    else
      "INVALID"
    end
  end

  private

  def invitation_description
    "#{user.email} invited to #{team.name}"
  end

  def mark_user_as_invited
    user.update(invited: true)
  end
end
