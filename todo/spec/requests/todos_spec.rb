require 'spec_helper'

describe "Todos" do

before do
	@task = Task.create :task => 'A brand new task'
end

  describe "GET /tasks" do
    it "display  everydays task" do
      Task.create :task => 'make coffee'
      visit tasks_path
      page.should have_content 'make coffee'
    end

    it "create a new task" do
    	visit tasks_path
    	fill_in :Task, :with => 'do some exercise'
    	click_button 'Create Task'
    	current_path.should == tasks_path
    	page.should have_content 'do some exercise'
    end

    it "edit a task" do
  		visit tasks_path
  		find("#task_#{@task.id}").click_link 'Edit'
  		current_path.should == edit_task_path(@task)
  		find_field('Task').value.should eq 'A brand new task'
  		fill_in 'Task', :with => 'Updated task'
  		click_button 'Update Task'
  		page.should have_content 'Updated task'
  		
  	end	
  end
end

describe User do
  before do
  	@user = User.create :email => 'abc@gmail.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
  end
 
  it "sends an email" do 
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button 'Sign in'
    visit tasks_path
    click_button 'Notify'
    ActionMailer::Base.deliveries.last.to.should == [@user.email]
  end
end
