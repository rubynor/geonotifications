require 'spec_helper'

describe "pois/show" do
  before(:each) do
    @poi = assign(:poi, stub_model(Poi,
      :location => "",
      :category => "Category",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Category/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
