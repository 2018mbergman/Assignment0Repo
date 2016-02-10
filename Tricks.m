%{ --------------
%  OVERVIEW - You can (should) run individual lines and 
%  pressing F9. This will evaluate the selection in the command window
%  ---------------
%}

%{ --------------
%  assign a value
%  ---------------
%}
x = 10

%{ --------------
%  assign a value and suppress output
%  ---------------
%}
y = 12;

%{ --------------
%  define a row vector
%  ---------------
%}
x = [1 4 3 5 6 9 10 10 1 15 14 13];
% or 
x = [1, 4, 3, 5, 6, 9, 10, 10, 1, 15, 14, 13];

%{ --------------
%  define a column vector
%  ---------------
%}
x = [1 4 3 5 6 9 10 10 1 15 14 13]';
% or 
x = [1; 4; 3; 5; 6; 9; 10; 10; 1; 15; 14; 13];

%{ --------------
%  transpose a row vector to a column vector
%  ---------------
%}
x = [1 2 3];
x'

%{ --------------
%  transpose a column vector to a row vector
%  ---------------
%}
y = [1;2;3];
y'

%{ --------------
%  define a sequence
%  ---------------
%}
x = [1:100]


%{ --------------
%  define a sequence with increments other than '1'
%  ---------------
%}
a = [-2:.1:2];
b = [10:10:100];
c = [10:10:99];
d = [100:-1:0];


%{ --------------
%  create a matrix of linearly spaced increments
%  ---------------
%}
x = linspace(0,1,11);
y = linspace(0,2*pi, 1001);


%{ --------------
%  get help on a function
%  ---------------
%}
help sqrt

%{ --------------
%  add a value to a matrix
%  ---------------
%}
x = [1 2 3];
x+1

%{ --------------
%  multiply a matrix by a constant
%  ---------------
%}
x = [1 2 3];
x*4

%{ --------------
%  element-wise matrix multiplication
%  ---------------
%}
x = [1 2 3];
y = x.*x;
z = x.*[1 0 2];


%{ --------------
%  replace a value (1 based indexing)
%  ---------------
%}
x = [1 4 3 5 6 9 10 10 1 15 14 13];
x(1) = 100;  
x(4) = 50;

%{ --------------
%  replace multiple values
%  ---------------
%}
x = [1 4 3 5 6 9 10 10 1 15 14 13];
x(2:5) = 100;
y = [1 4 3 5 6 9 10 10 1 15 14 13];
y( 1:2:5 ) = 100;


%{ --------------
%  get the last element
%  ---------------
%}
x = [10:10:100];
x(end)   = 4;
x(end-1) = 5;
y = [1:5];
y(2:end) = -1;


%{ --------------
%  access elements using vectors
%  ---------------
%}

x = [1 1 1 1 1 1 1 1 1 1 1 1 1];
x( [1:3] + 0 ) = 4;
x( end-[0 1] ) = 9;
y = [1 1 1 1 1 1 1 1 1 1 1 1 1];
y( [4 7 2 1] ) = 99;


%{ --------------
%  create a 2-D matrix
%  ---------------
%}
x = [1 2 3;4 5 6];

%{ --------------
%  create a 2-D matrix of ones or zeros
%  ---------------
%}
x = ones(3,4);
y = zeros(2,9);

%{ --------------
%  grab a single row of a 2d matrix
%  ---------------
%}
x = [1 2 3;4 5 6];
x(1,:)
x(2,:)
x(end,:)

%{ --------------
%  grab a single column of a 2d matrix
%  ---------------
%}
x = [1 2 3;4 5 6];
x(:,2)

%{ --------------
%  replace a column in a 2d matrix
%  ---------------
%}
x = [1 1 1;2 2 2];
x(:,1) = plus( x(:,1), 1 );
y = [1 2 3;4 5 6];
y(:,2) = 10;
y(:,3) = [0;0];

%{ --------------
%  Plot a cosine
%  -------------
%}
N = 1e5;
t = 2*pi*[0:N-1]/N;
plot( t, cos(t), 'k+-' )

%{ --------------
%  Plot a cosine with a phase offset
%  ---------------
%}

N = 1e5;
t = 2*pi*[0:N-1]/N;
plot( t, cos(t+pi/2), 'k+-' )

%{ --------------
%  Plot a cosine with frequency 100
%  ---------------
%}

N = 1e5;
t = 2*pi*[0:N-1]/N;
plot( t, cos(100*t), 'k+-' )

%{ --------------
%  Plot a sine and cosine
%  ---------------
%}
N = 1e5;
t = 2*pi*[0:N-1]/N;
plot( t, cos(t), 'k+-' );
hold on;
plot( t, sin(t), 'b+-' );
hold off;


%{ --------------
%  random numbers
%  ---------------
%}
x = rand(1,100);
y = rand(2,4);

%{ --------------
%  normally districuted random numbers
%  ---------------
%}
x = randn(1,100);
y = randn(2,4);

%{ --------------
%  character representation (ASCII representation)
%  ---------------
%}
x = 'f';
disp( double(x) )
y = 'abc';
disp( double(y) )

char( [99 98 101 102,'f'] )

%{ --------------
%  conditionals
%  ---------------
%}
x = rand;
if x>.5
    disp( 'x is greater than 1/2' );
end

y = randn(1,4);
indx = find( y>1 );
if isempty( indx )
    disp( 'no values greater than 1' );
else
    disp( sprintf( '%.f values greater than 1', length(indx) ) );
end

%{ --------------
%  for statements*
%       'for' statements are slow, and can usually
%       be replaced by some matrix operation. 
%       as you get better with MATLAB, you will use them less and less
%  ---------------
%}
x = round( 10*randn( 1,6 ) );
N = length(x);
for indx = 1:N
    disp( sprintf( 'the value is: %.f', x(indx) ) );
end

%{ --------------
%  example of a BAD for statement
%  ---------------
%}
N = 1e1;
foo = [1:N];
out = zeros(1,N);
out(1) = foo(1);
for indx = 2:N
    out(indx) = foo(indx) + foo(indx-1);
end
 % - better way
 out(1) = foo(1);
 out(2:end) = foo(1:N-1) + foo(2:N);

%{ --------------
%  example of a BAD for statement
%  ---------------
%}
x = round( 10*randn( 1,6 ) );
for indx = 1:length(x)
    x(indx) = x(indx) + 1;
    % there is no ++ notation in matlab
end
% USE THIS INSTEAD
x = x + 1;

%{ --------------
%  another BAD for statement
%  ---------------
%}
% column-wise computation of the sum
foo = round( 10*randn( 3,6 ) );
[nRows,nCols] = size( foo );
sums = zeros(1,nCols);
for indx = 1:nCols
    sums(indx) = sum( foo(:,indx) );
end

% better way
foo = round( 10*randn( 3,6 ) );
sums = sum( foo );

%{ --------------
%  write a function
%  copy the code into a file with the same name as the function, and with a
%  .m suffix
%  ---------------
%}

function a_out = timesTwo( a_in )
a_out = 2*a_in;

%{ --------------
%  put help comments inside of your function 
%   the first comment in your function is the help file
%  ---------------
%}
function a_out = timesTwo( a_in )

% USAGE
%   y = timesTwo(x);

a_out = 2*a_in;


%{ --------------
%  multiple input arguments
%  ---------------
%}
function a_out = timesThem( a_in, b_in )

% USAGE
%   y = timesThem(x1,x2);

a_out = a_in.*b_in;

%{ --------------
%  multiple output arguments
%  ---------------
%}
function [a_out,b_out] = timesThem( a_in, b_in )

% USAGE
%   [y,t] = timesThem(x1,x2);
%    where: y is the result 
%           t is the execution time

tic;
a_out = a_in.*b_in;
b_out = toc;

%{ --------------
%  determine number of input arguments
%  ---------------
%}
function [a_out,b_out] = timesThem( a_in, b_in )

% USAGE
%   [y,t] = timesThem(x1,x2);
%    where: y is the result 
%           t is the execution time

if nargin<2
    b_in = 2;
end

tic;
a_out = a_in.*b_in;
b_out = toc;
