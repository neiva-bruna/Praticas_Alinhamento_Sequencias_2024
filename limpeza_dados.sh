#!/bin/bash

# Avaliação de qualidade das leituras com FastQC
# Esse comando analisa a qualidade dos arquivos de leitura FastQ
# SRRXXXXXXX.fastq deve ser substituído pelo nome do seu arquivo real
fastqc SRRXXXXXXX.fastq

# Limpeza e corte de sequências de baixa qualidade com Trim Galore
# --fastqc - Gera um relatório FastQC após o corte
# -q 25 - Define a pontuação mínima de qualidade para manter uma leitura
# --trim-n - Remove bases 'N' de extremidades de leitura
# --max_n 0 - Remove leituras contendo 'N' após o corte
# -j 1 - Define o número de threads a serem usadas (1 thread neste caso)
# --length 18 - Descarte leituras que ficam mais curtas que essa
# --dont_gzip - Não gzip os arquivos de saída
# SRRXXXXXXX.fastq deve ser substituído pelo nome do seu arquivo real
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq

# Aqui, você também pode adicionar comandos adicionais como o seqtk
# Exemplo: seqtk seq -a input.fq.gz > output.fa
