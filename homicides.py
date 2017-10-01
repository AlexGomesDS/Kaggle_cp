# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

## 1st descriptive statistics 
## 2nd describe main differences between states
    # 3 plus

## crime profiling
    #correlations between 



#import lib
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import plotly.plotly as py

#%% import dataset

df=pd.read_csv("database.csv")

#%%
df.columns 
df.head()
df.describe()


dfcrimetype = df['Crime Type']
dfcrimetype.
plt.hist(dfcrimetype)
plt.xlabel("Index")
plt.ylabel("Crime Type")