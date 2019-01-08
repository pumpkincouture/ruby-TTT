require_relative 'spec_helper.rb'

describe GameFactory do

  before :each do
    @game_factory = GameFactory.new
    @game_factory.create
  end

  it "creates Human Player instance" do
    expect(@game_factory.human_player).to eq(@game_factory.human_player)
  end

  it "creates Computer Player instance" do
    expect(@game_factory.computer_player).to eq(@game_factory.computer_player)
  end

  it "creates User Interface instance" do
    expect(@game_factory.ui).to eq(@game_factory.ui)
  end

  it "creates Board instance" do
    expect(@game_factory.board).to eq(@game_factory.board)
  end

  it "creates Rules instance" do
    expect(@game_factory.rules).to eq(@game_factory.rules)
  end
end
