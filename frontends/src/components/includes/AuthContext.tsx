import { createContext } from 'react';

// 1. Get the user synchronously from local storage immediately on load
const getInitialUser = () => {
  const savedUserString = localStorage.getItem('user');
  if (savedUserString) {
    try {
      return JSON.parse(savedUserString);
    } catch (error) {
      console.error("Error parsing user data", error);
      return null;
    }
  }
  return null;
};

// 2. Export the initial user data for use in useState hooks
export { getInitialUser };

// 3. Create context with null default structure
export const UserContext = createContext(null);
