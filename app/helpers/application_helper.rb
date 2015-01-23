module ApplicationHelper

	def title_text(extra='')
		return extra if extra == "MelodyScout"
		extra.empty? ? "MelodyScout" : "#{extra} | MelodyScout"
	end
end
