require 'spec_helper'

describe "Todos" do
  describe "GET /tasks" do
    it "display  everydays task" do
      visit tasks_path
      page.should have_content 'make coffee'
    end
  end
end
