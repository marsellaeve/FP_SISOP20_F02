# FP_SISOP20_F02

Kelompok F02 (0099 &amp; 0142)

FINAL PROJECT SISOP 2020 - XV6

Tabel 1 : Truncate          **SELESAI

Tabel 2 : Expand            **SELESAI
         
Factor            **SELESAI

Tabel 3 : rm (biasa, -r,*) **SELESAI

wget             **NULL

# Pembahasan Jawaban

## No 1 Truncate

### Source Code : [truncate.c](https://github.com/marsellaeve/FP_SISOP20_F02/blob/master/XV6/truncate.c)

```
` if(strcmp(argv[1],"--help")==0){
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
```
Code untuk error handling dan help. Apabila terdapat error, akan diberitahu error apa yang dialami. Help untuk membantu memasukkan argumen.

```
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
 ```
Untuk pengecekan ukuran file dari argumen. Atoi() untuk mengubah string menjadi integer. Pengecekan apabila + artinya menambah file size, apabila - artinya mengurangi file size, dan apabila string tanpa + - artinya mengubah file size menjadi ukuran tersebut. Untuk setiap ukuran size diakhiri dengan char 'K'.

```
 if ((bytesread=read(fd,buf,nbytes))<0){
    printf(1,"Problem reading file\n");
    exit();
  }
  else printf(1,"Read %d bytes from file\n",bytesread);
  close(fd);
```
Untuk mengetahui ukuran file sebelum pengubahan dan digunakan juga pada akhir fungsi untuk mengetahui ukuran file setelah diubah.

```
    if(bil>bytesread){
      fd=open(argv[3], O_RDWR);
      bytesread=read(fd,buf,nbytes);
      int i=0;
      for(i=bytesread;i<bil;i++){
        write(fd," ",1);
      }
    }
 ```
Apabila ukuran file sekarang lebih kecil dari yang diminta pada truncate, maka dilakukan penambahan ukuran data dengan spasi (1 spasi = 1 byte).

```
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
```
Apabila ukuran file sekarang lebih besar dari yang diminta pada truncate, maka isi file disimpan terlebih dahulu pada array kemudian file tersebut dihapus. Kemudian dibuat kembali file dengan nama yang sama, dan diisi dengan array yang sudah disimpan sampai ukuran byte yang diminta.

```
  else if(tanda==1){
    //plus
    fd=open(argv[3], O_RDWR);
    bytesread=read(fd,buf,nbytes);
    int i=0;
    for(i=0;i<bil;i++){
      write(fd," ",1);
    }
  }
```
Apabila truncate diminta menambah ukuran file, maka ditambahkan spasi mulai akhir isi file sampai sejumlah penambahan yang diminta.

```
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
```
Apabila truncate diminta mengurangi ukuran file, maka dilakukan seperti pada fungsi ukuran file lebih kecil dari yang diminta pada truncate, hanya saja isi dari file di-copy kan sampai ukuran setelah file asli dikurangi ukuran yang diminta pada truncate.

## No 2 Expand

### Source Code : [expand.c](https://github.com/marsellaeve/FP_SISOP20_F02/blob/master/XV6/expand.c)

Pertama, file dibuka dulu dengan open, lalu dicek isinya dalam fungsi.

```
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
```
Apabila terdapat tab, maka akan diganti dengan spasi. Cnt adalah counter untuk tab, 1 tab berisi 8 spasi.

## No 3 Factor

### Source Code : [factor.c](https://github.com/marsellaeve/FP_SISOP20_F02/blob/master/XV6/factor.c)

```
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
```
Error handling, help dan pengubahan string menjadi bilangan.

```
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
```
Fungsi untuk mengecek apakah bilangan tersebut prima atau tidak.

## No 4 Rm (Biasa, -r, *)

### Source Code : [rm.c](https://github.com/marsellaeve/FP_SISOP20_F02/blob/master/XV6/rm.c)
