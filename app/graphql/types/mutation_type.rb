module Types
  class MutationType < Types::BaseObject
    field :post_create, mutation: Mutations::PostCreate
    field :user_create, mutation: Mutations::UserCreate
  end
end
