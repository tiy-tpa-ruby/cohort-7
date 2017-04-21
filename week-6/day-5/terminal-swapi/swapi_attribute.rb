module SwapiAttribute
  def define_attributes(attributes, details)
    attributes.each do |attribute|
      define_singleton_method(attribute) do
        details[attribute]
      end
    end
  end
end
