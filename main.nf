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
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
