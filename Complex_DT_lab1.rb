class ComplexCalculator
    @@add_operation=0
    @@multiply_operation=0
    def initialize(cn1)
        @cn1=cn1
        puts cn1
    end
    #add complex number
    def addComplex(cn2)
        puts "Add Complex Number : #{@cn1 + cn2}"
        @@add_operation +=1
    end    
    #multiply complex number
    def multiplyComplex(cn2)
        puts "Multiply Complex Number : #{@cn1*cn2}"
        @@multiply_operation +=1
    end
    #bulk add
    def bulk_add(cns)
        result=0
        cns.each do |cn|
            cn+=@cn1
            result=cn
        end
        @@add_operation +=1
        puts "Bulk Add : #{result}"     
    end
    #bulk multiply
    def bulk_multiply(cns)
        result=0
        cns.each do |cn|
            cn*=@cn1
            result=cn
            @@multiply_operation+=1
        end
        puts "Bulk Multiply : #{result}"  
    end  
    def get_stats()
        puts "Add State: #{@@add_operation}"
        puts "Multiply State: #{@@multiply_operation}"
    end    
end

######################################################################
#take object from class & init class with pass complex number
complexcalculator=ComplexCalculator.new(Complex(1,3))
#add complex number 
complexcalculator.addComplex(Complex(1,1))
#multiply number
complexcalculator.multiplyComplex(Complex(2,3))
#bulk add array 
complexcalculator.bulk_add([Complex(1,5),Complex(5,6)])
#bulk multi array
complexcalculator.bulk_multiply([Complex(1,5),Complex(5,6)])
#opearation added
complexcalculator.get_stats()