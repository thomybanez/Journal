require "test_helper"

class TaskTest < ActiveSupport::TestCase
    test "should not save category without name" do
        task = Task.new
        assert_not task.save, "Saved the task without a name"
    end
end
