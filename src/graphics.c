//This executable was created in hopes to speed up frame drawing

#include<stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct Entity {
   int x;
   int y;
};

int main(int argc,char* argv[]) //name,dimX,dimY,pX,pY,e1X,e1Y,e2X,e2Y,e3X,e3Y,...
{
    if (argc%2==1){
        int i;
        int x = atoi(argv[1]);
        int j;
        int y = atoi(argv[2]);
        struct Entity player;
        player.x = atoi(argv[3]);
        player.y = atoi(argv[4]);
        struct Entity enemy[(argc-5)/2];
        bool empty = true;

        int enemyCount;
        for (enemyCount=0; enemyCount<sizeof(enemy)/sizeof(enemy[0]); enemyCount++){
            enemy[enemyCount].x = atoi(argv[(2*enemyCount+5)]);
            enemy[enemyCount].y = atoi(argv[(2*enemyCount+6)]);
        }
        for(j=0;j<y;j++){
            for(i=0;i<x;i++){
                empty = true;
                if (i==0 || i==x-1 || j==0 || j==y-1) {
                        printf("#");
                        empty = false;
                }
                else if (i==player.x && j==player.y) {
                        printf("@");
                        empty = false;
                }
                else {
                    for (enemyCount=0;enemyCount<sizeof(enemy)/sizeof(enemy[0]);enemyCount++){
                        if (i==enemy[enemyCount].x && j==enemy[enemyCount].y) {
                                printf("E");
                                empty = false;
                        }
                    }
                }
            if (empty) printf(".");
            }
            printf("\n");
        }
    }
    else printf("invalid");

}
