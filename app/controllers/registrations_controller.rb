class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
  # after_update_path_forメソッドはDeviseが用意しているメソッドです。アカウントをアップデートさせた後、どのパスに遷移させるかを指定できます。
end
