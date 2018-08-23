//This executable was created in hopes to speed up frame drawing. Needs to be precompiled and stored in the same folder as game.bat

#include<stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

struct Entity {
   int x;
   int y;
};

int main(int argc,char* argv[]) //name,dimX,dimY,floorIco,wallIco,playerIco,enemyIco,pX,pY,e1X,e1Y,e2X,e2Y,e3X,e3Y,...
{
    if (argc%2==1){
        int i;
        int x = atoi(argv[1]);
        int j;
        int y = atoi(argv[2]);
        struct Entity player;
        player.x = atoi(argv[7]);
        player.y = atoi(argv[8]);
        struct Entity enemy[(argc-9)/2];
        bool empty = true;

        int enemyCount;
        for (enemyCount=0; enemyCount<sizeof(enemy)/sizeof(enemy[0]); enemyCount++){
            enemy[enemyCount].x = atoi(argv[(2*enemyCount+9)]);
            enemy[enemyCount].y = atoi(argv[(2*enemyCount+10)]);
        }
        for(j=0;j<y;j++){
            for(i=0;i<x;i++){
                empty = true;
                if (i==0 || i==x-1 || j==0 || j==y-1) {
                        printf("%s",argv[4]);
                        empty = false;
                }
                else if (i==player.x && j==player.y) {
                        printf("%s",argv[5]);
                        empty = false;
                }
                else {
                    for (enemyCount=0;enemyCount<sizeof(enemy)/sizeof(enemy[0]);enemyCount++){
                        if (i==enemy[enemyCount].x && j==enemy[enemyCount].y) {
                                printf("%s",argv[6]);
                                empty = false;
                        }
                    }
                }
            if (empty) printf("%s",argv[3]);
            }
            printf("\n");
        }
        usleep(100000); //gives user time to view the finished frame
    }
    else printf("invalid");

}
