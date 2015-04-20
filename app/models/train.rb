class Train < ActiveRecord::Base
  validates :run, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: %w[line route run operator]) do |row|
      Train.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate(headers: %w[TRAIN_LINE, ROUTE_NAME, RUN_NUMBER, OPERATOR_ID], write_headers: true) do |csv|
      Train.all.each { |train| csv << [train.line, train.route, train.run, train.operator] }
    end
  end
end