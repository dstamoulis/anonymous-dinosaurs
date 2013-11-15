/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
* File Name : main.c
* Creation Date :
* Last Modified : 
* Created By : Dimitrios Stamoulis  <stamoulis.dimitrios@gmail.com>
_._._._._._._._._._._._._._._._._._._._._.*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    if (argc < 3 )
    { 
      printf("usage : ./main -file -NumberOfInputs\n");
      return 0;
    }

    // define your variables here
    int i, j, N;
    long int count = 1;
    int step = 1;
    int flag = 0;
    
    N = atoi(argv[2]);
    printf("%d\n",N);

    for (i=0;i<N;i++)
	{count *=2;}
 
    printf("%d\n",count);

    int **A;
    A = ( int **) malloc ( count * sizeof ( int *) ) ;
    for ( i =0; i < count ; i ++)
        A [ i ] = ( int *) malloc ( N * sizeof ( int ) ) ;

    //int A[count][N];

    for (j=N-1;j>=0;j--)
    { 
      for (i=0;i<count;i++)
      {
        A[i][j] = flag;  
        //if (i!=0){
	if ((i+1)%step == 0)
        {  
 	  if (flag == 0)
            flag =1;
 	  else if (flag == 1)
            flag =0;
        } 
      }
      step *=2;
      flag = 0;
    }

    // read a file 
    FILE *fp = NULL;
    fp = fopen(argv[1], "w");

    // use you functions defined @ common.{c and h}
    

    for (i=0;i<count;i++)
    {  for (j=0;j<N;j++)
       {  fprintf(fp,"%d", A[i][j]);
       }
       fprintf(fp,"\n");
    }

    fclose(fp);

    return 0;
}
