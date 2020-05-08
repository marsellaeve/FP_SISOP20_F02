
_factor:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"

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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 51 04             	mov    0x4(%ecx),%edx
    int bil;
    int fact;
    int temp;
    int arr[argc];
  19:	8d 0c bd 00 00 00 00 	lea    0x0(,%edi,4),%ecx
int main(int argc, char *argv[]){
  20:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    int arr[argc];
  23:	8d 41 12             	lea    0x12(%ecx),%eax
  26:	83 e0 f0             	and    $0xfffffff0,%eax
  29:	29 c4                	sub    %eax,%esp
    int factor=-1;
    for(int i=1;i<argc;i++){
  2b:	83 ff 01             	cmp    $0x1,%edi
    int arr[argc];
  2e:	89 65 e0             	mov    %esp,-0x20(%ebp)
    for(int i=1;i<argc;i++){
  31:	7e 65                	jle    98 <main+0x98>
  33:	8d 72 04             	lea    0x4(%edx),%esi
  36:	b8 01 00 00 00       	mov    $0x1,%eax
  3b:	89 f3                	mov    %esi,%ebx
  3d:	eb 0b                	jmp    4a <main+0x4a>
  3f:	90                   	nop
  40:	83 c0 01             	add    $0x1,%eax
  43:	83 c3 04             	add    $0x4,%ebx
  46:	39 c7                	cmp    %eax,%edi
  48:	74 56                	je     a0 <main+0xa0>
        if(argv[i][0]=='-'&&argv[i][1]=='-'){
  4a:	8b 13                	mov    (%ebx),%edx
  4c:	80 3a 2d             	cmpb   $0x2d,(%edx)
  4f:	75 ef                	jne    40 <main+0x40>
  51:	80 7a 01 2d          	cmpb   $0x2d,0x1(%edx)
  55:	75 e9                	jne    40 <main+0x40>
            if(strcmp(argv[i],"--help")==0){
  57:	57                   	push   %edi
  58:	57                   	push   %edi
  59:	68 58 09 00 00       	push   $0x958
  5e:	52                   	push   %edx
  5f:	e8 2c 02 00 00       	call   290 <strcmp>
  64:	83 c4 10             	add    $0x10,%esp
  67:	85 c0                	test   %eax,%eax
  69:	0f 84 c1 01 00 00    	je     230 <main+0x230>
                printf(1,"factor [NUMBER]\nnumber must be a positive integer and >2\n");
                printf(1,"factor by F02\n");
            }
            else if(strlen(argv[i])>1)
  6f:	83 ec 0c             	sub    $0xc,%esp
  72:	ff 33                	pushl  (%ebx)
  74:	e8 67 02 00 00       	call   2e0 <strlen>
  79:	83 c4 10             	add    $0x10,%esp
  7c:	83 f8 01             	cmp    $0x1,%eax
  7f:	76 17                	jbe    98 <main+0x98>
            printf(1,"factor invalid option --help for more info\n");
  81:	52                   	push   %edx
  82:	52                   	push   %edx
  83:	68 d4 09 00 00       	push   $0x9d4
  88:	6a 01                	push   $0x1
  8a:	e8 71 05 00 00       	call   600 <printf>
  8f:	83 c4 10             	add    $0x10,%esp
  92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            exit();
  98:	e8 15 04 00 00       	call   4b2 <exit>
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    for(int i=1;i<argc;i++){
  a3:	31 ff                	xor    %edi,%edi
  a5:	01 cb                	add    %ecx,%ebx
  a7:	eb 17                	jmp    c0 <main+0xc0>
  a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bil= atoi(argv[i]);
        if(bil==0&&strcmp(argv[i],"0")){
            printf(1,"factor %s not a valid positive int\n--help for more info\n",argv[i]);
        }
        else{
            arr[cnt++]=bil;
  b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b3:	89 0c b8             	mov    %ecx,(%eax,%edi,4)
  b6:	83 c7 01             	add    $0x1,%edi
  b9:	83 c6 04             	add    $0x4,%esi
    for(int i=1;i<argc;i++){
  bc:	39 de                	cmp    %ebx,%esi
  be:	74 48                	je     108 <main+0x108>
        bil= atoi(argv[i]);
  c0:	83 ec 0c             	sub    $0xc,%esp
  c3:	ff 36                	pushl  (%esi)
  c5:	e8 76 03 00 00       	call   440 <atoi>
        if(bil==0&&strcmp(argv[i],"0")){
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	85 c0                	test   %eax,%eax
        bil= atoi(argv[i]);
  cf:	89 c1                	mov    %eax,%ecx
        if(bil==0&&strcmp(argv[i],"0")){
  d1:	75 dd                	jne    b0 <main+0xb0>
  d3:	83 ec 08             	sub    $0x8,%esp
  d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d9:	68 6e 09 00 00       	push   $0x96e
  de:	ff 36                	pushl  (%esi)
  e0:	e8 ab 01 00 00       	call   290 <strcmp>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	85 c0                	test   %eax,%eax
  ea:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  ed:	74 c1                	je     b0 <main+0xb0>
            printf(1,"factor %s not a valid positive int\n--help for more info\n",argv[i]);
  ef:	50                   	push   %eax
  f0:	ff 36                	pushl  (%esi)
  f2:	68 00 0a 00 00       	push   $0xa00
  f7:	6a 01                	push   $0x1
  f9:	e8 02 05 00 00       	call   600 <printf>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	eb b6                	jmp    b9 <main+0xb9>
 103:	90                   	nop
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        }
    }
    for(int i=0;i<cnt;i++){
 108:	85 ff                	test   %edi,%edi
 10a:	89 7d d8             	mov    %edi,-0x28(%ebp)
 10d:	74 89                	je     98 <main+0x98>
 10f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    int factor=-1;
 116:	83 c9 ff             	or     $0xffffffff,%ecx
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bil=arr[i];
 120:	8b 45 e0             	mov    -0x20(%ebp),%eax
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
        printf(1,"%d:",bil);
 126:	83 ec 04             	sub    $0x4,%esp
 129:	89 4d dc             	mov    %ecx,-0x24(%ebp)
        fact=2;
        temp=1;
 12c:	bf 01 00 00 00       	mov    $0x1,%edi
        fact=2;
 131:	bb 02 00 00 00       	mov    $0x2,%ebx
        bil=arr[i];
 136:	8b 34 90             	mov    (%eax,%edx,4),%esi
        printf(1,"%d:",bil);
 139:	56                   	push   %esi
 13a:	68 70 09 00 00       	push   $0x970
 13f:	6a 01                	push   $0x1
 141:	e8 ba 04 00 00       	call   600 <printf>
        if(bil>1){
 146:	83 c4 10             	add    $0x10,%esp
 149:	83 fe 01             	cmp    $0x1,%esi
 14c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 14f:	0f 8e a3 00 00 00    	jle    1f8 <main+0x1f8>
            while(fact*fact<=bil){
 155:	89 d8                	mov    %ebx,%eax
 157:	0f af c3             	imul   %ebx,%eax
 15a:	39 c6                	cmp    %eax,%esi
 15c:	7c 28                	jl     186 <main+0x186>
 15e:	89 f0                	mov    %esi,%eax
 160:	99                   	cltd   
 161:	f7 fb                	idiv   %ebx
                if(bil%fact==0){
 163:	85 d2                	test   %edx,%edx
 165:	74 69                	je     1d0 <main+0x1d0>
                    bil=bil/fact;
                    continue;
                }
                fact=fact+temp;
                if(fact<7) temp=2;
                else temp=6-temp;
 167:	b8 06 00 00 00       	mov    $0x6,%eax
                fact=fact+temp;
 16c:	01 fb                	add    %edi,%ebx
                else temp=6-temp;
 16e:	29 f8                	sub    %edi,%eax
 170:	83 fb 06             	cmp    $0x6,%ebx
 173:	89 c7                	mov    %eax,%edi
 175:	b8 02 00 00 00       	mov    $0x2,%eax
 17a:	0f 4e f8             	cmovle %eax,%edi
            while(fact*fact<=bil){
 17d:	89 d8                	mov    %ebx,%eax
 17f:	0f af c3             	imul   %ebx,%eax
 182:	39 c6                	cmp    %eax,%esi
 184:	7d d8                	jge    15e <main+0x15e>
            }
            if(bil==factor){
 186:	39 f1                	cmp    %esi,%ecx
 188:	0f 84 8a 00 00 00    	je     218 <main+0x218>
                printf(1," %d",fact);
            }
            else{
                factor=bil;
                printf(1," %d",bil);
 18e:	83 ec 04             	sub    $0x4,%esp
 191:	56                   	push   %esi
 192:	68 74 09 00 00       	push   $0x974
 197:	6a 01                	push   $0x1
 199:	e8 62 04 00 00       	call   600 <printf>
 19e:	83 c4 10             	add    $0x10,%esp
            }
            printf(1,"\n");
 1a1:	83 ec 08             	sub    $0x8,%esp
 1a4:	68 6c 09 00 00       	push   $0x96c
 1a9:	6a 01                	push   $0x1
 1ab:	e8 50 04 00 00       	call   600 <printf>
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	89 f1                	mov    %esi,%ecx
    for(int i=0;i<cnt;i++){
 1b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1bc:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 1bf:	0f 85 5b ff ff ff    	jne    120 <main+0x120>
 1c5:	e9 ce fe ff ff       	jmp    98 <main+0x98>
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                        printf(1," %d",fact);
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
 1d6:	53                   	push   %ebx
 1d7:	68 74 09 00 00       	push   $0x974
 1dc:	6a 01                	push   $0x1
 1de:	e8 1d 04 00 00       	call   600 <printf>
 1e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
 1e6:	83 c4 10             	add    $0x10,%esp
                    continue;
 1e9:	89 d9                	mov    %ebx,%ecx
                    bil=bil/fact;
 1eb:	89 c6                	mov    %eax,%esi
                    continue;
 1ed:	e9 63 ff ff ff       	jmp    155 <main+0x155>
 1f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        }
        else{
            printf(1,"factor < 2, prime number>=2\n");
 1f8:	83 ec 08             	sub    $0x8,%esp
 1fb:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 1fe:	68 78 09 00 00       	push   $0x978
 203:	6a 01                	push   $0x1
 205:	e8 f6 03 00 00       	call   600 <printf>
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 210:	eb a3                	jmp    1b5 <main+0x1b5>
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1," %d",fact);
 218:	83 ec 04             	sub    $0x4,%esp
 21b:	53                   	push   %ebx
 21c:	68 74 09 00 00       	push   $0x974
 221:	6a 01                	push   $0x1
 223:	e8 d8 03 00 00       	call   600 <printf>
 228:	83 c4 10             	add    $0x10,%esp
 22b:	e9 71 ff ff ff       	jmp    1a1 <main+0x1a1>
                printf(1,"factor [NUMBER]\nnumber must be a positive integer and >2\n");
 230:	51                   	push   %ecx
 231:	51                   	push   %ecx
 232:	68 98 09 00 00       	push   $0x998
 237:	6a 01                	push   $0x1
 239:	e8 c2 03 00 00       	call   600 <printf>
                printf(1,"factor by F02\n");
 23e:	5b                   	pop    %ebx
 23f:	5e                   	pop    %esi
 240:	68 5f 09 00 00       	push   $0x95f
 245:	6a 01                	push   $0x1
 247:	e8 b4 03 00 00       	call   600 <printf>
 24c:	83 c4 10             	add    $0x10,%esp
 24f:	e9 44 fe ff ff       	jmp    98 <main+0x98>
 254:	66 90                	xchg   %ax,%ax
 256:	66 90                	xchg   %ax,%ax
 258:	66 90                	xchg   %ax,%ax
 25a:	66 90                	xchg   %ax,%ax
 25c:	66 90                	xchg   %ax,%ax
 25e:	66 90                	xchg   %ax,%ax

00000260 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 26a:	89 c2                	mov    %eax,%edx
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 270:	83 c1 01             	add    $0x1,%ecx
 273:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 277:	83 c2 01             	add    $0x1,%edx
 27a:	84 db                	test   %bl,%bl
 27c:	88 5a ff             	mov    %bl,-0x1(%edx)
 27f:	75 ef                	jne    270 <strcpy+0x10>
    ;
  return os;
}
 281:	5b                   	pop    %ebx
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    
 284:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 28a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000290 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
 297:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 29a:	0f b6 02             	movzbl (%edx),%eax
 29d:	0f b6 19             	movzbl (%ecx),%ebx
 2a0:	84 c0                	test   %al,%al
 2a2:	75 1c                	jne    2c0 <strcmp+0x30>
 2a4:	eb 2a                	jmp    2d0 <strcmp+0x40>
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 2b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2b6:	83 c1 01             	add    $0x1,%ecx
 2b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 2bc:	84 c0                	test   %al,%al
 2be:	74 10                	je     2d0 <strcmp+0x40>
 2c0:	38 d8                	cmp    %bl,%al
 2c2:	74 ec                	je     2b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2c4:	29 d8                	sub    %ebx,%eax
}
 2c6:	5b                   	pop    %ebx
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2d2:	29 d8                	sub    %ebx,%eax
}
 2d4:	5b                   	pop    %ebx
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <strlen>:

uint
strlen(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2e6:	80 39 00             	cmpb   $0x0,(%ecx)
 2e9:	74 15                	je     300 <strlen+0x20>
 2eb:	31 d2                	xor    %edx,%edx
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	75 f5                	jne    2f0 <strlen+0x10>
    ;
  return n;
}
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 300:	31 c0                	xor    %eax,%eax
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 30a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000310 <memset>:

void*
memset(void *dst, int c, uint n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 317:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31a:	8b 45 0c             	mov    0xc(%ebp),%eax
 31d:	89 d7                	mov    %edx,%edi
 31f:	fc                   	cld    
 320:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 322:	89 d0                	mov    %edx,%eax
 324:	5f                   	pop    %edi
 325:	5d                   	pop    %ebp
 326:	c3                   	ret    
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <strchr>:

char*
strchr(const char *s, char c)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 33a:	0f b6 10             	movzbl (%eax),%edx
 33d:	84 d2                	test   %dl,%dl
 33f:	74 1d                	je     35e <strchr+0x2e>
    if(*s == c)
 341:	38 d3                	cmp    %dl,%bl
 343:	89 d9                	mov    %ebx,%ecx
 345:	75 0d                	jne    354 <strchr+0x24>
 347:	eb 17                	jmp    360 <strchr+0x30>
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 350:	38 ca                	cmp    %cl,%dl
 352:	74 0c                	je     360 <strchr+0x30>
  for(; *s; s++)
 354:	83 c0 01             	add    $0x1,%eax
 357:	0f b6 10             	movzbl (%eax),%edx
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strchr+0x20>
      return (char*)s;
  return 0;
 35e:	31 c0                	xor    %eax,%eax
}
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <gets>:

char*
gets(char *buf, int max)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 376:	31 f6                	xor    %esi,%esi
 378:	89 f3                	mov    %esi,%ebx
{
 37a:	83 ec 1c             	sub    $0x1c,%esp
 37d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 380:	eb 2f                	jmp    3b1 <gets+0x41>
 382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 388:	8d 45 e7             	lea    -0x19(%ebp),%eax
 38b:	83 ec 04             	sub    $0x4,%esp
 38e:	6a 01                	push   $0x1
 390:	50                   	push   %eax
 391:	6a 00                	push   $0x0
 393:	e8 32 01 00 00       	call   4ca <read>
    if(cc < 1)
 398:	83 c4 10             	add    $0x10,%esp
 39b:	85 c0                	test   %eax,%eax
 39d:	7e 1c                	jle    3bb <gets+0x4b>
      break;
    buf[i++] = c;
 39f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a3:	83 c7 01             	add    $0x1,%edi
 3a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3a9:	3c 0a                	cmp    $0xa,%al
 3ab:	74 23                	je     3d0 <gets+0x60>
 3ad:	3c 0d                	cmp    $0xd,%al
 3af:	74 1f                	je     3d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 3b1:	83 c3 01             	add    $0x1,%ebx
 3b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3b7:	89 fe                	mov    %edi,%esi
 3b9:	7c cd                	jl     388 <gets+0x18>
 3bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 3c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	90                   	nop
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d0:	8b 75 08             	mov    0x8(%ebp),%esi
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	01 de                	add    %ebx,%esi
 3d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 3da:	c6 03 00             	movb   $0x0,(%ebx)
}
 3dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5f                   	pop    %edi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    
 3e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f5:	83 ec 08             	sub    $0x8,%esp
 3f8:	6a 00                	push   $0x0
 3fa:	ff 75 08             	pushl  0x8(%ebp)
 3fd:	e8 f0 00 00 00       	call   4f2 <open>
  if(fd < 0)
 402:	83 c4 10             	add    $0x10,%esp
 405:	85 c0                	test   %eax,%eax
 407:	78 27                	js     430 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 409:	83 ec 08             	sub    $0x8,%esp
 40c:	ff 75 0c             	pushl  0xc(%ebp)
 40f:	89 c3                	mov    %eax,%ebx
 411:	50                   	push   %eax
 412:	e8 f3 00 00 00       	call   50a <fstat>
  close(fd);
 417:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 41a:	89 c6                	mov    %eax,%esi
  close(fd);
 41c:	e8 b9 00 00 00       	call   4da <close>
  return r;
 421:	83 c4 10             	add    $0x10,%esp
}
 424:	8d 65 f8             	lea    -0x8(%ebp),%esp
 427:	89 f0                	mov    %esi,%eax
 429:	5b                   	pop    %ebx
 42a:	5e                   	pop    %esi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    
 42d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 430:	be ff ff ff ff       	mov    $0xffffffff,%esi
 435:	eb ed                	jmp    424 <stat+0x34>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <atoi>:

int
atoi(const char *s)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
 444:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 447:	0f be 11             	movsbl (%ecx),%edx
 44a:	8d 42 d0             	lea    -0x30(%edx),%eax
 44d:	3c 09                	cmp    $0x9,%al
  n = 0;
 44f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 454:	77 1f                	ja     475 <atoi+0x35>
 456:	8d 76 00             	lea    0x0(%esi),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 460:	8d 04 80             	lea    (%eax,%eax,4),%eax
 463:	83 c1 01             	add    $0x1,%ecx
 466:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 46a:	0f be 11             	movsbl (%ecx),%edx
 46d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 470:	80 fb 09             	cmp    $0x9,%bl
 473:	76 eb                	jbe    460 <atoi+0x20>
  return n;
}
 475:	5b                   	pop    %ebx
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
 478:	90                   	nop
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
 485:	8b 5d 10             	mov    0x10(%ebp),%ebx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 48e:	85 db                	test   %ebx,%ebx
 490:	7e 14                	jle    4a6 <memmove+0x26>
 492:	31 d2                	xor    %edx,%edx
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 498:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 49c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 49f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 4a2:	39 d3                	cmp    %edx,%ebx
 4a4:	75 f2                	jne    498 <memmove+0x18>
  return vdst;
}
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4aa:	b8 01 00 00 00       	mov    $0x1,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <exit>:
SYSCALL(exit)
 4b2:	b8 02 00 00 00       	mov    $0x2,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <wait>:
SYSCALL(wait)
 4ba:	b8 03 00 00 00       	mov    $0x3,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <pipe>:
SYSCALL(pipe)
 4c2:	b8 04 00 00 00       	mov    $0x4,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <read>:
SYSCALL(read)
 4ca:	b8 05 00 00 00       	mov    $0x5,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <write>:
SYSCALL(write)
 4d2:	b8 10 00 00 00       	mov    $0x10,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <close>:
SYSCALL(close)
 4da:	b8 15 00 00 00       	mov    $0x15,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <kill>:
SYSCALL(kill)
 4e2:	b8 06 00 00 00       	mov    $0x6,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <exec>:
SYSCALL(exec)
 4ea:	b8 07 00 00 00       	mov    $0x7,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <open>:
SYSCALL(open)
 4f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <mknod>:
SYSCALL(mknod)
 4fa:	b8 11 00 00 00       	mov    $0x11,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <unlink>:
SYSCALL(unlink)
 502:	b8 12 00 00 00       	mov    $0x12,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <fstat>:
SYSCALL(fstat)
 50a:	b8 08 00 00 00       	mov    $0x8,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <link>:
SYSCALL(link)
 512:	b8 13 00 00 00       	mov    $0x13,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <mkdir>:
SYSCALL(mkdir)
 51a:	b8 14 00 00 00       	mov    $0x14,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <chdir>:
SYSCALL(chdir)
 522:	b8 09 00 00 00       	mov    $0x9,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <dup>:
SYSCALL(dup)
 52a:	b8 0a 00 00 00       	mov    $0xa,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <getpid>:
SYSCALL(getpid)
 532:	b8 0b 00 00 00       	mov    $0xb,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <sbrk>:
SYSCALL(sbrk)
 53a:	b8 0c 00 00 00       	mov    $0xc,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <sleep>:
SYSCALL(sleep)
 542:	b8 0d 00 00 00       	mov    $0xd,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <uptime>:
SYSCALL(uptime)
 54a:	b8 0e 00 00 00       	mov    $0xe,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    
 552:	66 90                	xchg   %ax,%ax
 554:	66 90                	xchg   %ax,%ax
 556:	66 90                	xchg   %ax,%ax
 558:	66 90                	xchg   %ax,%ax
 55a:	66 90                	xchg   %ax,%ax
 55c:	66 90                	xchg   %ax,%ax
 55e:	66 90                	xchg   %ax,%ax

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 569:	85 d2                	test   %edx,%edx
{
 56b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 56e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 570:	79 76                	jns    5e8 <printint+0x88>
 572:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 576:	74 70                	je     5e8 <printint+0x88>
    x = -xx;
 578:	f7 d8                	neg    %eax
    neg = 1;
 57a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 581:	31 f6                	xor    %esi,%esi
 583:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 586:	eb 0a                	jmp    592 <printint+0x32>
 588:	90                   	nop
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 fe                	mov    %edi,%esi
 592:	31 d2                	xor    %edx,%edx
 594:	8d 7e 01             	lea    0x1(%esi),%edi
 597:	f7 f1                	div    %ecx
 599:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
  }while((x /= base) != 0);
 5a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 5a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 5a5:	75 e9                	jne    590 <printint+0x30>
  if(neg)
 5a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5aa:	85 c0                	test   %eax,%eax
 5ac:	74 08                	je     5b6 <printint+0x56>
    buf[i++] = '-';
 5ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 5b3:	8d 7e 02             	lea    0x2(%esi),%edi
 5b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 5ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
 5c6:	83 ee 01             	sub    $0x1,%esi
 5c9:	6a 01                	push   $0x1
 5cb:	53                   	push   %ebx
 5cc:	57                   	push   %edi
 5cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 5d0:	e8 fd fe ff ff       	call   4d2 <write>

  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x60>
    putc(fd, buf[i]);
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5ef:	eb 90                	jmp    581 <printint+0x21>
 5f1:	eb 0d                	jmp    600 <printf>
 5f3:	90                   	nop
 5f4:	90                   	nop
 5f5:	90                   	nop
 5f6:	90                   	nop
 5f7:	90                   	nop
 5f8:	90                   	nop
 5f9:	90                   	nop
 5fa:	90                   	nop
 5fb:	90                   	nop
 5fc:	90                   	nop
 5fd:	90                   	nop
 5fe:	90                   	nop
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 75 0c             	mov    0xc(%ebp),%esi
 60c:	0f b6 1e             	movzbl (%esi),%ebx
 60f:	84 db                	test   %bl,%bl
 611:	0f 84 b3 00 00 00    	je     6ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 617:	8d 45 10             	lea    0x10(%ebp),%eax
 61a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 61d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 61f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 622:	eb 2f                	jmp    653 <printf+0x53>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 a7 00 00 00    	je     6d8 <printf+0xd8>
  write(fd, &c, 1);
 631:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 634:	83 ec 04             	sub    $0x4,%esp
 637:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 63a:	6a 01                	push   $0x1
 63c:	50                   	push   %eax
 63d:	ff 75 08             	pushl  0x8(%ebp)
 640:	e8 8d fe ff ff       	call   4d2 <write>
 645:	83 c4 10             	add    $0x10,%esp
 648:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 64b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 64f:	84 db                	test   %bl,%bl
 651:	74 77                	je     6ca <printf+0xca>
    if(state == 0){
 653:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 655:	0f be cb             	movsbl %bl,%ecx
 658:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 65b:	74 cb                	je     628 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 65d:	83 ff 25             	cmp    $0x25,%edi
 660:	75 e6                	jne    648 <printf+0x48>
      if(c == 'd'){
 662:	83 f8 64             	cmp    $0x64,%eax
 665:	0f 84 05 01 00 00    	je     770 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 66b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 671:	83 f9 70             	cmp    $0x70,%ecx
 674:	74 72                	je     6e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 676:	83 f8 73             	cmp    $0x73,%eax
 679:	0f 84 99 00 00 00    	je     718 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67f:	83 f8 63             	cmp    $0x63,%eax
 682:	0f 84 08 01 00 00    	je     790 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	0f 84 ef 00 00 00    	je     780 <printf+0x180>
  write(fd, &c, 1);
 691:	8d 45 e7             	lea    -0x19(%ebp),%eax
 694:	83 ec 04             	sub    $0x4,%esp
 697:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69b:	6a 01                	push   $0x1
 69d:	50                   	push   %eax
 69e:	ff 75 08             	pushl  0x8(%ebp)
 6a1:	e8 2c fe ff ff       	call   4d2 <write>
 6a6:	83 c4 0c             	add    $0xc,%esp
 6a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 6ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 6af:	6a 01                	push   $0x1
 6b1:	50                   	push   %eax
 6b2:	ff 75 08             	pushl  0x8(%ebp)
 6b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6ba:	e8 13 fe ff ff       	call   4d2 <write>
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 6c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c6:	84 db                	test   %bl,%bl
 6c8:	75 89                	jne    653 <printf+0x53>
    }
  }
}
 6ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 6d8:	bf 25 00 00 00       	mov    $0x25,%edi
 6dd:	e9 66 ff ff ff       	jmp    648 <printf+0x48>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e8:	83 ec 0c             	sub    $0xc,%esp
 6eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f0:	6a 00                	push   $0x0
 6f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	8b 17                	mov    (%edi),%edx
 6fa:	e8 61 fe ff ff       	call   560 <printint>
        ap++;
 6ff:	89 f8                	mov    %edi,%eax
 701:	83 c4 10             	add    $0x10,%esp
      state = 0;
 704:	31 ff                	xor    %edi,%edi
        ap++;
 706:	83 c0 04             	add    $0x4,%eax
 709:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 70c:	e9 37 ff ff ff       	jmp    648 <printf+0x48>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 718:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 71b:	8b 08                	mov    (%eax),%ecx
        ap++;
 71d:	83 c0 04             	add    $0x4,%eax
 720:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 723:	85 c9                	test   %ecx,%ecx
 725:	0f 84 8e 00 00 00    	je     7b9 <printf+0x1b9>
        while(*s != 0){
 72b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 72e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 730:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 732:	84 c0                	test   %al,%al
 734:	0f 84 0e ff ff ff    	je     648 <printf+0x48>
 73a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 73d:	89 de                	mov    %ebx,%esi
 73f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 742:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 745:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 748:	83 ec 04             	sub    $0x4,%esp
          s++;
 74b:	83 c6 01             	add    $0x1,%esi
 74e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 751:	6a 01                	push   $0x1
 753:	57                   	push   %edi
 754:	53                   	push   %ebx
 755:	e8 78 fd ff ff       	call   4d2 <write>
        while(*s != 0){
 75a:	0f b6 06             	movzbl (%esi),%eax
 75d:	83 c4 10             	add    $0x10,%esp
 760:	84 c0                	test   %al,%al
 762:	75 e4                	jne    748 <printf+0x148>
 764:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 767:	31 ff                	xor    %edi,%edi
 769:	e9 da fe ff ff       	jmp    648 <printf+0x48>
 76e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 0a 00 00 00       	mov    $0xa,%ecx
 778:	6a 01                	push   $0x1
 77a:	e9 73 ff ff ff       	jmp    6f2 <printf+0xf2>
 77f:	90                   	nop
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 786:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 789:	6a 01                	push   $0x1
 78b:	e9 21 ff ff ff       	jmp    6b1 <printf+0xb1>
        putc(fd, *ap);
 790:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 796:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
        ap++;
 79a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 79d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7a3:	50                   	push   %eax
 7a4:	ff 75 08             	pushl  0x8(%ebp)
 7a7:	e8 26 fd ff ff       	call   4d2 <write>
        ap++;
 7ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b2:	31 ff                	xor    %edi,%edi
 7b4:	e9 8f fe ff ff       	jmp    648 <printf+0x48>
          s = "(null)";
 7b9:	bb 3c 0a 00 00       	mov    $0xa3c,%ebx
        while(*s != 0){
 7be:	b8 28 00 00 00       	mov    $0x28,%eax
 7c3:	e9 72 ff ff ff       	jmp    73a <printf+0x13a>
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	a1 f4 0c 00 00       	mov    0xcf4,%eax
{
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e8:	39 c8                	cmp    %ecx,%eax
 7ea:	8b 10                	mov    (%eax),%edx
 7ec:	73 32                	jae    820 <free+0x50>
 7ee:	39 d1                	cmp    %edx,%ecx
 7f0:	72 04                	jb     7f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	39 d0                	cmp    %edx,%eax
 7f4:	72 32                	jb     828 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fc:	39 fa                	cmp    %edi,%edx
 7fe:	74 30                	je     830 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 803:	8b 50 04             	mov    0x4(%eax),%edx
 806:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 809:	39 f1                	cmp    %esi,%ecx
 80b:	74 3a                	je     847 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80f:	a3 f4 0c 00 00       	mov    %eax,0xcf4
}
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	39 d0                	cmp    %edx,%eax
 822:	72 04                	jb     828 <free+0x58>
 824:	39 d1                	cmp    %edx,%ecx
 826:	72 ce                	jb     7f6 <free+0x26>
{
 828:	89 d0                	mov    %edx,%eax
 82a:	eb bc                	jmp    7e8 <free+0x18>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	75 c6                	jne    80d <free+0x3d>
    p->s.size += bp->s.size;
 847:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 84a:	a3 f4 0c 00 00       	mov    %eax,0xcf4
    p->s.size += bp->s.size;
 84f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 852:	8b 53 f8             	mov    -0x8(%ebx),%edx
 855:	89 10                	mov    %edx,(%eax)
}
 857:	5b                   	pop    %ebx
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 86c:	8b 15 f4 0c 00 00    	mov    0xcf4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 872:	8d 78 07             	lea    0x7(%eax),%edi
 875:	c1 ef 03             	shr    $0x3,%edi
 878:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 87b:	85 d2                	test   %edx,%edx
 87d:	0f 84 9d 00 00 00    	je     920 <malloc+0xc0>
 883:	8b 02                	mov    (%edx),%eax
 885:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 888:	39 cf                	cmp    %ecx,%edi
 88a:	76 6c                	jbe    8f8 <malloc+0x98>
 88c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 892:	bb 00 10 00 00       	mov    $0x1000,%ebx
 897:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 89a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8a1:	eb 0e                	jmp    8b1 <malloc+0x51>
 8a3:	90                   	nop
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8aa:	8b 48 04             	mov    0x4(%eax),%ecx
 8ad:	39 f9                	cmp    %edi,%ecx
 8af:	73 47                	jae    8f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8b1:	39 05 f4 0c 00 00    	cmp    %eax,0xcf4
 8b7:	89 c2                	mov    %eax,%edx
 8b9:	75 ed                	jne    8a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	56                   	push   %esi
 8bf:	e8 76 fc ff ff       	call   53a <sbrk>
  if(p == (char*)-1)
 8c4:	83 c4 10             	add    $0x10,%esp
 8c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ca:	74 1c                	je     8e8 <malloc+0x88>
  hp->s.size = nu;
 8cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	83 c0 08             	add    $0x8,%eax
 8d5:	50                   	push   %eax
 8d6:	e8 f5 fe ff ff       	call   7d0 <free>
  return freep;
 8db:	8b 15 f4 0c 00 00    	mov    0xcf4,%edx
      if((p = morecore(nunits)) == 0)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	85 d2                	test   %edx,%edx
 8e6:	75 c0                	jne    8a8 <malloc+0x48>
        return 0;
  }
}
 8e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8eb:	31 c0                	xor    %eax,%eax
}
 8ed:	5b                   	pop    %ebx
 8ee:	5e                   	pop    %esi
 8ef:	5f                   	pop    %edi
 8f0:	5d                   	pop    %ebp
 8f1:	c3                   	ret    
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f8:	39 cf                	cmp    %ecx,%edi
 8fa:	74 54                	je     950 <malloc+0xf0>
        p->s.size -= nunits;
 8fc:	29 f9                	sub    %edi,%ecx
 8fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 901:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 904:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 907:	89 15 f4 0c 00 00    	mov    %edx,0xcf4
}
 90d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 910:	83 c0 08             	add    $0x8,%eax
}
 913:	5b                   	pop    %ebx
 914:	5e                   	pop    %esi
 915:	5f                   	pop    %edi
 916:	5d                   	pop    %ebp
 917:	c3                   	ret    
 918:	90                   	nop
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 920:	c7 05 f4 0c 00 00 f8 	movl   $0xcf8,0xcf4
 927:	0c 00 00 
 92a:	c7 05 f8 0c 00 00 f8 	movl   $0xcf8,0xcf8
 931:	0c 00 00 
    base.s.size = 0;
 934:	b8 f8 0c 00 00       	mov    $0xcf8,%eax
 939:	c7 05 fc 0c 00 00 00 	movl   $0x0,0xcfc
 940:	00 00 00 
 943:	e9 44 ff ff ff       	jmp    88c <malloc+0x2c>
 948:	90                   	nop
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 950:	8b 08                	mov    (%eax),%ecx
 952:	89 0a                	mov    %ecx,(%edx)
 954:	eb b1                	jmp    907 <malloc+0xa7>
