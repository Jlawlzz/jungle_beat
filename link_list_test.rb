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

  def test_correct_head?
    jb = JungleBeat.new('bop beep')
    assert_equal 'bop', jb.head.node
  end

  def test_has_tail?
    jb = JungleBeat.new('bop beep')
    jb.find_tail
    assert jb.tail?
  end

  def test_tail_class?
    jb = JungleBeat.new('beep bop boop')
    jb.find_tail
    assert Class, jb.tail.class
  end

  #why only work with three or more?
  def test_has_correct_tail?
    jb = JungleBeat.new('bop beep bloop')
    jb.find_tail
    assert_equal 'bloop', jb.tail.node
  end

  #methods

  def test_count
    jb = JungleBeat.new('bop beep bop')
    jb.count
    assert_equal 3, jb.count
  end

  def test_append
    jb = JungleBeat.new('bop beep boop')
    jb.append('peep pop doop')
    jb.find_tail
    assert_equal 'doop', jb.tail.node
  end

  def test_after_append_correct_number_in_list
    jb = JungleBeat.new('bop beep boop')
    jb.append('peep pop doop')
    jb.count
    assert_equal 6, jb.count
  end

  def test_prepend
    jb = JungleBeat.new('bop boop boop')
    jb.prepend('puts bop')
    assert_equal 'puts', jb.head.node
  end

  def test_after_prepend_correct_number_in_list
    jb = JungleBeat.new('bop boop boop')
    jb.prepend('puts bop')
    jb.count
    assert_equal 5, jb.count
  end

  def test_includes?
    jb = JungleBeat.new('bop boop beep')
    jb.includes?('boop')
    assert jb.includes?('boop')
  end

  def test_pop
    skip
    jb = JungleBeat.new('bop boop beep')
    jb.test_pop
  end

end
