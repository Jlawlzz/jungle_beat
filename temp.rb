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
