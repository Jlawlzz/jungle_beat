require './node'
require 'pry'

class JungleBeat

  attr_reader :head, :tail, :rate, :voice
  attr_accessor

  def initialize(input = nil)
    @head = nil
    filter_input(input)
  end

  def play
    `say -r 500 -v Alice "#{all}"`
    count
  end

  def head?
    @head != nil
  end

  def tail?
    @tail != nil
  end

  def find_tail
    node = @head
    if @head.next == nil
      @tail = @head
    else
      until node.next == nil
        node = node.next
        @tail = node
      end
    end
  end

  def filter_input(pre_input)
    accept_input = ['tee', 'dep', 'dee', 'deep','dop', 'doop', 'bop', 'boop', 'beep', 'blop', 'la', 'na']
    input = pre_input.split.select do |word|
      accept_input.include?(word)
    end
    build_link_list(input)
  end

  def build_link_list(input)
    if input.size != 0
      node = Node.new(input[0])
      if @head == nil
        @head = node
        input.shift
        node = @head
      else
        @data = node
        input.shift
        node = @data
      end
      input.each do |word|
        node.next = Node.new(word)
        node = node.next
      end
    else
      @head = Node.new(input)
    end
    count
  end

  def count
    node = @head
    count = 1
    find_tail

    until node.next == nil
      count += 1
      node = node.next
    end
    return count
  end

  def append(input)
    find_tail
    filter_input(input)
    @tail.next = @data
    input.split.count
  end

  def prepend(input)
    old_head = @head
    @head = nil
    filter_input(input)
    find_tail
    @tail.next = old_head
    input.split.count
  end

  def include?(input)
    node = @head
    until node.next == nil
      value = true if node.node == input
      node = node.next
    end
    value
  end

  def pop(input = 1)
    pop_bin = []
    input.times do
      node = @head
      until node.next == nil
        node_last = node
        node = node.next
      end
      node_pop = node_last.next
      node_last.next = nil
      pop_bin << node_pop.node
    end
    pop_bin.reverse.join(' ')
  end

  def find(num, value)
    node = @head
    find_bin = []
    counter = 1
    until num == counter
      counter += 1
      node = node.next
    end
    counter = 0
    until value == counter
      find_bin << node.node
      counter += 1
      node = node.next
    end
    find_bin.join(' ')
  end

  def all
    node = @head
    all_bin = []
    until node.next == nil
      all_bin << node.node
      node = node.next
    end
    all_bin << node.node
    all_bin.join(' ')
  end

  def insert(num, input)
    node = @head
    counter = 1
    filter_input(input)
    until num == counter
      node = node.next
      temp_head = node.next
      counter += 1
    end
    node.next = @data
    find_tail
    @tail.next = temp_head
    all
  end
end

binding.pry
