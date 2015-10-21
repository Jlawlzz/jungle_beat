require './node'
require 'pry'


class JungleBeat

  attr_reader

  def initialize(input = nil)
    @head = nil
    build_link_list(input)
  end

  def head?
    @head != nil
  end

  def tail?
    @tail != nil
  end

  def tail
    node = @head
    until node.next == nil
      node = node.next
      @tail = node
    end
  end

  def build_link_list(input)
    if input
      input = input.split(' ')
      until @head != nil
        @head = Node.new(input[0])
        input.shift
      end

      node = @head

      input.each do |word|
        node.next = Node.new(word)
        node = node.next
      end
    end
  end
end

# end
