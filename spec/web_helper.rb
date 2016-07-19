def add_tag(tag)
  fill_in "tag", with: tag
  click_button "add"
end