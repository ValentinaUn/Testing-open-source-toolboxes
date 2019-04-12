# -*- coding: utf-8 -*-
"""
Created on Wed Feb  6 09:18:07 2019

@author: Valentina Unakafova
"""
import scipy.io
import signal_processing
import timeit
import numpy

def computeCWT(isSine2, n):
    if isSine2:
        mat = scipy.io.loadmat('sines2.mat')
    else:    
        mat = scipy.io.loadmat('sines1.mat')

    h = list(numpy.arange(2.0,80.0,2.0))    
    a = mat['dataValues']
    b = 1
    for i in range(0,n):
        if isSine2:
            b = signal_processing.wavelet_transform(a, h, 10.0, 1000.0, True)
        else:    
            b = signal_processing.wavelet_transform(a, h, 20.0, 1000.0, True)
        
    return mat, b
        
def runElephantWavelet():

    for i in range(1,3):
        if i == 1:
            isSine2 = True            
            t = timeit.Timer("computeCWT(True, 1000)", "from __main__ import computeCWT")
        else:
            isSine2 = False
            t = timeit.Timer("computeCWT(False, 1000)", "from __main__ import computeCWT")
        
        time = t.timeit(1)
        print(time)
        
        mat, b = computeCWT(isSine2, 1);
        adict = {}
        adict['data'] = b
        adict['__header__'] = mat['__header__']

        if isSine2:
            scipy.io.savemat('spectrSine2.mat', adict)
        else:
            scipy.io.savemat('spectrSine1.mat', adict)
            
        
runElephantWavelet()
