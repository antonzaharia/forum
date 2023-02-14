module ApplicationHelper
  include Pagy::Frontend

  def any_notification?
    user_signed_in? && Current.user.notifications.newest_first.unread.any?
  end
end
