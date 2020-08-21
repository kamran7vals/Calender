require_relative 'calender'

describe "calender", "event handling" do 
  
  before(:each) do
    @calender = Calender.new    
  end

  it "should add an event to a specific date" do
    @calender.add_event(Time.now, "Test Event Name", "Test Event Description")
    expect(@calender.check_event("Test Event Name")).to be_truthy
  end

  it "should give an error message if the user attempts to add two events with the same name to a specific date" do
    @calender.add_event(Time.now, "Test Event Name", "Test Event Description")
    expect(@calender.add_event(Time.now, "Test Event Name", "Test Event Description")).to be_falsy
  end

  it "should remove an event from a specific date" do
    @calender.add_event(Time.now, "Test Event Name", "Test Event Description")
    @calender.remove_event(Time.now, "Test Event Name")
    expect(@calender.check_event("Test Event Name")).to be_falsy
  end

  it "should give error message if user attempts to remove an event that doesn't exist" do
    @calender.add_event(Time.now, "Test Event Name", "Test Event Description")
    @calender.remove_event(Time.now, "Test Event Name")
    expect(@calender.remove_event(Time.now, "Test Event Name")).to be_falsy
  end

  it "should edit an event on a specific date" do
    @calender.add_event(Time.now, "Test Event Name", "Test Event Description")
    @calender.edit_event(Time.now, "Test Event Name", "Edited Event Description")
    expect(@calender.check_event("Test Event Name")).to be_truthy
  end

  it "should give an error message if the user attempts edit an event that does not exits" do
    expect(@calender.edit_event(Time.now, "Test Event Name", "Edited Event Description")).to be_falsy
  end

end