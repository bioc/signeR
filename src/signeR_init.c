// This file was automatically generated by 'Kmisc::registerFunctions()'

#include <R.h>
#include <Rinternals.h>

#include <R_ext/Rdynload.h>

SEXP _signeR_FuzzyClusterCpp(SEXP ExpSEXP, SEXP MedxSEXP, SEXP CSEXP, SEXP mSEXP, SEXP threshSEXP);
SEXP _signeR_GibbsSamplerCpp(SEXP MSEXP, SEXP WSEXP, SEXP ZSEXP, SEXP PSEXP, SEXP ESEXP, SEXP ApSEXP, SEXP BpSEXP, SEXP AeSEXP, SEXP BeSEXP, SEXP apSEXP, SEXP bpSEXP, SEXP aeSEXP, SEXP beSEXP, SEXP lpSEXP, SEXP leSEXP, SEXP var_apSEXP, SEXP var_aeSEXP, SEXP burnSEXP, SEXP evalSEXP, SEXP PfixedSEXP, SEXP ZfixedSEXP, SEXP ThetafixedSEXP, SEXP AfixedSEXP, SEXP keep_parSEXP);

R_CallMethodDef callMethods[]  = {
  {"_signeR_FuzzyClusterCpp", (DL_FUNC) &_signeR_FuzzyClusterCpp, 5},
  {"_signeR_GibbsSamplerCpp", (DL_FUNC) &_signeR_GibbsSamplerCpp, 24},
  {NULL, NULL, 0}
};

void R_init_signeR(DllInfo *info) {
  R_registerRoutines(info, NULL, callMethods, NULL, NULL);
  R_useDynamicSymbols(info, FALSE);
}

