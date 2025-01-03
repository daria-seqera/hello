#!/usr/bin/env nextflow

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    echo 'just_parameter: $params.just_parameter'
    echo 'parameter_with_embedded_another_parameter: $params.parameter_with_embedded_another_parameter'
    echo 'parameter_referencing_another_parameter: $params.parameter_referencing_another_parameter'
    echo 'parameter_with_embedded_non_parameter: $params.parameter_with_embedded_non_parameter'
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
