function MatToLatex(finalPos,mat,m,n)
%MatToLatex this function prints the mat in the latex form
%mat is a matrix of mxn

disp('\begin{table}');
disp('\centering');
disp('\caption{Total time for the zero order hold approximation}');
disp('\begin{tabular}{l|l|l|l}');
disp('\hline');
disp('final pos  & N=21 & N=61 & N=101 & N=201\\\hline');
for i=1:m
    str1=sprintf('(%d,%d)',finalPos(i,1),finalPos(i,2));
    str=str1;
    for j=1:n
        str2=sprintf(' & %.4f',mat(i,j));
        str=[str str2];
    end
    str=[str '\\\hline'];
    disp(str);
end
disp('\end{tabular}');
disp('\end{table}');
end