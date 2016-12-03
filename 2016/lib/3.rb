def valid_triangles(input)
  valid_triangles = 0
  input.each do |triangle|
    triangle = triangle.split.map(&:to_i).sort
    valid_triangles += 1 if triangle[0] + triangle[1] > triangle[2]
  end
  valid_triangles
end

def vertical_triangles(input)
  valid_triangles = 0
  until input.empty?
    row_1 = input.shift.split.map(&:to_i)
    row_2 = input.shift.split.map(&:to_i)
    row_3 = input.shift.split.map(&:to_i)
    tri_1 = [row_1[0], row_2[0], row_3[0]].sort
    valid_triangles += 1 if tri_1[0] + tri_1[1] > tri_1[2]
    tri_2 = [row_1[1], row_2[1], row_3[1]].sort
    valid_triangles += 1 if tri_2[0] + tri_2[1] > tri_2[2]
    tri_3 = [row_1[2], row_2[2], row_3[2]].sort
    valid_triangles += 1 if tri_3[0] + tri_3[1] > tri_3[2]
  end
  valid_triangles
end
