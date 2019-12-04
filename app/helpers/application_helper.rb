module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t "app_name"
    page_title ? (page_title + " | " + base_title) : base_title
  end

  def check_auth_controller?
    %w(patients sessions).include?(controller.controller_name) &&
      controller.action_name == "new"
  end

  def numbered params_page, index, per_page
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end
end
