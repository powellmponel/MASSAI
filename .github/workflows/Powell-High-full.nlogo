; codes for sub-procedures, created by __includes["file.nls"] then saved first
__includes[
  "P0.Patch&Turtle-Attributes.nls" "P11.Import-Spatial-Data.nls"        "P12.Import-Sample-Data.nls"
  "P22.Nutrient-Stocks&Flows.nls"  "P3.Update-Attributes&Processes.nls" "P4&5.Scenarios&Iterations.nls"
  "P6.Draw-graphs.nls"             "P61.Maps&Statistics.nls"]

globals [elapsed-years prod-max ST-f-max SOCmax]

;LANDSCAPE AND HOUSEHOLDS (in file: patch-turtle-attributes.nls )

To SET-UP
   __clear-all-and-reset-ticks
  set elapsed-years 0
  P11.Import-Spatial-Data
  P12.Import-Household-Plot-Data
   P221.Estimate-nutrient-stocks  ;show "erosion parameters"
  P15.erosion-parameters ;show "erosion"
   P2233.OUT3-soil-erosion ;show " prod index"
   P226.Calculate-productivity-Index
   P13.Plots-For-Unsampled-Households
   P22.Nutrient-Stocks&Flows
   P332.estimate-economic-benefit
  P14.Working-policy-variables ;model-shift
  P6.Draw-graphs
  Map-baseline
  show "INITIALIZATION has been done."
End

To GO
tick
set elapsed-years elapsed-years + 1
P311.Update-policy&dynamic-factors
P51.subsidy-scenarios
show (word "Year " ticks " subsidy scenarios done")
;P52.gender&labour-scenarios
;show (word "Year " ticks " gender&labour scenarios done")
P6.Draw-graphs
show (word "Year " elapsed-years  " has elapsed! Beeindruncked!")
  if ticks = stop-when [stop]
End

To P51.subsidy-scenarios
show "current"
P511.subsidy-current
show "reduced"
P512.subsidy-reduced
show "universal"
P513.subsidy-universal
show "zero"
P514.subsidy-zero
End

To P52.gender&labour-scenarios
  show "baseline"
P521.baseline
  show "weai increase"
P522.weai-increase
  show "labour decrease"
P523.labour-decrease
  show "depend decrease"
P524.dependecy-decrease
End
To P4.iterations ;run repetitions to cater for stochasticity in estimates
P41.iteration1
show (word "1st interation done")
P42.iteration2
show (word "2nd interation done")
P43.iteration3
show (word "3rd interation done")
P44.iteration4
show (word "4th interation done")
P45.iteration5
show (word "5th interation done")
P46.iteration6
show (word "6th interation done")
P47.iteration7
show (word "7th interation done")
P48.iteration8
show (word "8th interation done")
P49.iteration9
show (word "9th interation done")
P410.iteration10
show (word "10th interation done")
P44.sum-iterations
End
@#$#@#$#@
GRAPHICS-WINDOW
150
10
979
386
-1
-1
1.0
1
10
1
1
1
0
1
1
1
0
820
0
366
0
0
1
ticks
30.0

BUTTON
981
24
1036
57
Elevation
map-elevation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
1004
10
1074
29
Data view
11
0.0
1

BUTTON
93
10
148
43
SET-UP
set-up
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
107
1038
140
SOC
map-SOC
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
107
1094
140
TN
map-TN
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
173
1038
206
P
map-Phosphorus
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
173
1094
206
K
map-Potassium
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
993
93
1093
113
NPK+C distribution
11
0.0
1

BUTTON
1035
24
1090
57
Slope
map-slope
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
93
42
148
75
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
272
1094
305
C:Pt
map-C:P-thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
240
1038
273
C:N
map-C:N
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
240
1094
273
C:P
map-C:P
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
140
1038
173
SOCt
map_SOC_thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
140
1094
173
TNt
map-N-thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
206
1038
239
Pt
map-P-thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1039
206
1094
239
Kt
map-K-thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
272
1038
305
C:Nt
map-C:N-thresholds
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1037
320
1093
354
Nutri
nutrients-summary-stats
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
39
414
736
440
1. FERTILIZER SUBSIDY REGIMES AND SUSTAINABLE AGRICULTURE INTENSIFICATION (SAI)
16
124.0
1

TEXTBOX
986
305
1088
324
Summary statistics
11
0.0
1

TEXTBOX
49
13
95
83
Data &\nModel\n\nSimulate
11
0.0
1

TEXTBOX
47
82
145
110
Subsidy policies
11
0.0
1

TEXTBOX
43
195
116
214
Progressive
11
0.0
1

CHOOSER
39
295
150
340
stop-when
stop-when
20 15 10 5
0

TEXTBOX
36
436
636
461
1.1. Productivity (Fertilizer & organic manure input and crop yield)
14
0.0
1

PLOT
760
455
1089
682
Fert (fert-subsidy) population
years
Fertilizer (kg/ha)
0.0
20.0
50.0
250.0
false
true
"" ""
PENS
"F_current-sub" 1.0 0 -16777216 true "" ""
"fs1l" 1.0 0 -5987164 true "" ""
"fs1u" 1.0 0 -5987164 true "" ""
"F_reduced-sub" 1.0 0 -13840069 true "" ""
"fs2l" 1.0 0 -5509967 true "" ""
"fs2u" 1.0 0 -5509967 true "" ""
"F_zero-sub" 1.0 0 -4079321 true "" ""
"fs0l" 1.0 0 -1184463 true "" ""
"fs0u" 1.0 0 -1184463 true "" ""
"F_universal-sub" 1.0 0 -2674135 true "" ""
"fs3l" 1.0 0 -1069655 true "" ""
"fs3u" 1.0 0 -1069655 true "" ""

SLIDER
37
130
148
163
Universal-subsidy
Universal-subsidy
0
100
70.0
1
1
NIL
HORIZONTAL

SLIDER
37
97
148
130
Decreased-subsidy
Decreased-subsidy
0
100
20.0
1
1
NIL
HORIZONTAL

SLIDER
37
163
148
196
no-subsidy
no-subsidy
0
100
0.0
1
1
NIL
HORIZONTAL

PLOT
36
455
277
682
Fert (fert-subsidy) farmtype1
years
Fertilizer (kg/ha)
0.0
20.0
50.0
250.0
false
false
"" ""
PENS
"Fs1-c1" 1.0 0 -16777216 true "" ""
"Fs1-c1l" 1.0 0 -7500403 true "" ""
"Fs1-c1u" 1.0 0 -7500403 true "" ""
"Fs2-c1" 1.0 0 -13840069 true "" ""
"Fs2-c1l" 1.0 0 -5509967 true "" ""
"Fs2-c1u" 1.0 0 -5509967 true "" ""
"Fs0-c1" 1.0 0 -4079321 true "" ""
"Fs0-c1l" 1.0 0 -1184463 true "" ""
"Fs0-c1u" 1.0 0 -1184463 true "" ""
"Fs3-c1" 1.0 0 -2674135 true "" ""
"Fs3-c1l" 1.0 0 -1069655 true "" ""
"Fs3-c1u" 1.0 0 -1069655 true "" ""

PLOT
277
455
518
682
Fert (fert-subsidy) farmtype2
years
Fertilizer (kg/ha)
0.0
20.0
50.0
250.0
false
false
"" ""
PENS
"Fs1-c2" 1.0 0 -16777216 true "" ""
"Fs1-c2l" 1.0 0 -7500403 true "" ""
"Fs1-c2u" 1.0 0 -7500403 true "" ""
"Fs2-c2" 1.0 0 -13840069 true "" ""
"Fs2-c2l" 1.0 0 -5509967 true "" ""
"Fs2-c2u" 1.0 0 -5509967 true "" ""
"Fs0-c2" 1.0 0 -4079321 true "" ""
"Fs0-c2l" 1.0 0 -1184463 true "" ""
"Fs0-c2u" 1.0 0 -1184463 true "" ""
"Fs3-c2" 1.0 0 -2674135 true "" ""
"Fs3-c2l" 1.0 0 -1069655 true "" ""
"Fs3-c2u" 1.0 0 -1069655 true "" ""

PLOT
519
455
760
682
Fert (fert-subsidy) farmtype3
years
Fertilizer (kg/ha)
0.0
20.0
50.0
250.0
false
false
"" ""
PENS
"Fs1-c3" 1.0 0 -16777216 true "" ""
"Fs1-c3l" 1.0 0 -7500403 true "" ""
"Fs1-c3u" 1.0 0 -7500403 true "" ""
"Fs2-c3" 1.0 0 -13840069 true "" ""
"Fs2-c3l" 1.0 0 -5509967 true "" ""
"Fs2-c3u" 1.0 0 -5509967 true "" ""
"Fs0-c3" 1.0 0 -4079321 true "" ""
"Fs0-c3l" 1.0 0 -1184463 true "" ""
"Fs0-c3u" 1.0 0 -1184463 true "" ""
"Fs3-c3" 1.0 0 -2674135 true "" ""
"Fs3-c3l" 1.0 0 -1069655 true "" ""
"Fs3-c3u" 1.0 0 -1069655 true "" ""

PLOT
760
684
1089
912
OM (fert-subsidy) population
years
Organic manure (kg/ha)
0.0
20.0
250.0
1100.0
true
true
"" ""
PENS
"O_current-sub" 1.0 0 -16777216 true "" ""
"os1l" 1.0 0 -7500403 true "" ""
"os1u" 1.0 0 -7500403 true "" ""
"O_reduced-sub" 1.0 0 -13840069 true "" ""
"os2l" 1.0 0 -5509967 true "" ""
"os2u" 1.0 0 -5509967 true "" ""
"O_zero-sub" 1.0 0 -4079321 true "" ""
"os0l" 1.0 0 -1184463 true "" ""
"os0u" 1.0 0 -1184463 true "" ""
"O_universal-sub" 1.0 0 -2674135 true "" ""
"os3l" 1.0 0 -1069655 true "" ""
"os3u" 1.0 0 -1069655 true "" ""

PLOT
519
684
760
912
OM (fert-subsidy) farmtype3
years
Organic manure (kg/ha)
0.0
20.0
250.0
1100.0
true
false
"" ""
PENS
"os1-c3" 1.0 0 -16777216 true "" ""
"os1-c3l" 1.0 0 -7500403 true "" ""
"os1-c3u" 1.0 0 -7500403 true "" ""
"os2-c3" 1.0 0 -15040220 true "" ""
"os2-c3l" 1.0 0 -13840069 true "" ""
"os2-c3u" 1.0 0 -13840069 true "" ""
"os0-c3" 1.0 0 -4079321 true "" ""
"os0-c3l" 1.0 0 -1184463 true "" ""
"os0-c3u" 1.0 0 -1184463 true "" ""
"os3-c3" 1.0 0 -2674135 true "" ""
"os3-c3l" 1.0 0 -1069655 true "" ""
"os3-c3u" 1.0 0 -1069655 true "" ""

PLOT
277
684
518
912
OM (fert-subsidy) farmtype2
years
Organic manure (kg/ha)
0.0
20.0
250.0
1100.0
true
false
"" ""
PENS
"os1-c2" 1.0 0 -16777216 true "" ""
"os1-c2l" 1.0 0 -7500403 true "" ""
"os1-c2u" 1.0 0 -7500403 true "" ""
"os2-c2" 1.0 0 -13840069 true "" ""
"os2-c2l" 1.0 0 -5509967 true "" ""
"os2-c2u" 1.0 0 -5509967 true "" ""
"os0-c2" 1.0 0 -4079321 true "" ""
"os0-c2l" 1.0 0 -1184463 true "" ""
"os0-c2u" 1.0 0 -1184463 true "" ""
"os3-c2" 1.0 0 -2674135 true "" ""
"os3-c2l" 1.0 0 -1069655 true "" ""
"os3-c2u" 1.0 0 -1069655 true "" ""

PLOT
36
684
277
912
OM (fert-subsidy) farmtype1
years
Organic manure (kg/ha)
0.0
20.0
250.0
1100.0
true
false
"" ""
PENS
"os1-c1" 1.0 0 -16777216 true "" ""
"os1-c1l" 1.0 0 -7500403 true "" ""
"os1-c1u" 1.0 0 -7500403 true "" ""
"os2-c1" 1.0 0 -13840069 true "" ""
"os2-c1l" 1.0 0 -5509967 true "" ""
"os2-c1u" 1.0 0 -5509967 true "" ""
"os0-c1" 1.0 0 -4079321 true "" ""
"os0-c1l" 1.0 0 -1184463 true "" ""
"os0-c1u" 1.0 0 -1184463 true "" ""
"os3-c1" 1.0 0 -2674135 true "" ""
"os3-c1l" 1.0 0 -1069655 true "" ""
"os3-c1u" 1.0 0 -1069655 true "" ""

PLOT
760
912
1089
1140
Maize (fert-subsidy) population
years
Maize yield (kg/ha)
0.0
20.0
1100.0
1800.0
false
true
"" ""
PENS
"M_current-sub" 1.0 0 -16777216 true "" ""
"ms1l" 1.0 0 -5987164 true "" ""
"ms1u" 1.0 0 -5987164 true "" ""
"M_reduced-sub" 1.0 0 -13840069 true "" ""
"ms2l" 1.0 0 -5509967 true "" ""
"ms2u" 1.0 0 -5509967 true "" ""
"M_zero-sub" 1.0 0 -4079321 true "" ""
"ms0l" 1.0 0 -1184463 true "" ""
"ms0u" 1.0 0 -1184463 true "" ""
"M_universal-sub" 1.0 0 -2674135 true "" ""
"ms3l" 1.0 0 -1069655 true "" ""
"ms3u" 1.0 0 -1069655 true "" ""

PLOT
519
912
760
1140
Maize (fert-subsidy) farmtype3
years
Maize yield (kg/ha)
0.0
20.0
1100.0
1800.0
false
false
"" ""
PENS
"ms1-c3" 1.0 0 -16777216 true "" ""
"ms1-c3l" 1.0 0 -5987164 true "" ""
"ms1-c3u" 1.0 0 -5987164 true "" ""
"ms2-c3" 1.0 0 -13840069 true "" ""
"ms2-c3l" 1.0 0 -5509967 true "" ""
"ms2-c3u" 1.0 0 -5509967 true "" ""
"ms0-c3" 1.0 0 -4079321 true "" ""
"ms0-c3l" 1.0 0 -1184463 true "" ""
"ms0-c3u" 1.0 0 -1184463 true "" ""
"ms3-c3" 1.0 0 -2674135 true "" ""
"ms3-c3l" 1.0 0 -1069655 true "" ""
"ms3-c3u" 1.0 0 -1069655 true "" ""

PLOT
277
912
518
1140
Maize (fert-subsidy) farmtype2
years
Maize yield (kg/ha)
0.0
20.0
1100.0
1800.0
false
false
"" ""
PENS
"ms1-c2" 1.0 0 -16777216 true "" ""
"ms1-c2l" 1.0 0 -5987164 true "" ""
"ms1-c2u" 1.0 0 -5987164 true "" ""
"ms2-c2" 1.0 0 -13840069 true "" ""
"ms2-c2l" 1.0 0 -5509967 true "" ""
"ms2-c2u" 1.0 0 -5509967 true "" ""
"ms0-c2" 1.0 0 -4079321 true "" ""
"ms0-c2l" 1.0 0 -1184463 true "" ""
"ms0-c2u" 1.0 0 -1184463 true "" ""
"ms3-c2" 1.0 0 -2674135 true "" ""
"ms3-c2l" 1.0 0 -1069655 true "" ""
"ms3-c2u" 1.0 0 -1069655 true "" ""

PLOT
36
912
277
1140
Maize (fert-subsidy) farmtype1
years
Maize yield (kg/ha)
0.0
20.0
1100.0
1800.0
false
false
"" ""
PENS
"ms1-c1" 1.0 0 -16777216 true "" ""
"ms1-c1l" 1.0 0 -5987164 true "" ""
"ms1-c1u" 1.0 0 -5987164 true "" ""
"ms2-c1" 1.0 0 -13840069 true "" ""
"ms2-c1l" 1.0 0 -5509967 true "" ""
"ms2-c1u" 1.0 0 -5509967 true "" ""
"ms0-c1" 1.0 0 -4079321 true "" ""
"ms0-c1l" 1.0 0 -1184463 true "" ""
"ms0-c1u" 1.0 0 -1184463 true "" ""
"ms3-c1" 1.0 0 -2674135 true "" ""
"ms3-c1l" 1.0 0 -1604481 true "" ""
"ms3-c1u" 1.0 0 -1604481 true "" ""

PLOT
760
1140
1089
1367
Legume (fert-subsidy) population
years
Legume yield (kg/ha)
0.0
20.0
400.0
550.0
true
true
"" ""
PENS
"L_current-sub" 1.0 0 -16777216 true "" ""
"Ls1l" 1.0 0 -5987164 true "" ""
"Ls1u" 1.0 0 -5987164 true "" ""
"L_reduced-sub" 1.0 0 -13840069 true "" ""
"Ls2l" 1.0 0 -5509967 true "" ""
"Ls2u" 1.0 0 -5509967 true "" ""
"L_zero-sub" 1.0 0 -1184463 true "" ""
"Ls0l" 1.0 0 -526419 true "" ""
"Ls0u" 1.0 0 -526419 true "" ""
"L_universal-sub" 1.0 0 -2674135 true "" ""
"Ls3l" 1.0 0 -1069655 true "" ""
"Ls3u" 1.0 0 -1069655 true "" ""

MONITOR
39
341
150
386
NIL
elapsed-years
0
1
11

SWITCH
39
211
149
244
Progressive
Progressive
0
1
-1000

PLOT
787
4122
1124
4350
Fert (gender-labour) population
years
Fertilizer (kg/ha)
0.0
20.0
50.0
200.0
false
true
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"fbl" 1.0 0 -5987164 true "" ""
"fbu" 1.0 0 -5987164 true "" ""
"weai-increase" 1.0 0 -13840069 true "" ""
"fwl" 1.0 0 -5509967 true "" ""
"fwu" 1.0 0 -5509967 true "" ""
"labour-decrease" 1.0 0 -4079321 true "" ""
"fll" 1.0 0 -1184463 true "" ""
"flu" 1.0 0 -1184463 true "" ""
"depend-decrease" 1.0 0 -2674135 true "" ""
"fdl" 1.0 0 -1069655 true "" ""
"fdu" 1.0 0 -1069655 true "" ""

PLOT
67
4122
307
4350
Fert (gender-labour) farmtype-1
years
Fertilizer (kg/ha)
0.0
20.0
50.0
200.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"fb-c1l" 1.0 0 -5987164 true "" ""
"fb-c1u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"fw-c1l" 1.0 0 -5509967 true "" ""
"fw-c1u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"fL-c1l" 1.0 0 -1184463 true "" ""
"fL-c1u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"fd-c1l" 1.0 0 -1069655 true "" ""
"fd-c1u" 1.0 0 -1069655 true "" ""

PLOT
307
4122
547
4350
Fert (gender-labour) farmtype-2
years
Fertilizer (kg/ha)
0.0
20.0
50.0
200.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"fb-c2l" 1.0 0 -5987164 true "" ""
"fb-c2u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"fw-c2l" 1.0 0 -5509967 true "" ""
"fw-c2u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"fL-c2l" 1.0 0 -1184463 true "" ""
"fL-c2u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"fd-c2l" 1.0 0 -1069655 true "" ""
"fd-c2u" 1.0 0 -1069655 true "" ""

PLOT
547
4122
787
4350
Fert (gender-labour) farmtype-3
years
Fertilizer (kg/ha)
0.0
20.0
50.0
200.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"fb-c3l" 1.0 0 -5987164 true "" ""
"fb-c3u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"fw-c3l" 1.0 0 -5509967 true "" ""
"fw-c3u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"fL-c3l" 1.0 0 -1184463 true "" ""
"fL-c3u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"fd-c3l" 1.0 0 -1069655 true "" ""
"fd-c3u" 1.0 0 -1069655 true "" ""

PLOT
67
4351
307
4579
OM (gender-labour) farmtype-1
years
Organic manure (kg/ha)
0.0
20.0
200.0
1300.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"ob-c1l" 1.0 0 -5987164 true "" ""
"ob-c1u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"ow-c1l" 1.0 0 -5509967 true "" ""
"ow-c1u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"ol-c1l" 1.0 0 -1184463 true "" ""
"ol-c1u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"od-c1l" 1.0 0 -1069655 true "" ""
"od-c1u" 1.0 0 -1069655 true "" ""

PLOT
307
4351
547
4579
OM (gender-labour) farmtype-2
years
Organic manure (kg/ha)
0.0
20.0
200.0
1300.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"ob-c2l" 1.0 0 -5987164 true "" ""
"ob-c2u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"ow-c2l" 1.0 0 -5509967 true "" ""
"ow-c2u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"ol-c2l" 1.0 0 -1184463 true "" ""
"ol-c2u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"od-c2l" 1.0 0 -1069655 true "" ""
"od-c2u" 1.0 0 -1069655 true "" ""

PLOT
547
4351
787
4579
OM (gender-labour) farmtype-3
years
Organic manure (kg/ha)
0.0
20.0
200.0
1300.0
false
false
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"ob-c3l" 1.0 0 -5987164 true "" ""
"ob-c3u" 1.0 0 -5987164 true "" ""
"weai-incr" 1.0 0 -13840069 true "" ""
"ow-c3l" 1.0 0 -5509967 true "" ""
"ow-c3u" 1.0 0 -5509967 true "" ""
"labour-decr" 1.0 0 -4079321 true "" ""
"oL-c3l" 1.0 0 -1184463 true "" ""
"oL-c3u" 1.0 0 -1184463 true "" ""
"depend-decr" 1.0 0 -2674135 true "" ""
"od-c3l" 1.0 0 -1069655 true "" ""
"od-c3u" 1.0 0 -1069655 true "" ""

PLOT
787
4351
1124
4579
OM (gender-labour) population
years
Organic manure (kg/ha)
0.0
20.0
200.0
1300.0
false
true
"" ""
PENS
"baseline" 1.0 0 -16777216 true "" ""
"obl" 1.0 0 -5987164 true "" ""
"obu" 1.0 0 -5987164 true "" ""
"weai-increase" 1.0 0 -13840069 true "" ""
"owl" 1.0 0 -5509967 true "" ""
"owu" 1.0 0 -5509967 true "" ""
"labour-decrease" 1.0 0 -4079321 true "" ""
"oll" 1.0 0 -1184463 true "" ""
"olu" 1.0 0 -1184463 true "" ""
"depend-decrease" 1.0 0 -2674135 true "" ""
"odl" 1.0 0 -1069655 true "" ""
"odu" 1.0 0 -1069655 true "" ""

PLOT
757
1407
1076
1635
NB (fert-subsidy) population
years
Nitrogen balance (kg/ha)
0.0
20.0
0.0
110.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"NBs1l" 1.0 0 -5987164 true "" ""
"NBs1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"NBs2l" 1.0 0 -5509967 true "" ""
"NBs2u" 1.0 0 -5509967 true "" ""
"To-zero-sub" 1.0 0 -4079321 true "" ""
"NBs0l" 1.0 0 -1184463 true "" ""
"NBs0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"NBs3l" 1.0 0 -1069655 true "" ""
"NBs3u" 1.0 0 -1069655 true "" ""

PLOT
37
1407
277
1635
NB (fert-subsidy) farmtype1
years
Nitrogen balance (kg/ha)
0.0
20.0
0.0
110.0
true
false
"" ""
PENS
"NBs1-c1" 1.0 0 -16777216 true "" ""
"NBs1-c1l" 1.0 0 -5987164 true "" ""
"NBs1-c1u" 1.0 0 -5987164 true "" ""
"NBs2-c1" 1.0 0 -13840069 true "" ""
"NBs2-c1l" 1.0 0 -5509967 true "" ""
"NBs2-c1u" 1.0 0 -5509967 true "" ""
"NBs0-c1" 1.0 0 -4079321 true "" ""
"NBs0-c1l" 1.0 0 -1184463 true "" ""
"NBs0-c1u" 1.0 0 -1184463 true "" ""
"NBs3-c1" 1.0 0 -2674135 true "" ""
"NBs3-c1l" 1.0 0 -1069655 true "" ""
"NBs3-c1u" 1.0 0 -1069655 true "" ""

PLOT
277
1407
517
1635
NB (fert-subsidy) farmtype2
years
Nitrogen balance (kg/ha)
0.0
20.0
0.0
110.0
true
false
"" ""
PENS
"NBs1-c2" 1.0 0 -16777216 true "" ""
"NBs1-c2l" 1.0 0 -5987164 true "" ""
"NBs1-c2u" 1.0 0 -5987164 true "" ""
"NBs2-c2" 1.0 0 -13840069 true "" ""
"NBs2-c2l" 1.0 0 -5509967 true "" ""
"NBs2-c2u" 1.0 0 -5509967 true "" ""
"NBs0-c2" 1.0 0 -4079321 true "" ""
"NBs0-c2l" 1.0 0 -1184463 true "" ""
"NBs0-c2u" 1.0 0 -1184463 true "" ""
"NBs3-c2" 1.0 0 -2674135 true "" ""
"NBs3-c2l" 1.0 0 -1069655 true "" ""
"NBs3-c2u" 1.0 0 -1069655 true "" ""

PLOT
517
1407
757
1635
NB (fert-subsidy) farmtype3
years
Nitrogen balance (kg/ha)
0.0
20.0
0.0
110.0
true
false
"" ""
PENS
"NBs1-c3" 1.0 0 -16777216 true "" ""
"NBs1-c3l" 1.0 0 -5987164 true "" ""
"NBs1-c3u" 1.0 0 -5987164 true "" ""
"NBs2-c3" 1.0 0 -13840069 true "" ""
"NBs2-c3l" 1.0 0 -5509967 true "" ""
"NBs2-c3u" 1.0 0 -5509967 true "" ""
"NBs0-c3" 1.0 0 -4079321 true "" ""
"NBs0-c3l" 1.0 0 -1184463 true "" ""
"NBs0-c3u" 1.0 0 -1184463 true "" ""
"NBs3-c3" 1.0 0 -2674135 true "" ""
"NBs3-c3l" 1.0 0 -1069655 true "" ""
"NBs3-c3u" 1.0 0 -1069655 true "" ""

PLOT
757
1636
1076
1865
PB (fert-subsidy) population
years
Phosphorus (kg/ha)
0.0
20.0
-1.0
10.0
false
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"PBs1l" 1.0 0 -5987164 true "" ""
"PBs1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"PBs2l" 1.0 0 -5509967 true "" ""
"PBs2u" 1.0 0 -5509967 true "" ""
"To-zero-sub" 1.0 0 -4079321 true "" ""
"PBs0l" 1.0 0 -1184463 true "" ""
"PBs0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"PBs3l" 1.0 0 -1069655 true "" ""
"PBs3u" 1.0 0 -1069655 true "" ""

PLOT
37
1636
277
1865
PB (fert-subsidy) farmtype1
years
Phosphorus (kg/ha)
0.0
20.0
-1.0
10.0
false
false
"" ""
PENS
"PBs1-c1" 1.0 0 -16777216 true "" ""
"PBs1-c1l" 1.0 0 -5987164 true "" ""
"PBs1-c1u" 1.0 0 -5987164 true "" ""
"PBs2-c1" 1.0 0 -13840069 true "" ""
"PBs2-c1l" 1.0 0 -5509967 true "" ""
"PBs2-c1u" 1.0 0 -5509967 true "" ""
"PBs0-c1" 1.0 0 -4079321 true "" ""
"PBs0-c1l" 1.0 0 -1184463 true "" ""
"PBs0-c1u" 1.0 0 -1184463 true "" ""
"PBs3-c1" 1.0 0 -2674135 true "" ""
"PBs3-c1l" 1.0 0 -1069655 true "" ""
"PBs3-c1u" 1.0 0 -1069655 true "" ""

PLOT
277
1636
517
1865
PB (fert-subsidy) farmtype2
years
Phosphorus (kg/ha)
0.0
20.0
-1.0
10.0
false
false
"" ""
PENS
"PBs1-c2" 1.0 0 -16777216 true "" ""
"PBs1-c2l" 1.0 0 -5987164 true "" ""
"PBs1-c2u" 1.0 0 -5987164 true "" ""
"PBs2-c2" 1.0 0 -13840069 true "" ""
"PBs2-c2l" 1.0 0 -5509967 true "" ""
"PBs2-c2u" 1.0 0 -5509967 true "" ""
"PBs0-c2" 1.0 0 -4079321 true "" ""
"PBs0-c2l" 1.0 0 -1184463 true "" ""
"PBs0-c2u" 1.0 0 -1184463 true "" ""
"PBs3-c2" 1.0 0 -2674135 true "" ""
"PBs3-c2l" 1.0 0 -1069655 true "" ""
"PBs3-c2u" 1.0 0 -1069655 true "" ""

PLOT
517
1636
757
1865
PB (fert-subsidy) farmtype3
years
Phosphorus (kg/ha)
0.0
20.0
-1.0
10.0
false
false
"" ""
PENS
"PBs1-c3" 1.0 0 -16777216 true "" ""
"PBs1-c3l" 1.0 0 -5987164 true "" ""
"PBs1-c3u" 1.0 0 -5987164 true "" ""
"PBs2-c3" 1.0 0 -13840069 true "" ""
"PBs2-c3l" 1.0 0 -5509967 true "" ""
"PBs2-c3u" 1.0 0 -5509967 true "" ""
"PBs0-c3" 1.0 0 -4079321 true "" ""
"PBs0-c3l" 1.0 0 -1184463 true "" ""
"PBs0-c3u" 1.0 0 -1184463 true "" ""
"PBs3-c3" 1.0 0 -2674135 true "" ""
"PBs3-c3l" 1.0 0 -1069655 true "" ""
"PBs3-c3u" 1.0 0 -1069655 true "" ""

PLOT
37
1865
277
2094
KB (fert-subsidy) farmtype1
years
Potassium balance (kg/ha)
0.0
20.0
-90.0
-70.0
true
false
"" ""
PENS
"KBs1-c1" 1.0 0 -16777216 true "" ""
"KBs1-c1l" 1.0 0 -5987164 true "" ""
"KBs1-c1u" 1.0 0 -5987164 true "" ""
"KBs2-c1" 1.0 0 -13840069 true "" ""
"KBs2-c1l" 1.0 0 -5509967 true "" ""
"KBs2-c1u" 1.0 0 -5509967 true "" ""
"KBs0-c1" 1.0 0 -4079321 true "" ""
"KBs0-c1l" 1.0 0 -1184463 true "" ""
"KBs0-c1u" 1.0 0 -1184463 true "" ""
"KBs3-c1" 1.0 0 -2674135 true "" ""
"KBs3-c1l" 1.0 0 -1069655 true "" ""
"KBs3-c1u" 1.0 0 -1069655 true "" ""

PLOT
277
1865
517
2094
KB (fert-subsidy) farmtype2
years
Potassium balance (kg/ha)
0.0
20.0
-90.0
-70.0
true
false
"" ""
PENS
"KBs1-c2" 1.0 0 -16777216 true "" ""
"KBs1-c2l" 1.0 0 -5987164 true "" ""
"KBs1-c2u" 1.0 0 -5987164 true "" ""
"KBs2-c2" 1.0 0 -13840069 true "" ""
"KBs2-c2l" 1.0 0 -5509967 true "" ""
"KBs2-c2u" 1.0 0 -5509967 true "" ""
"KBs0-c2" 1.0 0 -4079321 true "" ""
"KBs0-c2l" 1.0 0 -1184463 true "" ""
"KBs0-c2u" 1.0 0 -1184463 true "" ""
"KBs3-c2" 1.0 0 -2674135 true "" ""
"KBs3-c2l" 1.0 0 -1069655 true "" ""
"KBs3-c2u" 1.0 0 -1069655 true "" ""

PLOT
517
1865
757
2094
KB (fert-subsidy) farmtype3
years
Potassium balance (kg/ha)
0.0
20.0
-90.0
-70.0
true
false
"" ""
PENS
"KBs1-c3" 1.0 0 -16777216 true "" ""
"KBs1-c3l" 1.0 0 -5987164 true "" ""
"KBs1-c3u" 1.0 0 -5987164 true "" ""
"KBs2-c3" 1.0 0 -13840069 true "" ""
"KBs2-c3l" 1.0 0 -5509967 true "" ""
"KBs2-c3u" 1.0 0 -5509967 true "" ""
"KBs0-c3" 1.0 0 -4079321 true "" ""
"KBs0-c3l" 1.0 0 -1184463 true "" ""
"KBs0-c3u" 1.0 0 -1184463 true "" ""
"KBs3-c3" 1.0 0 -2674135 true "" ""
"KBs3-c3l" 1.0 0 -1069655 true "" ""
"KBs3-c3u" 1.0 0 -1069655 true "" ""

PLOT
757
1865
1076
2094
KB (fert-subsidy) population
years
Potassium balance (kg/ha)
0.0
20.0
-90.0
-70.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"KBs1u" 1.0 0 -5987164 true "" ""
"KBs1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"KBs2u" 1.0 0 -5509967 true "" ""
"KBs2l" 1.0 0 -5509967 true "" ""
"To-zero-sub" 1.0 0 -4079321 true "" ""
"KBs0u" 1.0 0 -1184463 true "" ""
"KBs0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"KBs3u" 1.0 0 -1069655 true "" ""
"KBs3l" 1.0 0 -1069655 true "" ""

TEXTBOX
40
1385
429
1405
1.2. Ecological (Nitrigen, phosphorus and potassium balance)
14
0.0
1

TEXTBOX
75
4071
688
4094
2. Gender + Labour dynamics and Sustainable Agricultural Intensification (SAI)
16
125.0
1

TEXTBOX
42
2327
246
2361
1.3. Economic indicators
14
0.0
1

TEXTBOX
63
3805
200
3823
1.4. Social indicators
14
0.0
1

BUTTON
981
56
1036
89
Land units
map-plots
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
983
320
1038
354
Inputs
Input-summary-statistics
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
74
4102
413
4121
2.1. Productivity (Fertilizer and organic manures)
11
0.0
1

PLOT
757
2351
1076
2579
Product $ (fert-subsidy) population
years
Product value ($/ha)
0.0
20.0
200.0
550.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"P$s1l" 1.0 0 -5987164 true "" ""
"P$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"P$s2l" 1.0 0 -5509967 true "" ""
"P$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"P$s0l" 1.0 0 -1184463 true "" ""
"P$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"P$s3l" 1.0 0 -1069655 true "" ""
"P$s3u" 1.0 0 -1069655 true "" ""

PLOT
36
2351
276
2579
Product $ (fert-subsidy) farmtype1
years
Product value ($/ha)
0.0
20.0
200.0
550.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"P$s1l" 1.0 0 -5987164 true "" ""
"P$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"P$s2l" 1.0 0 -5509967 true "" ""
"P$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"P$s0l" 1.0 0 -1184463 true "" ""
"P$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"P$s3l" 1.0 0 -1069655 true "" ""
"P$s3u" 1.0 0 -1069655 true "" ""

PLOT
517
2351
757
2579
Product $ (fert-subsidy) farmtype3
years
Product value ($/ha)
0.0
20.0
200.0
550.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"P$s1l" 1.0 0 -5987164 true "" ""
"P$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"P$s2l" 1.0 0 -5509967 true "" ""
"P$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"P$s0l" 1.0 0 -1184463 true "" ""
"P$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"P$s3l" 1.0 0 -1069655 true "" ""
"P$s3u" 1.0 0 -1069655 true "" ""

PLOT
276
2351
517
2579
Product $ (fert-subsidy) farmtype2
years
Product value ($/ha)
0.0
20.0
200.0
550.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"P$s1l" 1.0 0 -5987164 true "" ""
"P$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"P$s2l" 1.0 0 -5509967 true "" ""
"P$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"P$s0l" 1.0 0 -1184463 true "" ""
"P$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"P$s3l" 1.0 0 -1069655 true "" ""
"P$s3u" 1.0 0 -1069655 true "" ""

PLOT
757
2578
1076
2809
Expense $ (fert-subsidy) population
years
Expense ($/ha)
0.0
20.0
0.0
220.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"E$s1l" 1.0 0 -5987164 true "" ""
"E$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"E$s2l" 1.0 0 -5509967 true "" ""
"E$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"E$s0l" 1.0 0 -1184463 true "" ""
"E$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"E$s3l" 1.0 0 -1069655 true "" ""
"E$s3u" 1.0 0 -1069655 true "" ""

PLOT
517
2578
757
2809
Expense $ (fert-subsidy) farmtype3
years
Expense ($/ha)
0.0
20.0
0.0
220.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"E$s1l" 1.0 0 -5987164 true "" ""
"E$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"E$s2l" 1.0 0 -5509967 true "" ""
"E$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"E$s0l" 1.0 0 -1184463 true "" ""
"E$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"E$s3l" 1.0 0 -1069655 true "" ""
"E$s3u" 1.0 0 -1069655 true "" ""

PLOT
276
2578
517
2809
Expense $ (fert-subsidy) farmtype2
years
Expense ($/ha)
0.0
20.0
0.0
220.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"E$s1l" 1.0 0 -5987164 true "" ""
"E$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"E$s2l" 1.0 0 -5509967 true "" ""
"E$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"E$s0l" 1.0 0 -1184463 true "" ""
"E$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"E$s3l" 1.0 0 -1069655 true "" ""
"E$s3u" 1.0 0 -1069655 true "" ""

PLOT
36
2578
276
2809
Expense $ (fert-subsidy) farmtype1
years
Expense ($/ha)
0.0
20.0
0.0
220.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"E$s1l" 1.0 0 -5987164 true "" ""
"E$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"E$s2l" 1.0 0 -5509967 true "" ""
"E$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"E$s0l" 1.0 0 -1184463 true "" ""
"E$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"E$s3l" 1.0 0 -1069655 true "" ""
"E$s3u" 1.0 0 -1069655 true "" ""

PLOT
757
2810
1076
3040
Profit (fert-subsidy) population
years
Profitability ($/ha)
0.0
20.0
150.0
400.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"B-C$s1l" 1.0 0 -5987164 true "" ""
"B-C$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"B-C$s2l" 1.0 0 -5509967 true "" ""
"B-C$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"B-C$s0l" 1.0 0 -1184463 true "" ""
"B-C$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"B-C$s3l" 1.0 0 -1069655 true "" ""
"B-C$s3u" 1.0 0 -1069655 true "" ""

PLOT
36
2810
276
3040
Profit (fert-subsidy) farmtype1
years
Profitability ($/ha)
0.0
20.0
160.0
400.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"B-C$s1l" 1.0 0 -5987164 true "" ""
"B-C$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"B-C$s2l" 1.0 0 -5509967 true "" ""
"B-C$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"B-C$s0l" 1.0 0 -1184463 true "" ""
"B-C$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"B-C$s3l" 1.0 0 -1069655 true "" ""
"B-C$s3u" 1.0 0 -1069655 true "" ""

PLOT
276
2810
517
3040
Profit (fert-subsidy) farmtype2
years
Profitability ($/ha)
0.0
20.0
160.0
400.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"B-C$s1l" 1.0 0 -5987164 true "" ""
"B-C$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"B-C$s2l" 1.0 0 -5509967 true "" ""
"B-C$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"B-C$s0l" 1.0 0 -1184463 true "" ""
"B-C$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"B-C$s3l" 1.0 0 -1069655 true "" ""
"B-C$s3u" 1.0 0 -1069655 true "" ""

PLOT
517
2810
757
3040
Profit (fert-subsidy) farmtype3
years
Profitability ($/ha)
0.0
20.0
160.0
400.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"B-C$s1l" 1.0 0 -5987164 true "" ""
"B-C$s1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"B-C$s2l" 1.0 0 -5509967 true "" ""
"B-C$s2u" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"B-C$s0l" 1.0 0 -1184463 true "" ""
"B-C$s0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"B-C$s3l" 1.0 0 -1069655 true "" ""
"B-C$s3u" 1.0 0 -1069655 true "" ""

PLOT
779
3823
1098
3963
NB+ (fert-subsidy) population
years
NB+ (% plots)
0.0
20.0
40.0
100.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Reduced-sub" 1.0 0 -14439633 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""

PLOT
58
3823
298
3963
NB+ (fert-subsidy) farmtype1
years
NB+ (% plots)
0.0
20.0
40.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""

PLOT
298
3823
539
3963
NB+ (fert-subsidy) farmtype2
years
NB+ (% plots)
0.0
20.0
40.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""

PLOT
539
3823
779
3963
NB+ (fert-subsidy) farmtype3
years
NB+ (% plots)
0.0
20.0
40.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""

BUTTON
983
354
1038
387
Base-Nut
Show-nut-stats_H
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
757
2094
1076
2321
CB (fert-subsidy) population
NIL
NIL
0.0
20.0
-1000.0
-600.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"CBs1l" 1.0 0 -5987164 true "" ""
"CBs1u" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"CBs2l" 1.0 0 -5509967 true "" ""
"CBs2u" 1.0 0 -5509967 true "" ""
"To-zero-sub" 1.0 0 -4079321 true "" ""
"CBs0l" 1.0 0 -1184463 true "" ""
"CBs0u" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"CBs3l" 1.0 0 -1069655 true "" ""
"CBs3u" 1.0 0 -1069655 true "" ""

PLOT
37
2094
277
2321
CB (fert-subsidy) farmtype1
years
Carbon balance (kg/ha)
0.0
20.0
-1000.0
-600.0
true
false
"" ""
PENS
"CBs1-c1" 1.0 0 -16777216 true "" ""
"CBs1-c1l" 1.0 0 -5987164 true "" ""
"CBs1-c1u" 1.0 0 -5987164 true "" ""
"CBs2-c1" 1.0 0 -13840069 true "" ""
"CBs2-c1l" 1.0 0 -5509967 true "" ""
"CBs2-c1u" 1.0 0 -5509967 true "" ""
"CBs0-c1" 1.0 0 -4079321 true "" ""
"CBs0-c1l" 1.0 0 -1184463 true "" ""
"CBs0-c1u" 1.0 0 -1184463 true "" ""
"CBs3-c1" 1.0 0 -2674135 true "" ""
"CBs3-c1l" 1.0 0 -1069655 true "" ""
"CBs3-c1u" 1.0 0 -1069655 true "" ""

PLOT
277
2094
517
2321
CB (fert-subsidy) farmtype2
years
Carbon balance (kg/ha)
0.0
20.0
-1000.0
-600.0
true
false
"" ""
PENS
"CBs1-c2" 1.0 0 -16777216 true "" ""
"CBs1-c2l" 1.0 0 -5987164 true "" ""
"CBs1-c2u" 1.0 0 -5987164 true "" ""
"CBs2-c2" 1.0 0 -13840069 true "" ""
"CBs2-c2l" 1.0 0 -5509967 true "" ""
"CBs2-c2u" 1.0 0 -5509967 true "" ""
"CBs0-c2" 1.0 0 -4079321 true "" ""
"CBs0-c2l" 1.0 0 -1184463 true "" ""
"CBs0-c2u" 1.0 0 -1184463 true "" ""
"CBs3-c2" 1.0 0 -2674135 true "" ""
"CBs3-c2l" 1.0 0 -1069655 true "" ""
"CBs3-c2u" 1.0 0 -1069655 true "" ""

PLOT
517
2094
757
2321
CB (fert-subsidy) farmtype3
years
Carbon balance (kg/ha)
0.0
20.0
-1000.0
-600.0
true
false
"" ""
PENS
"CBs1-c3" 1.0 0 -16777216 true "" ""
"CBs1-c3l" 1.0 0 -5987164 true "" ""
"CBs1-c3u" 1.0 0 -5987164 true "" ""
"CBs2-c3" 1.0 0 -13840069 true "" ""
"CBs2-c3l" 1.0 0 -5509967 true "" ""
"CBs2-c3u" 1.0 0 -5509967 true "" ""
"CBs0-c3" 1.0 0 -4079321 true "" ""
"CBs0-c3l" 1.0 0 -1184463 true "" ""
"CBs0-c3u" 1.0 0 -1184463 true "" ""
"CBs3-c3" 1.0 0 -2674135 true "" ""
"CBs3-c3l" 1.0 0 -1069655 true "" ""
"CBs3-c3u" 1.0 0 -1069655 true "" ""

CHOOSER
39
246
149
291
Parameter
Parameter
"Low" "High"
1

CHOOSER
983
386
1075
431
Nut-balance
Nut-balance
"Full" "Partial"
1

PLOT
760
3077
1078
3305
Inputs $ (fert-subsidy) population
years
Input value ($/ha)
0.0
20.0
300.0
650.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"In$s1u" 1.0 0 -5987164 true "" ""
"In$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"In$s2u" 1.0 0 -5509967 true "" ""
"In$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"In$s0u" 1.0 0 -1184463 true "" ""
"In$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"In$s3u" 1.0 0 -1069655 true "" ""
"In$s3l" 1.0 0 -1069655 true "" ""

PLOT
33
3077
273
3305
Inputs $ (fert-subsidy) farmtype1
years
Input Value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"In$s1u" 1.0 0 -5987164 true "" ""
"In$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"In$s2u" 1.0 0 -5509967 true "" ""
"In$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"In$s0u" 1.0 0 -1184463 true "" ""
"In$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"In$s3u" 1.0 0 -1069655 true "" ""
"In$s3l" 1.0 0 -1069655 true "" ""

PLOT
273
3077
516
3305
Inputs $ (fert-subsidy) farmtype2
years
Inputs value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"In$s1u" 1.0 0 -5987164 true "" ""
"In$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"In$s2u" 1.0 0 -5509967 true "" ""
"In$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"In$s0u" 1.0 0 -1184463 true "" ""
"In$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"In$s3u" 1.0 0 -1069655 true "" ""
"In$s3l" 1.0 0 -1069655 true "" ""

PLOT
516
3077
760
3305
Inputs $ (fert-subsidy) farmtype3
years
Inputs value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"In$s1u" 1.0 0 -5987164 true "" ""
"In$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"In$s2u" 1.0 0 -5509967 true "" ""
"In$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"In$s0u" 1.0 0 -1184463 true "" ""
"In$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"In$s3u" 1.0 0 -1069655 true "" ""
"In$s3l" 1.0 0 -1069655 true "" ""

PLOT
760
3305
1078
3531
Outputs $ (fert-subsidy) population
years
Outputs value ($/ha)
0.0
20.0
300.0
650.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Out$s1u" 1.0 0 -5987164 true "" ""
"Out$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Out$s2u" 1.0 0 -5509967 true "" ""
"Out$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Out$s0u" 1.0 0 -1184463 true "" ""
"Out$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Out$s3u" 1.0 0 -1069655 true "" ""
"Out$s3l" 1.0 0 -1069655 true "" ""

PLOT
33
3305
273
3531
Outputs $ (fert-subsidy) farmtype1
years
Output value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Out$s1u" 1.0 0 -5987164 true "" ""
"Out$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Out$s2u" 1.0 0 -5509967 true "" ""
"Out$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Out$s0u" 1.0 0 -1184463 true "" ""
"Out$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Out$s3u" 1.0 0 -1069655 true "" ""
"Out$s3l" 1.0 0 -1069655 true "" ""

PLOT
273
3305
516
3531
Outputs $ (fert-subsidy) farmtype2
years
Outputs value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Out$s1u" 1.0 0 -5987164 true "" ""
"Out$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Out$s2u" 1.0 0 -5509967 true "" ""
"Out$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Out$s0u" 1.0 0 -1184463 true "" ""
"Out$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Out$s3u" 1.0 0 -1069655 true "" ""
"Out$s3l" 1.0 0 -1069655 true "" ""

PLOT
516
3305
760
3531
Outputs $ (fert-subsidy) farmtype3
years
Outputs value ($/ha)
0.0
20.0
300.0
650.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Out$s1u" 1.0 0 -5987164 true "" ""
"Out$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Out$s2u" 1.0 0 -5509967 true "" ""
"Out$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Out$s0u" 1.0 0 -1184463 true "" ""
"Out$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Out$s3u" 1.0 0 -1069655 true "" ""
"Out$s3l" 1.0 0 -1069655 true "" ""

PLOT
760
3531
1078
3757
Balance $ (fert-subsidy) population
years
Balance value ($/ha)
0.0
20.0
-70.0
100.0
true
true
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Bal$s1u" 1.0 0 -5987164 true "" ""
"Bal$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Bal$s2u" 1.0 0 -5509967 true "" ""
"Bal$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Bal$s0u" 1.0 0 -1184463 true "" ""
"Bal$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Bal$s3u" 1.0 0 -1069655 true "" ""
"Bal$s3l" 1.0 0 -1069655 true "" ""

PLOT
33
3531
273
3757
Balance $ (fert-subsidy) farmtype1
years
Balance value ($/ha)
0.0
20.0
-70.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Bal$s1u" 1.0 0 -5987164 true "" ""
"Bal$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Bal$s2u" 1.0 0 -5509967 true "" ""
"Bal$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Bal$s0u" 1.0 0 -1184463 true "" ""
"Bal$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Bal$s3u" 1.0 0 -1069655 true "" ""
"Bal$s3l" 1.0 0 -1069655 true "" ""

PLOT
273
3531
516
3757
Balance $ (fert-subsidy) farmtype2
years
Balance value ($/ha)
0.0
20.0
-70.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Bal$s1u" 1.0 0 -5987164 true "" ""
"Bal$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Bal$s2u" 1.0 0 -5509967 true "" ""
"Bal$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Bal$s0u" 1.0 0 -1184463 true "" ""
"Bal$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Bal$s3u" 1.0 0 -1069655 true "" ""
"Bal$s3l" 1.0 0 -1069655 true "" ""

PLOT
516
3531
760
3757
Balance $ (fert-subsidy) farmtype3
years
Balance value ($/ha)
0.0
20.0
-70.0
100.0
true
false
"" ""
PENS
"Current-sub" 1.0 0 -16777216 true "" ""
"Bal$s1u" 1.0 0 -5987164 true "" ""
"Bal$s1l" 1.0 0 -5987164 true "" ""
"Reduced-sub" 1.0 0 -13840069 true "" ""
"Bal$s2u" 1.0 0 -5509967 true "" ""
"Bal$s2l" 1.0 0 -5509967 true "" ""
"Zero-sub" 1.0 0 -4079321 true "" ""
"Bal$s0u" 1.0 0 -1184463 true "" ""
"Bal$s0l" 1.0 0 -1184463 true "" ""
"Universal-sub" 1.0 0 -2674135 true "" ""
"Bal$s3u" 1.0 0 -1069655 true "" ""
"Bal$s3l" 1.0 0 -1069655 true "" ""

BUTTON
1036
56
1091
89
prod-index
map-productivity-index
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
793
399
864
432
NIL
map-all
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(Spatially and temporally explicit capture, analyse, present soil nutrient balances and explore ex-ante possible livelihood and ecological outcomes from alternative soil management practices to better inform smallholder farmers and other stakeholders whilst making their sustainability decisions)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
