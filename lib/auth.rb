module Auth

  # error for when a user can't be identified
  def not_logged_in
    GraphQL::ExecutionError.new('User could not be identified')
  end
end