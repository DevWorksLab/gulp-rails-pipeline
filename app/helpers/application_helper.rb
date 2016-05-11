module ApplicationHelper
  def gulp_asset_path(path)
    path = REV_MANIFEST[path] if defined?(REV_MANIFEST)
    "/assets/#{path}"
  end

  # def page_navigation_links(pages, param_name=:page)
  #   will_paginate(pages, :params => {:anchor => "#job-bar", :class => 'pagination',
  #     :inner_window => 2, :outer_window => 0,
  #     :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe,
  #     :param_name => param_name} )
  # end

end
