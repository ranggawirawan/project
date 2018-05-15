# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 22:54:21 2018

@author: rangga
"""

import pandas as pd
import numpy as np

perf=pd.read_csv("d:/performance.csv")
perf.head()

# Untuk membuat label grade
grades = []


for row in perf['Performance']:
    if row>=95 and row <=100:
        grades.append('A')
    elif row>=85 and row<95:
        grades.append('A-')
    elif row>=70 and row<85:
        grades.append('B')
    elif row>=50 and row<70:
        grades.append('B-')
    elif row>=25 and row<50:
        grades.append('C')
    elif row<25:
        grades.append('D')
    # jika tidak
    else:
        grades.append('Failed')
        
# Buat Kolom Grade dalam List
perf['grades'] = grades

#perf.to_csv('d:/performance_grading.csv')