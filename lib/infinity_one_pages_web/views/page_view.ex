defmodule InfinityOnePagesWeb.PageView do
  use InfinityOnePagesWeb, :view

  def home_intro do
    content_tag :p do
      [
        gettext("""
          InfinityOne combines the benefits of full-featured team chat with an
          extensible communications platform, build on a highly scalable, highly
          reliable platform.
          """),
        tag(:br),
        gettext("""
          Integrate InfinityOne with your phone system to instantly see who is
          on the phone, call a user, or any posted phone number with a simple click.
          """)
      ]
    end
  end
end
