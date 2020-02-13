import java.lang.reflect.Array; //<>//
import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;


public List<Integer> list = new ArrayList<Integer>(); 

public Boolean first = true;
PFont f;
void setup() {
  f = createFont("Arial",16,true); // STEP 2 Create Font
  list.add(1); 
  list.add(3); 
  list.add(4);
  list.add(11);
  list.add(9);

  size(1600, 1000);

  background(0);
  frameRate(1);
}
void draw() {
    textFont(f);
  Node root = new Node(1, 8, 1600/2, 100);
  BinaryTree tree = new BinaryTree(root);
  first=false;
  addChild(tree);
}


void addChild(BinaryTree t) {
  for (int i=0; i< list.size(); i++) {
    t.add(list.get(i));
  }
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
    text(Integer.toString(value), x,y);
  }
}

class BinaryTree {

  Node root;
  public void add(int value) {
    // Since root is never null, we dont need to check prev==null 
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
