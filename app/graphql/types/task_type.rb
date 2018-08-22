# defines a new GraphQL type
Types::TaskType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'Task'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
end
