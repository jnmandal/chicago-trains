class Train < ActiveRecord::Base
  before_validation :strip_whitespace
  validates :run, uniqueness: true

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

  private
    def strip_whitespace
      self.line     = self.line.strip     if self.line
      self.route    = self.route.strip    if self.route
      self.run      = self.run.strip      if self.run
      self.operator = self.operator.strip if self.operator
    end
end