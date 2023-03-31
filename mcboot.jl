using StatsBase
include("bootp.jl")

function dostuff(nmc,nboot,nsamp)
sb = Array(Float64,nmc)
xbs = Array(Float64,nsamp)
p = (1.0/nsamp)*ones(nsamp)
pp = cumsum(p)
xm = zeros(nboot)
# trand = zeros(nsamp)
trand = Array(Int64,nsamp)
tic()
for i in 1:nmc
	 xvals = randn(nsamp)
	 # xm = boot_mean(xvals,nboot)
	 for j in 1:nboot
		   #xbs = resample(xvals,nsamp)
		   # resamplep(xvals,xbs,nsamp,pp,trand)
		   resample(xvals,xbs,nsamp,trand)
		   xm[j] = mean(xbs)
		#   xbs = sample(xvals,wv,nsamp)
		#  theIndex=rand(1:nsamp,nsamp)
		## xbs = xvals[theIndex]
		# xm[j] = mean(xvals[theIndex])
		# xm[j] = bootMean(xvals,nsamp)
	 end
	sb[i] = std(xm)
end
toc()
end

nmc = 1000
nboot = 1000
nsamp = 100
dostuff(nmc,nboot,nsamp)
