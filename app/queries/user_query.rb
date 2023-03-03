class UserQuery
  module Scopes

    def filter_by_ids(ids)
      return self if ids.blank?
      where(id: ids)
    end

    def filter_by_first_name(first_name)
      return self if first_name.blank?
      where(first_name: first_name)
    end

    def filter_by_keyword(keyword)
      return self if keyword.blank?
      where("LOWER(users.first_name) LIKE LOWER(?) or LOWER(users.last_name) LIKE LOWER(?) or LOWER(users.maiden_name) LIKE LOWER(?)
             or LOWER(email) LIKE LOWER(?) or LOWER(phone) LIKE LOWER(?) or LOWER(username) LIKE LOWER(?)
             or LOWER(university) LIKE LOWER(?) or LOWER(eye_color) LIKE LOWER(?) or LOWER(addresses.address) LIKE LOWER(?)
             or LOWER(addresses.city) LIKE LOWER(?) or LOWER(addresses.state) LIKE LOWER(?) or LOWER(companies.department) LIKE LOWER(?)
             or LOWER(companies.name) LIKE LOWER(?) or LOWER(companies.title) LIKE LOWER(?)",
             "%#{keyword}%", "%#{keyword}%", "%#{keyword}%","%#{keyword}%", "%#{keyword}%",
             "%#{keyword}%","%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%",
             "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end

    def sort_result(sort_key, sort_direction)
      sort_key = "id" if !sort_key
      sort_direction = "desc" if !sort_direction
      self.order("#{sort_key} #{sort_direction}")
    end

    def paginate(page, per_page)
      page = 1 if !page
      per_page = 10 if !per_page
      self.page(page).per(per_page)
    end
  end

  def self.paginated_filter(params)
    User.joins(:company, :address)
      .extending(Scopes)
      .filter_by_ids(params[:ids])
      .filter_by_first_name(params[:first_name])
      .filter_by_keyword(params[:keyword])
      .sort_result(params[:sort_key],params[:sort_direction])
      .paginate(params[:page], params[:per_page])
  end

  def self.filter_by_ids(ids)
    User
      .extending(Scopes)
      .filter_by_ids(ids)
  end
end