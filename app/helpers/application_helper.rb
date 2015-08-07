# Comment. ApplicationHelper is the module that contains helpers that are available to our entire application.
# Also, Helper methods can be used to generate markup in a Rails application.
# Helper methods are called just like any other method in a view.
module ApplicationHelper
	def title(title)
		content_for(:title) { "#{title} | "}
	end

	def new_item_link
		if @todo_list && !@todo_list.new_record?
			text, path = "Todo Item", new_todo_list_todo_item_path(@todo_list)
		else
			text, path = "Todo List", new_todo_list_path
		end
		link_to "Add #{text}", path, class: "icon-new right hide-text"
	end
end