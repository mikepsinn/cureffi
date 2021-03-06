setwd('~/d/sci/074gen228/jclub')
set.seed(1)
k_all = '#AAAAAA'
k_gwas = '#000000'
k_fine = '#CC5700'
n_total = 50
all_variation = runif(n=n_total,min=1,max=100)
logp = 10-abs(50-all_variation)/5 + rexp(n=n_total,rate=.7)
randomization = runif(n=n_total,min=0,max=1)
gwas_typed = rep(c(rep(FALSE,9),TRUE),10)
fine_mapping_typed = randomization>.50 & !gwas_typed
# first, the full plot
pdf('full.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
points(all_variation[gwas_typed],rep(-1,sum(gwas_typed)),pch='|',col=k_gwas)
points(all_variation[fine_mapping_typed],rep(-1,sum(fine_mapping_typed)),pch='|',col=k_fine)
points(all_variation[gwas_typed],logp[gwas_typed],pch=20,col=k_gwas)
points(all_variation[fine_mapping_typed],logp[fine_mapping_typed],pch=20,col=k_fine)
legend('topleft',c('All variants','On GWAS chip','Fine-mapped'),col=c(k_all,k_gwas,k_fine),text.col=c(k_all,k_gwas,k_fine),pch='|')
dev.off()
# your goal - search the possible variants here for association
pdf('1.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
dev.off()
# your approach - genotype some variants in a GWAS
pdf('2.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
points(all_variation[gwas_typed],rep(-1,sum(gwas_typed)),pch='|',col=k_gwas)
dev.off()
# your results - some hits in a GWAS
pdf('3.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
points(all_variation[gwas_typed],rep(-1,sum(gwas_typed)),pch='|',col=k_gwas)
points(all_variation[gwas_typed],logp[gwas_typed],pch=20,col=k_gwas)
dev.off()
# your next approach - fine-map the region
pdf('4.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
points(all_variation[gwas_typed],rep(-1,sum(gwas_typed)),pch='|',col=k_gwas)
points(all_variation[gwas_typed],logp[gwas_typed],pch=20,col=k_gwas)
points(all_variation[fine_mapping_typed],rep(-1,sum(fine_mapping_typed)),pch='|',col=k_fine)
dev.off()
# your results with fine-mapping
pdf('5.pdf',height=4,width=6)
par(mar=c(2,4,2,1))
plot(NA,NA,xlim=c(1,100),ylim=c(-1,12),xlab='',ylab='-log10(p)',axes=FALSE)
mtext(side=1,line=1,text='genomic position')
abline(h=0,col='black',lwd=.5)
abline(h=-log10(5e-8),col='blue',lwd=.5)
axis(side=2,at=0:12,labels=0:12,las=1,lwd=0,lwd.ticks=1)
points(all_variation,rep(-1,n_total),pch='|',col=k_all)
points(all_variation[gwas_typed],rep(-1,sum(gwas_typed)),pch='|',col=k_gwas)
points(all_variation[gwas_typed],logp[gwas_typed],pch=20,col=k_gwas)
points(all_variation[fine_mapping_typed],rep(-1,sum(fine_mapping_typed)),pch='|',col=k_fine)
points(all_variation[fine_mapping_typed],logp[fine_mapping_typed],pch=20,col=k_fine)
dev.off()