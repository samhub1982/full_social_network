require 'spec_helper'

describe "codes/new.html.erb" do
  before(:each) do
    assign(:code, stub_model(Code,
      :encrypted_code => "MyString",
      :salt => "MyString"
    ).as_new_record)
  end

  it "renders new code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => codes_path, :method => "post" do
      assert_select "input#code_encrypted_code", :name => "code[encrypted_code]"
      assert_select "input#code_salt", :name => "code[salt]"
    end
  end
end
