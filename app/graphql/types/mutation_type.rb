Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createTask, function: Resolvers::CreateTask.new
end
