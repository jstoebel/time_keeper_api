require 'auth'
class Resolvers::CreateInterval < GraphQL::Function
  include Auth
  argument :taskId, types.ID
  argument :startTime, types.String
  argument :endTime, types.String
  argument :headline, types.String
  argument :reflection, types.String

  type Types::IntervalType

  def call(_obj, args, ctx)
    return not_logged_in(ctx) if ctx[:current_user].nil?
    Interval.create!(
      user: ctx[:current_user],
      task_id: args[:taskId],
      start_time: args[:startTime],
      end_time: args[:endTime],
      headline: args[:headline],
      reflection: args[:reflection],
      )
  end
end
