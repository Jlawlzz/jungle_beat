require 'minitest/autorun'
require './jungle_beat'
require './node'

class JungleBeatTest < MiniTest::Test

  #node_test

  def test_node_holds_data
    node_1 = Node.new('data')
    assert_equal 'data', node_1.node
  end

  def test_node_links_next
    head = Node.new('head')
    node_1 = Node.new('data')
    head.next = node_1
    assert_equal node_1, head.next
  end

  #jungle_beats_test

  def test_has_head?
    jb = JungleBeat.new('bop')
    assert jb.head?
  end

  def test_has_tail?
    jb = JungleBeat.new('bop beep')
    jb.tail
    assert jb.tail?
  end
end
