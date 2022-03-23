-This is a coursework (Decision Making Models and Methodologies) project based on the PhD thesis work in Kenley (1986).
- Managers and Decision makers continuously seek insight and clarity into external factors 
  that affect organizations and choice of available alternatives for decision making (Burns & Clemens 1993).
- As decision analysts, what benefits can be reaped from causal modeling in formulating decision models? Given 
  an approach for integrating imperfect information into decision analysis, can we make this approach 
  computationally efficient, robust and faster via computer programming routines?
- Multivariate Normal Influence Diagrams can be used for integrating imperfect information into decision analysis and are based
 on the concept of Multivariate normality. Employing the joint distribution of various problem variables into
 series of conditional  distributions (assumed normal) for obtaining insight on dependency of variables (Burns & Clemens 1993).
- Decision Analyst will request information from consulting client on expected value vector μ and variance vector v of interacting variables.
 For obtaining linear coefficient 𝒃_𝒊𝒋 indicating strength of correlation between variables 𝒊 𝒂𝒏𝒅 𝒋.
 This multivariate network representation has an Influence diagrams form representation of (μ, B, v).
- Manipulation of influence diagram by employing the arc reversal between vector nodes and vector node removal algorithms
 for multivariate influence diagrams presented in Kenley (1986).
- The steps are:
  - Conversion of Covariance Matrix to Influence 
    Diagram.
  - Arc reversal between vector nodes
  - Vector node removal
  - Conversion of Influence Diagram to Covariance
    matrix.
- The R codes for these four steps are provided in the R files.