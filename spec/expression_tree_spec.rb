# frozen_string_literal: true

require_relative "../lib/expression_tree"

module ExpressionTree
  describe "Expression tree" do
    let(:tree) do
      DivNode.new(
        AddNode.new(
          ValueNode.new(7),
          MulNode.new(
            SubNode.new(
              ValueNode.new(3),
              ValueNode.new(2)
            ),
            ValueNode.new(5)
          )
        ),
        ValueNode.new(6)
      );
    end

    it "calculates result" do
      expect(tree.result).to eq(2)
    end

    it "builds string representation" do
      expect(tree.to_s).to eq("((7 + ((3 - 2) x 5)) ÷ 6)")
    end

    context "when value is nil" do
      let(:tree) do
        AddNode.new(
          ValueNode.new(nil),
          ValueNode.new(3),
        )
      end

      it "raises an error" do
        expect {
          tree.result
        }.to raise_error(WrongOperandError, "Left operand 'nil' doesn't support '+'")
      end

      it "raises an error" do
        expect {
          tree.to_s
        }.to raise_error(WrongOperandError, "Wrong value: 'nil'")
      end
    end
  end
end
