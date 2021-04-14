#!/bin/bash -l
        
#SBATCH --mail-user=rapeek@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -J splitNovo
#SBATCH -e splitNovo.%j.err
#SBATCH -o splitNovo.%j.out
#SBATCH -c 20
#SBATCH -p high
#SBATCH --time=1-20:00:00

#set -e # exits upon failing command
#set -v # verbose -- all lines
#set -x # trace of all commands after expansion before execution
									        
seq1=$1
seq2=$2
somm=$3

	       grep --no-group-separator -A 3 ":CCGTTT" ${seq1} > ../fastq/${somm}_CCGTTT_R1.fastq
	       grep --no-group-separator -A 3 ":CCGTTT" ${seq2} > ../fastq/${somm}_CCGTTT_R2.fastq

	       grep --no-group-separator -A 3 ":AACGTT" ${seq1} > ../fastq/${somm}_AACGTT_R1.fastq
	       grep --no-group-separator -A 3 ":AACGTT" ${seq2} > ../fastq/${somm}_AACGTT_R2.fastq

	       grep --no-group-separator -A 3 ":TCAGTT" ${seq1} > ../fastq/${somm}_TCAGTT_R1.fastq
	       grep --no-group-separator -A 3 ":TCAGTT" ${seq2} > ../fastq/${somm}_TCAGTT_R2.fastq

	       grep --no-group-separator -A 3 ":CGTCTT" ${seq1} > ../fastq/${somm}_CGTCTT_R1.fastq
	       grep --no-group-separator -A 3 ":CGTCTT" ${seq2} > ../fastq/${somm}_CGTCTT_R2.fastq

	       grep --no-group-separator -A 3 ":TAGCTT" ${seq1} > ../fastq/${somm}_TAGCTT_R1.fastq
	       grep --no-group-separator -A 3 ":TAGCTT" ${seq2} > ../fastq/${somm}_TAGCTT_R2.fastq

	       grep --no-group-separator -A 3 ":GATATT" ${seq1} > ../fastq/${somm}_GATATT_R1.fastq
	       grep --no-group-separator -A 3 ":GATATT" ${seq2} > ../fastq/${somm}_GATATT_R2.fastq

	       grep --no-group-separator -A 3 ":CTCATT" ${seq1} > ../fastq/${somm}_CTCATT_R1.fastq
	       grep --no-group-separator -A 3 ":CTCATT" ${seq2} > ../fastq/${somm}_CTCATT_R2.fastq

	       grep --no-group-separator -A 3 ":TCTTGT" ${seq1} > ../fastq/${somm}_TCTTGT_R1.fastq
	       grep --no-group-separator -A 3 ":TCTTGT" ${seq2} > ../fastq/${somm}_TCTTGT_R2.fastq

	       grep --no-group-separator -A 3 ":CGCTGT" ${seq1} > ../fastq/${somm}_CGCTGT_R1.fastq
	       grep --no-group-separator -A 3 ":CGCTGT" ${seq2} > ../fastq/${somm}_CGCTGT_R2.fastq

	       grep --no-group-separator -A 3 ":GTATGT" ${seq1} > ../fastq/${somm}_GTATGT_R1.fastq
	       grep --no-group-separator -A 3 ":GTATGT" ${seq2} > ../fastq/${somm}_GTATGT_R2.fastq

	       grep --no-group-separator -A 3 ":CATGGT" ${seq1} > ../fastq/${somm}_CATGGT_R1.fastq
	       grep --no-group-separator -A 3 ":CATGGT" ${seq2} > ../fastq/${somm}_CATGGT_R2.fastq

	       grep --no-group-separator -A 3 ":GGGGGT" ${seq1} > ../fastq/${somm}_GGGGGT_R1.fastq
	       grep --no-group-separator -A 3 ":GGGGGT" ${seq2} > ../fastq/${somm}_GGGGGT_R2.fastq

	       grep --no-group-separator -A 3 ":AAGAGT" ${seq1} > ../fastq/${somm}_AAGAGT_R1.fastq
	       grep --no-group-separator -A 3 ":AAGAGT" ${seq2} > ../fastq/${somm}_AAGAGT_R2.fastq

	       grep --no-group-separator -A 3 ":GCCAGT" ${seq1} > ../fastq/${somm}_GCCAGT_R1.fastq
	       grep --no-group-separator -A 3 ":GCCAGT" ${seq2} > ../fastq/${somm}_GCCAGT_R2.fastq

	       grep --no-group-separator -A 3 ":ATGGCT" ${seq1} > ../fastq/${somm}_ATGGCT_R1.fastq
	       grep --no-group-separator -A 3 ":ATGGCT" ${seq2} > ../fastq/${somm}_ATGGCT_R2.fastq

	       grep --no-group-separator -A 3 ":TGCGCT" ${seq1} > ../fastq/${somm}_TGCGCT_R1.fastq
	       grep --no-group-separator -A 3 ":TGCGCT" ${seq2} > ../fastq/${somm}_TGCGCT_R2.fastq

	       grep --no-group-separator -A 3 ":GACCCT" ${seq1} > ../fastq/${somm}_GACCCT_R1.fastq
	       grep --no-group-separator -A 3 ":GACCCT" ${seq2} > ../fastq/${somm}_GACCCT_R2.fastq

	       grep --no-group-separator -A 3 ":ACACCT" ${seq1} > ../fastq/${somm}_ACACCT_R1.fastq
	       grep --no-group-separator -A 3 ":ACACCT" ${seq2} > ../fastq/${somm}_ACACCT_R2.fastq

	       grep --no-group-separator -A 3 ":CCTACT" ${seq1} > ../fastq/${somm}_CCTACT_R1.fastq
	       grep --no-group-separator -A 3 ":CCTACT" ${seq2} > ../fastq/${somm}_CCTACT_R2.fastq

	       grep --no-group-separator -A 3 ":TTAACT" ${seq1} > ../fastq/${somm}_TTAACT_R1.fastq
	       grep --no-group-separator -A 3 ":TTAACT" ${seq2} > ../fastq/${somm}_TTAACT_R2.fastq

	       grep --no-group-separator -A 3 ":TACTAT" ${seq1} > ../fastq/${somm}_TACTAT_R1.fastq
	       grep --no-group-separator -A 3 ":TACTAT" ${seq2} > ../fastq/${somm}_TACTAT_R2.fastq

	       grep --no-group-separator -A 3 ":TTTGAT" ${seq1} > ../fastq/${somm}_TTTGAT_R1.fastq
	       grep --no-group-separator -A 3 ":TTTGAT" ${seq2} > ../fastq/${somm}_TTTGAT_R2.fastq

	       grep --no-group-separator -A 3 ":GTGCAT" ${seq1} > ../fastq/${somm}_GTGCAT_R1.fastq
	       grep --no-group-separator -A 3 ":GTGCAT" ${seq2} > ../fastq/${somm}_GTGCAT_R2.fastq

	       grep --no-group-separator -A 3 ":CAACAT" ${seq1} > ../fastq/${somm}_CAACAT_R1.fastq
	       grep --no-group-separator -A 3 ":CAACAT" ${seq2} > ../fastq/${somm}_CAACAT_R2.fastq

	       grep --no-group-separator -A 3 ":CGGAAT" ${seq1} > ../fastq/${somm}_CGGAAT_R1.fastq
	       grep --no-group-separator -A 3 ":CGGAAT" ${seq2} > ../fastq/${somm}_CGGAAT_R2.fastq

	       grep --no-group-separator -A 3 ":TTTTTG" ${seq1} > ../fastq/${somm}_TTTTTG_R1.fastq
	       grep --no-group-separator -A 3 ":TTTTTG" ${seq2} > ../fastq/${somm}_TTTTTG_R2.fastq

	       grep --no-group-separator -A 3 ":CGATTG" ${seq1} > ../fastq/${somm}_CGATTG_R1.fastq
	       grep --no-group-separator -A 3 ":CGATTG" ${seq2} > ../fastq/${somm}_CGATTG_R2.fastq

	       grep --no-group-separator -A 3 ":GAGGTG" ${seq1} > ../fastq/${somm}_GAGGTG_R1.fastq
	       grep --no-group-separator -A 3 ":GAGGTG" ${seq2} > ../fastq/${somm}_GAGGTG_R2.fastq

	       grep --no-group-separator -A 3 ":TGCCTG" ${seq1} > ../fastq/${somm}_TGCCTG_R1.fastq
	       grep --no-group-separator -A 3 ":TGCCTG" ${seq2} > ../fastq/${somm}_TGCCTG_R2.fastq

	       grep --no-group-separator -A 3 ":AGTATG" ${seq1} > ../fastq/${somm}_AGTATG_R1.fastq
	       grep --no-group-separator -A 3 ":AGTATG" ${seq2} > ../fastq/${somm}_AGTATG_R2.fastq

	       grep --no-group-separator -A 3 ":AAATGG" ${seq1} > ../fastq/${somm}_AAATGG_R1.fastq
	       grep --no-group-separator -A 3 ":AAATGG" ${seq2} > ../fastq/${somm}_AAATGG_R2.fastq

	       grep --no-group-separator -A 3 ":ACCGGG" ${seq1} > ../fastq/${somm}_ACCGGG_R1.fastq
	       grep --no-group-separator -A 3 ":ACCGGG" ${seq2} > ../fastq/${somm}_ACCGGG_R2.fastq

	       grep --no-group-separator -A 3 ":TTAGGG" ${seq1} > ../fastq/${somm}_TTAGGG_R1.fastq
	       grep --no-group-separator -A 3 ":TTAGGG" ${seq2} > ../fastq/${somm}_TTAGGG_R2.fastq

	       grep --no-group-separator -A 3 ":CCTCGG" ${seq1} > ../fastq/${somm}_CCTCGG_R1.fastq
	       grep --no-group-separator -A 3 ":CCTCGG" ${seq2} > ../fastq/${somm}_CCTCGG_R2.fastq

	       grep --no-group-separator -A 3 ":ATGCGG" ${seq1} > ../fastq/${somm}_ATGCGG_R1.fastq
	       grep --no-group-separator -A 3 ":ATGCGG" ${seq2} > ../fastq/${somm}_ATGCGG_R2.fastq

	       grep --no-group-separator -A 3 ":GTTAGG" ${seq1} > ../fastq/${somm}_GTTAGG_R1.fastq
	       grep --no-group-separator -A 3 ":GTTAGG" ${seq2} > ../fastq/${somm}_GTTAGG_R2.fastq

	       grep --no-group-separator -A 3 ":GCCTCG" ${seq1} > ../fastq/${somm}_GCCTCG_R1.fastq
	       grep --no-group-separator -A 3 ":GCCTCG" ${seq2} > ../fastq/${somm}_GCCTCG_R2.fastq

	       grep --no-group-separator -A 3 ":TCTGCG" ${seq1} > ../fastq/${somm}_TCTGCG_R1.fastq
	       grep --no-group-separator -A 3 ":TCTGCG" ${seq2} > ../fastq/${somm}_TCTGCG_R2.fastq

	       grep --no-group-separator -A 3 ":CACGCG" ${seq1} > ../fastq/${somm}_CACGCG_R1.fastq
	       grep --no-group-separator -A 3 ":CACGCG" ${seq2} > ../fastq/${somm}_CACGCG_R2.fastq

	       grep --no-group-separator -A 3 ":GGACCG" ${seq1} > ../fastq/${somm}_GGACCG_R1.fastq
	       grep --no-group-separator -A 3 ":GGACCG" ${seq2} > ../fastq/${somm}_GGACCG_R2.fastq

	       grep --no-group-separator -A 3 ":TAGACG" ${seq1} > ../fastq/${somm}_TAGACG_R1.fastq
	       grep --no-group-separator -A 3 ":TAGACG" ${seq2} > ../fastq/${somm}_TAGACG_R2.fastq

	       grep --no-group-separator -A 3 ":ATCACG" ${seq1} > ../fastq/${somm}_ATCACG_R1.fastq
	       grep --no-group-separator -A 3 ":ATCACG" ${seq2} > ../fastq/${somm}_ATCACG_R2.fastq

	       grep --no-group-separator -A 3 ":CTGTAG" ${seq1} > ../fastq/${somm}_CTGTAG_R1.fastq
	       grep --no-group-separator -A 3 ":CTGTAG" ${seq2} > ../fastq/${somm}_CTGTAG_R2.fastq

	       grep --no-group-separator -A 3 ":GGCGAG" ${seq1} > ../fastq/${somm}_GGCGAG_R1.fastq
	       grep --no-group-separator -A 3 ":GGCGAG" ${seq2} > ../fastq/${somm}_GGCGAG_R2.fastq

	       grep --no-group-separator -A 3 ":TCGCAG" ${seq1} > ../fastq/${somm}_TCGCAG_R1.fastq
	       grep --no-group-separator -A 3 ":TCGCAG" ${seq2} > ../fastq/${somm}_TCGCAG_R2.fastq

	       grep --no-group-separator -A 3 ":AACCAG" ${seq1} > ../fastq/${somm}_AACCAG_R1.fastq
	       grep --no-group-separator -A 3 ":AACCAG" ${seq2} > ../fastq/${somm}_AACCAG_R2.fastq

	       grep --no-group-separator -A 3 ":CATAAG" ${seq1} > ../fastq/${somm}_CATAAG_R1.fastq
	       grep --no-group-separator -A 3 ":CATAAG" ${seq2} > ../fastq/${somm}_CATAAG_R2.fastq

	       grep --no-group-separator -A 3 ":GCAAAG" ${seq1} > ../fastq/${somm}_GCAAAG_R1.fastq
	       grep --no-group-separator -A 3 ":GCAAAG" ${seq2} > ../fastq/${somm}_GCAAAG_R2.fastq

	       grep --no-group-separator -A 3 ":CATTTC" ${seq1} > ../fastq/${somm}_CATTTC_R1.fastq
	       grep --no-group-separator -A 3 ":CATTTC" ${seq2} > ../fastq/${somm}_CATTTC_R2.fastq

	       grep --no-group-separator -A 3 ":TGGTTC" ${seq1} > ../fastq/${somm}_TGGTTC_R1.fastq
	       grep --no-group-separator -A 3 ":TGGTTC" ${seq2} > ../fastq/${somm}_TGGTTC_R2.fastq

	       grep --no-group-separator -A 3 ":GTCGTC" ${seq1} > ../fastq/${somm}_GTCGTC_R1.fastq
	       grep --no-group-separator -A 3 ":GTCGTC" ${seq2} > ../fastq/${somm}_GTCGTC_R2.fastq

	       grep --no-group-separator -A 3 ":AGAGTC" ${seq1} > ../fastq/${somm}_AGAGTC_R1.fastq
	       grep --no-group-separator -A 3 ":AGAGTC" ${seq2} > ../fastq/${somm}_AGAGTC_R2.fastq

	       grep --no-group-separator -A 3 ":TCTCTC" ${seq1} > ../fastq/${somm}_TCTCTC_R1.fastq
	       grep --no-group-separator -A 3 ":TCTCTC" ${seq2} > ../fastq/${somm}_TCTCTC_R2.fastq

	       grep --no-group-separator -A 3 ":ACGATC" ${seq1} > ../fastq/${somm}_ACGATC_R1.fastq
	       grep --no-group-separator -A 3 ":ACGATC" ${seq2} > ../fastq/${somm}_ACGATC_R2.fastq

	       grep --no-group-separator -A 3 ":ATCTGC" ${seq1} > ../fastq/${somm}_ATCTGC_R1.fastq
	       grep --no-group-separator -A 3 ":ATCTGC" ${seq2} > ../fastq/${somm}_ATCTGC_R2.fastq

	       grep --no-group-separator -A 3 ":CCATGC" ${seq1} > ../fastq/${somm}_CCATGC_R1.fastq
	       grep --no-group-separator -A 3 ":CCATGC" ${seq2} > ../fastq/${somm}_CCATGC_R2.fastq

	       grep --no-group-separator -A 3 ":TACGGC" ${seq1} > ../fastq/${somm}_TACGGC_R1.fastq
	       grep --no-group-separator -A 3 ":TACGGC" ${seq2} > ../fastq/${somm}_TACGGC_R2.fastq

	       grep --no-group-separator -A 3 ":GGTCGC" ${seq1} > ../fastq/${somm}_GGTCGC_R1.fastq
	       grep --no-group-separator -A 3 ":GGTCGC" ${seq2} > ../fastq/${somm}_GGTCGC_R2.fastq

	       grep --no-group-separator -A 3 ":CAGCGC" ${seq1} > ../fastq/${somm}_CAGCGC_R1.fastq
	       grep --no-group-separator -A 3 ":CAGCGC" ${seq2} > ../fastq/${somm}_CAGCGC_R2.fastq

	       grep --no-group-separator -A 3 ":TTGAGC" ${seq1} > ../fastq/${somm}_TTGAGC_R1.fastq
	       grep --no-group-separator -A 3 ":TTGAGC" ${seq2} > ../fastq/${somm}_TTGAGC_R2.fastq

	       grep --no-group-separator -A 3 ":AAGTCC" ${seq1} > ../fastq/${somm}_AAGTCC_R1.fastq
	       grep --no-group-separator -A 3 ":AAGTCC" ${seq2} > ../fastq/${somm}_AAGTCC_R2.fastq

	       grep --no-group-separator -A 3 ":CTTGCC" ${seq1} > ../fastq/${somm}_CTTGCC_R1.fastq
	       grep --no-group-separator -A 3 ":CTTGCC" ${seq2} > ../fastq/${somm}_CTTGCC_R2.fastq

	       grep --no-group-separator -A 3 ":GCGCCC" ${seq1} > ../fastq/${somm}_GCGCCC_R1.fastq
	       grep --no-group-separator -A 3 ":GCGCCC" ${seq2} > ../fastq/${somm}_GCGCCC_R2.fastq

	       grep --no-group-separator -A 3 ":CGCCCC" ${seq1} > ../fastq/${somm}_CGCCCC_R1.fastq
	       grep --no-group-separator -A 3 ":CGCCCC" ${seq2} > ../fastq/${somm}_CGCCCC_R2.fastq

	       grep --no-group-separator -A 3 ":TGTACC" ${seq1} > ../fastq/${somm}_TGTACC_R1.fastq
	       grep --no-group-separator -A 3 ":TGTACC" ${seq2} > ../fastq/${somm}_TGTACC_R2.fastq

	       grep --no-group-separator -A 3 ":CAAACC" ${seq1} > ../fastq/${somm}_CAAACC_R1.fastq
	       grep --no-group-separator -A 3 ":CAAACC" ${seq2} > ../fastq/${somm}_CAAACC_R2.fastq

	       grep --no-group-separator -A 3 ":ACTTAC" ${seq1} > ../fastq/${somm}_ACTTAC_R1.fastq
	       grep --no-group-separator -A 3 ":ACTTAC" ${seq2} > ../fastq/${somm}_ACTTAC_R2.fastq

	       grep --no-group-separator -A 3 ":GGATAC" ${seq1} > ../fastq/${somm}_GGATAC_R1.fastq
	       grep --no-group-separator -A 3 ":GGATAC" ${seq2} > ../fastq/${somm}_GGATAC_R2.fastq

	       grep --no-group-separator -A 3 ":GATGAC" ${seq1} > ../fastq/${somm}_GATGAC_R1.fastq
	       grep --no-group-separator -A 3 ":GATGAC" ${seq2} > ../fastq/${somm}_GATGAC_R2.fastq

	       grep --no-group-separator -A 3 ":AGGCAC" ${seq1} > ../fastq/${somm}_AGGCAC_R1.fastq
	       grep --no-group-separator -A 3 ":AGGCAC" ${seq2} > ../fastq/${somm}_AGGCAC_R2.fastq

	       grep --no-group-separator -A 3 ":TTACAC" ${seq1} > ../fastq/${somm}_TTACAC_R1.fastq
	       grep --no-group-separator -A 3 ":TTACAC" ${seq2} > ../fastq/${somm}_TTACAC_R2.fastq

	       grep --no-group-separator -A 3 ":TCCAAC" ${seq1} > ../fastq/${somm}_TCCAAC_R1.fastq
	       grep --no-group-separator -A 3 ":TCCAAC" ${seq2} > ../fastq/${somm}_TCCAAC_R2.fastq

	       grep --no-group-separator -A 3 ":AGCTTA" ${seq1} > ../fastq/${somm}_AGCTTA_R1.fastq
	       grep --no-group-separator -A 3 ":AGCTTA" ${seq2} > ../fastq/${somm}_AGCTTA_R2.fastq

	       grep --no-group-separator -A 3 ":GAATTA" ${seq1} > ../fastq/${somm}_GAATTA_R1.fastq
	       grep --no-group-separator -A 3 ":GAATTA" ${seq2} > ../fastq/${somm}_GAATTA_R2.fastq

	       grep --no-group-separator -A 3 ":TGTGTA" ${seq1} > ../fastq/${somm}_TGTGTA_R1.fastq
	       grep --no-group-separator -A 3 ":TGTGTA" ${seq2} > ../fastq/${somm}_TGTGTA_R2.fastq

	       grep --no-group-separator -A 3 ":CCCGTA" ${seq1} > ../fastq/${somm}_CCCGTA_R1.fastq
	       grep --no-group-separator -A 3 ":CCCGTA" ${seq2} > ../fastq/${somm}_CCCGTA_R2.fastq

	       grep --no-group-separator -A 3 ":ATACTA" ${seq1} > ../fastq/${somm}_ATACTA_R1.fastq
	       grep --no-group-separator -A 3 ":ATACTA" ${seq2} > ../fastq/${somm}_ATACTA_R2.fastq

	       grep --no-group-separator -A 3 ":GTGATA" ${seq1} > ../fastq/${somm}_GTGATA_R1.fastq
	       grep --no-group-separator -A 3 ":GTGATA" ${seq2} > ../fastq/${somm}_GTGATA_R2.fastq

	       grep --no-group-separator -A 3 ":CTTTGA" ${seq1} > ../fastq/${somm}_CTTTGA_R1.fastq
	       grep --no-group-separator -A 3 ":CTTTGA" ${seq2} > ../fastq/${somm}_CTTTGA_R2.fastq

	       grep --no-group-separator -A 3 ":GCAGGA" ${seq1} > ../fastq/${somm}_GCAGGA_R1.fastq
	       grep --no-group-separator -A 3 ":GCAGGA" ${seq2} > ../fastq/${somm}_GCAGGA_R2.fastq

	       grep --no-group-separator -A 3 ":AATCGA" ${seq1} > ../fastq/${somm}_AATCGA_R1.fastq
	       grep --no-group-separator -A 3 ":AATCGA" ${seq2} > ../fastq/${somm}_AATCGA_R2.fastq

	       grep --no-group-separator -A 3 ":TGGCGA" ${seq1} > ../fastq/${somm}_TGGCGA_R1.fastq
	       grep --no-group-separator -A 3 ":TGGCGA" ${seq2} > ../fastq/${somm}_TGGCGA_R2.fastq

	       grep --no-group-separator -A 3 ":GTCCGA" ${seq1} > ../fastq/${somm}_GTCCGA_R1.fastq
	       grep --no-group-separator -A 3 ":GTCCGA" ${seq2} > ../fastq/${somm}_GTCCGA_R2.fastq

	       grep --no-group-separator -A 3 ":CCGAGA" ${seq1} > ../fastq/${somm}_CCGAGA_R1.fastq
	       grep --no-group-separator -A 3 ":CCGAGA" ${seq2} > ../fastq/${somm}_CCGAGA_R2.fastq

	       grep --no-group-separator -A 3 ":AGAAGA" ${seq1} > ../fastq/${somm}_AGAAGA_R1.fastq
	       grep --no-group-separator -A 3 ":AGAAGA" ${seq2} > ../fastq/${somm}_AGAAGA_R2.fastq

	       grep --no-group-separator -A 3 ":GGTTCA" ${seq1} > ../fastq/${somm}_GGTTCA_R1.fastq
	       grep --no-group-separator -A 3 ":GGTTCA" ${seq2} > ../fastq/${somm}_GGTTCA_R2.fastq

	       grep --no-group-separator -A 3 ":TTGTCA" ${seq1} > ../fastq/${somm}_TTGTCA_R1.fastq
	       grep --no-group-separator -A 3 ":TTGTCA" ${seq2} > ../fastq/${somm}_TTGTCA_R2.fastq

	       grep --no-group-separator -A 3 ":CGGGCA" ${seq1} > ../fastq/${somm}_CGGGCA_R1.fastq
	       grep --no-group-separator -A 3 ":CGGGCA" ${seq2} > ../fastq/${somm}_CGGGCA_R2.fastq

	       grep --no-group-separator -A 3 ":TAAGCA" ${seq1} > ../fastq/${somm}_TAAGCA_R1.fastq
	       grep --no-group-separator -A 3 ":TAAGCA" ${seq2} > ../fastq/${somm}_TAAGCA_R2.fastq

	       grep --no-group-separator -A 3 ":TCCCCA" ${seq1} > ../fastq/${somm}_TCCCCA_R1.fastq
	       grep --no-group-separator -A 3 ":TCCCCA" ${seq2} > ../fastq/${somm}_TCCCCA_R2.fastq

	       grep --no-group-separator -A 3 ":TCATAA" ${seq1} > ../fastq/${somm}_TCATAA_R1.fastq
	       grep --no-group-separator -A 3 ":TCATAA" ${seq2} > ../fastq/${somm}_TCATAA_R2.fastq

	       grep --no-group-separator -A 3 ":ACGGAA" ${seq1} > ../fastq/${somm}_ACGGAA_R1.fastq
	       grep --no-group-separator -A 3 ":ACGGAA" ${seq2} > ../fastq/${somm}_ACGGAA_R2.fastq

	       grep --no-group-separator -A 3 ":CTAGAA" ${seq1} > ../fastq/${somm}_CTAGAA_R1.fastq
	       grep --no-group-separator -A 3 ":CTAGAA" ${seq2} > ../fastq/${somm}_CTAGAA_R2.fastq

	       grep --no-group-separator -A 3 ":GCTCAA" ${seq1} > ../fastq/${somm}_GCTCAA_R1.fastq
	       grep --no-group-separator -A 3 ":GCTCAA" ${seq2} > ../fastq/${somm}_GCTCAA_R2.fastq

	       grep --no-group-separator -A 3 ":ATTAAA" ${seq1} > ../fastq/${somm}_ATTAAA_R1.fastq
	       grep --no-group-separator -A 3 ":ATTAAA" ${seq2} > ../fastq/${somm}_ATTAAA_R2.fastq

	       grep --no-group-separator -A 3 ":GACAAA" ${seq1} > ../fastq/${somm}_GACAAA_R1.fastq
	       grep --no-group-separator -A 3 ":GACAAA" ${seq2} > ../fastq/${somm}_GACAAA_R2.fastq
