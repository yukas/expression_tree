# frozen_string_literal: true

module ExpressionTree
  class AddNode < OperationNode
    private

    def operator
      :+
    end

    def operator_string
      "+"
    end
  end
end
