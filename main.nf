#!/usr/bin/env nextflow

process sayHello {
  publishDir "${params.publishDir}"

  input: 
    val x
  output:
    path 'output_*'
  script:
    """
    echo '$x world!' > "output_$x"
    for i in {1..20}; do cat "output_$x" "output_$x" > tmp && mv tmp "output_$x"; done
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
