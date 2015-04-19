class Train < ActiveRecord::Base
  validates :run, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: %w[line route run operator]) do |row|
      Train.create(row.to_hash)
    end
  end
end
