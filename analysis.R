data('lalonde')

library(mediation)

M.model = glm(married ~ treat + age + educ + black + hisp + nodegr + re74, data=lalonde,family=binomial(link='probit'))
Y.model = lm(re78 ~ married + treat + age + educ + black + hisp + nodegr + re74, data=lalonde)

med.out = mediate(M.model, Y.model, sim=1000, boot=TRUE, treat='treat', mediator='married')

summary(med.out)

sensitivity = medsens(med.out, rho.by = 0.1)

plot(sensitivity, sens.par ='rho')
