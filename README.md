# aDDM_Simulation_2
Study Information – Experiential Neglect 2

Everyday human decision-making operates on the principle that there exists a trade-off between the speed at which decisions are made and the accuracy of their outcomes. Through assessment of reaction times and choice accuracy, this trade-off provides a measurable and observable approximation of the neural mechanisms underlying decision-making processes.
Furthermore, for decisions to be economically advantageous and optimal, it is assumed that the brain must integrate reward predictions from decisions spanning multiple modalities into a unified expected value. Common decisions such as choosing between a familiar restaurant and a new, highly rated one, or deciding between multiple travel plans often involve the interplay between memory-based and perceptual options. Therefore, multiple questions arise: When confronted with choices presenting various modalities, do we merge all modalities into one metric for comparison, or does each modality undergo comparison independently? Are there parallel processes and interactions involved, where the evaluation of one modality dynamically influences others? Above all, what happens in the brain when separate perceptual and memory features communicate information about a common decision factor, like reward value?

In our rapidly digitizing world, where AI technologies continue to advance, the distinction between what is familiar and what may be artificial presents new challenges to decision-making. For instance, consider the dilemma of choosing between an AI-generated photograph of a real face and an authentic image. Hereby, the intricate nature of decisions where experiential knowledge collides with perceptual manipulations is highlighted, showcasing that still little is known about potential reference points in context-dependent decision making. Recent findings in the cognitive decision-sciences reveal economically disadvantageous, systematic neglects of perceptual options. Garcia et al. (2022, 2023) highlight a systematic neglect of experiential values, such as icons, and an excessive reliance on symbolic representations, such as pie charts, even at an economic cost. They propose the existence of two distinct neural representational systems for decision-making value, diverging from the standard model that assumes convergence of symbolic and experiential values into a central valuation system translated into a common currency (Vlaev et al., 2011; Camerer, 2013; Glimcher, 2022).Moreover, there is growing interest in behavioural effects that offer insights into the neural systems underlying human reinforcement learning paradigms. Recent studies suggest that reaction times often decrease with increases in both the overall value and absolute value of options. However, this trend does not consistently affect choice behaviour and may sometimes remain unchanged or even increase, contrary to traditional assumptions of the Weber-Fechner Law and typical speed-accuracy trade-offs (Shevlin et al., 2022; Fontanesi et al., 2019; Krajbich et al., 2011; Lebreton et al., 2019; Ting & Gluth, in press).

In this study, my objective is to experimentally and through computational cognitive modelling examine how overall magnitude (OV = r(Option1) + r(Option 2)) and the absolute value difference (absVD = |r(Option1) – r(Option 2)|)  influence choice patterns in binary decisions involving a trade-off between a perceptual and a value-based option. To my knowledge, this has not yet been investigated in this specific learning paradigm involving binary choices between pie-charts and icons. I will measure these patterns through accuracy, response time, and the confidence level associated with making the correct decision. Furthermore, I am interested in the cognitive architecture approximating the neural valuation system in value-based decision making. As posited by the aDDM (attentional drift diffusion model), attention operates in a multiplicative manner, enhancing the influence of fixated value during the evidence accumulation process. In essence, higher option values tend to accelerate the pace of evidence accumulation. Consequently, the accumulation of evidence for options with high overall value often reaches decision boundaries, including incorrect ones, at a faster rate compared to options with low overall value. However, how evidence accumulation processes may be biased when participants decide between an option from memory and a perceptual option (pie-chart) is unknown. Based on this premise, I will first use conventional linear and logistic regression analysis, and then, using the HDDM and RLSSM toolboxes, fit several, hierarchical variations of DDMs to test the hypothesis that:

Hypothesis 1: When choosing between options with multiple attributes, can we assume equal weighting of values associated with high reward in both choice modalities? I hypothesize the contrary, that is, when making decisions between ‘conflicting’ options (one from memory vs a perceptual one), RT will be faster when the absolute value difference is high, and when the option associated with the higher reward is perceptual in nature. This would be evidence of different value-based reward systems. 

Hypothesis 2: Accuracy increases as overall- value increases in the learning phase (LE) and memory phase (EE) but decreases in the transfer phase (ES) due to the nature of the decision between 2 modalities (uncertainty associated with the choice between an option from experience and a perceptual option)

Hypothesis 2: Reaction time is faster as the value difference increases in the transfer phase (ES) compared to the EE- and LE phases due to the presence of 2 modalities facilitating the decision.

Hypothesis 3: Confidence increases as the overall value increases. Participants will also be more accurate in estimating the probability of winning for high-reward values.

Additionally, I aim to incorporate eye movements into the choice and reaction time modelling to replicate the observed phenomenon wherein reaction times tend to decrease with overall value, while choice accuracy remains relatively unaffected by overall value and could even improve in LE and EE phases (Shevlin et al., 2022; Ting & Gluth, forthcoming). I challenge this assumption in the ES-phase stating that high overall value will not decrease when making decisions between values of 2 different modalities. Moreover, I intend to examine the effects of overall value on choice accuracy and on gaze-related choice bias across both single-modality (LE, EE) and dual-modality (ES) domains and propose the following hypotheses:

Hypothesis 4: In the high overall value condition during the LE and EE phases, participants will select options not fixated on last. This will support the finding that task performance remains intact despite faster reaction times, contradicting the traditional notion of a speed-accuracy trade-off and replicating Ting and Gluth's (forthcoming) results.

Hypothesis 5: The eye-gaze behaviour in the ES phase will be significantly different from the eye-gaze behaviour in the other phases due to decisions between 2 modalities. The model-free analysis will reveal that gaze patterns (including dwell-time advantage and final fixations) serve as predictors of choices. We anticipate a reversal of the fixation pattern observed in the LE and EE phases as, due to the conflicting nature of choices between 2 modalities, participants will rely more heavily on memory-recall and reward estimation of the perceptual option, thereby not discounting the option last fixated on. The strength of this association between gaze and choice will diminish with higher absolute value difference (absVD). 

Hypothesis 6:  Using hierarchical drift diffusion modelling, I predict that choice patterns are better explained by an aDDM with an absVD-dependent discounting factor (θ) than and OV-dependent discounting factor. Both models will outperform models with a constant θ across absVD and OV levels, similar to findings by Ting and Gluth (forthcoming). As OV increases, I expect the discounting factor θ for the non-fixated option to approach 1 in LE and EE phases which would weaken the influence of attention on preference and strengthen the reliance on memory. The positive impact of OV and absVD on accuracy will only be accounted for by the aDDM with OV- and absVD-dependent θ, while the negative correlation between absVD and RT and OV and RT is adequately explained by the aDDM, regardless of the θ being OV-dependent or OV-independent.

Hypothesis 7: I will assume a lower threshold for the perceptual options and a starting point bias. I hypothesize an increase in non-decision time for memory-based options in the ES-phase, when OV is low and when the reward of the perceptual (pie-chart) option is larger than 50 % due to increase in decision conflict. 

Study Design
1.	The optimal number of trials, trials per block in the LE can be estimated using simulations similar to Ting and Gluth (in press) who oriented to the aDDM model by Shevlin and Krajbich https://osf.io/rewtq/download . Ting and Gluth assumed these parameters: 
•	μ_θ=[0.2, 0.9]; σ_θ=0.01;
•	μ_SD=[0.02, 0.03]; σ_SD=0.001;
•	μ_d=[0.0002, 0.0004]; σ_d=0.00001;
•	μ_NDT=[350, 650]; σ_NDT=10;


Learning phase (LE): To account for OV and absVD effects, I rearranged option values in the learning phase. After the introduction participants learn to associate specific probabilities of winning with specific incons (experiential options). Block one: options with 10% or 30% winning probability (as shown by feedback of +1 and -1 points). Block two: 20% and 60%. Block three: 40% and 80%. Block four: 70% and 90%. Alternatively, discrete values can be used such as 55, 46 etc. that are associated with different standard deviations to allow for uncertainty in reward estimation (and to have options that vary in mean reward and reward difference).
Therefore, this yields the OV-options: 
1.	0.4
2.	0.8
3.	1.2
4.	1.6
Which would give the absVD-options:
1.	0.2
2.	0.4
3.	0.4
4.	0.2

Participants would subsequently engage in a transfer phase (ES: experiential vs symbolic). No reward will be shown after the decision, instead, participants decide which of the option they believe is associated with a higher reward/ probability of winning. 
 
Then, a purely memory-based phase (EE: experiential vs experiential) follows. Which is very similar to the learning phase, but participants will receive no information about their choice (which reward the option yielded)
 
Lastly, there will be a confidence phase, in which participants indicate the probability of yielding a specific reward on a slider and state their confidence in the decision. 

 

References: 
Camerer, C. F. (2013). A review essay about Foundations of Neuroeconomic Analysis by Paul Glimcher. Journal of Economic Literature, 51(4), 1155-1182.

Fontanesi, L., Gluth, S., Spektor, M. S., & Rieskamp, J. (2019). A reinforcement learning diffusion decision model for value-based decisions. Psychonomic bulletin & review, 26(4), 1099-1121.

Garcia, B., Lebreton, M., Bourgeois-Gironde, S., & Palminteri, S. (2022). The impassable gap between experiential and symbolic values.

Garcia, B., Lebreton, M., Bourgeois-Gironde, S., & Palminteri, S. (2023). Experiential values are underweighted in decisions involving symbolic options. Nature human behaviour, 7(4), 611-626.

Glimcher, P. W. (2022). Efficiently irrational: deciphering the riddle of human choice. Trends in cognitive sciences, 26(8), 669-687.

Krajbich, I., & Rangel, A. (2011). Multialternative drift-diffusion model predicts the relationship between visual fixations and choice in value-based decisions. Proceedings of the National Academy of Sciences, 108(33), 13852-13857.

Lebreton, M., Bacily, K., Palminteri, S., & Engelmann, J. B. (2019). Contextual influence on confidence judgments in human reinforcement learning. PLoS computational biology, 15(4), e1006973.

Shevlin, B. R., Smith, S. M., Hausfeld, J., & Krajbich, I. (2022). High-value decisions are fast and accurate, inconsistent with diminishing value sensitivity. Proceedings of the National Academy of Sciences, 119(6), e2101508119.

Ting, C. C., & Gluth, S. (in press). High overall values mitigate gaze-related effects in perceptual and preferential choices.

Vlaev, I., Chater, N., Stewart, N., & Brown, G. D. (2011). Does the brain calculate value?. Trends in cognitive sciences, 15(11), 546-554.

