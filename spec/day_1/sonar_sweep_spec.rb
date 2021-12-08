require_relative "../../day_1/sonar_sweep.rb"

describe "#depth_increases" do
  subject { depth_increases(values) }

  let(:values) do
    [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  end

  it { is_expected.to eq (7) }
end

describe "#window_depth_increases" do
  subject { window_depth_increases(values) }

  let(:values) do
    [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  end

  it { is_expected.to eq(5) }
end
