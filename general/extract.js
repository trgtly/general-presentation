const fs = require('fs');
const readline = require('readline');

async function extract() {
  const fileStream = fs.createReadStream('/Users/iclicks/.cursor/projects/Users-iclicks-Desktop-presentation/agent-transcripts/2fd08559-e013-4801-b1a3-bf7468fb85f3/2fd08559-e013-4801-b1a3-bf7468fb85f3.jsonl');
  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  let fileContent = '';

  for await (const line of rl) {
    try {
      const parsed = JSON.parse(line);
      const msg = parsed?.message;
      if (msg && msg.content && Array.isArray(msg.content)) {
        for (const block of msg.content) {
          if (block.type === 'tool_use') {
            const input = block.input;
            if (input && input.path === '/Users/iclicks/Desktop/presentation/src/components/slides/Slide1.vue') {
              if (block.name === 'Write') {
                fileContent = input.contents;
              } else if (block.name === 'StrReplace') {
                if (fileContent.includes(input.old_string)) {
                  fileContent = fileContent.replace(input.old_string, input.new_string);
                } else if (input.old_string && input.new_string) {
                    // Try to replace ignoring exact whitespace if needed, but simple replace first
                    fileContent = fileContent.replace(input.old_string, input.new_string);
                }
              }
            }
          }
        }
      }
    } catch (e) {}
  }
  
  fs.writeFileSync('extracted_Slide1.vue', fileContent);
  console.log("Done");
}

extract();