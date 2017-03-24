require "rails_helper"

describe Vacancy::Publish, type: :model do
  describe "#publish" do
    subject { described_class.new(vacancy).publish }

    context "with a valid vacancy" do
      let(:vacancy) { build(:vacancy) }

      it "creates the vacancy on the database" do
        expect { subject }.to change(Vacancy, :count).by(1)
      end
    end

    context "with a vacancy with invalid parameters" do
      let(:vacancy) { build(:vacancy, job_title: nil) }

      it "raises an error" do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
