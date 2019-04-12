# Testing-open-source-toolboxes

These are supplementary files for the bioRxiv preprint "Comparing open-source toolboxes for processing and analysis of spike and local field potentials data": https://www.biorxiv.org/content/10.1101/600486v1. The aim of this contribution is to test and compare functionality of major open-source toolboxes for spike and local field potentials (LFPs) data analysis and processing.

Description of data files:

1 Please, upload the file MM_S1_raw.mat from https://crcns.org/data-sets/motor-cortex/pmd-1/about-pmd-1

2 additiveNoise.mat: the data were generated as additiveNoise = randn( 1, 2001 ) and saved in mat file for repeatability of the results

3 sines1.mat, sines2.mat: the data correspond to signals dataValues for iPlot = 1 and iPlot = 2 for the Section 3.4 in TestingToolboxes.m, this data are saved to be loaded in Python script for testing Elephant toolbox

4 spectrSine1.mat, spectrSine2.mat: the data correspond to power spectrum computed in Elephant for the signals sines1.mat, sines2.mat (see above)

5 monkey_example_data_v1.mat: the LFP data from https://datadryad.org/resource/doi:10.5061/dryad.p631f

6 PerichReachData.mat contains same data as MM_S1_raw.mat but for 1ms instead of 10 ms bin size: PerichReachData.mat data was generated by running clean_data.m from https://crcns.org/data-sets/motor-cortex/pmd-1/about-pmd-1 (data and scripts) for dt = 0.001 instead of dt = 0.01 (line 24), correspondingly.
