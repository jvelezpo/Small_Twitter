module ApplicationHelper
	
	#Return a title on a per-page basis.
	def title
		base_title = "Ruby On Rails" 
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("rails.png", :alt => "Sample app", :class => "round")
	end
	
	def javascript(*files)
		content_for(:head) { javascript_include_tag(*files) }
	end
end
