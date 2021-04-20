require_relative '../lib/ceaser_cypher'

describe "transform letter method" do
  it "should return the letter move of n position to the right/left" do
    expect(transform_letter("a", 3)).to eq("d")
    expect(transform_letter("c", 10)).to eq("m")
    expect(transform_letter("o", -3)).to eq("l")
    expect(transform_letter("F", 14)).to eq("T")
    expect(transform_letter("Z", 2)).to eq("B")
    expect(transform_letter("y", 4)).to eq("c")
    expect(transform_letter("E", -5)).to eq("Z")
    expect(transform_letter("E", 54)).to eq("G")
  end
end

describe "transform word method" do
  it "should return the whole word with all its letters move of n position to the right/left" do
    expect(transform_word("Les", 3)).to eq("Ohv")
    expect(transform_word("saucisson", -3)).to eq("pxrzfpplk")
    expect(transform_word("Pain", 1)).to eq("Qbjo")
    expect(transform_word("Cannards", 25)).to eq("Bzmmzqcr")
    expect(transform_word("Telephone", 773)).to eq("Mxexiahgx")
  end
end

describe "ceaser cypher method" do
  it "should return the whole word with all its letters move of n position to the right/left" do
    expect(ceaser_cypher("Pouet pouet cacahuete", 3)).to eq("Srxhw srxhw fdfdkxhwh")
    expect(ceaser_cypher("ET telephone maison", -123)).to eq("LA alslwovul thpzvu")
    expect(ceaser_cypher("Kebab tomate salade oignon", -8)).to eq("Cwtst lgeslw ksdsvw gayfgf")
    expect(ceaser_cypher("qui veut gagner de largent en masse", -4)).to eq("mqe raqp cwcjan za hwncajp aj iwooa")
    expect(ceaser_cypher("Mangeons du fromage", 11)).to eq("Xlyrpzyd of qczxlrp")
    expect(ceaser_cypher("The Hacking Project", 26)).to eq("The Hacking Project")
  end
end