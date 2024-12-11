require 'rails_helper'

RSpec.describe DashboardHelper do
  describe '#score_display' do
    subject { score_display(score) }

    context 'scoreが存在する場合' do
      let(:score) { 100 }

      it { is_expected.to eq 100 }
    end

    context 'scoreが存在しない場合' do
      let(:score) { nil }

      it { is_expected.to eq '-' }
    end
  end

  describe '#test_year' do
    subject { test_year(examination) }

    let(:test) { create(:test, year: 2023) }

    context 'examinationが存在する場合' do
      let(:examination) { create(:examination, test: test) }

      it { is_expected.to eq '第58回(2023年度)' }
    end

    context 'examinationが存在しない場合' do
      let(:examination) { nil }

      it { is_expected.to eq '模試形式での受験歴がありません' }
    end
  end

  describe '#display_pass_mark' do
    subject { display_pass_mark(examination) }

    let(:test) { create(:test, year: 2023) }
    let!(:pass_mark) { create(:pass_mark, test: test) }

    context 'examinationが存在する場合' do
      let!(:examination) { create(:examination, test: test) }

      it { is_expected.to eq pass_mark.total_score }
    end

    context 'examinationが存在しない場合' do
      let(:examination) { nil }

      it { is_expected.to eq '-' }
    end
  end
end
