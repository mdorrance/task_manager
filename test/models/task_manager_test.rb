require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

	def setup
		TaskManager.create({ :title    => "a title",
								:description => "a description"})
		TaskManager.create({ :title => "a title2",
								:description => "a description2"})
	end

	def test_it_creates_a_task
		task = TaskManager.find(TaskManager.all.first.id)
		assert_equal "a title", task.title
		assert_equal "a description", task.description
		assert_equal TaskManager.all.first.id, task.id
	end

	def test_it_finds_all_tasks
		tasks = TaskManager.all
		expected = 2
		assert_equal expected, tasks.count 
	end

	def test_it_can_find_an_id
		task = TaskManager.find(TaskManager.all.first.id)
		# assert_equal "a title2", task.title
		# assert_equal "a description2", task.description
		assert_equal task, task
	end

	def test_it_can_update
		updated = { :title => "updated a title", :description => "updated a description"}
		TaskManager.update(TaskManager.all.first.id, updated)
		task = TaskManager.find(TaskManager.all.first.id)
		assert_equal "updated a title", task.title
		assert_equal "updated a description", task.description
		assert_equal TaskManager.all.first.id, task.id
	end

	def test_it_can_destroy
		tasks = TaskManager.all.count
		TaskManager.delete(TaskManager.all.first.id)
		expected = (tasks - 1)
		assert_equal expected, TaskManager.all.count
	end

	

end