# frozen_string_literal: true

module Mutations
  class PostCreate < BaseMutation
    description "Creates a new post"

    field :post, Types::PostType, null: false

    argument :user_id, Integer, required: true
    argument :title, String, required: true
    argument :content, String, required: true

    def resolve(**kwargs)
      authenticate!
      post = ::Post.new(**kwargs)
      raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save

      { post: post }
    end
  end
end
