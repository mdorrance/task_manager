require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest
	def test_home_page_displays_welcome_message
		# WWUD what would the user do
		# they would got to a webpage
		# they would look at the rendered page w their eyeballs
		# they would hopefully see the stuff theya re looking for
		visit("/")
		assert page.has_content?("Welcome to the Task Manager")
	end

	def test_home_page_displays_greeting_within_css
		visit "/"
		within(".container") do
			assert page.has_content?("Welcome to the Task Manager")
		end
	end

	def test_user_can_fill_in_task_form
		visit("/")
		click_link("New Task")
		assert_equal "/tasks/new", current_path

		fill_in('task[title]', with: "pizza")
		fill_in('task[description]', with: "pepperoni")
		click_button("submit")
		
		assert_equal "/tasks", current_path
		save_and_open_page
		within(".container") do
			assert page.has_content?("pizza")
		end
	end

	def test_user_can_edit_a_task_form
		visit("/tasks/new")

		fill_in("task[title]", with: "pizza")
		fill_in("task[description]", with: "pepperoni")
		click_button("submit")

		assert_equal "/tasks", current_path
		click_link("edit")
		assert_equal "/tasks/1/edit", current_path

		fill_in("task[title]", with: "bread")
		fill_in("task[description]", with: "wheat")
		click_button("Update Task")

		assert_equal "/tasks/1", current_path
		save_and_open_page
		within(".container") do
			assert page.has_content?("bread")
		end

	end

	def test_user_sees_index_of_tasks

	end
end
