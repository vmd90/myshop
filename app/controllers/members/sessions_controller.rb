class Members::SessionsController < Devise::SessionsController

  def new
    super
  end
  
  protected
    def after_sign_in_path_for(resource)
      store_resouce = stored_location_for(resource)

      if store_resouce.match(site_ad_detail_index_path)
        store_resouce
      else
        site_profile_dashboard_index_path
      end
    end
end
