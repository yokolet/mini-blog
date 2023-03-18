module Mutations
  class UserRegister < BaseMutation
    description "Register a new user"

    field :user, Types::UserType, null: false

    argument :email, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false

    def resolve(**kwargs)
      user = ::User.new(**kwargs)
      if user.save
        user.token = user.to_sgid(expires_in: 6.hours, for: 'graphql')
        { user: user }
      else
        raise GraphQL::ExecutionError.new "Error creating user", extensions: user.errors.to_hash
      end
    end
  end
end
