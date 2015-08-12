class FoundationFormBuilder < ActionView::Helpers::FormBuilder
	include ActionView::Helpers::TagHelper
	# Comment. CaptureHelper allow us to capture a block of text.
	include ActionView::Helpers::CaptureHelper
	include ActionView::Helpers::TextHelper

	attr_accessor :output_buffer

	# Comment. The following line of code is metaprogramming, which occurs when a program can write features or data at runtime.
	%w(email_field text_field password_field).each do |form_method|
		# Comment. define_method is a Ruby method that defines a method using a string or symbol.
		define_method(form_method) do |*args|
			attribute = args[0]
			options = args	[1] || {}

			options [:label] ||= attribute.to_s.titleize
	 		label_text ||= options.delete(:label)
	 		label_options ||= {}
	 		if errors_on?(attribute)
	 			label_options[:class] = "error"
	 			options[:class] = "error"
	 		end
	 		wrapper do 		
	 			label(attribute, label_text, label_options) +
	 			# Comment. super allow us get access to the original text field method.
	 			super(attribute, options) + errors_for_field(attribute)	
	 		end
		end
	end

 	def submit(text, options={})
 		options [:class] ||= "button radius expand"
 		wrapper do
 			super(text, options)
 		end 		
 	end

 	def wrapper(options={}, &block)
 		content_tag(:div, class: "row") do
 			content_tag(:div, capture(&block), class: "small-12 columns") 	
 		end
 	end

 	def errors_on?(attribute)
 		# Comment. The object property of a form builder gives access to the form object.
 		object.errors[attribute].size > 0
 	end

 	def errors_for_field(attribute, options={})
 		return "" if object.errors[attribute].empty?
 		content_tag(:small, object.errors[attribute].to_sentence.capitalize, class: "error")
 	end
 end