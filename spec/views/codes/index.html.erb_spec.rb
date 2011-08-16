require 'spec_helper'

describe "codes/index.html.erb" do
  before(:each) do
    assign(:codes, [
      stub_model(Code,
        :encrypted_code => "Encrypted Code",
        :salt => "Salt"
      ),
      stub_model(Code,
        :encrypted_code => "Encrypted Code",
        :salt => "Salt"
      )
    ])
  end

  it "renders a list of codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
  end
end
