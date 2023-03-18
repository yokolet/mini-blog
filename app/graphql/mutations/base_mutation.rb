module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    private

    def current_user
      context[:current_user]
    end

    def authenticate!
      if current_user.blank?
        raise GraphQL::ExecutionError.new "Authentication failed. Please log in."
      end
    end
  end
end
