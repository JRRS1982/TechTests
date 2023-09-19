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



/**
 *
 * kataThree... using DOMParser which isn't available in the test env
 *
 */
// export const kataThree = (markdown: string) => {
//   if (!markdown) {
//     return;
//   }

//   let text = "";

//   // handle html text
//   const parser = new DOMParser();
//   const doc = parser.parseFromString(markdown, "text/html")
//   // remove html tags
//   if (doc.body.firstChild) {
//     if (doc.body.firstChild.textContent) {
//       markdown = doc.body.firstChild.textContent;
//     }
//   }

//   let isError;
//   let size = 0;
//   const splitWords = markdown.split(" ");

//   // remove space from first word
//   if (!splitWords[0]) {
//     splitWords.shift();
//   }

//   // handle a case where the string starts with a space
//   if (markdown[0] === " ") {
//     markdown = markdown.substring(1);
//   }

//   // error if invalid hash count
//   if (splitWords[0].length > 6) {
//     return markdown;
//   }

//   // error if first word is not all hash
//   Array.from(splitWords[0]).forEach((char) => {
//     if (char !== "#") {
//       isError = markdown;
//     } else {
//       size++;
//     }
//   });

//   text = markdown.substring(size + 1);

//   return isError || `<h${size}>${text}</h${size}>`;
// };


const removeStartSpace = (md: string) => {
  let emptySpaces = 0;
  for (let index = 0; index < md.length; index++) {
    if (md[index] === " ") {
      emptySpaces++;
    } else {
      break;
    }
  }

  // handle a case where the string starts with a/multiple spaces
  if (emptySpaces) {
    md = md.substring(emptySpaces);
  }
  return md;
}

const removeEndSpace = (md: string) => {
  let emptySpaces = 0;
  for (let index = md.length - 1; index >= 0; index--) {
    if (md[index] === " ") {
      emptySpaces++;
    } else {
      break;
    }
  }

  // handle a case where the string ends with a/multiple spaces
  if (emptySpaces) {
    md = md.substring(0, md.length - emptySpaces);
  }
  return md;
}

// prior to using DOMParser
export const kataThree = (markdown: string) => {
  if (!markdown) {
    return;
  }

  let isError;
  markdown = markdown.replace(/<[^>]+>/g, "");

  markdown = removeStartSpace(markdown);
  markdown = removeEndSpace(markdown);

  let size = 0;
  const splitWords = markdown.split(" ");

  if (!splitWords[0]) {
    splitWords.shift();
  }

  // error if first word is not all hash
  Array.from(splitWords[0]).forEach((char) => {
    if (char !== "#") {
      isError = markdown;
    } else {
      size++;
    }
  });

  // test for invalid hash count
  if (splitWords[0].length > 6) {
    return markdown;
  }

  let text = markdown.substring(splitWords[0].length + 1);
  text = removeStartSpace(text);

  return isError || `<h${size}>${text}</h${size}>`;
};