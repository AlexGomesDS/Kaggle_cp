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
<<<<<<< HEAD
%matplotlib qt5
=======
import plotly.plotly as py
>>>>>>> origin/master

#%% import dataset

df=pd.read_csv("database.csv")

#%%
df.columns 
df.head()
df.describe()

<<<<<<< HEAD
#%% 
df2=df.loc[1:10000]
plt.figure()
plt.scatter(df2['Victim Age'].values, df2['Perpetrator Age'].values)
=======

dfcrimetype = df['Crime Type']
dfcrimetype.
plt.hist(dfcrimetype)
plt.xlabel("Index")
plt.ylabel("Crime Type")
>>>>>>> origin/master
