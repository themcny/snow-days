class Resort < ActiveRecord::Base
  # Remember to create a migration!
  has_many :reports

  def self.current_report
    self.reports.last
  end
end
