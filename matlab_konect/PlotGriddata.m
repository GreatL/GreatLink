%%三组数据画曲面图
function PlotGriddata( x,y,z )
mx=min(x);%求x的最小值
Mx=max(x);%求x的最大值
my=min(y);
My=max(y);
Nx=50; %定义x轴插值数据点数，根据实际情况确定
Ny=50;%定义y轴插值数据点数，根据实际情况确定
cx=linspace(mx,Mx,Nx);%在原始x数据的最大值最小值之间等间隔生成Nx个插值点
cy=linspace(my,My,Ny);%在原始数据y的最大值最小值之间等间隔生成Ny个插值点
cz=griddata(x,y,z,cx,cy','cubic');%调用matlab函数进行立方插值
meshz(cx,cy,cz) %绘制曲面
end

