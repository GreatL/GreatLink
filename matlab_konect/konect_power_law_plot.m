%
% Visualize a power law. This draws the complementary cumulative
% distribution of the given values. It is similar to cdfplot(), but
% shows P(x > X) instead of P(x < X), where x is a randomly chosen
% value out of the given values, and X is a value from the plot's X
% axis.  
%
% To draw a plot of a degree distribution, pass the degree vector as
% the parameter "values".
%
% A power law distribution manifests itself as a straight line with
% negative slope in this plot.  (But of course you need a proper
% statistical test to determine that; this function only visualizes
% it.) 
%
% This function does not draw axis labels -- you can add them
% yourself by calling xlabel() and ylabel() after having called this
% function. 
%
% EXAMPLE 
%
%	A = ...; % Adjacency matrix of graph
%	d = sum(A,2); % Degree vector
%	konect_power_law_plot(d);
%
% PARAMETERS 
%	values			(n*1) Values, i.e. the degree vector;
%				must all be larger than zero 
%	c			(optional, default=[]) (n*1)
%				Frequencies. May be [] to indicate
%				that all values have frequency 1. 
%	enable_normalization	(optional, default=0) Normalize X
%				values, such that sum of all values
%				is one 
%	color			(optional) Color of the line
%	enable_largest		(optional, default=0) When the passed
%				values are only the largest ones
%				know. Setting this will not draw the
%				topmost line.   
%	enable_axis		(optional, default=1) set the axis
%				automatically from the data
%	line_style		(optional, default = '-')
%
% ABOUT 
%	This file is part of the KONECT Matlab Toolbox version 0.3.
%	konect.uni-koblenz.de
%	(c) Jerome Kunegis 2014; this is Free Software released under
%	the GPLv3, see COPYING. 
%

function konect_power_law_plot(values, ...
                               c, ...
                               enable_normalization, ...
                               color, ...
                               enable_largest, ...
                               enable_axis, ...
                               line_style)

factor = 1.5; % Distance to the edge of the plot when setting the axis
font_size = 24; 
line_width = 3; 

if ~exist('c', 'var')
    c = []; 
end

if ~exist('enable_normalization', 'var')
    enable_normalization = 0; 
end

if ~exist('color', 'var')
    color = [0 0 1]; 
end

if ~exist('enable_largest', 'var')
    enable_largest = 0; 
end

if ~exist('enable_axis', 'var')
    enable_axis = 1; 
end

if ~exist('line_style', 'var')
    line_style = '-';
end

if length(c) > 0

    [values ii] = sort(values);
    c = c(ii); 

    xx = values; 
    yy = sum(c) - [0 ; cumsum(c)]; 
    yy = yy(1:end-1) / sum(c); 

    value_sum = values' * c; 

else
    values = sort(values); 

    xx = values; 
    yy = (length(values) : -1 : 1)' / length(values); 

    value_sum = sum(values); 
end

if enable_normalization
    xx = xx ./ value_sum; 
end

if enable_axis
    ax(1) = xx(1) / factor; 
    ax(2) = factor * xx(end); 
    ax(3) = yy(end) / factor;
    ax(4) = 1 * factor; 
else
    ax = axis(); 
end

if ~enable_largest
    x = [ax(1) ; xx]; 
    y = [yy ; ax(3) ]; 
else
    x = xx;
    y = [yy(2:end); ax(3) ]; 
end

stairs(x, y, 'LineWidth', line_width, 'Color', color, 'LineStyle', line_style);

set(gca, 'XScale', 'log', 'YScale', 'log');

if enable_axis
    axis(ax); 
end

set(gca, 'FontSize', font_size); 

set(gca, 'XMinorTick', 'on');
set(gca, 'YMinorTick', 'on'); 
set(gca, 'TickLength', [0.05 0.05]); 

% Workaround for Matlab bug. Otherwise, the minor ticks are not visible. 
ax = axis(); 
if ax(1) > 0 & ax(3) > 0 
    set(gca, 'XTick', 10 .^ (ceil(log(ax(1)) / log(10)):floor(log(ax(2)) / log(10)))); 
    set(gca, 'YTick', 10 .^ (ceil(log(ax(3)) / log(10)):floor(log(ax(4)) / log(10)))); 
end
