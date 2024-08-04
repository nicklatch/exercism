defmodule DNA do
  @moduledoc """
  Functions to encode and decode nucleotides and nucleic acid chains.
  """

  @doc """
  Encodes the given code_point to a binary.
  """
  @spec encode_nucleotide(non_neg_integer()) :: non_neg_integer()
  def encode_nucleotide(code_point) when is_integer(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  @doc """
  Decodes the given encoded_code to its orginal code point.
  """
  @spec decode_nucleotide(non_neg_integer()) :: non_neg_integer()
  def decode_nucleotide(encoded_code) when is_integer(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  @doc """
  Encdoes the diven dna charlist into a bitstring.
  """
  @spec encode(charlist()) :: bitstring()
  def encode(dna) when is_list(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::4>>)
  end

  @doc """
  Decodes the dna bitstring into a charlist.
  """
  @spec decode(bitstring()) :: charlist()
  def decode(dna) when is_bitstring(dna), do: do_decode(dna, ~c"")

  defp do_decode(<<>>, acc), do: acc

  defp do_decode(<<head::4, tail::bitstring>>, acc) do
    do_decode(tail, acc ++ [decode_nucleotide(head)])
  end
end
