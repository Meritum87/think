# implementation module Valid
module Valid
  def valid?
    validate!
  rescue StandardError
    false
  end
end
