# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

#import lib
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
%matplotlib qt5

#%% import dataset

df=pd.read_csv("database.csv")

#%% 
df.head()
df.describe()

#%% 
df2=df.loc[1:10000]
plt.figure()
plt.scatter(df2['Victim Age'].values, df2['Perpetrator Age'].values)
