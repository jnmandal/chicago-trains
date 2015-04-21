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

    it "has a flag" do
      expect(train.flag).to be_a(FalseClass)
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

  describe "flags" do
    it "doesn't flag a valid entry" do
      expect(train.flag).to be(false)
    end

    it "flags invalid data in line" do
      t = Train.create(
        line:     "Netra",
        route:    "Red Line",
        run:      "E432",
        operator: "LHill"
      )
      expect(t.flag).to be(true)
    end

    it "flags empty data in route" do
      t = Train.create(
        line:     "El",
        route:     " ",
        run:      "E432",
        operator: "LHill"
      )
      expect(t.flag).to be(true)
    end

    it "flags empty data in run" do
      t = Train.create(
        line:     "El",
        run:      " ",
        route:    "Red Line",
        operator: "LHill"
      )
      expect(t.flag).to be(true)
    end

    it "flags invalid data in run" do
      t = Train.create(
        line:     "El",
        run:      "H22",
        route:    "Red Line",
        operator: "LHill"
      )
      expect(t.flag).to be(true)
    end
  end

end


