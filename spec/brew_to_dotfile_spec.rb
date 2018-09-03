require "dg"

describe "dotfile" do
  it "creates a dotfile" do
    dependencies = <<-DEPS
autoconf:
automake: autoconf
bison:
gd: fontconfig freetype jpeg
    DEPS

    expected_result = <<-EXP
digraph D {
    "autoconf";
    "automake" [fontcolor=white,style=filled,color=darkslategray];
    "automake" -> "autoconf";
    "bison" [fontcolor=white,style=filled,color=darkslategray];
    "gd" [fontcolor=white,style=filled,color=darkslategray];
    "gd" -> "fontconfig";
    "gd" -> "freetype";
    "gd" -> "jpeg";
}
    EXP

    result = DG::brew_to_dotfile(dependencies)

    expect(result).to eq(expected_result)
  end
end
