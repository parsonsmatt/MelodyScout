module ApplicationHelper

	def title_text(extra='')
		extra.empty? ? "MelodyScout" : "#{extra} | MelodyScout"
	end
end
