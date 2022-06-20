#!/usr/bin/env python3

import xarray as xr
import matplotlib.pyplot as plt

ds = xr.open_dataset('amm7_5d_20050101_20050130_ptrc_T.nc')

dat = ds['total_chlorophyll_calculator_result'].isel(deptht=0,time_counter=-1)
dat.where(dat>0).plot(x='nav_lon',y='nav_lat',ylim=[40,65],vmax=0.6,figsize=(12,12))
plt.title('Surface Chlorophyll - 30th Jan')
plt.savefig('chlorophyll.eps',format='eps')
