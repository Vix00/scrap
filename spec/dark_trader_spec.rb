require_relative "../lib/dark_trader"

describe "Nombre de résultats" do
  it "au maximum 20" do
    expect(get_currencies().count).to be > 20
  end
end