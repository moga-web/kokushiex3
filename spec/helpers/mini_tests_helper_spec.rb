require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MiniTestsHelper. For example:
#
# describe MiniTestsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MiniTestsHelper do
  describe '#correct_answer_icon' do
    subject { helper.correct_answer_icon(selected_answers, question) }

    let(:question) { create(:question) }

    context '正答の場合' do
      let(:correct_choice) { create(:choice, question:, is_correct: true, option_number: 1) }
      # コントローラでハッシュにしている
      let(:selected_answers) { { question.id => [correct_choice.option_number] } }

      it { is_expected.to eq('⭕️') }
    end

    context '誤答の場合' do
      let(:incorrect_choice) { create(:choice, question:, is_correct: false, option_number: 2) }
      # コントローラでハッシュにしている
      let(:selected_answers) { { question.id => [incorrect_choice.option_number] } }

      it { is_expected.to eq('❌') }
    end
  end
end
