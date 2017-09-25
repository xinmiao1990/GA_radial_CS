function [evalc] = norm_evaluate(f,p,lambda,B,DO_SHIFT);
[Nx Ny Nc] = size(f);
v = f;
if DO_SHIFT
    vec = randperm(B+1)-B/2-1; dx = round(vec(1));
    vec = randperm(B+1)-B/2-1; dy = round(vec(1));
    v = circshift(v,[dx dy]);
end
evalc=0;
for x=1:B:Nx-B+1
    for y=1:B:Ny-B+1
        BLOCK = reshape(v(x:x+B-1,y:y+B-1,:),[B*B Nc]);
        
[U,S,V] = svd(BLOCK,'econ'); sigmaq = diag(S);
        
evalc = evalc + sum(abs(sigmaq(:)).^p./p)*lambda;

    end
end


end