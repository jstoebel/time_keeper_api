require 'search_object/plugin/graphql'

class Resolvers::TasksSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Task.all }

  # return type
  type !types[Types::TaskType]

  # inline input type definition for the advance filter
  TaskFilter = GraphQL::InputObjectType.define do
    name 'TaskFilter'

    argument :OR, -> { types[TaskFilter] }
    argument :description_contains, types.String
    argument :name_contains, types.String
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: TaskFilter, with: :apply_filter

  option :filter, type: TaskFilter, with: :apply_filter
  option :first,  type: types.Int,  with: :apply_first
  option :skip,   type: types.Int,  with: :apply_skip

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    # normalize filters from nested OR structure, to flat scope list
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end

  def normalize_filters(value, branches = [])
    # add like SQL conditions
    scope = Task.all
    scope = scope.where('description LIKE ?', "%#{value['description_contains']}%") if value['description_contains']
    scope = scope.where('name LIKE ?', "%#{value['name_contains']}%") if value['name_contains']

    branches << scope

    # continue to normalize down
    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end
