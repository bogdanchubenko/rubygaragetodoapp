class Task < ActiveRecord::Base
  require 'date'
  belongs_to :project
  validates :title, presence: true
  default_scope { order('position ASC') }

  def completed?
    complete == true
  end
end
