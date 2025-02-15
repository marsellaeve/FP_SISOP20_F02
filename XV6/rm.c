#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"

void rmbiasa(char *s) {
	if (unlink(s) < 0) {
		printf(2, "rm: %s failed to delete \n", s);
		return;
	}
}

void rmrekursif(char *dir) {
	int fd;
	char buf[512], *p;
	struct dirent de;
	struct stat st;

	fd = open(dir, O_RDONLY);

	fstat(fd, &st);

	switch (st.type) {
		case T_FILE:
			rmbiasa(dir);
			break;
		case T_DIR:
			strcpy(buf, dir);
			p = buf+strlen(buf);
			*p = '/';
			p++;

			while(read(fd, &de, sizeof(de)) == sizeof(de)) {
				if(de.inum == 0 || !strcmp(de.name, ".") || !strcmp(de.name, ".."))
					continue;
				memmove(p, de.name, strlen(de.name));
				p[strlen(de.name)] = 0;
				fstat(open(buf, O_RDONLY), &st);
				if (st.type == T_FILE) 
					rmbiasa(buf);
				else if (st.type == T_DIR)
					rmrekursif(buf);
			}
			break;
	}
	unlink(dir);
	close(fd);
}

void rmall(char *path){
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    printf(2, "failed to remove %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  switch(st.type){
 
  case T_FILE:
	rmbiasa(&buf[2]);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
	  if (st.type == T_FILE) rmbiasa(&buf[2]);
	  else if(st.type == T_DIR){
		  printf(1,"rm: cannot remove '%s': Is a directory\n",buf);
	  }
    }
    break;
  }
  close(fd);
}

int main(int argc, char *argv[]){
	int i;

	if(argc < 2){
		printf(2, "Argumen kurang tepat, ketik rm help untuk menampilkan daftar command.\n");
		exit();
	}

	if(!strcmp(argv[1], "help")){
        printf(1, " List Option : \n");
        printf(1, " rm [File]		Menghapus File\n");
        printf(1, " rm -r [Direktori]	Menghapus Direktori yang terpilih beserta File di dalamnya\n");
        printf(1, " rm  *			Menghapus semua File pada direktori yang sedang dikerjakan\n\n");
            
        exit();
	}
	
	if (!strcmp(argv[1], "-r")){
      for (i = 2; i < argc; i++){
			  rmrekursif(argv[2]);
		}
	} 
  
  else if(!strcmp(argv[1], "*")){
    	rmall(".");
  	}
  else {
		for(i = 1; i < argc; i++){
			rmbiasa(argv[i]);
		}
	}
	exit();
}
