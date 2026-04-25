module.exports = {
  preset: 'jest-preset-angular',
  testEnvironment: 'jsdom',
  testMatch: ['<rootDir>/src/**/*.spec.ts'],
  moduleFileExtensions: ['ts', 'html', 'js', 'json', 'mjs'],
  transform: {
    '^.+\\.(ts|mjs|js|html)$': [
      'jest-preset-angular',
      {
        tsconfig: '<rootDir>/tsconfig.spec.json',
        stringifyContentPathRegex: '\\.(html|svg)$'
      }
    ]
  },
  transformIgnorePatterns: [
    'node_modules/(?!(@ionic|@stencil|ionicons|.*\\.mjs$))'
  ],
  moduleNameMapper: {
    '^ionicons/components/(.*)$': '<rootDir>/node_modules/ionicons/components/$1'
  },
  collectCoverageFrom: [
    'src/**/*.ts',
    '!src/main.ts',
    '!src/polyfills.ts',
    '!src/**/*.module.ts'
  ],
  coverageThreshold: {
    global: {
      statements: 50,
      branches: 80,
      functions: 35,
      lines: 50
    }
  }
};
