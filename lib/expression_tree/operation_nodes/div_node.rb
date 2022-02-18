# frozen_string_literal: true

module ExpressionTree
  class DivNode < OperationNode
    private

    def operator
      :/
    end

    def operator_string
      "÷"
    end
  end
end
