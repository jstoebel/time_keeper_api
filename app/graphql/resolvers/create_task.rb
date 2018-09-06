require 'auth'
class Resolvers::CreateTask < GraphQL::Function
  include Auth
  # arguments passed as "args"
  argument :name, !types.String
  argument :description, !types.String

  # return type from the mutation
  type Types::TaskType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    return not_logged_in(ctx) if ctx[:current_user].nil?
    Task.create!(
      description: args[:description],
      name: args[:name],
      user: ctx[:current_user],
    )
  end
end
