function X = uniform_rejection(N)
g = 4;
X = zeros(N,1); % Preallocate memory
for i = 1:N
    Q = false;
    while Q == false
        u = rand();
        v = 2+(4-2)*rand();
        if g*u <= 4
           X(i) = v;
           Q = true;
        end
    end
end