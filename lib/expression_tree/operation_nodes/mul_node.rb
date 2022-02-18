# frozen_string_literal: true

module ExpressionTree
  class MulNode < OperationNode
    private

    def operator
      :*
    end

    def operator_string
      "x"
    end
  end
end
