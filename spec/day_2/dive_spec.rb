require_relative "../../day_2/dive"

describe "#final_position" do
  let(:directions) do
    [
      ["forward", 5],
      ["down", 5],
      ["forward", 8],
      ["up", 3],
      ["down", 8],
      ["forward", 2],
    ]
  end

  subject { final_position(directions) }

  it { is_expected.to eq({ horizontal: 15, depth: 10 })}
end

describe "#final_position_v2" do
  let(:directions) do
    [
      ["forward", 5],
      ["down", 5],
      ["forward", 8],
      ["up", 3],
      ["down", 8],
      ["forward", 2],
    ]
  end

  subject { final_position_v2(directions) }

  it { is_expected.to eq({ horizontal: 15, depth: 60 })}
end
