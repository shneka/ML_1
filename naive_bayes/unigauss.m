function value = unigauss(x,mu,sigma)
constant = sqrt(1/(2*pi));
val = 1/(sqrt(norm(sigma)));
exp_inter = ((x-mu)*transpose(x-mu))/norm(sigma);
value = constant*val*exp(-exp_inter/2);