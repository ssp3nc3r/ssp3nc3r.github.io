
data {
  int<lower=0> N;
  vector[N] attendance;
  array[N] int<lower=1,upper=7> day_idx;
  vector<lower=0,upper=1>[N] is_night;
  vector[N] winpct;
  vector[N] Pr_win;
}
transformed data {
  int K = 5;
  int n_days = 7;
  
  vector[N] attendance_c = attendance - mean(attendance);
}

parameters {
  real alpha;
  vector[n_days] beta_day;
  real beta_night;
  real beta_winpct;
  real beta_Pr_win;
  real beta_Pr_win2;
  real<lower=0> sigma;
}

model {
  alpha ~ lognormal(20000, 5000);
  beta_day ~ normal(0, 5000);
  sum(beta_day) ~ std_normal();
  beta_night ~ normal(0, 5000);
  beta_winpct ~ normal(0, 5000);
  beta_Pr_win ~ normal(0, 5000);
  beta_Pr_win2 ~ normal(0, 5000);
  
  sigma ~ exponential(1);
  
  vector[N] theta = alpha 
                  + beta_day[day_idx] 
                  + beta_night * is_night
                  + beta_winpct * winpct
                  + beta_Pr_win * Pr_win
                  + beta_Pr_win2 * square(Pr_win);
                  
  attendance_c ~ normal(theta, sigma);
  
}

generated quantities {
  real opt_uncert = -beta_Pr_win / (2 * beta_Pr_win2);
}
