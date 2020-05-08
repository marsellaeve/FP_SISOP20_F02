
_truncate:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char buf[60000];
int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec e0 c3 00 00    	sub    $0xc3e0,%esp
  17:	8b 59 04             	mov    0x4(%ecx),%ebx
  1a:	8b 31                	mov    (%ecx),%esi

  int bytesread, fd;
  unsigned int nbytes=60000;
  if(strcmp(argv[1],"--help")==0){
  1c:	68 98 0c 00 00       	push   $0xc98
  21:	ff 73 04             	pushl  0x4(%ebx)
  24:	e8 a7 05 00 00       	call   5d0 <strcmp>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	85 c0                	test   %eax,%eax
  2e:	0f 84 84 01 00 00    	je     1b8 <main+0x1b8>
    printf(1,"truncate -s [ukuran] [namafile]\nOpsi ukuran: 0,+[number]K,-[number]K,[number]K\n");
    printf(1,"Truncate by F02\n");
    exit();
  }
  if(argc < 4){
  34:	83 fe 03             	cmp    $0x3,%esi
  37:	0f 8e 68 01 00 00    	jle    1a5 <main+0x1a5>
    printf(2, "Usage: truncate size files...\n--help for more info\n");
    exit();
  }
  
  if(argc > 4){
  3d:	83 fe 04             	cmp    $0x4,%esi
  40:	0f 85 c8 02 00 00    	jne    30e <main+0x30e>
    printf(2, "Usage: truncate size files...\n--help for more info\n");
  }

  if(open(argv[3],O_RDONLY) < 0){
  46:	57                   	push   %edi
  47:	57                   	push   %edi
  48:	6a 00                	push   $0x0
  4a:	ff 73 0c             	pushl  0xc(%ebx)
  4d:	e8 e0 07 00 00       	call   832 <open>
  52:	83 c4 10             	add    $0x10,%esp
  55:	85 c0                	test   %eax,%eax
  57:	0f 88 da 02 00 00    	js     337 <main+0x337>
    printf(1, "truncate: file %s not found.\n--help for more info\n", argv[1]);
    exit();
  }

  if(argv[1][0]!='-'&&argv[1][1]!='s'){
  5d:	8b 43 04             	mov    0x4(%ebx),%eax
  60:	80 38 2d             	cmpb   $0x2d,(%eax)
  63:	74 0a                	je     6f <main+0x6f>
  65:	80 78 01 73          	cmpb   $0x73,0x1(%eax)
  69:	0f 85 6a 01 00 00    	jne    1d9 <main+0x1d9>
    printf(1,"Invalid truncate\n--help for more info\n");
    exit();
  }

  int bil=-1;
  int length=strlen(argv[2]);
  6f:	83 ec 0c             	sub    $0xc,%esp
  72:	ff 73 08             	pushl  0x8(%ebx)
  75:	e8 a6 05 00 00       	call   620 <strlen>
  int tanda=0; //1 untuk plus, 2 untuk minus
  int i=0;
  char temp[100];
  if(argv[2][0]=='0') bil=atoi(argv[2]);
  7a:	8b 53 08             	mov    0x8(%ebx),%edx
  7d:	83 c4 10             	add    $0x10,%esp
  80:	0f b6 0a             	movzbl (%edx),%ecx
  83:	80 f9 30             	cmp    $0x30,%cl
  86:	0f 84 19 03 00 00    	je     3a5 <main+0x3a5>
  8c:	83 e8 01             	sub    $0x1,%eax
  else if (argv[2][0]=='+'&&argv[2][length-1]=='K'){
  8f:	80 f9 2b             	cmp    $0x2b,%cl
  92:	8d 34 02             	lea    (%edx,%eax,1),%esi
  95:	0f b6 3e             	movzbl (%esi),%edi
  98:	0f 84 4e 01 00 00    	je     1ec <main+0x1ec>
    }
    bil=atoi(temp);
    tanda=1;
    printf(1,"ukuran file trunc +%d\n",bil);
  }
  else if (argv[2][0]=='-'&&argv[2][length-1]=='K'){
  9e:	80 f9 2d             	cmp    $0x2d,%cl
  a1:	0f 84 a5 02 00 00    	je     34c <main+0x34c>
    }
    bil=atoi(temp);
    tanda=2;
    printf(1,"ukuran file trunc -%d\n",bil);
  }
  else if (argv[2][length-1]=='K'){
  a7:	89 f8                	mov    %edi,%eax
  a9:	3c 4b                	cmp    $0x4b,%al
  ab:	0f 85 46 01 00 00    	jne    1f7 <main+0x1f7>
    argv[2][length-1]='\0';
    bil=atoi(argv[2]);
  b1:	83 ec 0c             	sub    $0xc,%esp
    argv[2][length-1]='\0';
  b4:	c6 06 00             	movb   $0x0,(%esi)
    bil=atoi(argv[2]);
  b7:	ff 73 08             	pushl  0x8(%ebx)
  ba:	e8 c1 06 00 00       	call   780 <atoi>
    printf(1,"ukuran file trunc %d\n",bil);
  bf:	83 c4 0c             	add    $0xc,%esp
    bil=atoi(argv[2]);
  c2:	89 85 24 3c ff ff    	mov    %eax,-0xc3dc(%ebp)
    printf(1,"ukuran file trunc %d\n",bil);
  c8:	50                   	push   %eax
  c9:	68 de 0c 00 00       	push   $0xcde
  ce:	6a 01                	push   $0x1
  d0:	e8 6b 08 00 00       	call   940 <printf>
  d5:	83 c4 10             	add    $0x10,%esp
  int tanda=0; //1 untuk plus, 2 untuk minus
  d8:	c7 85 20 3c ff ff 00 	movl   $0x0,-0xc3e0(%ebp)
  df:	00 00 00 
  }
  else{
    printf(1,"Size file not valid\n--help for more info\n");
  }

  fd=open(argv[3], O_RDONLY);
  e2:	56                   	push   %esi
  e3:	56                   	push   %esi
  e4:	6a 00                	push   $0x0
  e6:	ff 73 0c             	pushl  0xc(%ebx)
  e9:	e8 44 07 00 00       	call   832 <open>
  if ((bytesread=read(fd,buf,nbytes))<0){
  ee:	83 c4 0c             	add    $0xc,%esp
  fd=open(argv[3], O_RDONLY);
  f1:	89 c6                	mov    %eax,%esi
  if ((bytesread=read(fd,buf,nbytes))<0){
  f3:	68 60 ea 00 00       	push   $0xea60
  f8:	68 40 11 00 00       	push   $0x1140
  fd:	50                   	push   %eax
  fe:	e8 07 07 00 00       	call   80a <read>
 103:	83 c4 10             	add    $0x10,%esp
 106:	85 c0                	test   %eax,%eax
 108:	89 c7                	mov    %eax,%edi
 10a:	0f 88 14 02 00 00    	js     324 <main+0x324>
    printf(1,"Problem reading file\n");
    exit();
  }
  else printf(1,"Read %d bytes from file\n",bytesread);
 110:	51                   	push   %ecx
 111:	50                   	push   %eax
 112:	68 0a 0d 00 00       	push   $0xd0a
 117:	6a 01                	push   $0x1
 119:	e8 22 08 00 00       	call   940 <printf>
  close(fd);
 11e:	89 34 24             	mov    %esi,(%esp)
 121:	e8 f4 06 00 00       	call   81a <close>

  if(bil==0){
 126:	83 c4 10             	add    $0x10,%esp
 129:	83 bd 24 3c ff ff 00 	cmpl   $0x0,-0xc3dc(%ebp)
 130:	0f 85 de 02 00 00    	jne    414 <main+0x414>
    unlink(argv[3]);
 136:	83 ec 0c             	sub    $0xc,%esp
 139:	ff 73 0c             	pushl  0xc(%ebx)
 13c:	e8 01 07 00 00       	call   842 <unlink>
    fd=open(argv[3], O_CREATE);
 141:	58                   	pop    %eax
 142:	5a                   	pop    %edx
 143:	68 00 02 00 00       	push   $0x200
 148:	ff 73 0c             	pushl  0xc(%ebx)
 14b:	e8 e2 06 00 00       	call   832 <open>
 150:	83 c4 10             	add    $0x10,%esp
 153:	89 c6                	mov    %eax,%esi
      write(fd,arr[i],strlen(arr[i]));
    }
  }

    
  close(fd);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	56                   	push   %esi
 159:	e8 bc 06 00 00       	call   81a <close>
  fd=open(argv[3], O_RDONLY);
 15e:	59                   	pop    %ecx
 15f:	5e                   	pop    %esi
 160:	6a 00                	push   $0x0
 162:	ff 73 0c             	pushl  0xc(%ebx)
 165:	e8 c8 06 00 00       	call   832 <open>
  if ((bytesread=read(fd,buf,nbytes))<0){
 16a:	83 c4 0c             	add    $0xc,%esp
  fd=open(argv[3], O_RDONLY);
 16d:	89 c3                	mov    %eax,%ebx
  if ((bytesread=read(fd,buf,nbytes))<0){
 16f:	68 60 ea 00 00       	push   $0xea60
 174:	68 40 11 00 00       	push   $0x1140
 179:	50                   	push   %eax
 17a:	e8 8b 06 00 00       	call   80a <read>
 17f:	83 c4 10             	add    $0x10,%esp
 182:	85 c0                	test   %eax,%eax
 184:	0f 88 9a 01 00 00    	js     324 <main+0x324>
    printf(1,"Problem reading file\n");
    exit();
  }
  else printf(1,"Now read %d bytes from file\n",bytesread);
 18a:	52                   	push   %edx
 18b:	50                   	push   %eax
 18c:	68 25 0d 00 00       	push   $0xd25
 191:	6a 01                	push   $0x1
 193:	e8 a8 07 00 00       	call   940 <printf>
  close(fd);
 198:	89 1c 24             	mov    %ebx,(%esp)
 19b:	e8 7a 06 00 00       	call   81a <close>
  exit();
 1a0:	e8 4d 06 00 00       	call   7f2 <exit>
    printf(2, "Usage: truncate size files...\n--help for more info\n");
 1a5:	50                   	push   %eax
 1a6:	50                   	push   %eax
 1a7:	68 94 0d 00 00       	push   $0xd94
 1ac:	6a 02                	push   $0x2
 1ae:	e8 8d 07 00 00       	call   940 <printf>
    exit();
 1b3:	e8 3a 06 00 00       	call   7f2 <exit>
    printf(1,"truncate -s [ukuran] [namafile]\nOpsi ukuran: 0,+[number]K,-[number]K,[number]K\n");
 1b8:	50                   	push   %eax
 1b9:	50                   	push   %eax
 1ba:	68 44 0d 00 00       	push   $0xd44
 1bf:	6a 01                	push   $0x1
 1c1:	e8 7a 07 00 00       	call   940 <printf>
    printf(1,"Truncate by F02\n");
 1c6:	58                   	pop    %eax
 1c7:	5a                   	pop    %edx
 1c8:	68 9f 0c 00 00       	push   $0xc9f
 1cd:	6a 01                	push   $0x1
 1cf:	e8 6c 07 00 00       	call   940 <printf>
    exit();
 1d4:	e8 19 06 00 00       	call   7f2 <exit>
    printf(1,"Invalid truncate\n--help for more info\n");
 1d9:	51                   	push   %ecx
 1da:	51                   	push   %ecx
 1db:	68 fc 0d 00 00       	push   $0xdfc
 1e0:	6a 01                	push   $0x1
 1e2:	e8 59 07 00 00       	call   940 <printf>
    exit();
 1e7:	e8 06 06 00 00       	call   7f2 <exit>
  else if (argv[2][0]=='+'&&argv[2][length-1]=='K'){
 1ec:	89 f9                	mov    %edi,%ecx
 1ee:	80 f9 4b             	cmp    $0x4b,%cl
 1f1:	0f 84 cf 01 00 00    	je     3c6 <main+0x3c6>
    printf(1,"Size file not valid\n--help for more info\n");
 1f7:	57                   	push   %edi
 1f8:	57                   	push   %edi
 1f9:	68 24 0e 00 00       	push   $0xe24
 1fe:	6a 01                	push   $0x1
 200:	e8 3b 07 00 00       	call   940 <printf>
  fd=open(argv[3], O_RDONLY);
 205:	58                   	pop    %eax
 206:	5a                   	pop    %edx
 207:	6a 00                	push   $0x0
 209:	ff 73 0c             	pushl  0xc(%ebx)
 20c:	e8 21 06 00 00       	call   832 <open>
  if ((bytesread=read(fd,buf,nbytes))<0){
 211:	83 c4 0c             	add    $0xc,%esp
  fd=open(argv[3], O_RDONLY);
 214:	89 c6                	mov    %eax,%esi
  if ((bytesread=read(fd,buf,nbytes))<0){
 216:	68 60 ea 00 00       	push   $0xea60
 21b:	68 40 11 00 00       	push   $0x1140
 220:	50                   	push   %eax
 221:	e8 e4 05 00 00       	call   80a <read>
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	89 c7                	mov    %eax,%edi
 22d:	0f 88 f1 00 00 00    	js     324 <main+0x324>
  else printf(1,"Read %d bytes from file\n",bytesread);
 233:	50                   	push   %eax
 234:	57                   	push   %edi
 235:	68 0a 0d 00 00       	push   $0xd0a
 23a:	6a 01                	push   $0x1
 23c:	e8 ff 06 00 00       	call   940 <printf>
  close(fd);
 241:	89 34 24             	mov    %esi,(%esp)
 244:	e8 d1 05 00 00       	call   81a <close>
 249:	83 c4 10             	add    $0x10,%esp
  int bil=-1;
 24c:	c7 85 24 3c ff ff ff 	movl   $0xffffffff,-0xc3dc(%ebp)
 253:	ff ff ff 
    else if(bil<bytesread){
 256:	39 bd 24 3c ff ff    	cmp    %edi,-0xc3dc(%ebp)
 25c:	0f 8d f3 fe ff ff    	jge    155 <main+0x155>
      unlink(argv[3]);
 262:	83 ec 0c             	sub    $0xc,%esp
 265:	ff 73 0c             	pushl  0xc(%ebx)
 268:	e8 d5 05 00 00       	call   842 <unlink>
      fd=open(argv[3], O_CREATE);
 26d:	59                   	pop    %ecx
 26e:	5e                   	pop    %esi
 26f:	68 00 02 00 00       	push   $0x200
 274:	ff 73 0c             	pushl  0xc(%ebx)
 277:	e8 b6 05 00 00       	call   832 <open>
      close(fd);
 27c:	89 04 24             	mov    %eax,(%esp)
 27f:	e8 96 05 00 00       	call   81a <close>
      fd=open(argv[3], O_RDWR);
 284:	5f                   	pop    %edi
 285:	58                   	pop    %eax
 286:	6a 02                	push   $0x2
 288:	ff 73 0c             	pushl  0xc(%ebx)
      for(i=0;i<strlen(buf);i++){
 28b:	31 ff                	xor    %edi,%edi
      fd=open(argv[3], O_RDWR);
 28d:	e8 a0 05 00 00       	call   832 <open>
      for(i=0;i<strlen(buf);i++){
 292:	83 c4 10             	add    $0x10,%esp
      fd=open(argv[3], O_RDWR);
 295:	89 c6                	mov    %eax,%esi
      for(i=0;i<strlen(buf);i++){
 297:	eb 1c                	jmp    2b5 <main+0x2b5>
        arr[i][0]=buf[i];
 299:	0f b6 97 40 11 00 00 	movzbl 0x1140(%edi),%edx
 2a0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
      for(i=0;i<strlen(buf);i++){
 2a3:	83 c7 01             	add    $0x1,%edi
        arr[i][1]='\0';
 2a6:	c6 84 05 99 3c ff ff 	movb   $0x0,-0xc367(%ebp,%eax,1)
 2ad:	00 
        arr[i][0]=buf[i];
 2ae:	88 94 05 98 3c ff ff 	mov    %dl,-0xc368(%ebp,%eax,1)
      for(i=0;i<strlen(buf);i++){
 2b5:	83 ec 0c             	sub    $0xc,%esp
 2b8:	68 40 11 00 00       	push   $0x1140
 2bd:	e8 5e 03 00 00       	call   620 <strlen>
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	39 f8                	cmp    %edi,%eax
 2c7:	77 d0                	ja     299 <main+0x299>
      for(i=0;i<bil;i++){
 2c9:	31 d2                	xor    %edx,%edx
 2cb:	89 9d 20 3c ff ff    	mov    %ebx,-0xc3e0(%ebp)
 2d1:	89 d3                	mov    %edx,%ebx
 2d3:	eb 26                	jmp    2fb <main+0x2fb>
 2d5:	8d 0c 9b             	lea    (%ebx,%ebx,4),%ecx
 2d8:	8d 85 98 3c ff ff    	lea    -0xc368(%ebp),%eax
        write(fd,arr[i],strlen(arr[i]));
 2de:	83 ec 0c             	sub    $0xc,%esp
      for(i=0;i<bil;i++){
 2e1:	83 c3 01             	add    $0x1,%ebx
 2e4:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
        write(fd,arr[i],strlen(arr[i]));
 2e7:	57                   	push   %edi
 2e8:	e8 33 03 00 00       	call   620 <strlen>
 2ed:	83 c4 0c             	add    $0xc,%esp
 2f0:	50                   	push   %eax
 2f1:	57                   	push   %edi
 2f2:	56                   	push   %esi
 2f3:	e8 1a 05 00 00       	call   812 <write>
      for(i=0;i<bil;i++){
 2f8:	83 c4 10             	add    $0x10,%esp
 2fb:	3b 9d 24 3c ff ff    	cmp    -0xc3dc(%ebp),%ebx
 301:	7c d2                	jl     2d5 <main+0x2d5>
 303:	8b 9d 20 3c ff ff    	mov    -0xc3e0(%ebp),%ebx
 309:	e9 47 fe ff ff       	jmp    155 <main+0x155>
    printf(2, "Usage: truncate size files...\n--help for more info\n");
 30e:	50                   	push   %eax
 30f:	50                   	push   %eax
 310:	68 94 0d 00 00       	push   $0xd94
 315:	6a 02                	push   $0x2
 317:	e8 24 06 00 00       	call   940 <printf>
 31c:	83 c4 10             	add    $0x10,%esp
 31f:	e9 22 fd ff ff       	jmp    46 <main+0x46>
    printf(1,"Problem reading file\n");
 324:	53                   	push   %ebx
 325:	53                   	push   %ebx
 326:	68 f4 0c 00 00       	push   $0xcf4
 32b:	6a 01                	push   $0x1
 32d:	e8 0e 06 00 00       	call   940 <printf>
    exit();
 332:	e8 bb 04 00 00       	call   7f2 <exit>
    printf(1, "truncate: file %s not found.\n--help for more info\n", argv[1]);
 337:	56                   	push   %esi
 338:	ff 73 04             	pushl  0x4(%ebx)
 33b:	68 c8 0d 00 00       	push   $0xdc8
 340:	6a 01                	push   $0x1
 342:	e8 f9 05 00 00       	call   940 <printf>
    exit();
 347:	e8 a6 04 00 00       	call   7f2 <exit>
  else if (argv[2][0]=='-'&&argv[2][length-1]=='K'){
 34c:	89 f9                	mov    %edi,%ecx
 34e:	80 f9 4b             	cmp    $0x4b,%cl
 351:	0f 85 a0 fe ff ff    	jne    1f7 <main+0x1f7>
    for(i=0;i<length-1;i++){
 357:	31 ff                	xor    %edi,%edi
 359:	8d b5 34 3c ff ff    	lea    -0xc3cc(%ebp),%esi
 35f:	eb 0f                	jmp    370 <main+0x370>
      temp[i]=argv[2][i+1];
 361:	0f b6 4c 3a 01       	movzbl 0x1(%edx,%edi,1),%ecx
 366:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
      temp[i+1]='\0';
 369:	83 c7 01             	add    $0x1,%edi
 36c:	c6 04 3e 00          	movb   $0x0,(%esi,%edi,1)
    for(i=0;i<length-1;i++){
 370:	39 f8                	cmp    %edi,%eax
 372:	7f ed                	jg     361 <main+0x361>
    bil=atoi(temp);
 374:	83 ec 0c             	sub    $0xc,%esp
 377:	56                   	push   %esi
 378:	e8 03 04 00 00       	call   780 <atoi>
    printf(1,"ukuran file trunc -%d\n",bil);
 37d:	83 c4 0c             	add    $0xc,%esp
    bil=atoi(temp);
 380:	89 85 24 3c ff ff    	mov    %eax,-0xc3dc(%ebp)
    printf(1,"ukuran file trunc -%d\n",bil);
 386:	50                   	push   %eax
 387:	68 c7 0c 00 00       	push   $0xcc7
 38c:	6a 01                	push   $0x1
 38e:	e8 ad 05 00 00       	call   940 <printf>
 393:	83 c4 10             	add    $0x10,%esp
    tanda=2;
 396:	c7 85 20 3c ff ff 02 	movl   $0x2,-0xc3e0(%ebp)
 39d:	00 00 00 
    printf(1,"ukuran file trunc -%d\n",bil);
 3a0:	e9 3d fd ff ff       	jmp    e2 <main+0xe2>
  if(argv[2][0]=='0') bil=atoi(argv[2]);
 3a5:	83 ec 0c             	sub    $0xc,%esp
 3a8:	52                   	push   %edx
 3a9:	e8 d2 03 00 00       	call   780 <atoi>
 3ae:	83 c4 10             	add    $0x10,%esp
 3b1:	89 85 24 3c ff ff    	mov    %eax,-0xc3dc(%ebp)
  int tanda=0; //1 untuk plus, 2 untuk minus
 3b7:	c7 85 20 3c ff ff 00 	movl   $0x0,-0xc3e0(%ebp)
 3be:	00 00 00 
 3c1:	e9 1c fd ff ff       	jmp    e2 <main+0xe2>
    for(i=0;i<length-1;i++){
 3c6:	31 ff                	xor    %edi,%edi
 3c8:	8d b5 34 3c ff ff    	lea    -0xc3cc(%ebp),%esi
 3ce:	eb 0f                	jmp    3df <main+0x3df>
      temp[i]=argv[2][i+1];
 3d0:	0f b6 4c 3a 01       	movzbl 0x1(%edx,%edi,1),%ecx
 3d5:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
      temp[i+1]='\0';
 3d8:	83 c7 01             	add    $0x1,%edi
 3db:	c6 04 3e 00          	movb   $0x0,(%esi,%edi,1)
    for(i=0;i<length-1;i++){
 3df:	39 f8                	cmp    %edi,%eax
 3e1:	7f ed                	jg     3d0 <main+0x3d0>
    bil=atoi(temp);
 3e3:	83 ec 0c             	sub    $0xc,%esp
 3e6:	56                   	push   %esi
 3e7:	e8 94 03 00 00       	call   780 <atoi>
    printf(1,"ukuran file trunc +%d\n",bil);
 3ec:	83 c4 0c             	add    $0xc,%esp
    bil=atoi(temp);
 3ef:	89 85 24 3c ff ff    	mov    %eax,-0xc3dc(%ebp)
    printf(1,"ukuran file trunc +%d\n",bil);
 3f5:	50                   	push   %eax
 3f6:	68 b0 0c 00 00       	push   $0xcb0
 3fb:	6a 01                	push   $0x1
 3fd:	e8 3e 05 00 00       	call   940 <printf>
 402:	83 c4 10             	add    $0x10,%esp
    tanda=1;
 405:	c7 85 20 3c ff ff 01 	movl   $0x1,-0xc3e0(%ebp)
 40c:	00 00 00 
    printf(1,"ukuran file trunc +%d\n",bil);
 40f:	e9 ce fc ff ff       	jmp    e2 <main+0xe2>
  else if(tanda==0){
 414:	83 bd 20 3c ff ff 00 	cmpl   $0x0,-0xc3e0(%ebp)
 41b:	0f 84 13 01 00 00    	je     534 <main+0x534>
  else if(tanda==1){
 421:	83 bd 20 3c ff ff 01 	cmpl   $0x1,-0xc3e0(%ebp)
 428:	8b 43 0c             	mov    0xc(%ebx),%eax
 42b:	0f 84 b2 00 00 00    	je     4e3 <main+0x4e3>
    unlink(argv[3]);
 431:	83 ec 0c             	sub    $0xc,%esp
 434:	50                   	push   %eax
 435:	e8 08 04 00 00       	call   842 <unlink>
    fd=open(argv[3], O_CREATE);
 43a:	58                   	pop    %eax
 43b:	5a                   	pop    %edx
 43c:	68 00 02 00 00       	push   $0x200
 441:	ff 73 0c             	pushl  0xc(%ebx)
 444:	e8 e9 03 00 00       	call   832 <open>
    close(fd);
 449:	89 04 24             	mov    %eax,(%esp)
 44c:	e8 c9 03 00 00       	call   81a <close>
    fd=open(argv[3], O_RDWR);
 451:	59                   	pop    %ecx
 452:	5e                   	pop    %esi
 453:	6a 02                	push   $0x2
 455:	ff 73 0c             	pushl  0xc(%ebx)
 458:	e8 d5 03 00 00       	call   832 <open>
    for(i=0;i<strlen(buf);i++){
 45d:	31 d2                	xor    %edx,%edx
 45f:	89 9d 20 3c ff ff    	mov    %ebx,-0xc3e0(%ebp)
    fd=open(argv[3], O_RDWR);
 465:	89 c6                	mov    %eax,%esi
    for(i=0;i<strlen(buf);i++){
 467:	83 c4 10             	add    $0x10,%esp
 46a:	89 d3                	mov    %edx,%ebx
 46c:	eb 1c                	jmp    48a <main+0x48a>
      arr[i][0]=buf[i];
 46e:	0f b6 8b 40 11 00 00 	movzbl 0x1140(%ebx),%ecx
 475:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
    for(i=0;i<strlen(buf);i++){
 478:	83 c3 01             	add    $0x1,%ebx
      arr[i][1]='\0';
 47b:	c6 84 05 99 3c ff ff 	movb   $0x0,-0xc367(%ebp,%eax,1)
 482:	00 
      arr[i][0]=buf[i];
 483:	88 8c 05 98 3c ff ff 	mov    %cl,-0xc368(%ebp,%eax,1)
    for(i=0;i<strlen(buf);i++){
 48a:	83 ec 0c             	sub    $0xc,%esp
 48d:	68 40 11 00 00       	push   $0x1140
 492:	e8 89 01 00 00       	call   620 <strlen>
 497:	83 c4 10             	add    $0x10,%esp
 49a:	39 d8                	cmp    %ebx,%eax
 49c:	77 d0                	ja     46e <main+0x46e>
    for(i=0;i<bytesread-bil;i++){
 49e:	2b bd 24 3c ff ff    	sub    -0xc3dc(%ebp),%edi
 4a4:	31 c9                	xor    %ecx,%ecx
 4a6:	89 cb                	mov    %ecx,%ebx
 4a8:	89 bd 24 3c ff ff    	mov    %edi,-0xc3dc(%ebp)
 4ae:	eb 26                	jmp    4d6 <main+0x4d6>
 4b0:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
 4b3:	8d 85 98 3c ff ff    	lea    -0xc368(%ebp),%eax
      write(fd,arr[i],strlen(arr[i]));
 4b9:	83 ec 0c             	sub    $0xc,%esp
    for(i=0;i<bytesread-bil;i++){
 4bc:	83 c3 01             	add    $0x1,%ebx
 4bf:	8d 3c 02             	lea    (%edx,%eax,1),%edi
      write(fd,arr[i],strlen(arr[i]));
 4c2:	57                   	push   %edi
 4c3:	e8 58 01 00 00       	call   620 <strlen>
 4c8:	83 c4 0c             	add    $0xc,%esp
 4cb:	50                   	push   %eax
 4cc:	57                   	push   %edi
 4cd:	56                   	push   %esi
 4ce:	e8 3f 03 00 00       	call   812 <write>
    for(i=0;i<bytesread-bil;i++){
 4d3:	83 c4 10             	add    $0x10,%esp
 4d6:	39 9d 24 3c ff ff    	cmp    %ebx,-0xc3dc(%ebp)
 4dc:	7f d2                	jg     4b0 <main+0x4b0>
 4de:	e9 20 fe ff ff       	jmp    303 <main+0x303>
    fd=open(argv[3], O_RDWR);
 4e3:	52                   	push   %edx
 4e4:	52                   	push   %edx
    for(i=0;i<bil;i++){
 4e5:	31 ff                	xor    %edi,%edi
    fd=open(argv[3], O_RDWR);
 4e7:	6a 02                	push   $0x2
 4e9:	50                   	push   %eax
 4ea:	e8 43 03 00 00       	call   832 <open>
    bytesread=read(fd,buf,nbytes);
 4ef:	83 c4 0c             	add    $0xc,%esp
    fd=open(argv[3], O_RDWR);
 4f2:	89 c6                	mov    %eax,%esi
    bytesread=read(fd,buf,nbytes);
 4f4:	68 60 ea 00 00       	push   $0xea60
 4f9:	68 40 11 00 00       	push   $0x1140
 4fe:	50                   	push   %eax
 4ff:	e8 06 03 00 00       	call   80a <read>
 504:	89 9d 20 3c ff ff    	mov    %ebx,-0xc3e0(%ebp)
    for(i=0;i<bil;i++){
 50a:	83 c4 10             	add    $0x10,%esp
 50d:	89 fb                	mov    %edi,%ebx
 50f:	8b bd 24 3c ff ff    	mov    -0xc3dc(%ebp),%edi
 515:	eb 14                	jmp    52b <main+0x52b>
      write(fd," ",1);
 517:	50                   	push   %eax
 518:	6a 01                	push   $0x1
    for(i=0;i<bil;i++){
 51a:	83 c3 01             	add    $0x1,%ebx
      write(fd," ",1);
 51d:	68 23 0d 00 00       	push   $0xd23
 522:	56                   	push   %esi
 523:	e8 ea 02 00 00       	call   812 <write>
    for(i=0;i<bil;i++){
 528:	83 c4 10             	add    $0x10,%esp
 52b:	39 df                	cmp    %ebx,%edi
 52d:	7f e8                	jg     517 <main+0x517>
 52f:	e9 cf fd ff ff       	jmp    303 <main+0x303>
    if(bil>bytesread){
 534:	39 bd 24 3c ff ff    	cmp    %edi,-0xc3dc(%ebp)
 53a:	0f 8e 16 fd ff ff    	jle    256 <main+0x256>
      fd=open(argv[3], O_RDWR);
 540:	50                   	push   %eax
 541:	50                   	push   %eax
 542:	6a 02                	push   $0x2
 544:	ff 73 0c             	pushl  0xc(%ebx)
 547:	e8 e6 02 00 00       	call   832 <open>
      bytesread=read(fd,buf,nbytes);
 54c:	83 c4 0c             	add    $0xc,%esp
      fd=open(argv[3], O_RDWR);
 54f:	89 c6                	mov    %eax,%esi
      bytesread=read(fd,buf,nbytes);
 551:	68 60 ea 00 00       	push   $0xea60
 556:	68 40 11 00 00       	push   $0x1140
 55b:	50                   	push   %eax
 55c:	e8 a9 02 00 00       	call   80a <read>
 561:	89 9d 20 3c ff ff    	mov    %ebx,-0xc3e0(%ebp)
      for(i=bytesread;i<bil;i++){
 567:	83 c4 10             	add    $0x10,%esp
 56a:	89 c3                	mov    %eax,%ebx
 56c:	8b bd 24 3c ff ff    	mov    -0xc3dc(%ebp),%edi
 572:	eb 14                	jmp    588 <main+0x588>
        write(fd," ",1);
 574:	50                   	push   %eax
 575:	6a 01                	push   $0x1
      for(i=bytesread;i<bil;i++){
 577:	83 c3 01             	add    $0x1,%ebx
        write(fd," ",1);
 57a:	68 23 0d 00 00       	push   $0xd23
 57f:	56                   	push   %esi
 580:	e8 8d 02 00 00       	call   812 <write>
      for(i=bytesread;i<bil;i++){
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 df                	cmp    %ebx,%edi
 58a:	7f e8                	jg     574 <main+0x574>
 58c:	e9 72 fd ff ff       	jmp    303 <main+0x303>
 591:	66 90                	xchg   %ax,%ax
 593:	66 90                	xchg   %ax,%ax
 595:	66 90                	xchg   %ax,%ax
 597:	66 90                	xchg   %ax,%ax
 599:	66 90                	xchg   %ax,%ax
 59b:	66 90                	xchg   %ax,%ax
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5aa:	89 c2                	mov    %eax,%edx
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b0:	83 c1 01             	add    $0x1,%ecx
 5b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 5b7:	83 c2 01             	add    $0x1,%edx
 5ba:	84 db                	test   %bl,%bl
 5bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 5bf:	75 ef                	jne    5b0 <strcpy+0x10>
    ;
  return os;
}
 5c1:	5b                   	pop    %ebx
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	8b 55 08             	mov    0x8(%ebp),%edx
 5d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5da:	0f b6 02             	movzbl (%edx),%eax
 5dd:	0f b6 19             	movzbl (%ecx),%ebx
 5e0:	84 c0                	test   %al,%al
 5e2:	75 1c                	jne    600 <strcmp+0x30>
 5e4:	eb 2a                	jmp    610 <strcmp+0x40>
 5e6:	8d 76 00             	lea    0x0(%esi),%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 5f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 5f6:	83 c1 01             	add    $0x1,%ecx
 5f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 5fc:	84 c0                	test   %al,%al
 5fe:	74 10                	je     610 <strcmp+0x40>
 600:	38 d8                	cmp    %bl,%al
 602:	74 ec                	je     5f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 604:	29 d8                	sub    %ebx,%eax
}
 606:	5b                   	pop    %ebx
 607:	5d                   	pop    %ebp
 608:	c3                   	ret    
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 610:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 612:	29 d8                	sub    %ebx,%eax
}
 614:	5b                   	pop    %ebx
 615:	5d                   	pop    %ebp
 616:	c3                   	ret    
 617:	89 f6                	mov    %esi,%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000620 <strlen>:

uint
strlen(const char *s)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 626:	80 39 00             	cmpb   $0x0,(%ecx)
 629:	74 15                	je     640 <strlen+0x20>
 62b:	31 d2                	xor    %edx,%edx
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	83 c2 01             	add    $0x1,%edx
 633:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 637:	89 d0                	mov    %edx,%eax
 639:	75 f5                	jne    630 <strlen+0x10>
    ;
  return n;
}
 63b:	5d                   	pop    %ebp
 63c:	c3                   	ret    
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 640:	31 c0                	xor    %eax,%eax
}
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    
 644:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 64a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000650 <memset>:

void*
memset(void *dst, int c, uint n)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 657:	8b 4d 10             	mov    0x10(%ebp),%ecx
 65a:	8b 45 0c             	mov    0xc(%ebp),%eax
 65d:	89 d7                	mov    %edx,%edi
 65f:	fc                   	cld    
 660:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 662:	89 d0                	mov    %edx,%eax
 664:	5f                   	pop    %edi
 665:	5d                   	pop    %ebp
 666:	c3                   	ret    
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <strchr>:

char*
strchr(const char *s, char c)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 67a:	0f b6 10             	movzbl (%eax),%edx
 67d:	84 d2                	test   %dl,%dl
 67f:	74 1d                	je     69e <strchr+0x2e>
    if(*s == c)
 681:	38 d3                	cmp    %dl,%bl
 683:	89 d9                	mov    %ebx,%ecx
 685:	75 0d                	jne    694 <strchr+0x24>
 687:	eb 17                	jmp    6a0 <strchr+0x30>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 690:	38 ca                	cmp    %cl,%dl
 692:	74 0c                	je     6a0 <strchr+0x30>
  for(; *s; s++)
 694:	83 c0 01             	add    $0x1,%eax
 697:	0f b6 10             	movzbl (%eax),%edx
 69a:	84 d2                	test   %dl,%dl
 69c:	75 f2                	jne    690 <strchr+0x20>
      return (char*)s;
  return 0;
 69e:	31 c0                	xor    %eax,%eax
}
 6a0:	5b                   	pop    %ebx
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret    
 6a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <gets>:

char*
gets(char *buf, int max)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6b6:	31 f6                	xor    %esi,%esi
 6b8:	89 f3                	mov    %esi,%ebx
{
 6ba:	83 ec 1c             	sub    $0x1c,%esp
 6bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 6c0:	eb 2f                	jmp    6f1 <gets+0x41>
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 6c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6cb:	83 ec 04             	sub    $0x4,%esp
 6ce:	6a 01                	push   $0x1
 6d0:	50                   	push   %eax
 6d1:	6a 00                	push   $0x0
 6d3:	e8 32 01 00 00       	call   80a <read>
    if(cc < 1)
 6d8:	83 c4 10             	add    $0x10,%esp
 6db:	85 c0                	test   %eax,%eax
 6dd:	7e 1c                	jle    6fb <gets+0x4b>
      break;
    buf[i++] = c;
 6df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 6e3:	83 c7 01             	add    $0x1,%edi
 6e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 6e9:	3c 0a                	cmp    $0xa,%al
 6eb:	74 23                	je     710 <gets+0x60>
 6ed:	3c 0d                	cmp    $0xd,%al
 6ef:	74 1f                	je     710 <gets+0x60>
  for(i=0; i+1 < max; ){
 6f1:	83 c3 01             	add    $0x1,%ebx
 6f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6f7:	89 fe                	mov    %edi,%esi
 6f9:	7c cd                	jl     6c8 <gets+0x18>
 6fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 700:	c6 03 00             	movb   $0x0,(%ebx)
}
 703:	8d 65 f4             	lea    -0xc(%ebp),%esp
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
 708:	5f                   	pop    %edi
 709:	5d                   	pop    %ebp
 70a:	c3                   	ret    
 70b:	90                   	nop
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 710:	8b 75 08             	mov    0x8(%ebp),%esi
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	01 de                	add    %ebx,%esi
 718:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 71a:	c6 03 00             	movb   $0x0,(%ebx)
}
 71d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 720:	5b                   	pop    %ebx
 721:	5e                   	pop    %esi
 722:	5f                   	pop    %edi
 723:	5d                   	pop    %ebp
 724:	c3                   	ret    
 725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000730 <stat>:

int
stat(const char *n, struct stat *st)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	56                   	push   %esi
 734:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 735:	83 ec 08             	sub    $0x8,%esp
 738:	6a 00                	push   $0x0
 73a:	ff 75 08             	pushl  0x8(%ebp)
 73d:	e8 f0 00 00 00       	call   832 <open>
  if(fd < 0)
 742:	83 c4 10             	add    $0x10,%esp
 745:	85 c0                	test   %eax,%eax
 747:	78 27                	js     770 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 749:	83 ec 08             	sub    $0x8,%esp
 74c:	ff 75 0c             	pushl  0xc(%ebp)
 74f:	89 c3                	mov    %eax,%ebx
 751:	50                   	push   %eax
 752:	e8 f3 00 00 00       	call   84a <fstat>
  close(fd);
 757:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 75a:	89 c6                	mov    %eax,%esi
  close(fd);
 75c:	e8 b9 00 00 00       	call   81a <close>
  return r;
 761:	83 c4 10             	add    $0x10,%esp
}
 764:	8d 65 f8             	lea    -0x8(%ebp),%esp
 767:	89 f0                	mov    %esi,%eax
 769:	5b                   	pop    %ebx
 76a:	5e                   	pop    %esi
 76b:	5d                   	pop    %ebp
 76c:	c3                   	ret    
 76d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 770:	be ff ff ff ff       	mov    $0xffffffff,%esi
 775:	eb ed                	jmp    764 <stat+0x34>
 777:	89 f6                	mov    %esi,%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <atoi>:

int
atoi(const char *s)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	53                   	push   %ebx
 784:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 787:	0f be 11             	movsbl (%ecx),%edx
 78a:	8d 42 d0             	lea    -0x30(%edx),%eax
 78d:	3c 09                	cmp    $0x9,%al
  n = 0;
 78f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 794:	77 1f                	ja     7b5 <atoi+0x35>
 796:	8d 76 00             	lea    0x0(%esi),%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 7a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 7a3:	83 c1 01             	add    $0x1,%ecx
 7a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 7aa:	0f be 11             	movsbl (%ecx),%edx
 7ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 7b0:	80 fb 09             	cmp    $0x9,%bl
 7b3:	76 eb                	jbe    7a0 <atoi+0x20>
  return n;
}
 7b5:	5b                   	pop    %ebx
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	90                   	nop
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	56                   	push   %esi
 7c4:	53                   	push   %ebx
 7c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7c8:	8b 45 08             	mov    0x8(%ebp),%eax
 7cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 7ce:	85 db                	test   %ebx,%ebx
 7d0:	7e 14                	jle    7e6 <memmove+0x26>
 7d2:	31 d2                	xor    %edx,%edx
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 7d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 7dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 7df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 7e2:	39 d3                	cmp    %edx,%ebx
 7e4:	75 f2                	jne    7d8 <memmove+0x18>
  return vdst;
}
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5d                   	pop    %ebp
 7e9:	c3                   	ret    

000007ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7ea:	b8 01 00 00 00       	mov    $0x1,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <exit>:
SYSCALL(exit)
 7f2:	b8 02 00 00 00       	mov    $0x2,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <wait>:
SYSCALL(wait)
 7fa:	b8 03 00 00 00       	mov    $0x3,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <pipe>:
SYSCALL(pipe)
 802:	b8 04 00 00 00       	mov    $0x4,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <read>:
SYSCALL(read)
 80a:	b8 05 00 00 00       	mov    $0x5,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <write>:
SYSCALL(write)
 812:	b8 10 00 00 00       	mov    $0x10,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <close>:
SYSCALL(close)
 81a:	b8 15 00 00 00       	mov    $0x15,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <kill>:
SYSCALL(kill)
 822:	b8 06 00 00 00       	mov    $0x6,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <exec>:
SYSCALL(exec)
 82a:	b8 07 00 00 00       	mov    $0x7,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <open>:
SYSCALL(open)
 832:	b8 0f 00 00 00       	mov    $0xf,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <mknod>:
SYSCALL(mknod)
 83a:	b8 11 00 00 00       	mov    $0x11,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <unlink>:
SYSCALL(unlink)
 842:	b8 12 00 00 00       	mov    $0x12,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <fstat>:
SYSCALL(fstat)
 84a:	b8 08 00 00 00       	mov    $0x8,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <link>:
SYSCALL(link)
 852:	b8 13 00 00 00       	mov    $0x13,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <mkdir>:
SYSCALL(mkdir)
 85a:	b8 14 00 00 00       	mov    $0x14,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <chdir>:
SYSCALL(chdir)
 862:	b8 09 00 00 00       	mov    $0x9,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <dup>:
SYSCALL(dup)
 86a:	b8 0a 00 00 00       	mov    $0xa,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <getpid>:
SYSCALL(getpid)
 872:	b8 0b 00 00 00       	mov    $0xb,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <sbrk>:
SYSCALL(sbrk)
 87a:	b8 0c 00 00 00       	mov    $0xc,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <sleep>:
SYSCALL(sleep)
 882:	b8 0d 00 00 00       	mov    $0xd,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <uptime>:
SYSCALL(uptime)
 88a:	b8 0e 00 00 00       	mov    $0xe,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    
 892:	66 90                	xchg   %ax,%ax
 894:	66 90                	xchg   %ax,%ax
 896:	66 90                	xchg   %ax,%ax
 898:	66 90                	xchg   %ax,%ax
 89a:	66 90                	xchg   %ax,%ax
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8a9:	85 d2                	test   %edx,%edx
{
 8ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 8ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 8b0:	79 76                	jns    928 <printint+0x88>
 8b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8b6:	74 70                	je     928 <printint+0x88>
    x = -xx;
 8b8:	f7 d8                	neg    %eax
    neg = 1;
 8ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 8c1:	31 f6                	xor    %esi,%esi
 8c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 8c6:	eb 0a                	jmp    8d2 <printint+0x32>
 8c8:	90                   	nop
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 8d0:	89 fe                	mov    %edi,%esi
 8d2:	31 d2                	xor    %edx,%edx
 8d4:	8d 7e 01             	lea    0x1(%esi),%edi
 8d7:	f7 f1                	div    %ecx
 8d9:	0f b6 92 58 0e 00 00 	movzbl 0xe58(%edx),%edx
  }while((x /= base) != 0);
 8e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 8e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 8e5:	75 e9                	jne    8d0 <printint+0x30>
  if(neg)
 8e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 8ea:	85 c0                	test   %eax,%eax
 8ec:	74 08                	je     8f6 <printint+0x56>
    buf[i++] = '-';
 8ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 8f3:	8d 7e 02             	lea    0x2(%esi),%edi
 8f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 8fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
 900:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
 906:	83 ee 01             	sub    $0x1,%esi
 909:	6a 01                	push   $0x1
 90b:	53                   	push   %ebx
 90c:	57                   	push   %edi
 90d:	88 45 d7             	mov    %al,-0x29(%ebp)
 910:	e8 fd fe ff ff       	call   812 <write>

  while(--i >= 0)
 915:	83 c4 10             	add    $0x10,%esp
 918:	39 de                	cmp    %ebx,%esi
 91a:	75 e4                	jne    900 <printint+0x60>
    putc(fd, buf[i]);
}
 91c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91f:	5b                   	pop    %ebx
 920:	5e                   	pop    %esi
 921:	5f                   	pop    %edi
 922:	5d                   	pop    %ebp
 923:	c3                   	ret    
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 928:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 92f:	eb 90                	jmp    8c1 <printint+0x21>
 931:	eb 0d                	jmp    940 <printf>
 933:	90                   	nop
 934:	90                   	nop
 935:	90                   	nop
 936:	90                   	nop
 937:	90                   	nop
 938:	90                   	nop
 939:	90                   	nop
 93a:	90                   	nop
 93b:	90                   	nop
 93c:	90                   	nop
 93d:	90                   	nop
 93e:	90                   	nop
 93f:	90                   	nop

00000940 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 949:	8b 75 0c             	mov    0xc(%ebp),%esi
 94c:	0f b6 1e             	movzbl (%esi),%ebx
 94f:	84 db                	test   %bl,%bl
 951:	0f 84 b3 00 00 00    	je     a0a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 957:	8d 45 10             	lea    0x10(%ebp),%eax
 95a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 95d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 95f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 962:	eb 2f                	jmp    993 <printf+0x53>
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 968:	83 f8 25             	cmp    $0x25,%eax
 96b:	0f 84 a7 00 00 00    	je     a18 <printf+0xd8>
  write(fd, &c, 1);
 971:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 974:	83 ec 04             	sub    $0x4,%esp
 977:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 97a:	6a 01                	push   $0x1
 97c:	50                   	push   %eax
 97d:	ff 75 08             	pushl  0x8(%ebp)
 980:	e8 8d fe ff ff       	call   812 <write>
 985:	83 c4 10             	add    $0x10,%esp
 988:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 98b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 98f:	84 db                	test   %bl,%bl
 991:	74 77                	je     a0a <printf+0xca>
    if(state == 0){
 993:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 995:	0f be cb             	movsbl %bl,%ecx
 998:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 99b:	74 cb                	je     968 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 99d:	83 ff 25             	cmp    $0x25,%edi
 9a0:	75 e6                	jne    988 <printf+0x48>
      if(c == 'd'){
 9a2:	83 f8 64             	cmp    $0x64,%eax
 9a5:	0f 84 05 01 00 00    	je     ab0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9b1:	83 f9 70             	cmp    $0x70,%ecx
 9b4:	74 72                	je     a28 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9b6:	83 f8 73             	cmp    $0x73,%eax
 9b9:	0f 84 99 00 00 00    	je     a58 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9bf:	83 f8 63             	cmp    $0x63,%eax
 9c2:	0f 84 08 01 00 00    	je     ad0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9c8:	83 f8 25             	cmp    $0x25,%eax
 9cb:	0f 84 ef 00 00 00    	je     ac0 <printf+0x180>
  write(fd, &c, 1);
 9d1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9d4:	83 ec 04             	sub    $0x4,%esp
 9d7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9db:	6a 01                	push   $0x1
 9dd:	50                   	push   %eax
 9de:	ff 75 08             	pushl  0x8(%ebp)
 9e1:	e8 2c fe ff ff       	call   812 <write>
 9e6:	83 c4 0c             	add    $0xc,%esp
 9e9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 9ec:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 9ef:	6a 01                	push   $0x1
 9f1:	50                   	push   %eax
 9f2:	ff 75 08             	pushl  0x8(%ebp)
 9f5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9f8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 9fa:	e8 13 fe ff ff       	call   812 <write>
  for(i = 0; fmt[i]; i++){
 9ff:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 a03:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a06:	84 db                	test   %bl,%bl
 a08:	75 89                	jne    993 <printf+0x53>
    }
  }
}
 a0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a0d:	5b                   	pop    %ebx
 a0e:	5e                   	pop    %esi
 a0f:	5f                   	pop    %edi
 a10:	5d                   	pop    %ebp
 a11:	c3                   	ret    
 a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 a18:	bf 25 00 00 00       	mov    $0x25,%edi
 a1d:	e9 66 ff ff ff       	jmp    988 <printf+0x48>
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 a28:	83 ec 0c             	sub    $0xc,%esp
 a2b:	b9 10 00 00 00       	mov    $0x10,%ecx
 a30:	6a 00                	push   $0x0
 a32:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 a35:	8b 45 08             	mov    0x8(%ebp),%eax
 a38:	8b 17                	mov    (%edi),%edx
 a3a:	e8 61 fe ff ff       	call   8a0 <printint>
        ap++;
 a3f:	89 f8                	mov    %edi,%eax
 a41:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a44:	31 ff                	xor    %edi,%edi
        ap++;
 a46:	83 c0 04             	add    $0x4,%eax
 a49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 a4c:	e9 37 ff ff ff       	jmp    988 <printf+0x48>
 a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a58:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a5b:	8b 08                	mov    (%eax),%ecx
        ap++;
 a5d:	83 c0 04             	add    $0x4,%eax
 a60:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 a63:	85 c9                	test   %ecx,%ecx
 a65:	0f 84 8e 00 00 00    	je     af9 <printf+0x1b9>
        while(*s != 0){
 a6b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 a6e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 a70:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 a72:	84 c0                	test   %al,%al
 a74:	0f 84 0e ff ff ff    	je     988 <printf+0x48>
 a7a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 a7d:	89 de                	mov    %ebx,%esi
 a7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a82:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 a85:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a88:	83 ec 04             	sub    $0x4,%esp
          s++;
 a8b:	83 c6 01             	add    $0x1,%esi
 a8e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 a91:	6a 01                	push   $0x1
 a93:	57                   	push   %edi
 a94:	53                   	push   %ebx
 a95:	e8 78 fd ff ff       	call   812 <write>
        while(*s != 0){
 a9a:	0f b6 06             	movzbl (%esi),%eax
 a9d:	83 c4 10             	add    $0x10,%esp
 aa0:	84 c0                	test   %al,%al
 aa2:	75 e4                	jne    a88 <printf+0x148>
 aa4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 aa7:	31 ff                	xor    %edi,%edi
 aa9:	e9 da fe ff ff       	jmp    988 <printf+0x48>
 aae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 ab0:	83 ec 0c             	sub    $0xc,%esp
 ab3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ab8:	6a 01                	push   $0x1
 aba:	e9 73 ff ff ff       	jmp    a32 <printf+0xf2>
 abf:	90                   	nop
  write(fd, &c, 1);
 ac0:	83 ec 04             	sub    $0x4,%esp
 ac3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 ac6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 ac9:	6a 01                	push   $0x1
 acb:	e9 21 ff ff ff       	jmp    9f1 <printf+0xb1>
        putc(fd, *ap);
 ad0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 ad3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 ad6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 ad8:	6a 01                	push   $0x1
        ap++;
 ada:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 add:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 ae0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 ae3:	50                   	push   %eax
 ae4:	ff 75 08             	pushl  0x8(%ebp)
 ae7:	e8 26 fd ff ff       	call   812 <write>
        ap++;
 aec:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 aef:	83 c4 10             	add    $0x10,%esp
      state = 0;
 af2:	31 ff                	xor    %edi,%edi
 af4:	e9 8f fe ff ff       	jmp    988 <printf+0x48>
          s = "(null)";
 af9:	bb 50 0e 00 00       	mov    $0xe50,%ebx
        while(*s != 0){
 afe:	b8 28 00 00 00       	mov    $0x28,%eax
 b03:	e9 72 ff ff ff       	jmp    a7a <printf+0x13a>
 b08:	66 90                	xchg   %ax,%ax
 b0a:	66 90                	xchg   %ax,%ax
 b0c:	66 90                	xchg   %ax,%ax
 b0e:	66 90                	xchg   %ax,%ax

00000b10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b10:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b11:	a1 20 11 00 00       	mov    0x1120,%eax
{
 b16:	89 e5                	mov    %esp,%ebp
 b18:	57                   	push   %edi
 b19:	56                   	push   %esi
 b1a:	53                   	push   %ebx
 b1b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b1e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b28:	39 c8                	cmp    %ecx,%eax
 b2a:	8b 10                	mov    (%eax),%edx
 b2c:	73 32                	jae    b60 <free+0x50>
 b2e:	39 d1                	cmp    %edx,%ecx
 b30:	72 04                	jb     b36 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b32:	39 d0                	cmp    %edx,%eax
 b34:	72 32                	jb     b68 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b36:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b39:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b3c:	39 fa                	cmp    %edi,%edx
 b3e:	74 30                	je     b70 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b40:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b43:	8b 50 04             	mov    0x4(%eax),%edx
 b46:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b49:	39 f1                	cmp    %esi,%ecx
 b4b:	74 3a                	je     b87 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b4d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 b4f:	a3 20 11 00 00       	mov    %eax,0x1120
}
 b54:	5b                   	pop    %ebx
 b55:	5e                   	pop    %esi
 b56:	5f                   	pop    %edi
 b57:	5d                   	pop    %ebp
 b58:	c3                   	ret    
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b60:	39 d0                	cmp    %edx,%eax
 b62:	72 04                	jb     b68 <free+0x58>
 b64:	39 d1                	cmp    %edx,%ecx
 b66:	72 ce                	jb     b36 <free+0x26>
{
 b68:	89 d0                	mov    %edx,%eax
 b6a:	eb bc                	jmp    b28 <free+0x18>
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 b70:	03 72 04             	add    0x4(%edx),%esi
 b73:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b76:	8b 10                	mov    (%eax),%edx
 b78:	8b 12                	mov    (%edx),%edx
 b7a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b7d:	8b 50 04             	mov    0x4(%eax),%edx
 b80:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b83:	39 f1                	cmp    %esi,%ecx
 b85:	75 c6                	jne    b4d <free+0x3d>
    p->s.size += bp->s.size;
 b87:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b8a:	a3 20 11 00 00       	mov    %eax,0x1120
    p->s.size += bp->s.size;
 b8f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b92:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b95:	89 10                	mov    %edx,(%eax)
}
 b97:	5b                   	pop    %ebx
 b98:	5e                   	pop    %esi
 b99:	5f                   	pop    %edi
 b9a:	5d                   	pop    %ebp
 b9b:	c3                   	ret    
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	57                   	push   %edi
 ba4:	56                   	push   %esi
 ba5:	53                   	push   %ebx
 ba6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bac:	8b 15 20 11 00 00    	mov    0x1120,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb2:	8d 78 07             	lea    0x7(%eax),%edi
 bb5:	c1 ef 03             	shr    $0x3,%edi
 bb8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 bbb:	85 d2                	test   %edx,%edx
 bbd:	0f 84 9d 00 00 00    	je     c60 <malloc+0xc0>
 bc3:	8b 02                	mov    (%edx),%eax
 bc5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bc8:	39 cf                	cmp    %ecx,%edi
 bca:	76 6c                	jbe    c38 <malloc+0x98>
 bcc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 bd2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 bd7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 bda:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 be1:	eb 0e                	jmp    bf1 <malloc+0x51>
 be3:	90                   	nop
 be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 bea:	8b 48 04             	mov    0x4(%eax),%ecx
 bed:	39 f9                	cmp    %edi,%ecx
 bef:	73 47                	jae    c38 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bf1:	39 05 20 11 00 00    	cmp    %eax,0x1120
 bf7:	89 c2                	mov    %eax,%edx
 bf9:	75 ed                	jne    be8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 bfb:	83 ec 0c             	sub    $0xc,%esp
 bfe:	56                   	push   %esi
 bff:	e8 76 fc ff ff       	call   87a <sbrk>
  if(p == (char*)-1)
 c04:	83 c4 10             	add    $0x10,%esp
 c07:	83 f8 ff             	cmp    $0xffffffff,%eax
 c0a:	74 1c                	je     c28 <malloc+0x88>
  hp->s.size = nu;
 c0c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c0f:	83 ec 0c             	sub    $0xc,%esp
 c12:	83 c0 08             	add    $0x8,%eax
 c15:	50                   	push   %eax
 c16:	e8 f5 fe ff ff       	call   b10 <free>
  return freep;
 c1b:	8b 15 20 11 00 00    	mov    0x1120,%edx
      if((p = morecore(nunits)) == 0)
 c21:	83 c4 10             	add    $0x10,%esp
 c24:	85 d2                	test   %edx,%edx
 c26:	75 c0                	jne    be8 <malloc+0x48>
        return 0;
  }
}
 c28:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c2b:	31 c0                	xor    %eax,%eax
}
 c2d:	5b                   	pop    %ebx
 c2e:	5e                   	pop    %esi
 c2f:	5f                   	pop    %edi
 c30:	5d                   	pop    %ebp
 c31:	c3                   	ret    
 c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c38:	39 cf                	cmp    %ecx,%edi
 c3a:	74 54                	je     c90 <malloc+0xf0>
        p->s.size -= nunits;
 c3c:	29 f9                	sub    %edi,%ecx
 c3e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c41:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c44:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 c47:	89 15 20 11 00 00    	mov    %edx,0x1120
}
 c4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c50:	83 c0 08             	add    $0x8,%eax
}
 c53:	5b                   	pop    %ebx
 c54:	5e                   	pop    %esi
 c55:	5f                   	pop    %edi
 c56:	5d                   	pop    %ebp
 c57:	c3                   	ret    
 c58:	90                   	nop
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 c60:	c7 05 20 11 00 00 24 	movl   $0x1124,0x1120
 c67:	11 00 00 
 c6a:	c7 05 24 11 00 00 24 	movl   $0x1124,0x1124
 c71:	11 00 00 
    base.s.size = 0;
 c74:	b8 24 11 00 00       	mov    $0x1124,%eax
 c79:	c7 05 28 11 00 00 00 	movl   $0x0,0x1128
 c80:	00 00 00 
 c83:	e9 44 ff ff ff       	jmp    bcc <malloc+0x2c>
 c88:	90                   	nop
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 c90:	8b 08                	mov    (%eax),%ecx
 c92:	89 0a                	mov    %ecx,(%edx)
 c94:	eb b1                	jmp    c47 <malloc+0xa7>
