require 'lib/frac_main.rb' 
require 'rspec'

describe Fraccion do
	before :each do
		@fr = Fraccion	
	end

	it "Debe existir un numerador" do
		@fr.new(1, 2).num.should == 1
	end

	it "Debe existir un denominador" do
		@fr.new(1, 2).dem.should == 2	
	end
	
	it "Debe de estar en su forma reducida" do
		@fr.new(2, 4).num.should == 1
		@fr.new(7, -21).dem.should == 3
	end

	it "Se debe invocar al metodo num() para obtener el numerador" do
		@fr.new(2,4).respond_to?("num").should be_true
	end
	
	it "Se debe invocar al metodo dem() para obtener el numerador" do
		@fr.new(1,2).respond_to?("dem").should be_true
	end
	
	it "Se debe mostar por la consola la fraccion de la forma: a/b, 
		donde a es el numerador y b el denominador" do
		@fr.new(1,2).to_s.should == "1/2"
		@fr.new(7,-21).to_s.should == "-1/3"
	end

	it "Se debe mostar por la consola la fraccion en formato flotante" do
		@fr.new(1,2).to_f.should == 1/2
		@fr.new(-2,6).to_f.should == -1/3
	end
	
	it "Se debe comparar si dos fracciones son iguales con ==" do
		@fr.new(1,2).should == @fr.new(2,4)
		@fr.new(-3,6).should == @fr.new(-1,2)
	end
	
	it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
		@fr.new(-2,3).abs.should == @fr.new(2,3)
		@fr.new(2,-4).abs.should == @fr.new(1,2)	
	end
	
	it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do 
		@fr.new(-2,3).reciproco.should == @fr.new(-3,2)
		@fr.new(21,3).reciproco.should == @fr.new(1,7)	
	end
	
	it "Se debe calcular el opuesto de una fraccion con - " do
		(-@fr.new(2,4)).should == @fr.new(-1,2)
		(-@fr.new(-1,3)).should == @fr.new(1,3)
	end
	
	it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
		(@fr.new(1,2) + @fr.new(1,4)).should == @fr.new(3,4)
		(@fr.new(5,15) + @fr.new(2,3)).should == @fr.new(1,1)
	end
	
	it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
		(@fr.new(6,8) - @fr.new(1,4)).should == @fr.new(1,2)
		(@fr.new(3,3) - @fr.new(2,6)).should == @fr.new(2,3)
	end

	it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
		(@fr.new(1,2) * @fr.new(2,4)).should == @fr.new(1,4)
		(@fr.new(-3,3) * @fr.new(2,6)).should == @fr.new(-1,3)
	end
	
	it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
		(@fr.new(2,3) / @fr.new(2,4)).should == @fr.new(4,3)
		(@fr.new(-6,16) / @fr.new(2,6)).should == @fr.new(-9,8)
	end
	
	it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma 
		reducida" do
		#(@fr.new(2,6) % @fr.new(1,2)).should == @fr.new(1,3)
		#(@fr.new(-6,16) % @fr.new(2,6)).should == @fr.new(1,24)
		(@fr.new(5,1) % @fr.new(2,1)).should == @fr.new(1,1)
		(@fr.new(17,1) % @fr.new(3,1)).should == @fr.new(2,1)
	end
	
	it "Se debe de poder comprobar si una fracion es menor que otra" do
		(@fr.new(1, 2) < @fr.new(3, 4)).should be_true
		(@fr.new(1, 2) < @fr.new(1, 4)).should be_false
	end
	
	it "Se debe de poder comprobar si una fracion es mayor que otra" do
		(@fr.new(1, 2) > @fr.new(3, 4)).should be_false
		(@fr.new(1, 2) > @fr.new(1, 4)).should be_true
	end
	
	it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
		(@fr.new(1, 2) <= @fr.new(2, 4)).should be_true
		(@fr.new(1, 2) <= @fr.new(3, 4)).should be_true
	end

	it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
		(@fr.new(1, 2) >= @fr.new(2, 4)).should be_true
		(@fr.new(3, 2) >= @fr.new(3, 4)).should be_true	
	end
	
	#Modificación
	it "Operaciones realizadas de forma conjunta" do
	    fr1 = Fraccion.new(3,4)
	    fr2 = Fraccion.new(2,5)
	    ((-fr1 * fr2).abs).should == @fr.new(3,10)
	end
	
	
end
