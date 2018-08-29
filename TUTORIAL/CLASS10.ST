"Smalltalk code from Chapter 10 of the Smalltalk/V Tutorial"!

Object subclass: #Animal
  instanceVariableNames: 
    'name knowledge habitat topSpeed color picture '
  classVariableNames: ''
  poolDictionaries: '' !
                     
Animal subclass: #Bird
  instanceVariableNames: 
    'flying '
  classVariableNames: ''
  poolDictionaries: '' !
                         
Bird subclass: #Parrot
  instanceVariableNames: 
    'vocabulary '
  classVariableNames: ''
  poolDictionaries: '' !
                        
Bird subclass: #Penguin
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !
               
Animal subclass: #Mammal
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !
                       
Mammal subclass: #Dog
  instanceVariableNames: 
    'barksAlot '
  classVariableNames: ''
  poolDictionaries: '' !
                        
Mammal subclass: #Whale
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !
                   
Object subclass: #AnimalHabitat
  instanceVariableNames: 
    'animals scriptString script browser'
  classVariableNames: ''
  poolDictionaries: '' !
                  
