require 'rails_helper'

RSpec.describe TagDecorator do
  describe '#category_color' do
    subject { tag.decorate.category_color }
    context 'major_categoriesの場合' do
      let(:tag) { create(:tag, :major_categories) }
      it 'bg-amber-100を返す' do
        expect(subject).to eq('bg-amber-100')
      end
    end

    context 'special_tagsの場合' do
      let(:tag) { create(:tag, :special_tags) }
      it 'bg-blue-100を返す' do
        expect(subject).to eq('bg-blue-100')
      end
    end

    context 'common_tagsの場合' do
      let(:tag) { create(:tag, :common_tags) }
      it 'bg-green-100を返す' do
        expect(subject).to eq('bg-green-100')
      end
    end
  end
end
