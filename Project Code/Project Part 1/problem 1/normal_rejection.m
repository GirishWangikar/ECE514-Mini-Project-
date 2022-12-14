function X = normal_rejection(N)
g = 1/(sqrt(2*pi*2));
X = zeros(N,1); % Preallocate memory
for i = 1:N
    Q = false;
    while Q == false
        u = rand();
        v = -4 + (6+4)*rand();
        if g*u <= (exp(-(v-2)^2/(2*2)))/(sqrt(2*pi*2))
           X(i) = v;
           Q = true;
        end
    end
end
