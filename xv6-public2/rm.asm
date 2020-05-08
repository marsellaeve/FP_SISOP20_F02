
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    break;
  }
  close(fd);
}

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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
	int i;

	if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	0f 8e 95 00 00 00    	jle    b7 <main+0xb7>
		printf(2, "Argumen kurang tepat, ketik rm --help untuk menampilkan daftar command.\n");
		exit();
	}

	if(!strcmp(argv[1], "--help")){
  22:	51                   	push   %ecx
  23:	51                   	push   %ecx
  24:	68 71 0c 00 00       	push   $0xc71
  29:	ff 77 04             	pushl  0x4(%edi)
  2c:	e8 1f 05 00 00       	call   550 <strcmp>
  31:	83 c4 10             	add    $0x10,%esp
  34:	85 c0                	test   %eax,%eax
  36:	74 42                	je     7a <main+0x7a>
        printf(1, " rm  *			Menghapus semua File pada direktori yang sedang dikerjakan\n\n");
            
        exit();
	}
	
	if (!strcmp(argv[1], "-r")){
  38:	52                   	push   %edx
  39:	52                   	push   %edx
  3a:	68 a5 0c 00 00       	push   $0xca5
  3f:	ff 77 04             	pushl  0x4(%edi)
  42:	e8 09 05 00 00       	call   550 <strcmp>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	75 7c                	jne    ca <main+0xca>
      for (i = 2; i < argc; i++){
  4e:	83 fe 02             	cmp    $0x2,%esi
  51:	74 22                	je     75 <main+0x75>
  53:	bb 02 00 00 00       	mov    $0x2,%ebx
  58:	90                   	nop
  59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			  rmrekursif(argv[2]);
  60:	83 ec 0c             	sub    $0xc,%esp
  63:	ff 77 08             	pushl  0x8(%edi)
      for (i = 2; i < argc; i++){
  66:	83 c3 01             	add    $0x1,%ebx
			  rmrekursif(argv[2]);
  69:	e8 f2 00 00 00       	call   160 <rmrekursif>
      for (i = 2; i < argc; i++){
  6e:	83 c4 10             	add    $0x10,%esp
  71:	39 de                	cmp    %ebx,%esi
  73:	75 eb                	jne    60 <main+0x60>
		for(i = 1; i < argc; i++){
			rmbiasa(argv[i]);
		}
	}

	exit();
  75:	e8 f8 06 00 00       	call   772 <exit>
        printf(1, " List Option : \n");
  7a:	51                   	push   %ecx
  7b:	51                   	push   %ecx
  7c:	68 78 0c 00 00       	push   $0xc78
  81:	6a 01                	push   $0x1
  83:	e8 38 08 00 00       	call   8c0 <printf>
        printf(1, " rm [File]		Menghapus File\n");
  88:	5b                   	pop    %ebx
  89:	5e                   	pop    %esi
  8a:	68 89 0c 00 00       	push   $0xc89
  8f:	6a 01                	push   $0x1
  91:	e8 2a 08 00 00       	call   8c0 <printf>
        printf(1, " rm -r [Direktori]	Menghapus Direktori yang terpilih beserta File di dalamnya\n");
  96:	5f                   	pop    %edi
  97:	58                   	pop    %eax
  98:	68 20 0d 00 00       	push   $0xd20
  9d:	6a 01                	push   $0x1
  9f:	e8 1c 08 00 00       	call   8c0 <printf>
        printf(1, " rm  *			Menghapus semua File pada direktori yang sedang dikerjakan\n\n");
  a4:	58                   	pop    %eax
  a5:	5a                   	pop    %edx
  a6:	68 70 0d 00 00       	push   $0xd70
  ab:	6a 01                	push   $0x1
  ad:	e8 0e 08 00 00       	call   8c0 <printf>
        exit();
  b2:	e8 bb 06 00 00       	call   772 <exit>
		printf(2, "Argumen kurang tepat, ketik rm --help untuk menampilkan daftar command.\n");
  b7:	53                   	push   %ebx
  b8:	53                   	push   %ebx
  b9:	68 d4 0c 00 00       	push   $0xcd4
  be:	6a 02                	push   $0x2
  c0:	e8 fb 07 00 00       	call   8c0 <printf>
		exit();
  c5:	e8 a8 06 00 00       	call   772 <exit>
  else if(!strcmp(argv[1], "*")){
  ca:	50                   	push   %eax
  cb:	50                   	push   %eax
  cc:	68 a8 0c 00 00       	push   $0xca8
  d1:	ff 77 04             	pushl  0x4(%edi)
  d4:	e8 77 04 00 00       	call   550 <strcmp>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	85 c0                	test   %eax,%eax
  de:	74 1f                	je     ff <main+0xff>
  e0:	8d 5f 04             	lea    0x4(%edi),%ebx
  e3:	8d 34 b7             	lea    (%edi,%esi,4),%esi
			rmbiasa(argv[i]);
  e6:	83 ec 0c             	sub    $0xc,%esp
  e9:	ff 33                	pushl  (%ebx)
  eb:	83 c3 04             	add    $0x4,%ebx
  ee:	e8 2d 00 00 00       	call   120 <rmbiasa>
		for(i = 1; i < argc; i++){
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	39 f3                	cmp    %esi,%ebx
  f8:	75 ec                	jne    e6 <main+0xe6>
  fa:	e9 76 ff ff ff       	jmp    75 <main+0x75>
    	rmall(".");
  ff:	83 ec 0c             	sub    $0xc,%esp
 102:	68 33 0c 00 00       	push   $0xc33
 107:	e8 04 02 00 00       	call   310 <rmall>
 10c:	83 c4 10             	add    $0x10,%esp
 10f:	e9 61 ff ff ff       	jmp    75 <main+0x75>
 114:	66 90                	xchg   %ax,%ax
 116:	66 90                	xchg   %ax,%ax
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <rmbiasa>:
void rmbiasa(char *s) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	83 ec 10             	sub    $0x10,%esp
 127:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (unlink(s) < 0) {
 12a:	53                   	push   %ebx
 12b:	e8 92 06 00 00       	call   7c2 <unlink>
 130:	83 c4 10             	add    $0x10,%esp
 133:	85 c0                	test   %eax,%eax
 135:	78 09                	js     140 <rmbiasa+0x20>
}
 137:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13a:	c9                   	leave  
 13b:	c3                   	ret    
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		printf(2, "rm: %s failed to delete \n", s);
 140:	83 ec 04             	sub    $0x4,%esp
 143:	53                   	push   %ebx
 144:	68 18 0c 00 00       	push   $0xc18
 149:	6a 02                	push   $0x2
 14b:	e8 70 07 00 00       	call   8c0 <printf>
 150:	83 c4 10             	add    $0x10,%esp
}
 153:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 156:	c9                   	leave  
 157:	c3                   	ret    
 158:	90                   	nop
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <rmrekursif>:
void rmrekursif(char *dir) {
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	81 ec 54 02 00 00    	sub    $0x254,%esp
 16c:	8b 75 08             	mov    0x8(%ebp),%esi
	fd = open(dir, O_RDONLY);
 16f:	6a 00                	push   $0x0
 171:	56                   	push   %esi
 172:	e8 3b 06 00 00       	call   7b2 <open>
	fstat(fd, &st);
 177:	59                   	pop    %ecx
 178:	5f                   	pop    %edi
 179:	8d bd d4 fd ff ff    	lea    -0x22c(%ebp),%edi
	fd = open(dir, O_RDONLY);
 17f:	89 c3                	mov    %eax,%ebx
	fstat(fd, &st);
 181:	57                   	push   %edi
 182:	50                   	push   %eax
 183:	e8 42 06 00 00       	call   7ca <fstat>
	switch (st.type) {
 188:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 18f:	83 c4 10             	add    $0x10,%esp
 192:	66 83 f8 01          	cmp    $0x1,%ax
 196:	74 38                	je     1d0 <rmrekursif+0x70>
 198:	66 83 f8 02          	cmp    $0x2,%ax
 19c:	75 0c                	jne    1aa <rmrekursif+0x4a>
			rmbiasa(dir);
 19e:	83 ec 0c             	sub    $0xc,%esp
 1a1:	56                   	push   %esi
 1a2:	e8 79 ff ff ff       	call   120 <rmbiasa>
			break;
 1a7:	83 c4 10             	add    $0x10,%esp
	unlink(dir);
 1aa:	83 ec 0c             	sub    $0xc,%esp
 1ad:	56                   	push   %esi
 1ae:	e8 0f 06 00 00       	call   7c2 <unlink>
	close(fd);
 1b3:	89 1c 24             	mov    %ebx,(%esp)
 1b6:	e8 df 05 00 00       	call   79a <close>
}
 1bb:	83 c4 10             	add    $0x10,%esp
 1be:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5f                   	pop    %edi
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    
 1c6:	8d 76 00             	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			strcpy(buf, dir);
 1d0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1d6:	83 ec 08             	sub    $0x8,%esp
 1d9:	56                   	push   %esi
 1da:	50                   	push   %eax
 1db:	e8 40 03 00 00       	call   520 <strcpy>
			p = buf+strlen(buf);
 1e0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1e6:	89 04 24             	mov    %eax,(%esp)
 1e9:	e8 b2 03 00 00       	call   5a0 <strlen>
 1ee:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
			while(read(fd, &de, sizeof(de)) == sizeof(de)) {
 1f4:	83 c4 10             	add    $0x10,%esp
			p = buf+strlen(buf);
 1f7:	01 d0                	add    %edx,%eax
			*p = '/';
 1f9:	c6 00 2f             	movb   $0x2f,(%eax)
			p++;
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
			while(read(fd, &de, sizeof(de)) == sizeof(de)) {
 205:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 20b:	83 ec 04             	sub    $0x4,%esp
 20e:	6a 10                	push   $0x10
 210:	50                   	push   %eax
 211:	53                   	push   %ebx
 212:	e8 73 05 00 00       	call   78a <read>
 217:	83 c4 10             	add    $0x10,%esp
 21a:	83 f8 10             	cmp    $0x10,%eax
 21d:	75 8b                	jne    1aa <rmrekursif+0x4a>
				if(de.inum == 0 || !strcmp(de.name, ".") || !strcmp(de.name, ".."))
 21f:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 226:	00 
 227:	74 dc                	je     205 <rmrekursif+0xa5>
 229:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 22f:	83 ec 08             	sub    $0x8,%esp
 232:	68 33 0c 00 00       	push   $0xc33
 237:	50                   	push   %eax
 238:	e8 13 03 00 00       	call   550 <strcmp>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	85 c0                	test   %eax,%eax
 242:	74 c1                	je     205 <rmrekursif+0xa5>
 244:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	68 32 0c 00 00       	push   $0xc32
 252:	50                   	push   %eax
 253:	e8 f8 02 00 00       	call   550 <strcmp>
 258:	83 c4 10             	add    $0x10,%esp
 25b:	85 c0                	test   %eax,%eax
 25d:	74 a6                	je     205 <rmrekursif+0xa5>
				memmove(p, de.name, strlen(de.name));
 25f:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 265:	83 ec 0c             	sub    $0xc,%esp
 268:	50                   	push   %eax
 269:	e8 32 03 00 00       	call   5a0 <strlen>
 26e:	83 c4 0c             	add    $0xc,%esp
 271:	50                   	push   %eax
 272:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 278:	50                   	push   %eax
 279:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 27f:	e8 bc 04 00 00       	call   740 <memmove>
				p[strlen(de.name)] = 0;
 284:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 28a:	89 04 24             	mov    %eax,(%esp)
 28d:	e8 0e 03 00 00       	call   5a0 <strlen>
 292:	8b 8d b4 fd ff ff    	mov    -0x24c(%ebp),%ecx
 298:	c6 04 01 00          	movb   $0x0,(%ecx,%eax,1)
				fstat(open(buf, O_RDONLY), &st);
 29c:	58                   	pop    %eax
 29d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 2a3:	5a                   	pop    %edx
 2a4:	6a 00                	push   $0x0
 2a6:	50                   	push   %eax
 2a7:	e8 06 05 00 00       	call   7b2 <open>
 2ac:	59                   	pop    %ecx
 2ad:	5a                   	pop    %edx
 2ae:	57                   	push   %edi
 2af:	50                   	push   %eax
 2b0:	e8 15 05 00 00       	call   7ca <fstat>
				if (st.type == T_FILE) 
 2b5:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	66 83 f8 02          	cmp    $0x2,%ax
 2c3:	74 2b                	je     2f0 <rmrekursif+0x190>
				else if (st.type == T_DIR)
 2c5:	66 83 f8 01          	cmp    $0x1,%ax
 2c9:	0f 85 36 ff ff ff    	jne    205 <rmrekursif+0xa5>
					rmrekursif(buf);
 2cf:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 2d5:	83 ec 0c             	sub    $0xc,%esp
 2d8:	50                   	push   %eax
 2d9:	e8 82 fe ff ff       	call   160 <rmrekursif>
 2de:	83 c4 10             	add    $0x10,%esp
 2e1:	e9 1f ff ff ff       	jmp    205 <rmrekursif+0xa5>
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
					rmbiasa(buf);
 2f0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 2f6:	83 ec 0c             	sub    $0xc,%esp
 2f9:	50                   	push   %eax
 2fa:	e8 21 fe ff ff       	call   120 <rmbiasa>
 2ff:	83 c4 10             	add    $0x10,%esp
 302:	e9 fe fe ff ff       	jmp    205 <rmrekursif+0xa5>
 307:	89 f6                	mov    %esi,%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <rmall>:
void rmall(char *path){
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	81 ec 54 02 00 00    	sub    $0x254,%esp
 31c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 31f:	6a 00                	push   $0x0
 321:	57                   	push   %edi
 322:	e8 8b 04 00 00       	call   7b2 <open>
 327:	83 c4 10             	add    $0x10,%esp
 32a:	85 c0                	test   %eax,%eax
 32c:	78 4a                	js     378 <rmall+0x68>
  if(fstat(fd, &st) < 0){
 32e:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 334:	83 ec 08             	sub    $0x8,%esp
 337:	89 c3                	mov    %eax,%ebx
 339:	56                   	push   %esi
 33a:	50                   	push   %eax
 33b:	e8 8a 04 00 00       	call   7ca <fstat>
 340:	83 c4 10             	add    $0x10,%esp
 343:	85 c0                	test   %eax,%eax
 345:	0f 88 95 00 00 00    	js     3e0 <rmall+0xd0>
  switch(st.type){
 34b:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 352:	66 83 f8 01          	cmp    $0x1,%ax
 356:	74 58                	je     3b0 <rmall+0xa0>
 358:	66 83 f8 02          	cmp    $0x2,%ax
 35c:	74 3a                	je     398 <rmall+0x88>
  close(fd);
 35e:	83 ec 0c             	sub    $0xc,%esp
 361:	53                   	push   %ebx
 362:	e8 33 04 00 00       	call   79a <close>
 367:	83 c4 10             	add    $0x10,%esp
}
 36a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5f                   	pop    %edi
 370:	5d                   	pop    %ebp
 371:	c3                   	ret    
 372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "failed to remove %s\n", path);
 378:	83 ec 04             	sub    $0x4,%esp
 37b:	57                   	push   %edi
 37c:	68 35 0c 00 00       	push   $0xc35
 381:	6a 02                	push   $0x2
 383:	e8 38 05 00 00       	call   8c0 <printf>
    return;
 388:	83 c4 10             	add    $0x10,%esp
}
 38b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38e:	5b                   	pop    %ebx
 38f:	5e                   	pop    %esi
 390:	5f                   	pop    %edi
 391:	5d                   	pop    %ebp
 392:	c3                   	ret    
 393:	90                   	nop
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	rmbiasa(&buf[2]);
 398:	8d 85 ea fd ff ff    	lea    -0x216(%ebp),%eax
 39e:	83 ec 0c             	sub    $0xc,%esp
 3a1:	50                   	push   %eax
 3a2:	e8 79 fd ff ff       	call   120 <rmbiasa>
    break;
 3a7:	83 c4 10             	add    $0x10,%esp
 3aa:	eb b2                	jmp    35e <rmall+0x4e>
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 3b0:	83 ec 0c             	sub    $0xc,%esp
 3b3:	57                   	push   %edi
 3b4:	e8 e7 01 00 00       	call   5a0 <strlen>
 3b9:	83 c0 10             	add    $0x10,%eax
 3bc:	83 c4 10             	add    $0x10,%esp
 3bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 3c4:	76 42                	jbe    408 <rmall+0xf8>
      printf(1, "ls: path too long\n");
 3c6:	83 ec 08             	sub    $0x8,%esp
 3c9:	68 5e 0c 00 00       	push   $0xc5e
 3ce:	6a 01                	push   $0x1
 3d0:	e8 eb 04 00 00       	call   8c0 <printf>
      break;
 3d5:	83 c4 10             	add    $0x10,%esp
 3d8:	eb 84                	jmp    35e <rmall+0x4e>
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "ls: cannot stat %s\n", path);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	57                   	push   %edi
 3e4:	68 4a 0c 00 00       	push   $0xc4a
 3e9:	6a 02                	push   $0x2
 3eb:	e8 d0 04 00 00       	call   8c0 <printf>
    close(fd);
 3f0:	89 1c 24             	mov    %ebx,(%esp)
 3f3:	e8 a2 03 00 00       	call   79a <close>
    return;
 3f8:	83 c4 10             	add    $0x10,%esp
}
 3fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fe:	5b                   	pop    %ebx
 3ff:	5e                   	pop    %esi
 400:	5f                   	pop    %edi
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    
 403:	90                   	nop
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    strcpy(buf, path);
 408:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 40e:	83 ec 08             	sub    $0x8,%esp
 411:	57                   	push   %edi
 412:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
 418:	50                   	push   %eax
 419:	e8 02 01 00 00       	call   520 <strcpy>
    p = buf+strlen(buf);
 41e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 424:	89 04 24             	mov    %eax,(%esp)
 427:	e8 74 01 00 00       	call   5a0 <strlen>
 42c:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 432:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 435:	01 d0                	add    %edx,%eax
    *p++ = '/';
 437:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 43a:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    *p++ = '/';
 440:	c6 00 2f             	movb   $0x2f,(%eax)
 443:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 450:	83 ec 04             	sub    $0x4,%esp
 453:	6a 10                	push   $0x10
 455:	57                   	push   %edi
 456:	53                   	push   %ebx
 457:	e8 2e 03 00 00       	call   78a <read>
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	83 f8 10             	cmp    $0x10,%eax
 462:	0f 85 f6 fe ff ff    	jne    35e <rmall+0x4e>
      if(de.inum == 0)
 468:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 46f:	00 
 470:	74 de                	je     450 <rmall+0x140>
      memmove(p, de.name, DIRSIZ);
 472:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 478:	83 ec 04             	sub    $0x4,%esp
 47b:	6a 0e                	push   $0xe
 47d:	50                   	push   %eax
 47e:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
 484:	e8 b7 02 00 00       	call   740 <memmove>
      p[DIRSIZ] = 0;
 489:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
 48f:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 493:	58                   	pop    %eax
 494:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 49a:	5a                   	pop    %edx
 49b:	56                   	push   %esi
 49c:	50                   	push   %eax
 49d:	e8 0e 02 00 00       	call   6b0 <stat>
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 57                	js     500 <rmall+0x1f0>
	  if (st.type == T_FILE) rmbiasa(&buf[2]);
 4a9:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 4b0:	66 83 f8 02          	cmp    $0x2,%ax
 4b4:	74 2a                	je     4e0 <rmall+0x1d0>
	  else if(st.type == T_DIR){
 4b6:	66 83 f8 01          	cmp    $0x1,%ax
 4ba:	75 94                	jne    450 <rmall+0x140>
		  printf(1,"rm: cannot remove '%s': Is a directory\n",buf);
 4bc:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 4c2:	83 ec 04             	sub    $0x4,%esp
 4c5:	50                   	push   %eax
 4c6:	68 ac 0c 00 00       	push   $0xcac
 4cb:	6a 01                	push   $0x1
 4cd:	e8 ee 03 00 00       	call   8c0 <printf>
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	e9 76 ff ff ff       	jmp    450 <rmall+0x140>
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	  if (st.type == T_FILE) rmbiasa(&buf[2]);
 4e0:	8d 85 ea fd ff ff    	lea    -0x216(%ebp),%eax
 4e6:	83 ec 0c             	sub    $0xc,%esp
 4e9:	50                   	push   %eax
 4ea:	e8 31 fc ff ff       	call   120 <rmbiasa>
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	e9 59 ff ff ff       	jmp    450 <rmall+0x140>
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, "ls: cannot stat %s\n", buf);
 500:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 506:	83 ec 04             	sub    $0x4,%esp
 509:	50                   	push   %eax
 50a:	68 4a 0c 00 00       	push   $0xc4a
 50f:	6a 01                	push   $0x1
 511:	e8 aa 03 00 00       	call   8c0 <printf>
        continue;
 516:	83 c4 10             	add    $0x10,%esp
 519:	e9 32 ff ff ff       	jmp    450 <rmall+0x140>
 51e:	66 90                	xchg   %ax,%ax

00000520 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 52a:	89 c2                	mov    %eax,%edx
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 530:	83 c1 01             	add    $0x1,%ecx
 533:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 537:	83 c2 01             	add    $0x1,%edx
 53a:	84 db                	test   %bl,%bl
 53c:	88 5a ff             	mov    %bl,-0x1(%edx)
 53f:	75 ef                	jne    530 <strcpy+0x10>
    ;
  return os;
}
 541:	5b                   	pop    %ebx
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    
 544:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 54a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000550 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 55 08             	mov    0x8(%ebp),%edx
 557:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 55a:	0f b6 02             	movzbl (%edx),%eax
 55d:	0f b6 19             	movzbl (%ecx),%ebx
 560:	84 c0                	test   %al,%al
 562:	75 1c                	jne    580 <strcmp+0x30>
 564:	eb 2a                	jmp    590 <strcmp+0x40>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 570:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 573:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 576:	83 c1 01             	add    $0x1,%ecx
 579:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 57c:	84 c0                	test   %al,%al
 57e:	74 10                	je     590 <strcmp+0x40>
 580:	38 d8                	cmp    %bl,%al
 582:	74 ec                	je     570 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 584:	29 d8                	sub    %ebx,%eax
}
 586:	5b                   	pop    %ebx
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 590:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 592:	29 d8                	sub    %ebx,%eax
}
 594:	5b                   	pop    %ebx
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005a0 <strlen>:

uint
strlen(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5a6:	80 39 00             	cmpb   $0x0,(%ecx)
 5a9:	74 15                	je     5c0 <strlen+0x20>
 5ab:	31 d2                	xor    %edx,%edx
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
 5b0:	83 c2 01             	add    $0x1,%edx
 5b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 5b7:	89 d0                	mov    %edx,%eax
 5b9:	75 f5                	jne    5b0 <strlen+0x10>
    ;
  return n;
}
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 5c0:	31 c0                	xor    %eax,%eax
}
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5da:	8b 45 0c             	mov    0xc(%ebp),%eax
 5dd:	89 d7                	mov    %edx,%edi
 5df:	fc                   	cld    
 5e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5e2:	89 d0                	mov    %edx,%eax
 5e4:	5f                   	pop    %edi
 5e5:	5d                   	pop    %ebp
 5e6:	c3                   	ret    
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005f0 <strchr>:

char*
strchr(const char *s, char c)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 5fa:	0f b6 10             	movzbl (%eax),%edx
 5fd:	84 d2                	test   %dl,%dl
 5ff:	74 1d                	je     61e <strchr+0x2e>
    if(*s == c)
 601:	38 d3                	cmp    %dl,%bl
 603:	89 d9                	mov    %ebx,%ecx
 605:	75 0d                	jne    614 <strchr+0x24>
 607:	eb 17                	jmp    620 <strchr+0x30>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 610:	38 ca                	cmp    %cl,%dl
 612:	74 0c                	je     620 <strchr+0x30>
  for(; *s; s++)
 614:	83 c0 01             	add    $0x1,%eax
 617:	0f b6 10             	movzbl (%eax),%edx
 61a:	84 d2                	test   %dl,%dl
 61c:	75 f2                	jne    610 <strchr+0x20>
      return (char*)s;
  return 0;
 61e:	31 c0                	xor    %eax,%eax
}
 620:	5b                   	pop    %ebx
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    
 623:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <gets>:

char*
gets(char *buf, int max)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 636:	31 f6                	xor    %esi,%esi
 638:	89 f3                	mov    %esi,%ebx
{
 63a:	83 ec 1c             	sub    $0x1c,%esp
 63d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 640:	eb 2f                	jmp    671 <gets+0x41>
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 648:	8d 45 e7             	lea    -0x19(%ebp),%eax
 64b:	83 ec 04             	sub    $0x4,%esp
 64e:	6a 01                	push   $0x1
 650:	50                   	push   %eax
 651:	6a 00                	push   $0x0
 653:	e8 32 01 00 00       	call   78a <read>
    if(cc < 1)
 658:	83 c4 10             	add    $0x10,%esp
 65b:	85 c0                	test   %eax,%eax
 65d:	7e 1c                	jle    67b <gets+0x4b>
      break;
    buf[i++] = c;
 65f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 663:	83 c7 01             	add    $0x1,%edi
 666:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 669:	3c 0a                	cmp    $0xa,%al
 66b:	74 23                	je     690 <gets+0x60>
 66d:	3c 0d                	cmp    $0xd,%al
 66f:	74 1f                	je     690 <gets+0x60>
  for(i=0; i+1 < max; ){
 671:	83 c3 01             	add    $0x1,%ebx
 674:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 677:	89 fe                	mov    %edi,%esi
 679:	7c cd                	jl     648 <gets+0x18>
 67b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 680:	c6 03 00             	movb   $0x0,(%ebx)
}
 683:	8d 65 f4             	lea    -0xc(%ebp),%esp
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
 68b:	90                   	nop
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 690:	8b 75 08             	mov    0x8(%ebp),%esi
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	01 de                	add    %ebx,%esi
 698:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 69a:	c6 03 00             	movb   $0x0,(%ebx)
}
 69d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a0:	5b                   	pop    %ebx
 6a1:	5e                   	pop    %esi
 6a2:	5f                   	pop    %edi
 6a3:	5d                   	pop    %ebp
 6a4:	c3                   	ret    
 6a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	56                   	push   %esi
 6b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 6b5:	83 ec 08             	sub    $0x8,%esp
 6b8:	6a 00                	push   $0x0
 6ba:	ff 75 08             	pushl  0x8(%ebp)
 6bd:	e8 f0 00 00 00       	call   7b2 <open>
  if(fd < 0)
 6c2:	83 c4 10             	add    $0x10,%esp
 6c5:	85 c0                	test   %eax,%eax
 6c7:	78 27                	js     6f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 6c9:	83 ec 08             	sub    $0x8,%esp
 6cc:	ff 75 0c             	pushl  0xc(%ebp)
 6cf:	89 c3                	mov    %eax,%ebx
 6d1:	50                   	push   %eax
 6d2:	e8 f3 00 00 00       	call   7ca <fstat>
  close(fd);
 6d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 6da:	89 c6                	mov    %eax,%esi
  close(fd);
 6dc:	e8 b9 00 00 00       	call   79a <close>
  return r;
 6e1:	83 c4 10             	add    $0x10,%esp
}
 6e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6e7:	89 f0                	mov    %esi,%eax
 6e9:	5b                   	pop    %ebx
 6ea:	5e                   	pop    %esi
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret    
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 6f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6f5:	eb ed                	jmp    6e4 <stat+0x34>
 6f7:	89 f6                	mov    %esi,%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <atoi>:

int
atoi(const char *s)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	53                   	push   %ebx
 704:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 707:	0f be 11             	movsbl (%ecx),%edx
 70a:	8d 42 d0             	lea    -0x30(%edx),%eax
 70d:	3c 09                	cmp    $0x9,%al
  n = 0;
 70f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 714:	77 1f                	ja     735 <atoi+0x35>
 716:	8d 76 00             	lea    0x0(%esi),%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 720:	8d 04 80             	lea    (%eax,%eax,4),%eax
 723:	83 c1 01             	add    $0x1,%ecx
 726:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 72a:	0f be 11             	movsbl (%ecx),%edx
 72d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 730:	80 fb 09             	cmp    $0x9,%bl
 733:	76 eb                	jbe    720 <atoi+0x20>
  return n;
}
 735:	5b                   	pop    %ebx
 736:	5d                   	pop    %ebp
 737:	c3                   	ret    
 738:	90                   	nop
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000740 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	56                   	push   %esi
 744:	53                   	push   %ebx
 745:	8b 5d 10             	mov    0x10(%ebp),%ebx
 748:	8b 45 08             	mov    0x8(%ebp),%eax
 74b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 74e:	85 db                	test   %ebx,%ebx
 750:	7e 14                	jle    766 <memmove+0x26>
 752:	31 d2                	xor    %edx,%edx
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 758:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 75c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 75f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 762:	39 d3                	cmp    %edx,%ebx
 764:	75 f2                	jne    758 <memmove+0x18>
  return vdst;
}
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
 768:	5d                   	pop    %ebp
 769:	c3                   	ret    

0000076a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 76a:	b8 01 00 00 00       	mov    $0x1,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <exit>:
SYSCALL(exit)
 772:	b8 02 00 00 00       	mov    $0x2,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <wait>:
SYSCALL(wait)
 77a:	b8 03 00 00 00       	mov    $0x3,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <pipe>:
SYSCALL(pipe)
 782:	b8 04 00 00 00       	mov    $0x4,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <read>:
SYSCALL(read)
 78a:	b8 05 00 00 00       	mov    $0x5,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <write>:
SYSCALL(write)
 792:	b8 10 00 00 00       	mov    $0x10,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <close>:
SYSCALL(close)
 79a:	b8 15 00 00 00       	mov    $0x15,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <kill>:
SYSCALL(kill)
 7a2:	b8 06 00 00 00       	mov    $0x6,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <exec>:
SYSCALL(exec)
 7aa:	b8 07 00 00 00       	mov    $0x7,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <open>:
SYSCALL(open)
 7b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <mknod>:
SYSCALL(mknod)
 7ba:	b8 11 00 00 00       	mov    $0x11,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <unlink>:
SYSCALL(unlink)
 7c2:	b8 12 00 00 00       	mov    $0x12,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <fstat>:
SYSCALL(fstat)
 7ca:	b8 08 00 00 00       	mov    $0x8,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <link>:
SYSCALL(link)
 7d2:	b8 13 00 00 00       	mov    $0x13,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <mkdir>:
SYSCALL(mkdir)
 7da:	b8 14 00 00 00       	mov    $0x14,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <chdir>:
SYSCALL(chdir)
 7e2:	b8 09 00 00 00       	mov    $0x9,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <dup>:
SYSCALL(dup)
 7ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <getpid>:
SYSCALL(getpid)
 7f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <sbrk>:
SYSCALL(sbrk)
 7fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <sleep>:
SYSCALL(sleep)
 802:	b8 0d 00 00 00       	mov    $0xd,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <uptime>:
SYSCALL(uptime)
 80a:	b8 0e 00 00 00       	mov    $0xe,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    
 812:	66 90                	xchg   %ax,%ax
 814:	66 90                	xchg   %ax,%ax
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 829:	85 d2                	test   %edx,%edx
{
 82b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 82e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 830:	79 76                	jns    8a8 <printint+0x88>
 832:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 836:	74 70                	je     8a8 <printint+0x88>
    x = -xx;
 838:	f7 d8                	neg    %eax
    neg = 1;
 83a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 841:	31 f6                	xor    %esi,%esi
 843:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 846:	eb 0a                	jmp    852 <printint+0x32>
 848:	90                   	nop
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 850:	89 fe                	mov    %edi,%esi
 852:	31 d2                	xor    %edx,%edx
 854:	8d 7e 01             	lea    0x1(%esi),%edi
 857:	f7 f1                	div    %ecx
 859:	0f b6 92 c0 0d 00 00 	movzbl 0xdc0(%edx),%edx
  }while((x /= base) != 0);
 860:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 862:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 865:	75 e9                	jne    850 <printint+0x30>
  if(neg)
 867:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 86a:	85 c0                	test   %eax,%eax
 86c:	74 08                	je     876 <printint+0x56>
    buf[i++] = '-';
 86e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 873:	8d 7e 02             	lea    0x2(%esi),%edi
 876:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 87a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 87d:	8d 76 00             	lea    0x0(%esi),%esi
 880:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 883:	83 ec 04             	sub    $0x4,%esp
 886:	83 ee 01             	sub    $0x1,%esi
 889:	6a 01                	push   $0x1
 88b:	53                   	push   %ebx
 88c:	57                   	push   %edi
 88d:	88 45 d7             	mov    %al,-0x29(%ebp)
 890:	e8 fd fe ff ff       	call   792 <write>

  while(--i >= 0)
 895:	83 c4 10             	add    $0x10,%esp
 898:	39 de                	cmp    %ebx,%esi
 89a:	75 e4                	jne    880 <printint+0x60>
    putc(fd, buf[i]);
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89f:	5b                   	pop    %ebx
 8a0:	5e                   	pop    %esi
 8a1:	5f                   	pop    %edi
 8a2:	5d                   	pop    %ebp
 8a3:	c3                   	ret    
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 8a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 8af:	eb 90                	jmp    841 <printint+0x21>
 8b1:	eb 0d                	jmp    8c0 <printf>
 8b3:	90                   	nop
 8b4:	90                   	nop
 8b5:	90                   	nop
 8b6:	90                   	nop
 8b7:	90                   	nop
 8b8:	90                   	nop
 8b9:	90                   	nop
 8ba:	90                   	nop
 8bb:	90                   	nop
 8bc:	90                   	nop
 8bd:	90                   	nop
 8be:	90                   	nop
 8bf:	90                   	nop

000008c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
 8c4:	56                   	push   %esi
 8c5:	53                   	push   %ebx
 8c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 8cc:	0f b6 1e             	movzbl (%esi),%ebx
 8cf:	84 db                	test   %bl,%bl
 8d1:	0f 84 b3 00 00 00    	je     98a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 8d7:	8d 45 10             	lea    0x10(%ebp),%eax
 8da:	83 c6 01             	add    $0x1,%esi
  state = 0;
 8dd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 8df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8e2:	eb 2f                	jmp    913 <printf+0x53>
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e8:	83 f8 25             	cmp    $0x25,%eax
 8eb:	0f 84 a7 00 00 00    	je     998 <printf+0xd8>
  write(fd, &c, 1);
 8f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8f4:	83 ec 04             	sub    $0x4,%esp
 8f7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 8fa:	6a 01                	push   $0x1
 8fc:	50                   	push   %eax
 8fd:	ff 75 08             	pushl  0x8(%ebp)
 900:	e8 8d fe ff ff       	call   792 <write>
 905:	83 c4 10             	add    $0x10,%esp
 908:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 90b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 90f:	84 db                	test   %bl,%bl
 911:	74 77                	je     98a <printf+0xca>
    if(state == 0){
 913:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 915:	0f be cb             	movsbl %bl,%ecx
 918:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 91b:	74 cb                	je     8e8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 91d:	83 ff 25             	cmp    $0x25,%edi
 920:	75 e6                	jne    908 <printf+0x48>
      if(c == 'd'){
 922:	83 f8 64             	cmp    $0x64,%eax
 925:	0f 84 05 01 00 00    	je     a30 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 92b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 931:	83 f9 70             	cmp    $0x70,%ecx
 934:	74 72                	je     9a8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 936:	83 f8 73             	cmp    $0x73,%eax
 939:	0f 84 99 00 00 00    	je     9d8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 93f:	83 f8 63             	cmp    $0x63,%eax
 942:	0f 84 08 01 00 00    	je     a50 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 948:	83 f8 25             	cmp    $0x25,%eax
 94b:	0f 84 ef 00 00 00    	je     a40 <printf+0x180>
  write(fd, &c, 1);
 951:	8d 45 e7             	lea    -0x19(%ebp),%eax
 954:	83 ec 04             	sub    $0x4,%esp
 957:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 95b:	6a 01                	push   $0x1
 95d:	50                   	push   %eax
 95e:	ff 75 08             	pushl  0x8(%ebp)
 961:	e8 2c fe ff ff       	call   792 <write>
 966:	83 c4 0c             	add    $0xc,%esp
 969:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 96c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 96f:	6a 01                	push   $0x1
 971:	50                   	push   %eax
 972:	ff 75 08             	pushl  0x8(%ebp)
 975:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 978:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 97a:	e8 13 fe ff ff       	call   792 <write>
  for(i = 0; fmt[i]; i++){
 97f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 983:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 986:	84 db                	test   %bl,%bl
 988:	75 89                	jne    913 <printf+0x53>
    }
  }
}
 98a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 98d:	5b                   	pop    %ebx
 98e:	5e                   	pop    %esi
 98f:	5f                   	pop    %edi
 990:	5d                   	pop    %ebp
 991:	c3                   	ret    
 992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 998:	bf 25 00 00 00       	mov    $0x25,%edi
 99d:	e9 66 ff ff ff       	jmp    908 <printf+0x48>
 9a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9a8:	83 ec 0c             	sub    $0xc,%esp
 9ab:	b9 10 00 00 00       	mov    $0x10,%ecx
 9b0:	6a 00                	push   $0x0
 9b2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 9b5:	8b 45 08             	mov    0x8(%ebp),%eax
 9b8:	8b 17                	mov    (%edi),%edx
 9ba:	e8 61 fe ff ff       	call   820 <printint>
        ap++;
 9bf:	89 f8                	mov    %edi,%eax
 9c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9c4:	31 ff                	xor    %edi,%edi
        ap++;
 9c6:	83 c0 04             	add    $0x4,%eax
 9c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 9cc:	e9 37 ff ff ff       	jmp    908 <printf+0x48>
 9d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 9d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9db:	8b 08                	mov    (%eax),%ecx
        ap++;
 9dd:	83 c0 04             	add    $0x4,%eax
 9e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 9e3:	85 c9                	test   %ecx,%ecx
 9e5:	0f 84 8e 00 00 00    	je     a79 <printf+0x1b9>
        while(*s != 0){
 9eb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 9ee:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 9f0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 9f2:	84 c0                	test   %al,%al
 9f4:	0f 84 0e ff ff ff    	je     908 <printf+0x48>
 9fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 9fd:	89 de                	mov    %ebx,%esi
 9ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a02:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 a05:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a08:	83 ec 04             	sub    $0x4,%esp
          s++;
 a0b:	83 c6 01             	add    $0x1,%esi
 a0e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 a11:	6a 01                	push   $0x1
 a13:	57                   	push   %edi
 a14:	53                   	push   %ebx
 a15:	e8 78 fd ff ff       	call   792 <write>
        while(*s != 0){
 a1a:	0f b6 06             	movzbl (%esi),%eax
 a1d:	83 c4 10             	add    $0x10,%esp
 a20:	84 c0                	test   %al,%al
 a22:	75 e4                	jne    a08 <printf+0x148>
 a24:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 a27:	31 ff                	xor    %edi,%edi
 a29:	e9 da fe ff ff       	jmp    908 <printf+0x48>
 a2e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 a30:	83 ec 0c             	sub    $0xc,%esp
 a33:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a38:	6a 01                	push   $0x1
 a3a:	e9 73 ff ff ff       	jmp    9b2 <printf+0xf2>
 a3f:	90                   	nop
  write(fd, &c, 1);
 a40:	83 ec 04             	sub    $0x4,%esp
 a43:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 a46:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 a49:	6a 01                	push   $0x1
 a4b:	e9 21 ff ff ff       	jmp    971 <printf+0xb1>
        putc(fd, *ap);
 a50:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 a53:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a56:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 a58:	6a 01                	push   $0x1
        ap++;
 a5a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 a5d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 a60:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a63:	50                   	push   %eax
 a64:	ff 75 08             	pushl  0x8(%ebp)
 a67:	e8 26 fd ff ff       	call   792 <write>
        ap++;
 a6c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 a6f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a72:	31 ff                	xor    %edi,%edi
 a74:	e9 8f fe ff ff       	jmp    908 <printf+0x48>
          s = "(null)";
 a79:	bb b8 0d 00 00       	mov    $0xdb8,%ebx
        while(*s != 0){
 a7e:	b8 28 00 00 00       	mov    $0x28,%eax
 a83:	e9 72 ff ff ff       	jmp    9fa <printf+0x13a>
 a88:	66 90                	xchg   %ax,%ax
 a8a:	66 90                	xchg   %ax,%ax
 a8c:	66 90                	xchg   %ax,%ax
 a8e:	66 90                	xchg   %ax,%ax

00000a90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a90:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a91:	a1 18 11 00 00       	mov    0x1118,%eax
{
 a96:	89 e5                	mov    %esp,%ebp
 a98:	57                   	push   %edi
 a99:	56                   	push   %esi
 a9a:	53                   	push   %ebx
 a9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a9e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aa8:	39 c8                	cmp    %ecx,%eax
 aaa:	8b 10                	mov    (%eax),%edx
 aac:	73 32                	jae    ae0 <free+0x50>
 aae:	39 d1                	cmp    %edx,%ecx
 ab0:	72 04                	jb     ab6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ab2:	39 d0                	cmp    %edx,%eax
 ab4:	72 32                	jb     ae8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ab6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ab9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 abc:	39 fa                	cmp    %edi,%edx
 abe:	74 30                	je     af0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 ac0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 ac3:	8b 50 04             	mov    0x4(%eax),%edx
 ac6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ac9:	39 f1                	cmp    %esi,%ecx
 acb:	74 3a                	je     b07 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 acd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 acf:	a3 18 11 00 00       	mov    %eax,0x1118
}
 ad4:	5b                   	pop    %ebx
 ad5:	5e                   	pop    %esi
 ad6:	5f                   	pop    %edi
 ad7:	5d                   	pop    %ebp
 ad8:	c3                   	ret    
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae0:	39 d0                	cmp    %edx,%eax
 ae2:	72 04                	jb     ae8 <free+0x58>
 ae4:	39 d1                	cmp    %edx,%ecx
 ae6:	72 ce                	jb     ab6 <free+0x26>
{
 ae8:	89 d0                	mov    %edx,%eax
 aea:	eb bc                	jmp    aa8 <free+0x18>
 aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 af0:	03 72 04             	add    0x4(%edx),%esi
 af3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 af6:	8b 10                	mov    (%eax),%edx
 af8:	8b 12                	mov    (%edx),%edx
 afa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 afd:	8b 50 04             	mov    0x4(%eax),%edx
 b00:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b03:	39 f1                	cmp    %esi,%ecx
 b05:	75 c6                	jne    acd <free+0x3d>
    p->s.size += bp->s.size;
 b07:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 b0a:	a3 18 11 00 00       	mov    %eax,0x1118
    p->s.size += bp->s.size;
 b0f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b12:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b15:	89 10                	mov    %edx,(%eax)
}
 b17:	5b                   	pop    %ebx
 b18:	5e                   	pop    %esi
 b19:	5f                   	pop    %edi
 b1a:	5d                   	pop    %ebp
 b1b:	c3                   	ret    
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	57                   	push   %edi
 b24:	56                   	push   %esi
 b25:	53                   	push   %ebx
 b26:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b29:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b2c:	8b 15 18 11 00 00    	mov    0x1118,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b32:	8d 78 07             	lea    0x7(%eax),%edi
 b35:	c1 ef 03             	shr    $0x3,%edi
 b38:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 b3b:	85 d2                	test   %edx,%edx
 b3d:	0f 84 9d 00 00 00    	je     be0 <malloc+0xc0>
 b43:	8b 02                	mov    (%edx),%eax
 b45:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b48:	39 cf                	cmp    %ecx,%edi
 b4a:	76 6c                	jbe    bb8 <malloc+0x98>
 b4c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 b52:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b57:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 b5a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 b61:	eb 0e                	jmp    b71 <malloc+0x51>
 b63:	90                   	nop
 b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b68:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b6a:	8b 48 04             	mov    0x4(%eax),%ecx
 b6d:	39 f9                	cmp    %edi,%ecx
 b6f:	73 47                	jae    bb8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b71:	39 05 18 11 00 00    	cmp    %eax,0x1118
 b77:	89 c2                	mov    %eax,%edx
 b79:	75 ed                	jne    b68 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b7b:	83 ec 0c             	sub    $0xc,%esp
 b7e:	56                   	push   %esi
 b7f:	e8 76 fc ff ff       	call   7fa <sbrk>
  if(p == (char*)-1)
 b84:	83 c4 10             	add    $0x10,%esp
 b87:	83 f8 ff             	cmp    $0xffffffff,%eax
 b8a:	74 1c                	je     ba8 <malloc+0x88>
  hp->s.size = nu;
 b8c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b8f:	83 ec 0c             	sub    $0xc,%esp
 b92:	83 c0 08             	add    $0x8,%eax
 b95:	50                   	push   %eax
 b96:	e8 f5 fe ff ff       	call   a90 <free>
  return freep;
 b9b:	8b 15 18 11 00 00    	mov    0x1118,%edx
      if((p = morecore(nunits)) == 0)
 ba1:	83 c4 10             	add    $0x10,%esp
 ba4:	85 d2                	test   %edx,%edx
 ba6:	75 c0                	jne    b68 <malloc+0x48>
        return 0;
  }
}
 ba8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bab:	31 c0                	xor    %eax,%eax
}
 bad:	5b                   	pop    %ebx
 bae:	5e                   	pop    %esi
 baf:	5f                   	pop    %edi
 bb0:	5d                   	pop    %ebp
 bb1:	c3                   	ret    
 bb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 bb8:	39 cf                	cmp    %ecx,%edi
 bba:	74 54                	je     c10 <malloc+0xf0>
        p->s.size -= nunits;
 bbc:	29 f9                	sub    %edi,%ecx
 bbe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 bc1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bc4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 bc7:	89 15 18 11 00 00    	mov    %edx,0x1118
}
 bcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 bd0:	83 c0 08             	add    $0x8,%eax
}
 bd3:	5b                   	pop    %ebx
 bd4:	5e                   	pop    %esi
 bd5:	5f                   	pop    %edi
 bd6:	5d                   	pop    %ebp
 bd7:	c3                   	ret    
 bd8:	90                   	nop
 bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 be0:	c7 05 18 11 00 00 1c 	movl   $0x111c,0x1118
 be7:	11 00 00 
 bea:	c7 05 1c 11 00 00 1c 	movl   $0x111c,0x111c
 bf1:	11 00 00 
    base.s.size = 0;
 bf4:	b8 1c 11 00 00       	mov    $0x111c,%eax
 bf9:	c7 05 20 11 00 00 00 	movl   $0x0,0x1120
 c00:	00 00 00 
 c03:	e9 44 ff ff ff       	jmp    b4c <malloc+0x2c>
 c08:	90                   	nop
 c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 c10:	8b 08                	mov    (%eax),%ecx
 c12:	89 0a                	mov    %ecx,(%edx)
 c14:	eb b1                	jmp    bc7 <malloc+0xa7>
