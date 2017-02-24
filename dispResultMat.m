%MatToLatexForRate

A=[0.5719
0.5629
0.6007
0.6425
0.7199
0.8429
0.5035
1.3643
2.3227];
B=[0.9742
0.9979
1.4953
1.0680
1.8046
4.4662
0.4244
1.5549
3.2035];

disp('\begin{table}');
disp('\centering');
disp('\caption{The time consumption and the rate}');
disp('\begin{tabular}{l|l|l|l}');
disp('\hline');
for i=1:9
    str=sprintf('(%d,%d)',finalPos(i,1),finalPos(i,2));
    str2=sprintf('& %.4f',A(i));
    str3=sprintf('& %.4f',B(i));
    str4=sprintf('& %.4f',A(i)/B(i)*100);
    disp([str str2 str3 str4 '\\\hline']);
end
disp('\end{tabular}');
disp('\end{table}');
disp(mean(A(1:end)./B(1:end)));
