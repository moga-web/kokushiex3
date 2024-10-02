require 'rails_helper'

RSpec.describe ScoreCalculationJob, type: :job do
  describe "enqueued job" do
    let(:examination) { create(:examination) }
    it "matches with enqueued job" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        ScoreCalculationJob.perform_later(examination.id)
      }.to have_enqueued_job.with(examination.id)
    end
  end
end
