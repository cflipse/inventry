class CategoryCountComponent < ViewComponent::Base
  def initialize(packages:)
    @packages = packages
    super
  end

  def by_category
    @packages.group_by { |p| p.food.category }
  end

  def category_counts
    by_category
      .transform_values(&:count)
      .sort_by(&:first)
  end
end
