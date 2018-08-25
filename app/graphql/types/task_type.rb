# defines a new GraphQL type
Types::TaskType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'Task'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :description, !types.String
  # add postedBy field to Link type
  # - "-> { }": helps against loading issues between types
  # - "property": remaps field to an attribute of Link model
  field :ownedBy, -> { Types::UserType }, property: :user
end
