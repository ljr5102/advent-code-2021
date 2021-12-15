require_relative "../../day_5/hydrothermal_venture"

describe "#multiple_overlapping_horizontal_vertical" do
  let(:points) do
    [
      [[0, 9], [5, 9]],
      [[8, 0], [0, 8]],
      [[9, 4], [3, 4]],
      [[2, 2], [2, 1]],
      [[7, 0], [7, 4]],
      [[6, 4], [2, 0]],
      [[0, 9], [2, 9]],
      [[3, 4], [1, 4]],
      [[0, 0], [8, 8]],
      [[5, 5], [8, 2]],
    ]
  end

  subject { multiple_overlapping_horizontal_vertical(points) }

  it { is_expected.to eq(5) }
end

describe "#multiple_overlapping_total" do
  let(:points) do
    [
      [[0, 9], [5, 9]],
      [[8, 0], [0, 8]],
      [[9, 4], [3, 4]],
      [[2, 2], [2, 1]],
      [[7, 0], [7, 4]],
      [[6, 4], [2, 0]],
      [[0, 9], [2, 9]],
      [[3, 4], [1, 4]],
      [[0, 0], [8, 8]],
      [[5, 5], [8, 2]],
    ]
  end

  subject { multiple_overlapping_total(points) }

  it { is_expected.to eq(12) }
end
