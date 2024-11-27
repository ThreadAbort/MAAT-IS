export interface Principle {
  id: string;
  title: string;
  hieroglyph: string;
  description: string;
  modernContext: string;
  examples: string[];
  relatedPrinciples: string[];
}

export interface PrincipleCategory {
  id: string;
  title: string;
  description: string;
  principles: Principle[];
} 