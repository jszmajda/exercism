class Raindrops
  def convert(a)
    e = []
    e << "Pling" if prime?(a,3)
    e << "Plang" if prime?(a,5)
    e << "Plong" if prime?(a,7)

    e.empty? ? a.to_s : e.join
  end

  private

  def prime?(a,n)
    a % n == 0
  end
end
