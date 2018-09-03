require "dependencies"

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
    "automake" -> autoconf;
    "bison";
    "gd" -> fontconfig;
    "gd" -> freetype;
    "gd" -> jpeg;
}
    EXP

    result = Dependencies::brew_to_dotfile(dependencies)

    expect(result).to eq(expected_result)
  end
end
