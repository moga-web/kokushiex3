require 'rails_helper'

RSpec.describe MiniTestSearchForm do
  let(:tag) { create(:tag) }
  let(:params) do
    {
      search: {
        tag_ids: [tag.id],
        question_count: 10
      }
    }
  end
  let!(:form) { described_class.new(params[:search]) }

  describe '#new' do
    it 'params[:search]を受け取りインスタンスが生成される' do
      expect(form.tag_ids).to eq([tag.id])
      expect(form.question_count).to eq(10)
    end
  end

  describe '#search' do
    let!(:question_tags) { create_list(:question_tag, 10, tag:) }

    it 'tag_idsをもとにQuestionを取得する' do
      questions = form.search
      questions.each do |q|
        expect(q.question_tags.pluck(:tag_id)).to include(tag.id)
      end
    end

    it 'question_countをもとに取得する質問数を制限する' do
      questions = form.search
      expect(questions.count).to eq(10)
    end
  end
end
