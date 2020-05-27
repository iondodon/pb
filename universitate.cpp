#include <fstream>
#include <sstream>
#include <set>
#include <map>
#include <queue>
using namespace std;
ifstream fin("universitate.in");
ofstream fout("universitate.out");
int N,M,K,capacitate[210][210];

void readdata(){
   int port;
   string str;
   fin>>N>>M>>K;
   getline(fin,str);
   for(int i=1;i<=N;i++){
      capacitate[0][i]=1;
      getline(fin, str);
      istringstream ss(str);
      while(ss>>port)
         capacitate[i][N+port]=1;
   }
   for(int j=1;j<=M;j++){
      capacitate[N+K+j][N+M+K+1]=1;
      getline(fin, str);
      istringstream ss(str);
      while(ss>>port)
         capacitate[N+port][N+K+j]=1;
   }
}

bool BFS(int sursa,int cautat,map<int,int> &parinte){
   bool atins=false;
   int curent;
   int vecin;
   set<int> vizitate;
   queue<int> coada;
   coada.push(sursa);
   vizitate.insert(sursa);
   while(!coada.empty()){
      curent=coada.front();
      for(vecin=1;vecin<=N+M+K+1;vecin++)
         if(capacitate[curent][vecin]>0&&vizitate.find(vecin)==vizitate.end()){
            parinte.insert(std::pair<int,int>(vecin,curent));
            coada.push(vecin);
            vizitate.insert(vecin);
            if(vecin==cautat){
               atins=true;
               break;
            }
         }
      coada.pop();
   }
   vizitate.clear();
   return atins;
}

int maxFlow(int sursa,int cautat){
   int maxFlow=0;
   int flow;
   int u,v;
   map<int,int> parinte;
   while(BFS(0,N+M+K+1,parinte)&&flow>0){
      flow=2147483647;
      v=cautat;
      while(v!=sursa)
      {
         u=parinte.at(v);
         if(flow>capacitate[u][v])
            flow=capacitate[u][v];
         v=u;
      }
      maxFlow+=flow;
      v=cautat;
      while(v!=sursa)
      {
         u=parinte.at(v);
         capacitate[u][v]-=flow;
         capacitate[v][u]+=flow;
         v=u;
      }
      parinte.clear();
   }
   return maxFlow;
}

int main(){
   readdata();
   fout<<M-maxFlow(0,N+M+K+1);
   return 0;
}
