class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_vary_header
  include Pundit

  private

  # Fix a bug/issue/by-design(?) of browsers that have a hard time understanding
  # what to do about our ajax search page. This header tells browsers to not cache
  # the current contents of the page because previously when someone filtered results,
  # went to the listing's external site, then hit Back, they'd only see the last
  # ajax response snippet, not the full listings page for their search.
  #
  # Heated multi-year discussion on this issue in Chrome
  # https://code.google.com/p/chromium/issues/detail?id=94369
  #
  # And continued by the Rails team:
  # https://github.com/rails/jquery-ujs/issues/318
  # https://github.com/rails/jquery-rails/issues/121
  def set_vary_header
    if request.xhr?
      response.headers["Vary"] = "accept"
    end
  end
end
