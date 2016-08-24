require 'spec_helper'

describe "cloudformation-ruby-dsl" do
  include CommandHelpers
  include JsonHelpers
  include FileHelpers
  include AwsHelpers

  context "simplest template" do
    let(:example_template) {"simple_template.rb"}

    it "should create a valid JSON template from the example ruby template" do
      delete_test_file("simple_template.json");
      json = exec_cmd("./#{example_template} expand", :within => "examples").first
      write_test_file("simple_template.json", json)
      validate_cfn_template("simple_template.json")
    end
  end

  # TODO validate examples/cloudformation-ruby-script.rb
end
