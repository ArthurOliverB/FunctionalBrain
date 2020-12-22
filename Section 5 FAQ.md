# Seção 05: FAQ

# Indice

1. [Cidadão de Primeira Linha]()
2. [Parâmetros são opcionais]()

## Cidadão de Primeira Linha

1. Qual a diferença entre usar função literal e armazenar ela em uma variável?

    Essa capacidade do JavaScript de armazenar funções dentro de 
    variáveis vem ser útil quando temos uma função anônima - não nomeada - 
    mas queremos acessá-la.

    Por exemplo:

    ```jsx
    setTimeout(function(){
    	console.log("A função executa depois de 1 segundo...")
    }, 1000)
    ```

    Nesse exemplo, uma função anônima foi passada para o setTimeout, e essa função anônima agora é um parâmetro do setTimeout.

    Ao armazenar uma função anônima dentro de uma variável, podemos chamar a função por meio dessa variável, assim:

    ```jsx
    let teste = function(){
    	console.log("Olha só, funciona!");
    }

    teste(); //chamando a função por meio da variável

    console.log(teste); //se você tentar imprimir a variável, ela mostra [Function: teste]
    console.log(typeof teste); //aqui ela retorna que teste é do tipo function
    ```

    As funções anônimas podem ser passadas como argumentos para outras 
    funções, bem como podem ser execuções de funções invocadas imediatamente
     (Immediately Invoked Function Expression, IIFE, que serão abordadas em 
    aulas futuras).

    Você pode ter também funções anônimas declaradas na sintaxe de Arrow Functions, que também serão abordadas futuramente.

    A função anônima abaixo, armazenada dentro da variável soma:

    ```jsx
    let soma = function(a, b){
    	return a + b;
    }

    console.log(soma(2, 3));
    ```

    Pode ser escrita dessa maneira, na sintaxe de função arrow:

    ```jsx
    let soma = (a, b) =>  a + b;
    console.log(soma(2, 3));
    ```

    Que é, convenhamos, uma maneira bem mais curta de declarar funções, mas que também tem suas particularidades.

2. O que se caracteriza como programação funcional?

    Programação funcional é só uma **outra maneira de pensar** na hora de criar o seu programa.

    É um paradigma de programação que descreve uma computação como uma 
    expressão a ser avaliada. A principal forma de estruturar o programa é 
    pela definição e aplicação de funções.

    Muitos programas escritos em programação imperativa são enormes e escritos em programação funcional eles ficam pequenininhos.

    Ao contrário do que muita gente pensa, programação funcional não é o oposto de programação orientada a objetos, são diferentes, mas podem inclusive ser usados em uma mesma aplicação, principalmente em  linguagens multi-paradigmas, como o JavaScript.

3. Na linha 16 do código, por que ao colocar um return console.log("Opa!") o resultado é Opa! e undefined?

    O motivo disso é porque console.log é uma função, e toda função tem um retorno. Logo, como ela não foi feita pra retornar nada específico, ela retorna undefined, que também será o retorno de obj.falar(). Como na linha 17 está mandando ser impresso no console o retorno de obj.falar(), então será impresso undefined.

4. O que faz o return?

    Quando você executa a função soma o resultado dela é outra chamada de função. É como se você executasse outra função chamando a primeira. Ou seja, quando você chamar a função soma() no seu código, ela vai chamar outra função ao invés de retornar algum valor. Esse exemplo da aula não é o melhor já que não tem muita utilidade, foi apenas para mostrar mesmo que é possível retornar uma função usando uma função

5. Para que usar os parâmetros numa função?

    Os parâmetros passados em uma função poderão ser utilizados dentro da mesma, por exemplo:

    ```jsx
    function imprimirString (parametro) {
    	console.log(parametro);
    }
         
    imprimirString('Essa frase tomará o lugar da variável parâmetro')
    ```

    Se você não criar a function com o parâmetro observe o que acontece:

    ```jsx
    function imprimirString () {
    	console.log(parametro); //vc não conseguirá utilizá-lo aqui
    }
         
    imprimirString('Essa frase tomará o lugar da variável parâmetro');
    ```

    Você terá o erro: ReferenceError: parametro is not defined.

## Parâmetro e Retorno São Opcionais

- O ${area} não está funcionando no VSCode

Confira se foram utilizados os back-ticks, ou sinais de crase, ( ` ` ) em vez de, por exemplo, aspas simples. Dessa maneira:

```jsx
console.log(`Valor acima do permitido: ${area}m2.`)
```

- Por que se eu chamar uma função sem o console.log, ela imprimiu um resultado sem o "undefined"?

Observe que dentro da própria função há um console.log. Se a condição do if for obedecida ele será executado e a função não utilizará seu retorno explícito de valor. Portanto o valor será impresso.

Mas existe também o retorno implícito. Quando você coloca uma função dentro de um console.log, se ela não retornar nada explicitamente (utilizando o return), implicitamente ela retornará undefined. Então, se ela estiver  dentro de um console.log o undefined (retorno implícito) será impresso.

- Mas isso não é bug do JavaScript? Se ela tem algo para retornar, o undefined não precisaria vir junto, não?

Não é bug, não!

O console.log só vai imprimir o que você pedir a ele; se uma função não declarada ou vazia for passada para o console.log, ele imprime o undefined porque de fato, o que você tentou imprimir não existe. Por exemplo:

```jsx
function masComoAssim(){ //função vazia!
     
    }
    console.log(masComoAssim()) //imprime undefined
```

O undefined significa "indefinido" ou seja, o que você está tentando imprimir não foi definido.

Porém, no momento que você explicita alguma coisa dentro da função, por exemplo, com um return:

```jsx
function masComoAssim(){
    return "Eita, funcionou!"
}
 
console.log(masComoAssim()) //imprime "Eita, funcionou!
```

- E afinal, por que esse undefined vem junto?

Uma função sem um return definido retorna um valor default. Ou seja:

```jsx
function abc (a) {
        console.log(a);
    }
```

A função acima não tem return, mas mesmo assim ela retorna um valor padrão.

Para funções construtoras, aquelas que utilizamos o new, o retorno é o this da função. Para todas as outras funções esse retorno padrão é undefined.

Então, analisando o código da aula, temos que:

```jsx
function area(largura, altura) {
        const area = largura * altura
        if (area > 20) {
            console.log(`Valor acima do permitido: ${area}m2.`)
        } else {
            return area
        }
    }
     
    console.log(area(5, 5))
```

O caso citado entrará no bloco if, imprimirá no console, não entrará no bloco else e encerrará a função. Como não foi executado nenhum retorno explícito, o valor padrão (undefined) é retornado.

Então é por isso que ela imprime no console e depois imprime o undefined, pois a chamada da função está dentro de um console.log. Se fizéssemos assim:

```jsx
area(5, 5)
```

A função seria chamada fora do console.log, logo seu retorno não seria impresso, mas seu bloco if executaria o console.log interno à função.

- Posso usar o return para retornar vários dados?

Não podemos fazer o retorno de vários valores, mas podemos retornar um array contendo os valores. Dessa forma aqui:

```jsx
const teste = {
        nome: 'Lucas',
        idade: 22
    }
     
    function testando(obj) {
        return [obj.nome, obj.idade]
    }
     
    console.log(testando(teste))
```

## Parâmetros Variáveis

- O que seria esse i usado no código da aula?

Basicamente esse i é uma variável de controle que é responsável por ser iterado a cada repetição do loop (quando fizer esse loop dentro do array arguments). Ou seja, na primeira iteração o i vai ser 1 e quando ele coloca arguments[i] é como se fosse arguments[1], na segunda iteração ficaria arguments[2] e por ai vai.

- O que seria o arguments?

 O arguments é um array que contém todos os parâmetros que você passou para a função, ou seja, caso você chame a função da seguinte forma: função(a, b, c, d, e) o arguments dessa função vai ser:

```jsx
arguments[0] = a

arguments[1] = b

arguments[2] = c

arguments[3] = d

arguments[4] = e
```

- Não seria importante usar o TypeScript para evitar possíveis problemas com argumentos de tipos não desejados? Tem alguma forma de obrigar que outros desenvolvedores passem argumentos de tipos indesejados para nossos métodos quando o código está modularizado no próprio JavaScript sem precisar de try/catch? A tipagem dinâmica do JavaScript tem alguma utilidade?

Se você está procurando tipagem estática para JS, o mais ideal é utilizar TypeScript mesmo. Para obrigar desenvolvedores a passar argumentos de um tipos predeterminados, seria por meio de checagem de tipagem antes da compilação, por meio de interface e tipagem forte, por exemplo. No caso do JS puro, não há interfaces, nem tipagem forte. Você poderia fazer testes de tipo, mas no momento da execução.

Alguns benefícios da tipagem dinâmica:

1. Há um aumento da flexibilidade em alguns casos
2. Menor necessidade escrita no momento de codificar, o que torna mais 
rápido a própria codificação, facilita a leitura e manutenção
3. Há maiores possibilidades para polimorfismos

## Parâmetro Padrão

- Faz sentido aceitar parâmetros padrão undefined ou que não sejam numéricos?

De modo geral, esse é um dos problemas que o TypeScript observou no JavaScript tentou resolver com a tipagem forte. No JS você tem algumas formas de lidar com isso. Você pode adicionar parâmetros padrão, você pode fazer checagem de tipos com typeof, você pode criar um módulo para fazer essas checagens por você, pode usar try/catch tbm... Por aí vai.

- Quando defino um parâmetro sem usar var, let ou const, ele está sendo definido no escopo global ou apenas dentro da função?

Quando você faz a assinatura de uma função, assim:

```jsx
function teste (a, b, c) {
        return a + b + c;
    }
```

Os parâmetros a, b e c só existirão dentro da função. O que for atribuído a eles poderá existir fora, mas eles não. Por exemplo:

```jsx
const numero1 = 2
    const numero2 = 4
     
     
    function teste (a, b, c) {
        c(a, b);
    }
     
    teste(numero1, numero2, (num1, num2) => {
        console.log(num1 + num2);
    })
```

numero1 e numero2 existem fora da função e dentro dela são conhecidos como 'a' e 'b'. Já a função arrow que passamos como parâmetro na hora da chamada da função teste não existe fora da função teste e dentro dela é conhecida como 'c'.

- Por que não definir o parâmetro padrão como 0, se o 1 causa problemas?

O valor 1 para a comparação foi utilizado por questão de didática mesmo, até porque não conseguiria, por exemplo, ser observado o bug do soma1(0,0,0) se o valor padrão fosse 0, enquanto que com o valor 1 pôde-se ver que mesmo se passando os três valores 0 para a comparação, ele retornava o resultado 3.

```jsx
function soma1(a, b, c) {
    a = a || 1
    b = b || 1
    c = c || 1
    return a + b + c
    }
    console.log(soma1(),soma1(3),soma1(1,2,3),soma1(0,0,0)) 
    //retorna 3, 5, 6 e 3 novamente
```

No mais, você pode usar quaisquer valores como padrão, mas no caso da aula foi usado o 1 mais por didática mesmo.

- Os parâmetros passados para uma funções são variáveis? Eles se comportam como let ou var?

Os parâmetros podem ser tratados como variáveis dentro da função e eles se comportam como var.

- Posso usar um operador ternário como parâmetro padrão?

O parâmetro padrão só é acionado quando não há uma passagem de valor  para aquele determinado parâmetro. Quando você não passa um valor para o parâmetro, ele permanece **undefined** então ele sempre vai entrar na primeira condição, que traduzindo para uma linguagem mais parecida com a nossa seria:

"*O valor de **a**, is not a number?  Sim. Então atribua o valor 1 a ele.*"

- Qual a vantagem de padronizar um elemento?

A maior vantagem é evitarmos que nossa função gere um erro por conta de dados errados passados para ela. Outra vantagem é quando temos funções onde um do seus parâmetros é o mesmo quase sempre, porém pode mudar de vez em quando. Nesse caso, você pode padronizar o parâmetro e facilitar o uso da função passando esse parâmetro somente quando for necessário a mudança dele.

## "this" pode variar

- Afinal, o que é o this?

Eu sempre recomendo, quando alguém não entende o que é algum método  ou função ou, nesse caso, variável no JavaScript - ou em qualquer linguagem de programação, diga-se de passagem - a minha sugestão é **traduzir** o nome dessa função, método ou variável.

O this, portanto, pode ser entendido como "isto" ou, ainda, "este" ou "esta". Faz ainda mais sentido quando se entende que o this se trata de **contexto.**

O this vai se referir ao contexto de um determinado bloco de código. É como se você estivesse falando "Aqui ó, é a **este** bloco de código que eu tô me referindo!"

Fora de qualquer bloco de código, o this vai se referir ao objeto global ("É **isto** aqui que eu tô me referindo agora!").

Dentro de uma função, o this vai depender de como esta função é chamada: numa chamada simples, que não está em modo estrito, o this não é definido pela chamada.

Já em modo estrito, o valor de this permanece seja qual for o definido ao entrar no contexto de execução.

As funções arrow não tem um this próprio, sendo o this definido lexicalmente, ou seja, seu valor é definido pelo contexto de execução onde está inserido.

```jsx
function Pessoa(){
      this.idade = 0;
     
      setInterval(() => {
        this.idade++; // |this| corretamente se refere ao objeto Pessoa
      }, 1000);
    }
     
    var p = new Pessoa();
```

Para funções, você poderia dizer "Ó, é esta função aqui que eu tô falando!"

- Há alguma semelhança entre funções arrow e as expressões lambda do C#?

Embora tenham algumas semelhanças, como o poder de retornar funções, ou até mesmo a sintaxe parecida, são conceitualmente diferentes.

As funções arrow existem para facilitar a escrita e tem como principal característica a imutabilidade do this.

- O this então referencia o contexto de execução?

Não necessariamente! O this está muito mais relacionado ao escopo do que ao contexto de execução, mas em Arrow Functions, que serão mostradas mais à frente, o this é, de fato, definido no contexto de execução onde está inserido.

- Então ele referencia o escopo da execução?

O escopo onde ele está inserido.

No contexto de execução global (fora de qualquer função), this refere-se ao objeto global, seja em modo estrito ou não.

```jsx
console.log(this.document === document); // true
```

Em navegadores web, o objeto window é também o objeto global:

```jsx
console.log(this === window); // true
```

Em funções Arrow é que ele é definido lexicalmente, ou seja, no contexto de execução.

- Quando se faz a comparação this === window ou this === body, o que está sendo dito de fato?

Significa que o this está apontando para o escopo, ou do window ou do body, ou seja, para o escopo global de onde você estiver trabalhando; se for num browser, ele aponta para window, se for num arquivo no VSCode, ele aponta para global (this === global).

- É recomendado usar somente arrow functions?

Depende da situação, se você quer trabalhar com o escopo do this só na função pode fazer essa alteração, mas não é algo que vai ser utilizado 100% das vezes, varia do projeto que você está trabalhando, do seu conforto em usar essa técnica entre muitas outras coisas.

## this e a função bind #01

- O que faz o bind afinal?

O método bind vai "amarrar" o valor do this. Você vai passar para o bind o contexto no qual você quer "amarrar" o this - você pode entender como limitar, por exemplo, porque ao usar o bind o this só vai apontar para aquele determinado contexto.

Então, na função da aula onde ele usa o bind na função **const falarDePessoa = pessoa.falar.bind(pessoa)** ele está amarrando esse contexto para que não ocorra mais o erro de paradigmas que foi mostrado na aula.

- Mas ele amarra o objeto ao this?

Não, ele amarra o **o this ao contexto do objeto passado para o bind**, de modo que agora ele sempre vai se referenciar ao método falar() dentro do objeto pessoa e assim imprimir o valor certo.

Vocênão consegue usar o falar() (o que tem pessoa.falar.bind(pessoa) dentro dele) fora de contexto, ele sempre vai apontar para o método falar() dentro do objeto pessoa.

Nem sempre, porém, vai ser passado ao bind um objeto, você pode passar argumentos que serão atribuídos a uma determinada função. Por exemplo:

```jsx
function lista() {
      return Array.prototype.slice.call(arguments);
    }
     
    var lista1 = lista(1, 2, 3); // retorna [1, 2, 3]
     
    // Cria uma função com um argumento principal predefinido
    var comecandoComTrintaESete = lista.bind(null, 37);
     
    var lista2 = comecandoComTrintaESete(); //sem passar parâmetros
    // [37]
     
    var lista3 = comecandoComTrintaESete(1, 2, 3); //passando parâmetros
    // [37, 1, 2, 3] - começa com o 37 e acrescenta os parâmetros passados
```

- O bind só funciona para objetos?

O bind é chamado à partir de uma função e como argumento você passa o objeto que quer que seja o this daquela função que está chamando o bind.

Por exemplo:

```jsx
func.bind(obj);
```

O this da função func será o objeto obj.

- Não é redundante usar a notação pessoa.falar.bind(pessoa)?

Em JavaScript o this pode variar de acordo com quem o chama, observe:

```jsx
const pessoa = {
        saudacao: 'Bom dia!',
        falar(){
            console.log(this);
        }
    }
     
    pessoa.falar();
    const falar = pessoa.falar;
    falar();
```

Observe que o código acima imprime o this no console, e não o this.nome.

Atentando para isso, observamos que ao chamar direto pessoa.falar o this é de fato o obj pessoa, como esperado.

Agora,o pulo do gato, quando atribuímos a função para uma constante no escopo global o this já não será mais o mesmo, e sim o objeto global. Ou seja, o this mudou de acordo com a chamada. Quando fazemos o bind, como na aula:

```jsx
const pessoa = {
        saudacao: 'Bom dia!',
        falar(){
            console.log(this);
        }
    }
     
    pessoa.falar();
    const falarComBind = pessoa.falar.bind(pessoa);
    falarComBind();
```

Observe que tanto na chamada direta (pessoa.falar) quanto na chamada com o bind (falarComBind) o this é o mesmo, porque a função bind atrela um escopo léxico à const, no caso.

- Por que usar o this?

O this pode variar de acordo com a chamada, então conhecer os escopos e dominar a utilização do this pode te trazer muito poder na hora de programar em JavaScript. No caso do exemplo é fato que você pode usar o nome da constante pessoa. Mas imagine que você esteja lidando com uma função construtora que retorna objetos que terão nomes diferentes, como fazer uma chamada que seja universal? Com o this!

- E qual a utilidade do this?

No exemplo acima está sendo criado um objeto armazenado em uma constante que você sabe o nome e chama o atributo pelo nome da constante, isso funciona! Agora imagine o seguinte cenário:

```jsx
function Pessoa (saudacao) {
        return {
            saudacao,
            falar: function () {
                console.log(this.saudacao)
            }
        }
    }
     
    const p1 = new Pessoa("Bom dia")
    const p2 = new Pessoa("Boa tarde")
    const p3 = new Pessoa("Boa noite")
     
    p1.falar()
    p2.falar()
    p3.falar()
```

No cenário acima nós temos uma função construtora que nos retornará um objeto do tipo Pessoa para cada instância que criarmos.

Como nós vamos utilizar dentro da função construtora o nome do objeto para chamar o atributo se esse nome pode variar?

Teremostrês pessoas com nomes diferentes (p1, p2, p3) e com saudações diferentes (Bom dia, Boa tarde e Boa noite). Então não podemos nesse caso utilizar diretamente o Pessoa.saudacao, pois não irá funcionar visto que o nome do objeto não é Pessoa e sim p1, p2 ou p3.

O this serve para as situações onde você vai precisar de uma auto referência, ou seja, uma referência a si mesmo. Quando em p1 eu chamo this.saudacao é, semanticamente, equivalente a p1.saudacao. O mesmo vale para p2, p3... e etc.

- Qual a diferença entre o this e o bind?

O 'this' muda de acordo com o escopo em que ele está inserido. Vamos pegar o exemplo da aula. O Professor criou um objeto que tem um atributo chamado 'saudacao' e uma função chamada 'falar', certo? O que essa função faz é imprimir 'this.saudacao'. Esse 'this' antes da variável 'saudacao' indica para o JavaScript que essa variável 'saudacao' está dentro do escopo ao qual a função 'falar' pertence, ou seja, dentro do objeto 'pessoa', dessa forma a função consegue achar o valor de 
'saudacao' não importa aonde ela seja chamada, pois sempre que for chamada, ela vai estar apontando para o próprio objeto por causa do 'this'.

Já o 'bind' é um método que existe para auxiliar o uso do this. Quando utilizamos o 'bind', o que colocarmos como parâmetro vai ser o escopo utilizado pelo 'this', por isso quando o Professor utilizou a função 'falar' de forma externa ao objeto o resultado funcionou corretamente, graças ao 'bind'. Pois o 'bind' indicou para a função que o 'this' seria o objeto pessoa.

- O bind copia o objeto passado ou só faz uma atribuição?

O bind cria uma nova função que vai ter o escopo associado a aquele bind (ou seja, tem o this setado), por isso que usamos o bind para corrigir problemas de escopo.

- O bind seria como um ponteiro?

É tipo isso mesmo. O bind faz o this apontar/referenciar um certo valor indicado. Essa referência é de forma fixa, fazendo com que o this não varie conforme o contexto. Observe somente que o this sempre faz referência a algo. Quando está diretamente no arquivo, por exemplo, fará, normalmente, referência ao objeto module.exports. Quando chamado dentro de uma função, fará referência ao objeto global.

## this e a função bind #02

- Qual a diferença entre chamar o método falar e falar()?

Usando o falar() ele está invocando a função, enquanto que usando o falar (como em pessoa.falar) ele está somente chamando o método falar. Para invocar diretamente, ele teria que fazer pessoa.falar() que seria o acesso ao método falar() de pessoa.

- Por que usar o new?

O new foi utilizado porque o intuito da função Pessoa é ser uma função construtora, ou seja, um "molde" de onde podemos criar objetos por meio do operador new.

O operador new instancia novos objetos a partir de funções construtoras.

O professor escolheu instanciar um objeto para mostrar como é a interação do this referente a objetos, e como o bind funcionaria nesse quesito, quando o this se refere a um objeto e não a uma função.

- Qual é o mais recomendado, o bind ou o self?

O mais recomendado é o uso do bind. É o mais indicado para quando surge esse tipo de problema. 

- O que ocorre no uso do bind e do self?

O que ocorre é que o *this* varia de acordo com quem chama a função. No caso da *callback*, ela não é chamada a partir de uma instância do objeto *Pessoa*, mas a partir da função *setInterval*. Assim sendo, o *this* não apontará para instância de *Pessoa*. Como esse é um comportamente inesperado, temos que indicar para o *JS* para quem queremos que o *this* aponte, de fato. Por isso usamos o *bind* ou a técnica do *self*.

A estratégia do *self* consiste em armazenar o this que está imediatamente dentro da função, 
que é o que aponta certamente para a instância da função. Desse modo, ao referenciá-lo dentro de setInterval, ele não mudará, por ser uma constante comum.

- Não consigo parar a execução do código!

O atalho para rodar o código é **Ctrl + Alt + N**. ****Para **parar** a execução, o comando é **Ctrl + Alt + M.**

- O que significa "instanciar uma função"?

Instanciar a função é que você vai criar um objeto que tem o comportamento baseado nessa classe ou função.

- Qual a diferença entre atributo e parâmetro?

O atributo é uma variável que foi definida para um objeto, já o parâmetro é a informação que é passada para uma função.

- Por que instanciar se é mais fácil fazer um objeto?

O motivo de ter sido trabalhado dessa forma nessa aula foi apenas para mostrar o comportamento do this nesse contexto de execução.

- Qual a diferença entre Pessoa() e new Pessoa?

O new foi utilizado porque o intuito da função Pessoa é ser uma função construtora, ou seja, um "molde" de onde podemos criar objetos por meio do operador new.

O operador new instancia novos objetos a partir de funções construtoras.

O professor escolheu instanciar um objeto para mostrar como é a interação do this referente a objetos, e como o bind funcionaria nesse quesito, quando o this se refere a um objeto e não a uma função.

No caso, **Pessoa** é a função construtora, e o **new** Pessoa instancia um novo objeto a partir dela, e é daí que o professor queria mostrar a utilidade do bind nesse caso.

## Funções Arrow #01

- As funções arrow devem ter apenas um parâmetro?

Você pode coloca quantos parâmetros quiser, no entanto, mesmo que você use somente um dos parâmetros os outros serão undefined por padrão.

- Qual seria a vantagem e uso para uma função sem parâmetro?

Depende muito do problema que se está querendo resolver, por exemplo pode-se fazer uma função que só retorna uma String ou coisa do tipo, saca só:

```jsx
let texto = 'Olá Mundo!'
    let outroTexto = 'Tchau Mundo!'
     
    const imprimir = () => {
        if(texto){
            console.log(texto)
        }
        
        if(outroTexto){
            console.log(outroTexto)
        }
    }
     
    imprimir()
```

Nesse caso estão sendo impressos os valores de texto e outroTexto, como falei depende do que se está sendo feito.

- Para usar uma Arrow Function é preciso necessariamente armazená-la dentro de uma variável?

Exatamente, só podemos utilizar uma se fizermos alguma atribuição para aquela arrow function (var, let ou const).

- Posso reduzir ainda mais a notação das arrow functions?

Sim, é possível usar uma notação como:

```jsx
ola => 'Olá'
```

Mas dependendo do caso, será melhor usar um param, dessa maneira:

```jsx
ola = _ => 'Olá!'
```

## Funções Arrow #02

- Por que, ao comparar o this dentro do objeto Pessoa com o própro objeto Pessoa, dá falso, sendo que ao imprimir o valor de this, ele diz que pertence ao objeto Pessoa?

O this é usado para referenciar uma determinada variável, como no caso dessa aula.

Vou te explicar um pouco melhor.

Para começar, você pode entender o this pela sua tradução, que é **isto**. Assim, as perguntas mais recorrentes sobre o this ficam mais simples de entender: Ao quê **isto** se refere? Para onde **isto** está apontando?

A grande jogada dele é que ele depende de **contexto**. Se declarado no contexto global, o this vai apontar para o objeto global. Isso seria, por exemplo, se você fizesse a comparação num 
arquivo:

```jsx
console.log(this.document === document); // retorna true
```

O this é, na maioria dos casos, determinado plea forma que uma função é chamada, possuindo diferenças também para os modos estritos e não estritos.

No caso de um modo não estrito ou de chamada simples, o this vai continuar apontando para o contexto global. Por exemplo:

```jsx
function f1(){ 
      return this;
    } 
    // No navegador
    f1() === window; // true
```

No ECMAScript2015 foram introduzidas as arrow functions, cujo this é delimitado lexicalmente (estabelecido de acordo com o escopo no qual está inserido). Por exemplo:

```jsx
var globalObject = this;
    var foo = (() => this);
    console.log(foo() === globalObject); //retorna true
```

O this, no caso, está se referindo ao **objeto criado pela função construtora Pessoa.**

- Por que não precisamos usar os parênteses ao chamar o bind?

Isso acontece porque o próprio bind já cria uma nova função, então na verdade o falarDePessoa = pessoa.falar.**bind(pessoa)** já é a chamada da função. Lembrando que o "falar de" aqui não é no 
sentido de "falar sobre uma pessoa" e sim "o método falar dentro de pessoa".

Você usa os parênteses quando quer fazer a chamada de uma função.

Por exemplo:

```jsx
function soma (a, b){
        return a + b
    }
     
    console.log(soma(2, 3)) //chamada da função passando os parâmetros 2 e 3 dentro do console.log
```

Ou, ainda:

```jsx
function soma (a, b){
        return console.log(a + b) //o console.log já dentro da função para imprimir o valor na tela
    }
     
    soma(2, 3) //chamada simples da função passando os parâmetros
```

- Por que não tem um return na função Arrow?

Quando utilizamos a forma contraída da Arrow Function estamos declarando um retorno implícito, ou seja, tem um return mas não enxergamos ele:

```jsx
const teste = () => console.log('Foi testado'); // Nessa linha depois do => existe um return escondido
    teste()
```

- O que o this referencia em funções arrow?

No contexto global, ela faz referência ao module.exports.

No contexto de um objeto literal, ela faz referência ao module.exports.

No contexto de um função construtora, ela faz referência a própria função construtora.

No contexto de uma função normal, isto é uma função anônima dentro de uma função, ela faz referência ao module.exports

## Funções Arrow #03

- Por que o this de comparaComThis aponta para o escopo global, mas o comparaComThisArrow aponta para o module.exports?

Nas funções arrow, o this **se refere ao contexto léxico** em que a função foi escrita. É por isso que ele não aponta para global, porque a função foi escrita em outro módulo, outro contexto, que não se refere ao escopo global.

Onde essa função for criada, o this referente a ela vai continuar apontando para o module.exports, independente de onde ela for chamada.

Quanto ao this apontar para module.exports, também é questão de escopo. Por exemplo:

```jsx
function teste (){
        return console.log(this === module.exports) //imprime false
    }
    teste() //chamada da função 
     
    console.log(this === module.exports)//imprime true
```

Comparando o this dentro de uma função, retornou false, e comparando fora de uma função, no escopo global, retornou true.

- Posso sempre usar funções arrow no lugar dos outros tipo de função?

Tanto o jeito tradicional quanto as Arrow functions tem suas utilidades. As funções Arrow facilitam a questão do escopo, sim, mas elas tem várias limitações, como por exemplo:

- não são hoisted (por serem sempre anônimas ou atreladas a variáveis);
- não podem ser usadas como construtor (elas tem um this léxico, e não um prototype);
- não contém acesso aos arguments;
- Entendendo o escopo global e local e o funcionamento do this

Existem dois tipos de escopos, escopo global (existe enquanto a aplicação roda) e escopo local (existe enquanto existe o objeto ou função). Precisamos ter em mente que escopo global é diferente de objeto global. É importante saber também que as regras do this variam quando variamos o ambiente de execução, ou seja, o this se comporta de maneira diferente no Node e no Browser. Com essas informações na mente temos que, no Node, observe:

```jsx
//Escopo global
    console.log(this === module.exports); //true
    this.nome = 'Daniel';
    console.log(this); //o atributo nome foi inserido em module.exports
    console.log(this.nome); //Daniel
     
    function digaMeuNome(){
        //escopo local
        console.log(this === global) //no escopo local de funções declaradas no escopo global o this é o objeto global
        this.nome = 'Rafael'; //Se comentar essa linha o resultado do console será undefined
        console.log(this.nome); //Rafael
    }
     
    digaMeuNome(); 
    console.log(global.nome); //this da função declarada no escopo global
    console.log(module.exports.nome);//this do escopo global
     
     
    const objeto = {
        nome: 'Arthur',
        imprimirThis: function(){
            console.log(this)
        },
        digaMeuNome: function(){
            console.log(this.nome)
        }    
    }
     
    objeto.imprimirThis();//No escopo local do objeto declarado no escopo global o this é o próprio objeto. 
    objeto.digaMeuNome();// Arthur.
```

No pequeno código acima é possível reparar que o this em javascript é variável e por isso deve ser estudado com atenção e utilizado com cuidado.

## Funções Anônimas

- O "segredo" por trás do terceiro parâmetro operacao

Foi feita a chamada de uma função dentro de outra função, conceito esse conhecido como função callback.

```jsx
const soma = function (x, y) {
    return x + y
}

const imprimirResultado = function (a, b, operacao = soma) {
    console.log(operacao(a, b))
}

imprimirResultado(3, 4)
imprimirResultado(3, 4, soma)
imprimirResultado(3, 4, function (x, y) {
    return x - y
})
imprimirResultado(3, 4, (x, y) => x * y)

const pessoa = {
    falar: function () {
        console.log('Opa')
    }
}

pessoa.falar()
```

Perceba que, primeiramente, foi declarada a função soma; logo em seguida, armazenada dentro da variável imprimirResultado, uma função (anônima, mas que pode ser invocada por meio de imprimirResultado) recebendo os parâmetros a, b e um terceiro que é uma variável que chama a função soma; dentro de imprimirResultado, é feita a chamada de operacao passando os parâmetros a e b, onde a = x e b = y.

- Para quê usar funções dentro de funções?

Essa pratica existe para evitar que funções fiquem soltas em escopos onde não são necessárias. Por exemplo, vamos supor que você tem uma função que recebe como parâmetro duas coleções e que as duas precisam ser filtradas e manipuladas da mesma forma:

```jsx
function transformar(colecao1, colecao2) {
        // ...
    }
```

Podemos criar manipular as duas da mesma forma, repetindo o código:

```jsx
function transformar(colecao1, colecao2) {
        const transformada1 = colecao1.map((c) => {
            //...
        }).filter(c => {
            //...
        }).reduce((total, valor) => {
            // ...
        })
     
        const transformada2 = colecao1.map((c) => {
            //...
        }).filter(c => {
            //...
        }).reduce((total, valor) => {
            // ...
        })
     
        return { transformada1, transformada2 }
    }
```

Ou podemos fazer uma função dentro de transformar e reaproveitar o código:

```jsx
function transformar(colecao1, colecao2) {
        const funcaoTransformadora = (colecao) => {
            return colecao.map((c) => {
                //...
            }).filter(c => {
                //...
            }).reduce((total, valor) => {
                // ...
            })
        }
        const transformada1 = funcaoTransformadora(colecao1)
        const transformada2 = funcaoTransformadora(colecao1)
     
        return { transformada1, transformada2 }
    }
```

A questão é: "Poderiamos ter colocado a funcaoTransformadora fora da função não?"

Sim,poderíamos, só que não faz muito sentido essa função ficar solta junto com todas as outras funções da sua aplicação, até porque ela só se aplica a essa função.

- Qual a diferença entre uma função normal e uma função anônima?

A diferença é que uma função anônima não é nomeada em sua declaração, embora possa ser atribuída a uma variável/constante e poder, posteriormente, ser referenciada. Essa característica permite que seja passada como um parâmetro de outra função. Por exemplo:

```jsx
var array = [1, 2, 3]
     
    array.forEach( function ( num ) {
        console.log(num)
    })
```

Perceba que essa função que foi definida foi somente para ser usada nesse foreach, não tendo um identificador que permita reutilizá-la depois.

- Por que usar funções anônimas?

Um das utilidades de se colocar uma função dentro de uma constante é para que ela não possa sofrer overwrite. Por exemplo, se você criar a função soma normalmente com a sintaxe:

```jsx
function soma(a, b) {
        return a + b
    }
```

Caso você mais a baixo no código faça função com o mesmo nome, a primeira função soma vai ser substituída pela segunda que você criou. E graças a propriedade do JavaScript chamada de hoisting, onde funções e variáveis são puxadas para cima na hora da execução, caso você crie a 
segunda função, a primeira vai ser substituída mesmo antes da segunda ter sido feita. 

Quando se salva a função numa const você impede isso, já que uma vez definida a const não pode ser redefinida.

## Funções Callback #01

- Como a linguagem sabe exatamente em que parâmetro tem que ser posto o índice e o nome?

O forEach é um método que pode ser chamado a partir de um array. Ele recebe até dois parâmetros, e seus tipos já são pré-definidos. O segundo parâmetro não foi objeto dessa aula e acho que não cabe falar sobre aqui. Já o primeiro parâmetro deve ser uma função que será executada cada vez que o forEach buscar um elemento no array, ou seja, a cada iteração sua sobre o array.

A função que é parâmetro do forEach pode receber até três parâmetros, que são enviados pelo próprio forEach com base no que ele buscou no array (por isso diz-se que é um callback). O primeiro parâmetro da função imprimir vai receber o valor do item da lista recuperado, o segundo o índice correspondente e o terceiro, o próprio array inteiro (que também não foi utilizado na aula).

Na primeira iteração de forEach, ele vai na lista e busca o valor ("Mercedes"), seu indice (0), e o próprio array ["Mercedes", "Audi", "BMW]. Depois de recuperar os valores, o forEach vai chamar a função queé seu parâmetro (imprimir) e, para essa função, passa como parâmetros, nessa ordem, o valor recuperado ("Mercedes") e o índice recuperado (0). Como a função imprimir só tem dois parâmetros, ele não vai passar o próprio array para a função imprimir.

Em cada iteração de forEach, ele chamará essa função que é seu parâmetro e passará para essa função parâmetros, a partir do que buscou na lista. Finalmente respondendo sua pergunta, os nomes dos parâmetros utilizados na função imprimir poderiam ser outros e não faria diferença. Nada tem de especial nos escolhidos na aula.

O primeiro parâmetro, independente de como for chamado, receberá o valor guardado na posição recuperada por forEach na iteração, o segundo receberá o seu índice e o terceiro (que na aula não foi utilizado) receberá o array inteiro. O código poderia ser como abaixo e funcionaria normalmente:

```jsx
const arrayExemplo = ["Banana", "Maçã", "Laranja"]
     
    function fnExemplo(recebeValor, recebeIndice) {
      console.log(`Índice ${recebeIndice}. Valor: ${recebeValor}`)
    }
     
    arrayExemplo.forEach(fnExemplo)
```

A função forEach vai, executa seu trabalho, e, na volta, chama a função fnExemplo. Por isso o nome callback. Terminado todo o processo, após as 3 iterações sobre a lista, terão sido exibidos os seguintes dados no console:

```jsx
Índice: 0. Valor: Banana
Índice: 1. Valor: Maçã
Índice: 2. Valor: Laranja
```

Na primeira iteração, o forEach vai no arrayExemplo e busca três informações: o primeiro valor (Banana), o primeiro índice (0) e o array inteiro (Banana, Maça, Laranja). Na volta, ele chama a função fnExemplo, e tenta passar para ela esses três parâmetros, na ordem citada. Como a 
fnExemplo não tem o terceiro parâmetro, ele não é utilizado. O forEach, na prática, está chamando `fnExemplo("Banana", 0)`.  Depois, chamará `fnExemplo("Maçã", 1)` e, por fim, `fnExemplo("Laranja", 2)`.

Os parâmetros recebeValor e recebeIndice poderiam ser qualquer coisa, como a e b, ou x e y. A nomenclatura utilizada tem mais ver com ter um código limpo e compreensível. Se os nomes não fizessem sentido, seria difícil modificar a mensagem a ser printada no console sem ter que 
revisar todo o código para saber por que aqueles parâmetros estão ali.

## Funções Callback #02

- O que define uma callback?

Uma função callback é uma função que é passada a outra como parâmetro.

Vejam que, no exemplo da aula:

```jsx
const notasBaixas2 = notas.filter(function (nota) {
    return nota < 7
    })
    console.log(notasBaixas2)
```

A const notasBaixas2 recebeu o método filter em cima do Array **notas** (notas.filter()). O filter() é um método que vai, por padrão, receber uma **função como parâmetro** e filtrar um Array de acordo com o que foi estabelecido nessa função passada a ele.

Ou seja, ele sempre recebe uma callback, e no caso vai ser uma que vai retornar os valores se a nota for menor que 7.

As callbacks podem ser tanto síncronas, quando executadas imediatamente, quanto assíncronas, quando são executadas depois de um determinado evento e você não sabe quando exatamente esse evento vai ocorrer.

- Diferenças entre o for e o for... in

O for recebe três expressões, de inicialização, condição e a expressão final, seguidas de uma declaração, que será o código a ser executado pelas vezes determinadas pelas expressões.

```jsx
for (var i = 0; i < 9; i++) {
       console.log(i);
    }
```

O for...in interage sobre propriedades enumeradas de um objeto, na ordem original de inserção.

```jsx
for (variavel in objeto) {...
    }
```

Onde essa **variavel** é uma propriedade diferente do objeto que é atribuída a cada iteração, e **objeto** é o Objeto com as propriedades enumeradas.

Ambas tem as suas utilidades e você pode achar mais prático o uso de uma acima da outra, mas não quer dizer que são iguais ou dispensáveis.

- O filter está diretamente ligado com a callback?

Na verdade Callback é uma função que é usada como "callback". Ela é tipicamente passada como argumento de outra função e/ou chamada quando um evento acontecer, ou quando uma parte de código receber uma resposta de que estava à espera. Para usar callback não necessariamente você precisa usar o filter, mas para usar o filter você precisa usar uma callback para ser chamada quando quiser testar a condição de filtragem.

- Diferença do forEach e filter

De fato são bem parecidas. Mas elas não retornam exatamente a mesma coisa. Enquanto o forEach() apenas executa uma função com cada um dos elementos da array, o filter gera uma nova array com os resultados da função. O filter é literalmente como o nome diz, um filtro, ou seja, você vai passar uma função que vai filtrar alguns valores da array e o filter vai gerar uma array nova com esses elementos.

## Função Callback #03

-
