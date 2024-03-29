-module(rna_transcription).

-export([to_rna/1]).

to_rna(_Strand) ->
    lists:map(fun from_dna/1, _Strand).

from_dna($G) -> $C;
from_dna($C) -> $G;
from_dna($T) -> $A;
from_dna($A) -> $U.
