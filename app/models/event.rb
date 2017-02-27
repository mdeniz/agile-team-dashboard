class Event < ApplicationRecord
  belongs_to :user, optional: true

  scope :in_month, ->(start_date) {
    where('start_date >= ?', start_date)
  }

  # Contants
  #
  COLORS = {
    vacation: '#88b200',
    sick: 'red',
    standup: '#0088b2',
    planning: '#ffc125',
    retrospective: '#491b47',
    workshop: '#920076',
    meeting: '#bf4469',
    other: '#c25975'
  }

  # Instance methods
  #
  def full_data
    [event_type, user.try(:github_login), name ].compact.join(' - ')
  end

  def color
    COLORS[event_type.try(:to_sym)]
  end
end

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  start_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_type  :string
#  end_date    :date
#  user_id     :integer
#  type        :string
#  description :text
#
