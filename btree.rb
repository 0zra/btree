class Node
  attr_accessor :parent, :lchild, :rchild, :value;

  def initialize value, parent = nil
    @value = value
    @parent = parent
    @lchild = nil
    @rchild = nil
  end

end

def build_tree ary
  tree = nil
  ary.each do |element|
    node = Node.new element
    if tree == nil
      tree = node
      next
    else
      current = tree

      while true do
        if element > current.value && current.rchild == nil
          current.rchild = Node.new(element,current)
          break
        elsif element > current.value && current.rchild != nil
          current = current.rchild
        elsif element <= current.value && current.lchild == nil
          current.lchild = Node.new(element,current)
          break
        else
          current = current.lchild
        end
      end
    end
  end
  tree
end

def bfs tree, data
  queue = [tree]
  while queue != []
    current = queue.pop
    return current if current.value == data
    queue.push(current.lchild) if current.lchild != nil
    queue.push(current.rchild) if current.rchild != nil
  end
  return nil
end

def dfs tree, data
  stack = [tree]
  while stack != []
    current = stack.shift
    return current if current.value == data
    stack.unshift(current.lchild) if current.lchild != nil
    stack.unshift(current.rchild) if current.rchild != nil
  end
  return nil
end

def dfs_rec node, data

  return dfs_rec(node.lchild, data) if   node.lchild != nil && dfs_rec(node.lchild, data) != nil
  return dfs_rec(node.rchild, data) if   node.rchild != nil && dfs_rec(node.rchild, data) != nil
  return node if node.value == data
  return nil

end

def print_branch node
  puts "\t  #{node.parent.value} \n\t  |" if node.parent != nil
  puts "\t  #{node.value}"
  puts "\t / \\"
  print "\t#{node.lchild.value}" if node.lchild != nil
  print "      nil" if node.lchild == nil
  print "   #{node.rchild.value} " if node.rchild != nil
  print "   nil " if node.rchild == nil
end

t = build_tree [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

print_branch dfs(t,6345)
puts "\n-------------------------------------------------------------"
print_branch bfs(t, 23)
puts "\n-------------------------------------------------------------"
print_branch dfs_rec(t,4)
