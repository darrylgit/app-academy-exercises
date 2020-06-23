require "phase_3"

describe "matrix_addition_reloaded" do
  let(:matrix_a) { [[2,5], [4,7]] }
  let(:matrix_b) { [[9,1], [3,0]] }
  let(:matrix_c) { [[-1,0], [0,-1]] }
  let(:matrix_d) { [[2, -5], [7, 10], [0, 1]] }
  let(:matrix_e) { [[0 , 0], [12, 4], [6,  3]] }

  it "should add matrices, but this time reloaded or something, idk man" do
    expect(matrix_addition_reloaded(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])            
    expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)).to eq([[10, 6], [7, 6]])    
    expect(matrix_addition_reloaded(matrix_e)).to eq([[0, 0], [12, 4], [6, 3]])                        
    expect(matrix_addition_reloaded(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])             
    expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)).to eq(nil)    
    expect(matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)).to eq(nil)   
  end
end