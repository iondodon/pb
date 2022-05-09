#include <stdio.h>
#define MAX_N 100000


class Queue{
private:
    struct Node{
        int edge;
        Node *next;
    }*tail, *head, *iterator;

public:
    Queue(){
        tail = NULL;
        head = NULL;
    }

    void pushEdge(int vertex){
        if(head == NULL){
            head = new Node;
            head->edge = vertex;
            head->next = NULL;
            tail = head;
        } else {
            Node *temp = new Node;
            temp->edge = vertex;
            temp->next = NULL;
            head->next = temp;
            head = head->next;
        }
    }

    void setIterator(){
        if(tail != NULL){
            iterator = tail;
        }
    }

    bool iteratorOut(){
        return iterator == NULL;
    }

    void iteratorNext(){
        iterator = iterator->next;
    }

    int getIteratorEdge(){
        return iterator->edge;
    }

    ~Queue(){
        tail = NULL;
        head = NULL;
    }
};






class Stack{
private:
    struct Node{
        int vertex;
        Node *previous;
    }*top;

public:
    Stack(){
        top = NULL;
    }

    bool isEmpty(){
        return top == NULL;
    }

    void push(int vertex){
        if(top == NULL){
            top = new Node;
            top->vertex = vertex;
            top->previous = NULL;
        } else {
            Node *temp = new Node;
            temp->vertex = vertex;
            temp->previous = top;
            top = temp;
        }
    }

    int getTopVertex(){
        int vertex = top->vertex;
        Node *temp = top;
        top = top->previous;
        delete temp;
        return vertex;
    }

    ~Stack(){
        top = NULL;
    }
};






class Graph{
private:
    struct Vertex{
        Queue *edges = NULL;
        bool visited = false;
    }vertex[MAX_N+1];

public:
    Graph(){}

    void addEdge(int x, int y){
        if(vertex[x].edges == NULL){
            vertex[x].edges = new Queue;
        }
        vertex[x].edges->pushEdge(y);
    }

    bool isVisited(int vertex){
        return this->vertex[vertex].visited;
    }

    Queue *getEdges(int vertex){
        return this->vertex[vertex].edges;
    }

    void setVisited(int vertex){
        this->vertex[vertex].visited = true;
    }

    ~Graph(){}
};






class Master{
private:
    FILE *fin, *fout;
    int N, M;
    int connComponents;
    Graph *graph;
    Stack *dfsStack;

    void readEdgesConstructTree(){
        for(int i = 1, x, y; i <= M; i++){
            fscanf(fin, "%d%d", &x, &y);
            graph->addEdge(x, y);
            graph->addEdge(y, x);
        }
    }

    void DFS(int source){
        dfsStack->push(source);

        while(!dfsStack->isEmpty()){
            int currentVertex = dfsStack->getTopVertex();
            Queue *edges = graph->getEdges(currentVertex);

            if(edges != NULL) {
                edges->setIterator();
                while (!edges->iteratorOut()) {
                    int edge = edges->getIteratorEdge();
                    if (!graph->isVisited(edge)) {
                        dfsStack->push(edge);
                        graph->setVisited(edge);
                    }
                    edges->iteratorNext();
                }
            }
        }
    }

    void findConnectedComponents(){
        for(int i = 1; i <= N; i++){
            if(!graph->isVisited(i)){
                connComponents++;
                DFS(i);
            }
        }
    }

public:
    Master(){
        fin = fopen("dfs.in", "r");
        fout = fopen("dfs.out", "w");
        fscanf(fin, "%d%d", &N, &M);
        graph = new Graph;
        readEdgesConstructTree();
        connComponents = 0;
        dfsStack = new Stack;
        findConnectedComponents();
        fprintf(fout, "%d", connComponents);
    }

    ~Master(){
        fclose(fin);
        fclose(fout);
        delete graph;
        delete dfsStack;
    }
};





int main() {
    Master *master = new Master;
    delete master;
    return 0;
}