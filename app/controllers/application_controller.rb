class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception
    #  def after_sign_in_path_for(resource)
    #     if resource.is_a?(User)
    #       authenticated_user_root_path
    #     end
    #  end
    #  def after_sign_in_path_for(resource)
    #     if resource.is_a?(Manager)
    #       authenticated_manager_root_path
    #     end
    #  end
     def after_sign_out_path_for(resource_or_scope)
        root_path
     end
end
