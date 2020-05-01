#include "types.h"
#include "stat.h"
#include "user.h"

char buffer[1000];

void expand(int fe){
  int fd;
  int cnt=1;
  char arr[]="\t\ntext";
  while((fd=read(fe,buffer,1))>0){
    if(buffer[0]==arr[0]){
      printf(1," ");
      cnt++;
      while(cnt%8!=1){
        printf(1," ");
        cnt++;
      }
    }
    else{
      if(write(1,buffer,fd)!=fd){
        printf(1,"Write error\n");
        exit();
      }
      cnt++;
    }
    if(buffer[0]==arr[1]) cnt=1;
  }
  if(fd<0){
    printf(1,"Read error\n");
    exit();
  }
}
int main(int argc, char *argv[]){
  int fe;
  if(argc<=1){
    printf(1,"Insert file name\n");
    exit();
  }
  for(int i=1;i<argc;i++){
    if((fe=open(argv[i],0))<0){
      printf(1,"Can't open %s\n",argv[i]);
      exit();
    }
    printf(1,"File %d: ",i);
    expand(fe);
    printf(1,"\n");
    close(fe);
  }
  exit();
}