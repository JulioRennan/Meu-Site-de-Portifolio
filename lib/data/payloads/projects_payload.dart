library projects_payload;

import 'package:rennan_portifolio/utils/manager_path.dart';
import '../model/project.dart';
import '../model/project_section.dart';
import '../model/tech.dart';

final List<ProjectSection> projectsPayload = [
  ProjectSection(
    title: "Mobile",
    projects: [
      Project(
        title: "Meu site de portifólio",
        description: '''
Eu estava curioso para saber como estava a performance do Flutter para Web.
Conforme fui testando funcionalidades o resultado foi bem positivo e esse é o resultado.@n
Estarei disponibilizando o projeto para quem quiser dar uma estudada no código tem algumas funcionalidades interessantes como:@n

@t + Divisão das funcionalidades em módulos.@n
@t + Extensions no Flutter.@n
@t + Animações com Widgets prontos do Flutter.@n
@t + Animações utilizando AnimationController.@n
@t + Uso do Canvas Kit para desenho de formas personalizadas.@n
@t + Como web no Flutter é relativamente novo o controle de responsividade é apenas uma sugestão, não segue padrão nenhum.@n
      ''',
        statusRepo: StatusRepo.private,
        techs: [
          Tech(
            imagePath: ManagerPath.iconFlutter,
            name: "Flutter",
          ),
        ],
      ),
      Project(
        title: "Manager Uangling",
        description: '''
App para gerenciado de estoque integrado com a plataforma Zoho Inventory.@n
Permitindo realizar todas as funções da plataforma de maneira offline, e depois sincroniza-las de maneira online com as seguintes funcionalidades básicas:@n
@t+ Criar/Deletar item.@n
@t+ Transferir/adicionar/remover itens dos armazéns.@n
@t+ Manipulação de projetos em massa.@n
@t+ Consulta de itens por código de barras.@n@n
 Ps: No momento, o repositório é fechado, mas será reformulado para ser aberto. 
      ''',
        statusRepo: StatusRepo.private,
        techs: [
          Tech(
            imagePath: ManagerPath.iconFlutter,
            name: "Flutter",
          ),
        ],
      ),
      Project(
        title: "Agência Lã",
        description: '''
Projeto em andamento de uma Startup de babás, em que estou responsável pela parte mobile.
Atualmente o projeto se encontra no desenvolvimento do MVP com as seguintes funcionalidades:@n
@t+Criação de contas.@n
@t+Cadastro completo de endereços e crianças que o usuário é responsável.@n
@t+Realização de agendamentos.@n@n

Ps: Repositório Fechado.
      ''',
        statusRepo: StatusRepo.private,
        techs: [
          Tech(
            imagePath: ManagerPath.iconFlutter,
            name: "Flutter",
          ),
        ],
      ),
      Project(
        title: "Festval",
        description: '''
Solução de varejo Android/iOS em que fiquei a frente do código do projeto na parte mobile, 
Enquanto estava na empresa MarketEasy. 
@nCom diversas funcionalidades:
+ Realização de cadastro.@n
+ Listagem/Pesquisa de produtos, por texto ou código de barras.@n
+ Adicionar/Remover produtos do carrinho.@n
+ Pagamentos pelo app.@n@n
Ps: Repositório Fechado.

      ''',
        statusRepo: StatusRepo.private,
        techs: [
          Tech(
            imagePath: ManagerPath.iconFlutter,
            name: "Flutter",
          ),
        ],
      )
    ],
  ),
];
