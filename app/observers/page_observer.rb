class PageObserver < ActiveRecord::Observer
  def expire_page_fragment(page)
    expire_fragment(:controller => 'admin/pages', :action => 'children', :action_suffix => "page_#{page.id}")
    expire_fragment(:controller => 'admin/pages', :action => 'index', :action_suffix => "page_#{page.id}")
  end

  def after_update(page)
    expire_page_fragment(page)
  end

  def after_destroy(page)
    expire_page_fragment(page)
  end
end
