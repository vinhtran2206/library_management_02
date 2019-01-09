module UsersHelper
  def gravatar_for(user, size: Settings.user_helper.gravatar_length)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.full_name, class: "gravatar")
  end

  def gender_for (user)
    select_tag :gender, options_for_select([ Settings.user_helper.male,
      Settings.user_helper.female ], Settings.user_helper.male)
  end
end
