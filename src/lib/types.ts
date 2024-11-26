export type ContentType = 'markdown' | 'text' | 'code';

export interface Post {
  id: string;
  content: string;
  author: {
    name: string;
    avatar: string;
  };
  timestamp: number;
}
