class Resort < ActiveRecord::Base
  has_many :reports
  belongs_to :favorites
  def current_report
    self.reports.last
  end
end
