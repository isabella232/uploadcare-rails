require "spec_helper"

describe :has_uploadcare_group do
  before(:each) do
    @post = PostWithCollection.new title: "Post title", file: " http://www.ucarecdn.com/19cde26d-e41b-4cf5-923e-f58729c0522a~2/" 
  end

  it "should respond to has_uploadcare_file? method" do
    @post.should respond_to(:has_uploadcare_file?)
  end

  it "should respond to has_uploadcare_group? method" do
    @post.should respond_to(:has_uploadcare_group?)
  end

  it ":has_uploadcare_file? should return true" do
    @post.has_uploadcare_file?.should == false
  end

  it ":has_uploadcare_group? should return false" do
    @post.has_uploadcare_group?.should == true
  end

  it "should have uploadcare file" do
    @post.file.should be_kind_of(Uploadcare::Rails::Group)
  end

  it "file should not be loaded by default" do
    @post.file.loaded?.should == false
  end
end