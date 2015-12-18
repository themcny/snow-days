class Resort < ActiveRecord::Base
  # Remember to create a migration!
  has_many :reports
  belongs_to :favorites
  def current_report
    self.reports.last
  end
end
