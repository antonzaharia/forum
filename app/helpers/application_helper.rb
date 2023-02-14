module ApplicationHelper
  include Pagy::Frontend

  def any_notification?
    Current.user&.notifications&.newest_first&.unread&.any?
  end
end
