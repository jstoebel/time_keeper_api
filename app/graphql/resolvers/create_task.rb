class Resolvers::CreateTask < GraphQL::Function
  # arguments passed as "args"
  argument :name, !types.String
  argument :description, !types.String

  # return type from the mutation
  type Types::TaskType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Task.create!(
      description: args[:description],
      name: args[:name],
    )
  end
end
