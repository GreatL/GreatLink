%%�������ݻ�����ͼ
function PlotGriddata( x,y,z )
mx=min(x);%��x����Сֵ
Mx=max(x);%��x�����ֵ
my=min(y);
My=max(y);
Nx=50; %����x���ֵ���ݵ���������ʵ�����ȷ��
Ny=50;%����y���ֵ���ݵ���������ʵ�����ȷ��
cx=linspace(mx,Mx,Nx);%��ԭʼx���ݵ����ֵ��Сֵ֮��ȼ������Nx����ֵ��
cy=linspace(my,My,Ny);%��ԭʼ����y�����ֵ��Сֵ֮��ȼ������Ny����ֵ��
cz=griddata(x,y,z,cx,cy','cubic');%����matlab��������������ֵ
meshz(cx,cy,cz) %��������
end

