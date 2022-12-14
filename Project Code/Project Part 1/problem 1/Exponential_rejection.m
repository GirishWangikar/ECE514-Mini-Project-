function X = Exponential_rejection(N)
g = 1;
X = zeros(N,1); % Preallocate memory
for i = 1:N
    Q = false;
    while Q == false
        u = rand();
        v = 8.*rand();
        if g*u <= exp(-2*v)
           X(i) = v;
           Q = true;
        end
    end
end
