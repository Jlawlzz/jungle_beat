require './node'
require 'pry'


class JungleBeat

  attr_reader :head, :tail

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

  def find_tail
    node = @head
    # count?
    until node.next == nil
      node = node.next
      @tail = node
    end
  end

  def build_link_list(input)
    if input
      input = input.split(' ')
      node = Node.new(input[0])

      input.each do |word|
        until @head != nil
          @head = node
          input.shift
          node = @head
        end

        node.next = Node.new(word)
        node = node.next
      end
    end
  end

  def count
    node = @head
    count = 1
    until node.next == nil
      node = node.next
      count += 1
    end
    count
  end

  def append(input)

    # @tail.next = Node.new()
  end

  def prepend(input)
    old_head = @head
    @head = nil
    build_link_list(input)
    find_tail
    @tail.next = old_head
  end
end

# end
