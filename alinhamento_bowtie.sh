#!/bin/bash

# Construção do índice de alinhamento com Bowtie
# Substituir reference.fasta pelo arquivo fasta da referência
# reference_index é o prefixo para os arquivos de índice gerados
bowtie-build reference.fasta reference_index

# Alinhamento das sequências contra a referência de Wolbachia
# -f    : Indica que os arquivos de entrada estão no formato Fasta
# -S    : Saída no formato SAM (Sequence Alignment/Map)
# -a    : Relata todas as correspondências, em vez de apenas uma
# -v 0  : Configura tolerância de zero mismatches
# -p 3  : Usa 3 threads para o alinhamento
# -t    : Mostra o tempo total consumido
# Substituir sample.fasta pelo arquivo de sequência a alinhar
# redireciona a saída padrão para sample.sam e erros para sample_bowtie.log
bowtie -f -S -a -v 0 -p 3 -t reference_index sample.fasta > sample.sam 2> sample_bowtie.log

# Loop para processar múltiplos arquivos de entrada
# Por exemplo, recorrer por todos os arquivos fasta (*.fasta) em um diretório
for sample in *.fasta; do
    output="${sample%.fasta}.sam"
    log="${sample%.fasta}_bowtie.log"
    bowtie -f -S -a -v 0 -p 3 -t reference_index "$sample" > "$output" 2> "$log"
done
