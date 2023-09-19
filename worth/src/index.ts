export const kataOne = (num: number) => {
  let nums = [];

  for (let index = 0; index < num; index++) {
    if (index % 3 === 0) {
      nums.push(index);
    } else if (index % 5 === 0) {
      nums.push(index);
    }
  }

  return nums.reduce((acc, num) => {
    return acc + num;
  });
};

interface INode {
  value?: string;
  left?: INode;
  right?: INode;
}

const node = ({
  value,
  left,
  right,
}: {
  value?: string;
  left?: INode;
  right?: INode;
}): INode => {
  return { value, left, right };
};

const s = node({ value: "S" });
const u = node({ value: "U" });
const r = node({ value: "R" });
const w = node({ value: "W" });
const d = node({ value: "D" });
const k = node({ value: "K" });
const g = node({ value: "G" });
const o = node({ value: "O" });
const i = node({ value: "I", left: s, right: u });
const a = node({ value: "A", left: r, right: w });
const n = node({ value: "N", left: d, right: k });
const m = node({ value: "M", left: g, right: o });
const e = node({ value: "E", left: i, right: a });
const t = node({ value: "T", left: n, right: m });

const binarySearch = (node: INode | undefined, target: string) => {
  if (!node) {
    return;
  }
  if (target === ".") {
    return node.left;
  } else if (target === "-") {
    return node.right;
  } else if (target === "?") {
    return node;
  }
};

export const kataTwo = (input: string): string[] => {
  let result: string[] = [];
  const root = node({ value: undefined, left: e, right: t });
  let searchNode = root;

  if (!input) {
    return [];
  }

  let tempSearch = input;

  // while there is an input
  while (tempSearch) {
    const searchOption = tempSearch[0]; // find the lowest node
    if (searchOption === "?" && searchNode) {
      if (searchNode.left?.value) {
        result.push(searchNode?.left?.value);
      }
      if (searchNode.right?.value) {
        result.push(searchNode?.right?.value);
      }
      tempSearch = tempSearch.substring(1);
    } else {
      const needle = binarySearch(searchNode, searchOption);
      tempSearch = tempSearch.substring(1);
      if (needle) {
        searchNode = needle;
        if (!tempSearch) {
          if (needle.value) {
            result.push(needle.value);
          }
        }
      }
    }
  }

  return result;
};
