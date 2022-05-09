#include <stdio.h>
#define MAX_N 100000



class Queue{
private:
    struct Node{
        int vertex;
        Node *next = NULL;
    };
    Node *tail, *head;

public:
    Queue(){
        tail = NULL;
        head = NULL;
    }

    //for neighbours
    void addNeighbour(int neighbour){
        if(head == NULL){
            head = new Node;
            head->vertex = neighbour;
            tail = head;
        } else {
            Node *node = new Node;
            node->vertex = neighbour;
            head->next = node;
            head = head->next;
        }
    }

    //for BFS
    void bfsPushQueue(int vertex){
        if(head == NULL){
            head = new Node;
            head->vertex = vertex;
            tail = head;
        } else {
            Node *node = new Node;
            node->vertex = vertex;
            head->next = node;
            head = head->next;
        }
    }

    //either queue is empty which means that head == NUll or tail > head and it's NULL
    bool isEmpty(){
        //return (tail == NULL) ? true : false;   or
        return tail == NULL;
    }

    int getTailVertex(){
        if(tail){
            return tail->vertex;
        } else {
            return -1;
        }
    }

    void pullOutTail(){
        if(tail){
            Node *temp = tail;
            tail = tail->next;
            delete temp;
        }
    }

    void moveTailNext(){
        tail = tail->next;
    }

    ~Queue(){
        tail = NULL;
        head = NULL;
    }
};






class Graph{
public:
    struct Vertex{
        Queue neighbours;
        int min_edges = -1;
        bool visited = false;
    }vertex[MAX_N+1];

public:
    Graph(){}

    void addEdge(int x, int y){
        vertex[x].neighbours.addNeighbour(y);
    }

    void setVisited(int vertex_to_set){
        this->vertex[vertex_to_set].visited = true;
    }

    Queue & getNeighbours(int vertex){
        return (Queue &)this->vertex[vertex].neighbours;
    }

    bool isVisited(int vertex_to_check){
        return vertex[vertex_to_check].visited;
    }

    void setMinEdges(int vertex_to_set, int edges){
        vertex[vertex_to_set].min_edges = edges;
    }

    int getMinEdges(int vertex_to_get){
        return vertex[vertex_to_get].min_edges;
    }

    ~Graph(){}
};







class Master{
private:
    FILE *fin, *fout;
    int N, M, S;
    Graph *graph;

    void readEdgesConstructGraph(){
        for(int i = 1, x, y; i <= M; i++){
            fscanf(fin, "%d%d", &x, &y);
            graph->addEdge(x, y);
        }
    }

    void BFS(int source){
        Queue *bfsQueue = new Queue;

        bfsQueue->bfsPushQueue(source);
        graph->setVisited(source);
        graph->setMinEdges(source, 0);

        while(!bfsQueue->isEmpty()){
            int currentVertex = bfsQueue->getTailVertex();
            Queue neighbours = graph->getNeighbours(currentVertex);

            while(!neighbours.isEmpty()){
                int tailVertex = neighbours.getTailVertex();
                if(!graph->isVisited(tailVertex)){
                    bfsQueue->bfsPushQueue(tailVertex);
                    graph->setVisited(tailVertex);
                    graph->setMinEdges(tailVertex, graph->getMinEdges(currentVertex)+1);
                }
                neighbours.moveTailNext();
            }

            bfsQueue->pullOutTail();
        }

        delete bfsQueue;
    }

    void printMinEdges(){
        for(int i = 1; i <= N; i++){
            fprintf(fout, "%d ", graph->getMinEdges(i));
        }
    }

public:
    Master(){
        fin = fopen("bfs.in", "r");
        fout = fopen("bfs.out", "w");
        fscanf(fin, "%d%d%d", &N, &M, &S);
        graph = new Graph();
        readEdgesConstructGraph();
        BFS(S);
        printMinEdges();
    }

    ~Master(){
        delete graph;
        fclose(fin);
        fclose(fout);
    }
};







int main() {
    Master *master = new Master();
    delete master;
    return 0;
}