# ![](Figures/FANTASIA_logo.png) FANTASIA: Functional ANnoTAtion based on embedding space SImilArity

[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](http://www.gnu.org/licenses/gpl.html)

FANTASIA (Functional ANnoTAtion based on embedding space SImilArity) is a pipeline for annotating GO terms in protein sequence files using GOPredSim ([to know more](https://github.com/Rostlab/goPredSim)) with the protein language model ProtT5. FANTASIA takes as input a proteome file (either the longest isoform or the full set of isoforms for all genes), removes identical sequences using CD-HIT (ref) and sequences longer than 5000 amino acids (due to a length constraint in the model), and executes GOPredSim-ProtT5 for all sequences. Then, it converts the standard GOPredSim output file to the input file format for topGO (ref) to facilitate its application in a wider biological workflow.

This pipeline results from joined efforts with equal contribution between Ana Roja's lab (Andalusian Center for Developmental Biology, CSIC) and Rosa Fernández's lab (Metazoa Phylogenomics Lab, Institute of Evolutionary Biology, CSIC-UPF) and shows that synergistic collaboration between labs with different expertise can result in great outcomes. We thank LifeHUB-CSIC for being the catalyst of this project and for impulsing us to 'think big'.

<img src="Figures/FANTASIA_pipeline.png" />

## Cite FANTASIA
Martínez-Redondo, G. I., Barrios, I., Vázquez-Valls, M., Rojas, A. M., & Fernández, R. (2024). Illuminating the functional landscape of the dark proteome across the Animal Tree of Life. [https://doi.org/10.1101/2024.02.28.582465](https://doi.org/10.1101/2024.02.28.582465)."

For our work about the performance of the different methods in model organisms check: Barrios-Núñez, I., Martínez-Redondo, G. I., Medina-Burgos, P., Cases, I., Fernández, R. & Rojas, A.M. (2024). Decoding functional proteome information in model organisms using protein language models, *NAR Genomics and Bioinformatics* (6), 3, lqae078, [https://doi.org/10.1093/nargab/lqae078](https://doi.org/10.1093/nargab/lqae078)


**Contact information**: Gemma I. Martínez-Redondo ([gemma.martinez@ibe.upf-csic.es](mailto:gemma.martinez@ibe.upf-csic.es)), Ana M. Rojas ([a.rojas.m@csic.es](mailto:a.rojas.m@csic.es)), Rosa Fernández ([rosa.fernandez@ibe.upf-csic.es](mailto:rosa.fernandez@ibe.upf-csic.es)).

## Before using FANTASIA
To reduce the environmental impact of this pipeline, check if your species of interest has already been functionally annotated using FANTASIA and use that file instead of running it from scratch. A collection of 970 animals and some closely-related outgroups are already calculated and can be found in [MATEdb2](https://github.com/MetazoaPhylogenomicsLab/MATEdb2). 

## How to use FANTASIA
### <b>Latest FANTASIA implementation</b>

  The current GitHub repository contains the FANTASIA (v1) implementation which can generate dependency conflicts in some computers. For this reason, we have developed a new more stable version that can be found here: [https://github.com/CBBIO/FANTASIA](https://github.com/CBBIO/FANTASIA). Both versions differ in their implementation, performance, and reference dataset. Check the paper () for the complete list of differences.

### <b>FANTASIA (v1) implementation in singularity image (default CPUs)</b>

  Download the singularity image from [here](https://cloud.sylabs.io/library/gemma.martinezredondo/fantasia/fantasia) by executing:

  ```
  singularity pull --arch amd64 library://gemma.martinezredondo/fantasia/fantasia:sha256.299ed9bb0947d19d58068f1ecef0128b147bbce73f762570b8ba44141d7b5fe6
  ```
  The definition file used to create the image is also available on this GitHub repository (```FANTASIA.def```). The files and scripts needed are the same as those required for local installation (download link below).

  Once downloaded, you can execute it as follows (make sure that you have [singularity](https://docs.sylabs.io/guides/3.0/user-guide/installation.html) installed!):
  </br>
  
  ```
  Syntax: ./fantasia --infile protein.fasta [--outpath output_path] [--allisoforms gene_isoform_conversion.txt]
  options:
  -i/--infile           Input protein fasta file.
  -h/--help             Print this Help.
  -o/--outpath          (Optional) Output directory. If not provided, input file directory will be used.
  -a/--allisoforms      (Optional) Tab-separated conversion file specifying the correspondance between gene and isoform IDs for obtaining a per-gene annotation using all isoforms.
  -p/--prefix           (Optional) Prefix to add to output folders and files (e.g. the species code). If not provided, input file name will be used.
  -g/--gpu              (Optional) Use GPUs instead of CPUs. If not provided, CPUs are used by default.
  ```
  
  At a given point, FANTASIA may raise a warning if your system only has CPUs or the GPU CUDA library version is different than 11.0. You can safely ignore this message as the singularity container for the default CPU mode.
