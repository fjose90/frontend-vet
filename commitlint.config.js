/** @type {import('@commitlint/types').UserConfig} */
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    // Tipos permitidos para o projeto
    'type-enum': [
      2,
      'always',
      [
        'feat',     // nova funcionalidade
        'fix',      // correção de bug
        'chore',    // tarefas de manutenção (deps, configs, etc.)
        'docs',     // documentação
        'style',    // formatação, sem mudança de lógica
        'refactor', // refatoração sem feat nem fix
        'test',     // adição ou correção de testes
        'perf',     // melhoria de performance
        'ci',       // pipelines e configurações de CI/CD
        'build',    // sistema de build ou dependências externas
        'revert',   // reversão de commit anterior
      ],
    ],
    // Assunto em letra minúscula
    'subject-case': [2, 'always', 'lower-case'],
    // Assunto não pode terminar com ponto
    'subject-full-stop': [2, 'never', '.'],
    // Assunto obrigatório
    'subject-empty': [2, 'never'],
    // Tipo obrigatório
    'type-empty': [2, 'never'],
  },
};
