require 'spec_helper'

describe "codes/show.html.erb" do
  before(:each) do
    @code = assign(:code, stub_model(Code,
      :encrypted_code => "Encrypted Code",
      :salt => "Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Salt/)
  end
end
