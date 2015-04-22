describe TrainsController do
  let!(:train) do
    Train.create(
      line:     "El",
      route:    "Red Line",
      run:      "E432",
      operator: "LHill"
    )
  end

  describe "GET #index" do
    it "assigns @trains to all trains" do
      get :index
      expect(assigns(:trains)).to all(be_kind_of(Train))
      expect(assigns(:trains).length ).to eq(Train.all.size)
    end

    it "assigns @trains in order by run" do
      get :index
      expect(assigns(:trains)).to eq(Train.order(:run))
    end
  end

  describe "GET #show" do
    it "assigns @train to the current train" do
      get :show, { id: train.to_param }
      expect(assigns(:train)).to eq(train)
    end

  end

  describe "GET #new" do
    it "creates a new train" do
      get :new
      expect(assigns(:train)).to be_kind_of(Train)
    end
  end

  describe "POST #create" do
    it "creates a new train" do
      post :create, { train: {line: "fake line", run: "fake run"} }
      expect(assigns(:train)).to be_kind_of(Train)
    end

    it "assigns a newly created train as @train" do
      post :create, { train: {id: train.to_param} }
      expect(assigns(:train)).to be_kind_of(Train)
    end

    it "redirects to the created train" do
      post :create, { train: {id: (train.to_param) } }
      response.should redirect_to "/trains/#{Train.last.id}"
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested train as @train" do
      delete :destroy, { id: train.to_param }
      expect(assigns(:train)).to eq(train)
    end

    it "destroys the requested train" do
      expect {
        delete :destroy, id: train.id
      }.to change(Train, :count).by(-1)
    end

    it "redirects to the trains list" do
      delete :destroy, { id: train.to_param }
      response.should redirect_to "/trains"
    end
  end
end