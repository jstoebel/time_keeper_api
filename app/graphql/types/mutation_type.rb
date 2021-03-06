Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createTask, function: Resolvers::CreateTask.new
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :createInterval, function: Resolvers::CreateInterval.new
end
