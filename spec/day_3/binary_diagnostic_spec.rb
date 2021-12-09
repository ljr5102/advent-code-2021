require_relative "../../day_3/binary_diagnostic"

describe "#gamma_rate" do
  let(:report) do
    [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]
  end

  subject { gamma_rate(report) }

  it { is_expected.to eq(22) }
end

describe "#epsilon_rate" do
  let(:report) do
    [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]
  end

  subject { epsilon_rate(report) }

  it { is_expected.to eq(9) }
end

describe "#oxygen_generator_rating" do
  let(:report) do
    [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]
  end

  subject { oxygen_generator_rating(report) }

  it { is_expected.to eq(23) }
end

describe "#co2_scrubber_rating" do
  let(:report) do
    [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010",
    ]
  end

  subject { co2_scrubber_rating(report) }

  it { is_expected.to eq(10) }
end
