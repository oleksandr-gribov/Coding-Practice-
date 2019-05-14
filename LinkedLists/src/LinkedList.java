public class LinkedList {

    Node head;


    // print the list
    public void printList() {
        Node n = head;

        while (n != null) {
            System.out.println(n.value);
            n = n.next;
        }
    }


    public static void main (String[] args) {

        LinkedList myLList = new LinkedList();
        myLList.head = new Node(1);
        Node second = new Node( 2);
        Node third = new Node (3);

        myLList.head.next = second;
        second.next = third;

        myLList.printList();
    }
}
