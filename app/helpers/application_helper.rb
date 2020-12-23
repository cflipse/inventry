module ApplicationHelper
  def grouped_room_options
    Location.all.group_by(&:room)
      .transform_values { |ls| ls.map { |l| [l.name, l.id] } }
  end

  def grouped_food_options
    Food.all.group_by(&:category)
      .transform_values { |foods| foods.map { |f| [f.name, f.id] } }
  end
end
