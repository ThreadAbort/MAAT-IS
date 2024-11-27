import { writable } from 'svelte/store';
import type { Principle, PrincipleCategory } from '$lib/types/principles';

// Initial principles data
const initialPrinciples: PrincipleCategory[] = [
  {
    id: 'truth',
    title: 'Truth and Justice',
    description: 'The fundamental principles of Ma\'at relating to truth-telling and just actions',
    principles: [
      {
        id: 'truth-speaking',
        title: 'Speaking Truth',
        hieroglyph: '𓂋',
        description: 'To speak truth in all matters, both great and small',
        modernContext: 'The importance of honesty in communication and data transparency',
        examples: [
          'Being truthful in documentation',
          'Transparent communication in team settings',
          'Accurate reporting of results'
        ],
        relatedPrinciples: ['integrity', 'responsibility']
      }
      // More principles...
    ]
  }
  // More categories...
];

function createPrinciplesStore() {
  const { subscribe, set, update } = writable(initialPrinciples);

  return {
    subscribe,
    addPrinciple: (categoryId: string, principle: Principle) => update(categories => {
      const category = categories.find(c => c.id === categoryId);
      if (category) {
        category.principles = [...category.principles, principle];
      }
      return categories;
    }),
    updatePrinciple: (categoryId: string, principle: Principle) => update(categories => {
      const category = categories.find(c => c.id === categoryId);
      if (category) {
        const index = category.principles.findIndex(p => p.id === principle.id);
        if (index !== -1) {
          category.principles[index] = principle;
        }
      }
      return categories;
    })
  };
}

export const principles = createPrinciplesStore();
