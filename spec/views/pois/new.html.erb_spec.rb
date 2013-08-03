require 'spec_helper'

describe "pois/new" do
  before(:each) do
    assign(:poi, stub_model(Poi,
      :location => "",
      :category => "MyString",
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new poi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pois_path, "post" do
      assert_select "input#poi_location[name=?]", "poi[location]"
      assert_select "input#poi_category[name=?]", "poi[category]"
      assert_select "input#poi_title[name=?]", "poi[title]"
      assert_select "textarea#poi_description[name=?]", "poi[description]"
    end
  end
end
