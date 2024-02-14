# ![](Figures/FANTASIA_logo.png) FANTASIA: Functional ANnoTAtion based on embedding space SImilArity

[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](http://www.gnu.org/licenses/gpl.html)

FANTASIA (Functional ANnoTAtion based on embedding space SImilArity) is a pipeline for annotating GO terms in protein sequence files using GOPredSim ([to know more](https://github.com/Rostlab/goPredSim)) with the protein language model ProtT5. FANTASIA takes as input a proteome file (either the longest isoform or the full set of isoforms for all genes), removes identical sequences using CD-HIT (ref) and sequences longer than 5000 amino acids (due to a length constraint in the model), and executes GOPredSim-ProtT5 for all sequences. Then, it converts the standard GOPredSim output file to the input file format for topGO (ref) to facilitate its application in a wider biological workflow.

## Cite FANTASIA
Martínez-Redondo, G. I., Barrios, I., Vázquez-Valls, M., Rojas, A. M., & Fernández, R. (2024). Illuminating the functional landscape of the dark proteome across the Animal Tree of Life."

## How to use FANTASIA
<details open>
<summary><b>FANTASIA singularity image</b></summary>
</br>

  Once downloaded, you can execute it as follows (make sure that you have [singularity]() installed!):
  </br>
  ```
  ./fantasia -i input_file.pep [-o output_path -a isoforms_conversion.txt -p prefix]
  ```
</details>

</br>

<details>
<summary><b>Local installation and execution</b></summary>
</br>
<img src="Figures/FANTASIA_pipeline.png" />
</details>

</br>

<details open>
<summary><b>Galaxy implementation</b></summary>
</br>
Work in progress...
</details>
