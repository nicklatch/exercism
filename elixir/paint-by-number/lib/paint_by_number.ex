defmodule PaintByNumber do
  @moduledoc """
  Contains functions for the Paint-By-Number app.
  """

  @doc """
  Returns how many bits are necessary to represent the given color_count color indices as binary numbers.
  """
  @spec palette_bit_size(color_count :: integer()) :: integer()
  def palette_bit_size(color_count) when color_count == 0, do: color_count
  def palette_bit_size(color_count) when color_count <= 2, do: 1
  def palette_bit_size(color_count), do: 1 + palette_bit_size((color_count / 2) |> ceil)

  @doc """
  Returns an empty bitstring.
  """
  @spec empty_picture() :: <<>>
  def empty_picture(), do: <<>>

  @doc """
  Returns a bitstring for testing
  """
  @spec test_picture() :: <<_::8>>
  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  @spec prepend_pixel(
          picture :: bitstring(),
          color_count :: integer(),
          pixel_color_index :: integer()
        ) :: bitstring()
  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(color_count |> palette_bit_size), picture::bitstring>>
  end

  @doc """
  Returns the first pixel from the bitstring. If there is no pixel it returns nil.
  """
  @spec get_first_pixel(picture :: bitstring(), color_count :: integer()) :: nil | integer()
  def get_first_pixel(<<>>, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    palette_size = palette_bit_size(color_count)
    <<pixel::size(palette_size), _pixels::bitstring>> = picture
    pixel
  end

  @doc """
  Returns the tail of the bit string if there is one, else it returns an empty bitstring.
  """
  @spec drop_first_pixel(picture :: bitstring(), color_count :: integer()) :: <<>> | bitstring()
  def drop_first_pixel(<<>>, _color_count), do: empty_picture()

  def drop_first_pixel(picture, color_count) do
    palette_size = palette_bit_size(color_count)
    <<_pixel::size(palette_size), pixels::bitstring>> = picture
    pixels
  end

  @doc """
  Returns the two given pictures concatinated into one.

  If one or the other is missing, it returns the present one.
  """
  @spec concat_pictures(picture1 :: bitstring(), picture2 :: bitstring()) :: bitstring()
  def concat_pictures(picture1, <<>>), do: picture1
  def concat_pictures(<<>>, picture2), do: picture2
  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
