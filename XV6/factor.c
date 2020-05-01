#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"

int main(int argc, char *argv[]){
    int bil;
    int fact;
    int temp;
    int arr[argc];
    int factor=-1;
    for(int i=1;i<argc;i++){
        if(argv[i][0]=='-'&&argv[i][1]=='-'){
            if(strcmp(argv[i],"--help")==0){
                printf(1,"factor [NUMBER]\nnumber must be a positive integer and >2\n");
                printf(1,"factor by F02\n");
            }
            else if(strlen(argv[i])>1)
            printf(1,"factor invalid option --help for more info\n");
            exit();
        }
    }
    int cnt=0;
    for(int i=1;i<argc;i++){
        bil= atoi(argv[i]);
        if(bil==0&&strcmp(argv[i],"0")){
            printf(1,"factor %s not a valid positive int\n",argv[i]);
        }
        else{
            arr[cnt++]=bil;
        }
    }
    for(int i=0;i<cnt;i++){
        bil=arr[i];
        printf(1,"%d:",bil);
        fact=2;
        temp=1;
        if(bil>1){
            while(fact*fact<=bil){
                if(bil%fact==0){
                    if(fact==factor){
                        printf(1," %d",fact);
                    }
                    else{
                        printf(1," %d",fact);
                        factor=fact;
                    }
                    bil=bil/fact;
                    continue;
                }
                fact=fact+temp;
                if(fact<7) temp=2;
                else temp=6-temp;
            }
            if(bil==factor){
                printf(1," %d",fact);
            }
            else{
                factor=bil;
                printf(1," %d",bil);
            }
            printf(1,"\n");
        }
        else{
            printf(1,"factor < 2, prime number>=2\n");
        }
    }
    exit();
}