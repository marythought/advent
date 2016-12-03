def valid_triangles(input)
  # ["566  477  376", "575  488  365", "50   18  156", "  558  673  498", "  133  112  510"]
  valid_triangles = 0
  input.each do |triangle|
    triangle = triangle.split.map(&:to_i).sort #["376", "477", "566"]
    if triangle[0]+ triangle[1] > triangle[2]
      valid_triangles += 1
    end
  end
  valid_triangles
end

def vertical_triangles(input)
# ["566  477  376", "575  488  365", "50   18  156", "  558  673  498", "  133  112  510"]
  valid_triangles = 0
  while input.length > 0
    row_1 = input.shift.split.map(&:to_i) #[566, 477, 376]
    row_2 = input.shift.split.map(&:to_i) #"575  488  365"
    row_3 = input.shift.split.map(&:to_i) #"50   18  156"
    tri_1 = [row_1[0], row_2[0], row_3[0]].sort
    if tri_1[0]+ tri_1[1] > tri_1[2]
      valid_triangles += 1
    end
    tri_2 = [row_1[1], row_2[1], row_3[1]].sort
    if tri_2[0]+ tri_2[1] > tri_2[2]
      valid_triangles += 1
    end
    tri_3 = [row_1[2], row_2[2], row_3[2]].sort
    if tri_3[0]+ tri_3[1] > tri_3[2]
      valid_triangles += 1
    end
  end
  valid_triangles
end
