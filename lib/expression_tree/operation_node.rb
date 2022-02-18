# frozen_string_literal: true

module ExpressionTree
  class WrongOperandError < StandardError; end;

  class OperationNode
    def initialize(left, right)
      @left = left
      @right = right
    end

    def result
      raise_wrong_operand_error unless left_operand_supports_operation?

      calculate_result
    end

    def to_s
      string_representation
    end

    private
    attr_reader :left, :right

    def raise_wrong_operand_error
      raise WrongOperandError.new(
        "Left operand '#{left.result.inspect}' doesn't support '#{operator_string}'"
      )
    end

    def left_operand_supports_operation?
      left.result.respond_to?(operator)
    end

    def operator
      raise NotImplementedError
    end

    def calculate_result
      left.result.send(operator, right.result)
    end

    def string_representation
      "(#{left.to_s} #{operator_string} #{right.to_s})"
    end

    def operator_string
      raise NotImplementedError
    end
  end
end
