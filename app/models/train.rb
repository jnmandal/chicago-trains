class Train < ActiveRecord::Base
  before_validation :strip_whitespace
  validates :run, uniqueness: true
  before_save :set_flags

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Train.create(
        line:     row.field(0),
        route:    row.field(1),
        run:      row.field(2),
        operator: row.field(3)
      )
    end
  end

  def self.to_csv
    CSV.generate(headers: %w[TRAIN_LINE, ROUTE_NAME, RUN_NUMBER, OPERATOR_ID], write_headers: true) do |csv|
      self.all.each do |train|
        csv << [train.line, train.route, train.run, train.operator]
      end
    end
  end

  def strip_whitespace
    self.line     = self.line.strip     if self.line
    self.route    = self.route.strip    if self.route
    self.run      = self.run.strip      if self.run
    self.operator = self.operator.strip if self.operator
  end

  def set_flags
    unless set_line_flag || set_route_flag || set_run_flag
      self.flag = false
      self.flag_info = nil
    end
  end

  def set_line_flag
    unless %w[El Metra Amtrak Trolley].include? self.line
      self.flag = true
      self.flag_info = "Check that line data field is correct."
      true
    end
  end

  def set_route_flag
    unless self.route.length > 0
      self.flag = true
      self.flag_info = "Check that route data field is correct."
      true
    end
  end

  def set_run_flag
    unless %w[E M A T].include? self.run[0]
      self.flag = true
      self.flag_info = "Check that run data field is correct."
      true
    end
  end
end