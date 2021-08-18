# TephraProb Implementations and Optimisations

## Proposed changes

0. Switch hard coded filepaths to environment variables
1. Look at the probability maker
2. Profile and compare
3. Translation exploration

## Changes

0. - setup.sh contains the filepaths for CURVES, CODE, GRID, WIND, RUNS, MODEL
   - Changed files:
       - CODE/process_T2_JC.m
       - CODE/probability_maker_JC.m
       - CODE/process_T2.m
       - CODE/runT2.m
       - CODE/load_grid.m
       - CODE/probability_maker.m
       - CODE/plot_hazCurves.m
       - CODE/get_prefs.m
       - CODE/runT2_JC.m
       - CODE/conf_points.m
       - CODE/runProb.m
       - CODE/runProb_vulc.m
       - CODE/plotMap.m
       - CODE/exportASCII_JC.m
       - CODE/conf_grid.m
       - CODE/exportASCII.m
       - CODE/dwind/process_wind.m
       - CODE/dwind/dwind.m
       - CODE/dwind/analyze_wind.m
       - CODE/dwind/installAPI.m
       - CODE/load_run.m
       - tephraProb_JC.m
       - tephraProb.m
       - TephraProb_wrapper_JC
       - RUNS/krak_cord/9/T2_stor.txt
