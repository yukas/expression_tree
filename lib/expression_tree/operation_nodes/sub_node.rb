# frozen_string_literal: true

module ExpressionTree
  class SubNode < OperationNode
    private

    def operator
      :-
    end

    def operator_string
      "-"
    end
  end
end
