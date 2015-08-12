describe 'MotionLocalize' do

  it "should say :hello" do
    :hello._.should == "Hello"
  end

  it "should say hello" do
    'hello'._.should == "Hello"
  end

  it "should show my age" do
    :show_my_age._(age: 36).should == "I'm 36 years old"
  end

end
