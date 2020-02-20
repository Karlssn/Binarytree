import java.lang.reflect.Array; //<>//
import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;


public List<Integer> list = new ArrayList<Integer>(); 
public Boolean first = true;
public Node root;
public BinaryTree tree;
void setup() {
textSize(18);
  list.add(1); 
  list.add(3); 
  list.add(4);
  list.add(11);
  list.add(9);
  list.add(2);
  list.add(12);
  size(1600, 1000);
  background(0);
  frameRate(1);
}
void draw() {
  if (first) {
    root = new Node(1, 8, 1600/2, 100);
    tree = new BinaryTree(root);
    delay(1000);
    first = false;
  }else{
  if (list.size() > 0)
    addChild(tree);
}}


void addChild(BinaryTree t) {  
  int temp = list.get(0);
  list.remove(0);
  t.add(temp);
  delay(3000);
}

class Node {
  int value;
  int x;
  int y;
  int level;
  Node left;
  Node right;
  Node parent;

  Node(int level, int value, int x, int y) {
    this.value = value;
    right = null;
    left = null;
    this.x =x;
    this.y =y;
    this.level = level;
    fill(254);
    ellipse(x, y, 100, 100);
    fill(2);
    textAlign(CENTER);
    text(Integer.toString(value), x, y);
  }
}

class BinaryTree {

  Node root;
  public void add(int value) {
    // Since root is never null, we dont need to check prev==null 
    stroke(255,204,0);
    fill(0,0,0);
    rect(0,0,200,200);
    addRecursive(value, root, null);
  }

  private Node addRecursive(int value, Node n, Node prev) {
    if (n==null) {
      int scale= 500/prev.level;
      if (value > prev.value) {
        stroke(255, 204, 0);
        line(prev.x, prev.y, prev.x+scale, prev.y+100);
        return new Node(prev.level+1, value, prev.x+scale, prev.y+100);
      } else {
        stroke(255, 204, 0);
        line(prev.x, prev.y, prev.x-scale, prev.y+100);
        return new Node(prev.level+1, value, prev.x-scale, prev.y+100);
      }
    }
    fill(255,255,255);
    textAlign(CENTER);
    text("Compare "+Integer.toString(value) + " with " + Integer.toString(n.value), 100, n.level*20);
    if (n.value>value) {
      n.left = addRecursive(value, n.left, n);
    } else if (n.value < value) {
      n.right = addRecursive(value, n.right, n);
    }
    return n;
  }

  BinaryTree(Node node) {
    root=node;
  }
}
