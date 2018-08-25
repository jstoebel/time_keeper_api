Types::IntervalType = GraphQL::ObjectType.define do
  name 'Interval'

  field :id, types.ID
  field :user, -> { Types::UserType }
  field :task, -> { Types::TaskType }
  field :start_time, !types.String
  field :end_time, !types.String
  field :headline, !types.String
  field :reflection, !types.String

end
