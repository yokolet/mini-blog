module Resolvers
  class UserCollectionResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false

    def resolve(**kwargs)
      User.all
    end
  end
end
