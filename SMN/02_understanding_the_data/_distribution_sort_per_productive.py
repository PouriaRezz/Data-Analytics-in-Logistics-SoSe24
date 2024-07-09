#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  2 09:49:03 2024

@author: johannesfricke
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.stats as stats


data = pd.read_csv("proportion_sorting_per_productive_steps_per_lot.csv", delimiter=',', header=None)
dataNP = np.array(data[1])


dataNP = dataNP[~np.isnan(dataNP)]


mean = np.mean(dataNP)
std_dev = np.std(dataNP)

data[2] = (data[1]-mean)**2
data_sorted = data.sort_values(by=[1], ascending=False)

x_values = np.linspace(mean - 3*std_dev, mean + 3*std_dev, 1000)


y_values = (1 / (std_dev * np.sqrt(2 * np.pi))) * np.exp(-0.5 * ((x_values - mean) / std_dev) ** 2)


plt.figure()
plt.hist(dataNP, bins=50, density=True, alpha=0.6, color='b', label='Data Histogram')

plt.plot(x_values, y_values, 'r', label='Gaussian Distribution')

plt.title('Distribution of sorting steps per productive step')
plt.xlabel('Steps')
plt.ylabel('Probability Density')
plt.legend()
plt.tight_layout()
plt.savefig("distribution_sort_per_productive.png", dpi=200)


npList = np.array(data_sorted.iloc[:975, 0], dtype=str)
npList = np.insert(npList, 0, "LOT", axis=0)
np.savetxt("Highest_sort_per_productive.csv", npList, fmt='%s')

# Sortierschritte pro Produktivschritt -> höchster Wert ist schlecht
# NDICA, IVLZS in Ordnung


# BHHXM = pd.read_csv("steps_BHHXM.csv", delimiter='|', header=None)
# GXCYV = pd.read_csv("steps_GXCYV.csv", delimiter='|', header=None)
# JFDHS = pd.read_csv("steps_JFDHS.csv", delimiter='|', header=None)
# OMCJX = pd.read_csv("steps_OMCJX.csv", delimiter='|', header=None)


