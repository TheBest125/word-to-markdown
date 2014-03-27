require File.join(File.dirname(__FILE__), 'helper')

class TestWordToMarkdownLists < Test::Unit::TestCase

  should "properly parse unnumbered lists" do
    validate_fixture "ul", "- One\n- Two\n- Three"
  end

  should "properly parse numbered lists" do
    validate_fixture "ol", "1. One\n2. Two\n3. Three"
  end

  should "not wrap ol in uls" do
    validate_fixture "ul-ol", "1. One\n2. Two"
  end

  should "parse nested ols" do
    validate_fixture "nested-ol", "1. One\n    1.  Sub one\n    1.  Sub two\n2. Two\n    1.  Sub one\n        1.  Sub sub one\n        1.  Sub sub two\n    1.  Sub two\n3. Three"
  end

  should "parse nested uls" do
    validate_fixture "nested-ul", ""
  end

  should "parse left margin" do
    doc = WordToMarkdown.new "<p style='margin-left: 25px'>foo</p>"
    assert_equal 25, doc.doc.css("p").first.left_margin
  end

  should "parse left margin shorthand" do
    doc = WordToMarkdown.new "<p style='margin: 0 0 0 25px'>foo</p>"
    assert_equal 25, doc.doc.css("p").first.left_margin
  end
end
