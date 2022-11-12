class LinkedList
    # attr_accessor :head 
    #reader
    def head
        @head
    end
    # Writer
    def head=(input)
        @head = input
    end

    def initialize
        @head = nil
    end
    def append(value)
        # set head/first node
        if (head.nil?)
            # self to access #writer and not intstance variable
            self.head = Node.new(value, nil)
        else
            lastNode = @head
            while(!lastNode.nextNode.nil?) # checking if the pointer of pointer is empty or not
                lastNode = lastNode.nextNode
            end
            lastNode.nextNode = Node.new(value, nil)
        end
    end
    # returns true if passed value is in the list
    def contains?(value)
        node = head
        while(!node.nil?)
            if(node.value == value)
                return true
            end
            node = node.nextNode
        end
        false
    end

    # assign a new head
    def prepend(value)
        if head.nil?
            self.head = Node.new(value, nil)
        else
            old_head = head
            self.head = Node.new(value, old_head)
        end
    end

    # remove a node from the linked list
    def remove(value)
        return if head.nil?
        node = @head
        prev_node = nil
        until(node.nil?)
            if(node.value == value)
                if !prev_node.nil?
                    prev_node.nextNode = node.nextNode
                    return
                else
                    self.head = nil
                    return
                end
            end
            prev_node = node
            node = node.nextNode
        end
    end
    
    # returns the total number of nodes in the list
    def size
        node = head
        counter = 0
        until node.nil?
            counter += 1
            node = node.nextNode
        end
        counter
    end

    # returns the last node in the list
    def tail
        return self.head = "No nodes available" if head.nil?
        node = head
        prev_node = nil
        until node.nil?
            prev_node = node
            node = node.nextNode
        end
        prev_node
    end

    # return the node at the given index
    def at(index)
        i = 1
        node = head
        while i < index
            node = node.nextNode
            i += 1
        end
        return node
    end

    # remove the last element from the list
    def pop
        return head if head.nil?
        node = head
        prev_node = nil
        until node.nil?
            prev_node = node
            node = node.nextNode
        end
        prev_node = nil
    end

    # return the index (from zero 0) of the node containing value, or nill if not found
    def find(value)
        index = 0
        node = head
        until node.value == value
            node = node.nextNode
            index += 1
        end
        if node.value == nil
            return nil
        else
            return index
        end
    end

    # represent objects as strings
    def to_s
        s = []
        node = @head
        until node.nil?
            s.push("( #{node.value} ) ->")
            node = node.nextNode
        end
        s.push('nil')
        s.join(' ')
    end


    private
    # creating a node
    class Node
        attr_accessor :value, :nextNode

        def initialize(value, nextNode)
            self.value = value
            self.nextNode = nextNode
        end
    end
end

ll = LinkedList.new
ll.append(1912)
ll.append(1955)
ll.append(1976)
ll.append(1992)
ll.remove(9)
ll.pop
puts "size"

puts ll.to_s

# puts ll.size
# puts ll.find(1976)
# puts ll.head.value
# puts ll.head.nextNode.value
# puts ll.find(20)
# puts ll.find(70)
# puts ll.find(10)