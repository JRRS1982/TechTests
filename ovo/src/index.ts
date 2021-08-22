export const app = (arr: string[], count: number) => {
  let result: string[] = [];

  for (let index = 0; index < count; index++) {
    result.push(arr[index % arr.length]); // modulo here allows us to start from the beginning of the array should the count be larger than the array itself.
  }

  return result;
};
