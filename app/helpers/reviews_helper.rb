module ReviewsHelper

  def index_heading_for_reviews
    if !!@user
      "#{@user.name}'s Reviews"
    else
      "All Reviews"
    end
  end
end
