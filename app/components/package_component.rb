# frozen_string_literal: true

class PackageComponent < ViewComponent::Base
  def initialize(package:)
    @package = package
  end
end
