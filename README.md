# ![](Figures/FANTASIA_logo.png) FANTASIA: Functional ANnoTAtion based on embedding space SImilArity

[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](http://www.gnu.org/licenses/gpl.html)

FANTASIA (Functional ANnoTAtion based on embedding space SImilArity) is a pipeline for annotating GO terms in protein sequence files using GOPredSim ([to know more](https://github.com/Rostlab/goPredSim)) with the protein language model ProtT5. FANTASIA takes as input a proteome file (either the longest isoform or the full set of isoforms for all genes), removes identical sequences using CD-HIT (ref) and sequences longer than 5000 amino acids (due to a length constraint in the model), and executes GOPredSim-ProtT5 for all sequences. Then, it converts the standard GOPredSim output file to the input file format for topGO (ref) to facilitate its application in a wider biological workflow.

This pipeline results from joined efforts with equal contribution between Ana Roja's lab (Andalusian Center for Developmental Biology, CSIC) and Rosa Fernández's lab (Metazoa Phylogenomics Lab, Institute of Evolutionary Biology, CSIC-UPF) and shows that synergistic collaboration between labs with different expertise can result in great outcomes. We thank LifeHUB-CSIC for being the catalyst of this project and for impulsing us to 'think big'.

## Cite FANTASIA
Martínez-Redondo, G. I., Barrios, I., Vázquez-Valls, M., Rojas, A. M., & Fernández, R. (2024). Illuminating the functional landscape of the dark proteome across the Animal Tree of Life. [https://doi.org/10.1101/2024.02.28.582465](https://doi.org/10.1101/2024.02.28.582465)."

For our work about the performance of the different methods in model organisms check: Barrios-Núñez, I., Martínez-Redondo, G. I., Medina-Burgos, P., Cases, I., Fernández, R. & Rojas, A.M. (2024). Decoding proteome functional information in model organisms using protein language models. [https://doi.org/10.1101/2024.02.14.580341](https://doi.org/10.1101/2024.02.14.580341)


**Contact information**: Gemma I. Martínez-Redondo ([gemma.martinez@ibe.upf-csic.es](mailto:gemma.martinez@ibe.upf-csic.es)), Ana M. Rojas ([a.rojas.m@csic.es](mailto:a.rojas.m@csic.es)), Rosa Fernández ([rosa.fernandez@ibe.upf-csic.es](mailto:rosa.fernandez@ibe.upf-csic.es)).

## Before using FANTASIA
To reduce the environmental impact of this pipeline, check if your species of interest has already been functionally annotated using FANTASIA and use that file instead of running it from scratch. A collection of 970 animal and some closely-related outgroups are already calculated and can be found in [MATEdb2](https://github.com/MetazoaPhylogenomicsLab/MATEdb2). 

## How to use FANTASIA
<details open>
<summary><b>FANTASIA singularity image (only CPUs)</b></summary>
</br>

  Download the singularity image from [here](https://cloud.sylabs.io/library/gemma.martinezredondo/fantasia/fantasia) by executing:

  ```
  singularity pull --arch amd64 library://gemma.martinezredondo/fantasia/fantasia:sha256.64ff77ac69b4a1474fc8e1eec99184a37a74fdbf564604a9004ef39130174822
  ```
  The definition file used to create the image is also available on this GitHub repository. The files and scripts needed are the same as those required for local installation (download link below).

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
  ```
  
  At a given point, FANTASIA may raise a warning if your system only has CPUs or the GPU CUDA library version is different than 11.0. You can safely ignore this message as the singularity container is prepared to run on CPUs.
  
</details>

</br>

<details>
<summary><b>Local installation and execution</b></summary>
</br>

  1.- Download the files and scripts from [here](http://gofile.me/5wDJy/CI8zCiijR).
  
  2.- Open ```installation_guide_FANTASIA.sh``` (you can download it from this Github repository) and follow the instructions.
  
  3.- Execute FANTASIA (you can check the files and options required for each script by adding ```-h```).

<img src="Figures/FANTASIA_pipeline.png" />
</details>

</br>

<details open>
<summary><b>Galaxy implementation</b></summary>
</br>
Work in progress...
</details>
