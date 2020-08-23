class TestService
  def self.call
    arr = [1, 2, 3, 4, 5, 4, 4, 2]
    hash = {}

    result = []
    arr.each do |c|
      unless hash[arr[c].to_s]
        result << c
        hash[arr[c].to_s] = 1
      end
    end
    result
  end
end

TestService.new.lint('()()()()(())')


#3. Viết hàm kiểm tra cặp kí tự '(' và ')' trong chuỗi. Ví dụ
#"()()()()(())" => output: true
#"(()()()(()" => output: false
#4. Viết hàm trả về số nhỏ thứ k trong mảng số nguyên. Ví dụ cho một mảng các số nguyên chưa được sắp xếp thứ tự
#[1,5,4,12,6,7,9,8] yêu cầu trả về số nhỏ thứ 3 (k = 3) trong mảng => output: 5
#5. Viết hàm tìm ra mảng con liên tiếp có tổng lớn nhất trong một mảng với tham số k là số phần tử của mảng con đó.
#  Ví dụ:
#  [1, -5, 4, 3, 6, 8, 2, 4], k = 3 => output: [3, 6, 8]
