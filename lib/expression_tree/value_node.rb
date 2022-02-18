# frozen_string_literal: true

module ExpressionTree
  class ValueNode
    def initialize(value)
      @value = value
    end

    def result
      value
    end

    def to_s
      raise_wrong_value if nil_value?

      string_representation
    end

    private
    attr_reader :value

    def raise_wrong_value
      raise WrongOperandError.new("Wrong value: '#{value.inspect}'")
    end

    def nil_value?
      value.nil?
    end

    def string_representation
      value.to_s
    end
  end
end
