%{
    for every edge
    mat=
[1 0 0 1 0 0
0 1 0 0 1 0
y1 x1 1 y2 x2 1];
additional equations depending on type of nodes
for hinge as node
mat(size(mat,1),:)=0;
mat(size(mat,1),required)=1;
%}

mat=zeros(size(nod,1));
for j=1:size(ed,1)
    a=ed.node1;
    b=ed.node2;
    mat1=[1 0 0 1 0 0;0 1 0 0 1 0;x1 y1 1 x2 y2 1];
    mat2=[sum(Fy);sum(Fx);sum(mom)];
    if(nod(a).V~=NAN)
        mat1(size(mat1,1),:)=[1 0 0 0 0 0];
        mat2(size(mat2,1),:)=[nod(a).V];
    end
    if(nod(a).H~=NAN)
        mat1(size(mat1,1),:)=[0 1 0 0 0 0];
        mat2(size(mat2,1),:)=[nod(a).H];
    end
    if(nod(a).M~=NAN)
        mat1(size(mat1,1),:)=[0 0 1 0 0 0];
        mat2(size(mat2,1),:)=[nod(a).M];
    end
    if(nod(b).V~=NAN)
        mat1(size(mat1,1),:)=[0 0 0 1 0 0];
        mat2(size(mat2,1),:)=[nod(b).V];
    end
    if(nod(b).H~=NAN)
        mat1(size(mat1,1),:)=[0 0 0 0 1 0];
        mat2(size(mat2,1),:)=[nod(b).H];
    end
    if(nod(b).M~=NAN)
        mat1(size(mat1,1),:)=[0 0 0 0 0 1];
    end
    
end
