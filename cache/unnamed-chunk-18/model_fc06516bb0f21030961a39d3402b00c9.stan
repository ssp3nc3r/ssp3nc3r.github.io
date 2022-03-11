data {
  int<lower=0> N;
  vector<lower=0>[N] rk;
  array[N] int<lower=0> k;
}

parameters {
  real beta;
  real<lower=0> alpha;
  real<lower=0> delta;
  real<offset=70, multiplier=10> k_star;
  real<lower=0> sigma;
}

model {
  beta   ~ std_normal();
  alpha  ~ exponential(1);
  delta  ~ exponential(1);
  sigma  ~ exponential(1);
  k_star ~ normal(70, 10);
  
  vector[N] mu;
  
  for( i in 1:N) mu[i] = beta + alpha * k[i] + 
  (k[i] > k_star ? delta * (k_star ^ 2 - 2 * k_star * k[i] + k[i] ^ 2) : 0);
  
  rk ~ normal(mu, sigma); 
}

generated quantities {
  vector[N] r_hat;
  
  for( i in 1:N) 
    r_hat[i] = normal_rng(
    beta + alpha * k[i] + (k[i] > k_star ? 
      delta * (k_star ^ 2 - 2 * k_star * k[i] + k[i] ^ 2) : 0), sigma);
}
