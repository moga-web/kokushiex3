# app/helpers/dashboard_helper.rb
module DashboardHelper
  def score_display(score)
    score.presence || '-'
  end

  def test_year(examination)
    examination.present? ? examination.test.decorate.implementation_year : '模試形式での受験歴がありません'
  end

  def display_pass_mark(examination)
    examination.present? ? examination.test.pass_mark&.total_score : '-'
  end
end
