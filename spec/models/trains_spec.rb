describe Train do
  let!(:train) do
    Train.create(
      line:     "El",
      route:    "Red Line",
      run:      "E432",
      operator: "LHill"
    )
  end

  describe "properties" do
    it "has a line type" do
      expect(train.line).to be_a(String)
    end

    it "has a route name" do
      expect(train.route).to be_a(String)
    end

    it "has a run number" do
      expect(train.run).to be_a(String)
    end

    it "has an operator" do
      expect(train.operator).to be_a(String)
    end
  end

  describe "validations" do
    it "forces run numbers to be unique" do
      t1 = Train.new(run: "J541")
      t2 = Train.new(run: "J541")
      t1.save
      expect(t2.save).to be(false)
    end
  end
end


