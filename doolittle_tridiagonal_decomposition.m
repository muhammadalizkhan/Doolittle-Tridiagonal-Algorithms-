function [L, U] = doolittle_tridiagonal_decomposition(A)
    % Check if the input matrix is tridiagonal
    [m, n] = size(A);
    if m ~= n || any(diag(A, -1) == 0) || any(diag(A, 1) == 0)
    end
    
    n = length(A);
    L = eye(n); % Initialize L as an identity matrix
    U = zeros(n); % Initialize U as an all-zero matrix

    % Perform LU decomposition
    for k = 1:n
        U(k, k) = A(k, k);
        L(k, k) = 1;
        if k < n
            U(k, k + 1) = A(k, k + 1);
            L(k + 1, k) = A(k + 1, k) / U(k, k);
            U(k + 1, k + 1) = A(k + 1, k + 1) - L(k + 1, k) * A(k, k + 1);
        end
    end
end
