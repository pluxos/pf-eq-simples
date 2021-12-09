import Test.Hspec        (Spec, it, describe, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck

import Exercise

main :: IO ()
main = hspecWith defaultConfig {configFastFail = False} specs

specs :: Spec
specs = do
          describe "Teste de funções simples" $ do
            it "Retorna uma string" $
              digaMeuNome `shouldBe` digaMeuNome
            it "Soma tres números " $
              somaTresNumeros 1 2 3 `shouldBe` 6
            it "Soma tres números " $ property $
              \x y z -> somaTresNumeros x y z `shouldBe` (x + y + z::Int)
            it "Calcula a area do quadrado " $
              areaQuadrado 2 `shouldBe` 4
            it "Calcula a area do quadrado " $ property $
              \x -> areaQuadrado x `shouldBe` (x*x :: Float)
            it "Calcula a area do retangulo " $
              areaRetangulo 2 3 `shouldBe` 6
            it "Calcula a area do retangulo " $ property $
              \(x,y) -> abs (areaRetangulo x y) `shouldBe` abs (x * y :: Int)
            it "Calcula a area do círculo " $ property $
              \x -> areaCirculo x `shouldBe` abs (pi * x**2 :: Float)
            it "Calcula a area do triângulo " $ property $
              \x y -> abs (areaTriangulo x y) `shouldBe` abs (x*y/2 :: Float)
            it "Calcula a area do trapézio " $ property $
              \x y z -> abs (areaTrapezio x y z) `shouldBe` abs  ((x + y)*z/2 :: Float)
            it "Calcula a hipotenusa " $ property $
              \x y -> abs (hipotenusa x y) `shouldBe` sqrt (x*x + y*y :: Float)
            it "Converts C to F " $
              celsius2fahrenheit 0 `shouldBe` 32
            it "Converts C to F " $
              celsius2fahrenheit 100 `shouldBe` 212
            it "Converts F to C " $
              fahrenheit2celsius 212 `shouldBe` 100
            it "Converts F to C " $
              fahrenheit2celsius 32 `shouldBe` 0
