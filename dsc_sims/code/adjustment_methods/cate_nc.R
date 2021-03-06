calibrate <- as.logical(calibrate)
cate_nc <- cate::cate(~Treatment, Y = Y,
                      X.data = data.frame(Treatment = X[, 2]),
                      r = num_sv, fa.method = "ml", adj.method = "nc",
                      nc = as.logical(control_genes), calibrate = calibrate)

betahat   <- c(cate_nc$beta)
sebetahat <- c(sqrt(cate_nc$beta.cov.row * cate_nc$beta.cov.col) /
    sqrt(nrow(X)))
df        <- rep(Inf, length = ncol(Y))
pvalues   <- c(cate_nc$beta.p.value)
