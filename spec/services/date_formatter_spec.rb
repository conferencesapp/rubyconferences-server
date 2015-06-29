require "rails_helper"

describe DateFormatter do
  describe "#to_s" do
    context "start date and end date are same" do
      it "results formatted start date" do
        date = Date.parse("June 29, 2015")
        formatter = DateFormatter.new(date, date)

        expect(formatter.to_s).to eq("June 29, 2015")
      end
    end

    context "start_date and end_date are not similar" do
      it "results formatted start and end date" do
        start_date = Date.parse("June 23, 2015")
        end_date = Date.parse("June 25, 2015")
        formatter = DateFormatter.new(start_date, end_date)

        expect(formatter.to_s).to eq("June 23-25, 2015")
      end

      it "results formatted start and end date with different months" do
        start_date = Date.parse("June 29, 2015")
        end_date = Date.parse("July 1, 2015")
        formatter = DateFormatter.new(start_date, end_date)

        expect(formatter.to_s).to eq("June 29 - July 01, 2015")
      end

      it "results formatted start and end date with different years" do
        start_date = Date.parse("Dec 31, 2015")
        end_date = Date.parse("Jan 1, 2016")
        formatter = DateFormatter.new(start_date, end_date)

        expect(formatter.to_s).to eq("December 31, 2015 - January 01, 2016")
      end
    end
  end
end
