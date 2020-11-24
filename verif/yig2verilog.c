#define log_max_ids 5
#define max_y_size 30
#define max_y_args ((max_y_size+1) *(max_y_size+2) ) /2 \

/*2:*/
#line 29 "yig2verilog.w"

#include <stdlib.h> 
#include <stdio.h> 
#include <string.h> 

typedef unsigned int uint;
typedef char args_vec[max_y_args][max_y_args+3];

/*11:*/
#line 177 "yig2verilog.w"

size_t bar_to_index(size_t x,size_t y){
return((x+y)*(x+y+1)/2)+x;
}

/*:11*//*13:*/
#line 207 "yig2verilog.w"

void print_vars(const char*name,char prefix,uint count){
int i;
if(count){
printf("  %s ",name);
for(i= 1;i<=count;++i){
if(i> 1)printf(", ");
printf("%c%d",prefix,i);
}
printf(";\n");
}
}

/*:13*//*15:*/
#line 231 "yig2verilog.w"

int print_expression(args_vec args,size_t x,size_t y,size_t n,int*tmpctr){
int i1,i2,i3;
if(n==0){
printf("  wire tmp%d;\n",*tmpctr);
printf("  assign tmp%d = %s;\n",*tmpctr,args[bar_to_index(x,y)]);
}else{
i1= print_expression(args,x,y,n-1,tmpctr);
i2= print_expression(args,x,y+1,n-1,tmpctr);
i3= print_expression(args,x+1,y,n-1,tmpctr);
printf("  wire tmp%d;\n",*tmpctr);
printf("  assign tmp%d = (tmp%d & tmp%d) | (tmp%d & tmp%d) | (tmp%d & tmp%d);\n",
*tmpctr,i1,i2,i1,i3,i2,i3);
}

return(*tmpctr)++;
}

/*:15*/
#line 37 "yig2verilog.w"
;

int main(int argc,char*argv[]){
char*buf= NULL,*rhs,*p;
char type;
size_t buflen,size,nargs;
args_vec args;
int first= 1,i,j;
uint npis= 0u,npos= 0u,nwires= 0u,id;
int tmpctr= 0,tmpid;

/*3:*/
#line 59 "yig2verilog.w"

if(argc!=1){
fprintf(stderr,"Usage: %s < design.yig\n",argv[0]);
return 1;
}

/*:3*/
#line 48 "yig2verilog.w"
;
/*4:*/
#line 72 "yig2verilog.w"

while(1){
if(getline(&buf,&size,stdin)!=-1){
buflen= strlen(buf);
/*5:*/
#line 93 "yig2verilog.w"

if(buflen&&buf[buflen-1]=='\n')buf[--buflen]= '\0';

/*:5*/
#line 76 "yig2verilog.w"
;
if(!buflen)continue;
if(buf[0]=='.'&&buflen> 1){
/*6:*/
#line 102 "yig2verilog.w"

if(buf[1]=='e')break;
else if(buf[1]=='i'){npis= atoi(buf+3);}
else if(buf[1]=='o'){npos= atoi(buf+3);}
else if(buf[1]=='w'){nwires= atoi(buf+3);}
else goto parse_error;

/*:6*/
#line 79 "yig2verilog.w"
;
}
else{
/*12:*/
#line 186 "yig2verilog.w"

if(first){
first= 0;
printf("module top( ");
for(i= 1;i<=npis;++i){
if(i> 1)printf(", ");
printf("i%d",i);
}
for(i= 1;i<=npos;++i){
if(npis||i> 1)printf(", ");
printf("o%d",i);
}
printf(" );\n");
print_vars("input",'i',npis);
print_vars("output",'o',npos);
print_vars("wire",'w',nwires);
}

/*:12*/
#line 82 "yig2verilog.w"
;
/*7:*/
#line 114 "yig2verilog.w"

rhs= buf;while(*rhs!='='&&*rhs!='\0')++rhs;
if(*rhs=='\0')goto parse_error;

/*:7*/
#line 83 "yig2verilog.w"
;
/*8:*/
#line 121 "yig2verilog.w"

*rhs++= '\0';
while(*rhs==' '){++rhs;}

/*:8*/
#line 84 "yig2verilog.w"
;
/*9:*/
#line 129 "yig2verilog.w"

type= *buf;
if(type!='w'&&type!='o')goto parse_error;
id= atoi(buf+1);
if(id==0u)goto parse_error;
if(type=='w'&&id> nwires)goto parse_error;
if(type=='o'&&id> npos)goto parse_error;

/*:9*/
#line 85 "yig2verilog.w"
;
/*10:*/
#line 140 "yig2verilog.w"

if(*rhs++!='Y')goto parse_error;
p= rhs+1;while(*p!='('&&*p!='\0')++p;
if(*p=='\0')goto parse_error;
*p= '\0';
size= atoi(rhs);
if(size<0)goto parse_error;
nargs= (size+1)*(size+2)/2;
i= 0,j= 0;
while(1)
{
switch(*(++p)){
default:args[i][j++]= *p;break;
case' ':continue;
case')':
case',':
if(j==1){
args[i][3]= args[i][0];
args[i][0]= '1';args[i][1]= '\'';args[i][2]= 'b';
j= 4;
}
args[i][j]= '\0';++i;j= 0;break;
case'\0':goto next;
}
}
next:
if(i!=nargs)goto parse_error;

/*14:*/
#line 223 "yig2verilog.w"

tmpid= print_expression(args,0,0,size,&tmpctr);
printf("  assign %c%d = tmp%d;\n",type,id,tmpid);

/*:14*/
#line 168 "yig2verilog.w"
;

/*:10*/
#line 86 "yig2verilog.w"
;
}
}
}
/*16:*/
#line 251 "yig2verilog.w"

printf("endmodule // top\n");
if(buf)
free(buf);

/*:16*/
#line 90 "yig2verilog.w"
;

/*:4*/
#line 49 "yig2verilog.w"
;
return 0;

parse_error:
fprintf(stderr,"[e] cannot parse %s\n",buf);
return 1;
}

/*:2*/
