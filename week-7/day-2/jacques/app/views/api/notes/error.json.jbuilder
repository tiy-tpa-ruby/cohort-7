json.errors @api_note.errors do |field|
  json.error "#{field.capitalize} #{@api_note.errors[field].join}"
end
