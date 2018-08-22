Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :allTasks, !types[Types::TaskType] do
    # resolve would be called in order to fetch data for that field
    resolve ->(obj, args, ctx) { Task.all }
  end
end