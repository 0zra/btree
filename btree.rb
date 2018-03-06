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
  ary.each do |element|
    puts "zasad radi"
  end
end

build_tree [1,2,3]
