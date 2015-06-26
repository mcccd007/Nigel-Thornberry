module AnimalsHelper
  def error_messages_on obj, field
  obj.errors.messages[field].join '; ' if obj.errors.messages[field]
end


end
