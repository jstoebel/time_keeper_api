Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :allTasks, function: Resolvers::TasksSearch
end
