module Types
  class MutationType < Types::BaseObject
    field :user_register, mutation: Mutations::UserRegister
    field :user_login, mutation: Mutations::UserLogin
    field :post_create, mutation: Mutations::PostCreate
  end
end
