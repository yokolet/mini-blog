module Mutations
  class UserLogin < BaseMutation
    description "Login an existing user"

    field :user, Types::UserType, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      user = User.find_by(email: email)
      if user&.authenticate(password)
        user.token = user.to_sgid(expires_in: 6.hours, for: 'graphql')
        { user: user }
      else
        raise GraphQL::ExecutionError.new "Error creating user", extensions: user.errors.to_hash
      end
    end
  end
end
