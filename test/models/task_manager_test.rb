require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

	def setup
		TaskManager.create({ :title    => "a title",
								:description => "a description"})
		TaskManager.create({ :title => "a title2",
								:description => "a description2"})
	end

	def test_it_creates_a_task
		task = TaskManager.find(1)
		assert_equal "a title", task.title
		assert_equal "a description", task.description
		assert_equal 1, task.id
	end

	def test_it_finds_all_tasks
		tasks = TaskManager.all
		expected = 2
		assert_equal expected, tasks.count 
	end

	def test_it_can_find_an_id
		task = TaskManager.find(2)
		assert_equal "a title2", task.title
		assert_equal "a description2", task.description
		assert_equal 2, task.id
	end

	def test_it_can_update
		updated = { :title => "updated a title", :description => "updated a description"}
		TaskManager.update(2, updated)
		task = TaskManager.find(2)
		assert_equal "updated a title", task.title
		assert_equal "updated a description", task.description
		assert_equal 2, task.id
	end

	def test_it_can_destroy
		TaskManager.delete(2)
		tasks = TaskManager.all
		expected = 1
		assert_equal expected, tasks.count
	end

	

end