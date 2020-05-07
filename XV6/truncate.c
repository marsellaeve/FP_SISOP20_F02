#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char buf[60000];
int main(int argc, char *argv[]){

  int bytesread, fd;
  unsigned int nbytes=60000;
  if(strcmp(argv[1],"--help")==0){
    printf(1,"truncate -s [ukuran] [namafile]\nOpsi ukuran: 0,+[number]K,-[number]K,[number]K\n");
    printf(1,"Truncate by F02\n");
    exit();
  }
  if(argc < 4){
    printf(2, "Usage: truncate size files...\n--help for more info\n");
    exit();
  }
  
  if(argc > 4){
    printf(2, "Usage: truncate size files...\n--help for more info\n");
  }

  if(open(argv[3],O_RDONLY) < 0){
    printf(1, "truncate: file %s not found.\n--help for more info\n", argv[1]);
    exit();
  }

  if(argv[1][0]!='-'&&argv[1][1]!='s'){
    printf(1,"Invalid truncate\n--help for more info\n");
    exit();
  }

  int bil=-1;
  int length=strlen(argv[2]);
  int tanda=0; //1 untuk plus, 2 untuk minus
  int i=0;
  char temp[100];
  if(argv[2][0]=='0') bil=atoi(argv[2]);
  else if (argv[2][0]=='+'&&argv[2][length-1]=='K'){
    for(i=0;i<length-1;i++){
      temp[i]=argv[2][i+1];
      temp[i+1]='\0';
    }
    bil=atoi(temp);
    tanda=1;
    printf(1,"ukuran file trunc +%d\n",bil);
  }
  else if (argv[2][0]=='-'&&argv[2][length-1]=='K'){
    for(i=0;i<length-1;i++){
      temp[i]=argv[2][i+1];
      temp[i+1]='\0';
    }
    bil=atoi(temp);
    tanda=2;
    printf(1,"ukuran file trunc -%d\n",bil);
  }
  else if (argv[2][length-1]=='K'){
    argv[2][length-1]='\0';
    bil=atoi(argv[2]);
    printf(1,"ukuran file trunc %d\n",bil);
  }
  else{
    printf(1,"Size file not valid\n--help for more info\n");
  }

  fd=open(argv[3], O_RDONLY);
  if ((bytesread=read(fd,buf,nbytes))<0){
    printf(1,"Problem reading file\n");
    exit();
  }
  else printf(1,"Read %d bytes from file\n",bytesread);
  close(fd);

  if(bil==0){
    unlink(argv[3]);
    fd=open(argv[3], O_CREATE);
  }
  else if(tanda==0){
    if(bil>bytesread){
      fd=open(argv[3], O_RDWR);
      bytesread=read(fd,buf,nbytes);
      int i=0;
      for(i=bytesread;i<bil;i++){
        write(fd," ",1);
      }
    }
    else if(bil<bytesread){
      unlink(argv[3]);
      fd=open(argv[3], O_CREATE);
      close(fd);
      fd=open(argv[3], O_RDWR);
      int i=0;
      char arr[10000][5];
      for(i=0;i<strlen(buf);i++){
        arr[i][0]=buf[i];
        arr[i][1]='\0';
      }
      for(i=0;i<bil;i++){
        write(fd,arr[i],strlen(arr[i]));
      }
    }
  }
  else if(tanda==1){
    //plus
    fd=open(argv[3], O_RDWR);
    bytesread=read(fd,buf,nbytes);
    int i=0;
    for(i=0;i<bil;i++){
      write(fd," ",1);
    }
  }
  else if(tanda==2){
    unlink(argv[3]);
    fd=open(argv[3], O_CREATE);
    close(fd);
    fd=open(argv[3], O_RDWR);
    int i=0;
    char arr[10000][5];
    for(i=0;i<strlen(buf);i++){
      arr[i][0]=buf[i];
      arr[i][1]='\0';
    }
    for(i=0;i<bytesread-bil;i++){
      write(fd,arr[i],strlen(arr[i]));
    }
  }

    
  close(fd);
  fd=open(argv[3], O_RDONLY);
  if ((bytesread=read(fd,buf,nbytes))<0){
    printf(1,"Problem reading file\n");
    exit();
  }
  else printf(1,"Now read %d bytes from file\n",bytesread);
  close(fd);
  exit();
}