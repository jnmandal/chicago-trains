describe "Features" do
  feature "trains import" do
    before do
      visit trains_path
    end

    scenario "when user is on the main page sees option to import csv" do
      expect(page).to have_content("Import CSV")
    end

    scenario "empty file upload CSV displays error message" do
      click_link "Import CSV"
      click_button "Upload CSV", visible: false
      expect(page).to have_content("No file attached.")
    end

    scenario "can succesfully upload CSV file" do
      click_link "Import CSV"
      attach_file "File", "spec/features/trains.csv", visible: false
      click_button "Upload CSV", visible: false
      expect(page).to have_content("CSV file imported.")
    end

    scenario "data from CSV is present in CRUD after upload" do
      click_link "Import CSV"
      attach_file "File", "spec/features/trains.csv", visible: false
      click_button "Upload CSV", visible: false
      expect(page).to have_content("A999")
    end
  end

  feature "trains export" do
    before do
      visit trains_path
    end

    scenario "when user is on the main page sees option to export csv" do
      expect(page).to have_content("Export CSV")
    end

    scenario "export CSV downloads .csv file" do
      click_link "Export CSV"
      page.response_headers['Content-Type'].should eq "application/octet-stream"
    end
  end

  #headed tests - slow but satisfying
  feature "coffeescript upload form toggle", js: true do
    scenario "clicking trains import shows file upload form" do
      visit trains_path
      click_link "Import CSV"
      expect(page).to have_content("File Upload")
    end
  end
end