# frozen_string_literal: true

module Mutations
  class UserCreate < BaseMutation
    description "Creates a new user"

    field :user, Types::UserType, null: false

    argument :email, String, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false

    def resolve(**kwargs)
      user = ::User.new(**kwargs)
      raise GraphQL::ExecutionError.new "Error creating user", extensions: user.errors.to_hash unless user.save

      { user: user }
    end
  end
end
