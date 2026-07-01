import json

try:
    with open('/Users/iclicks/.cursor/projects/Users-iclicks-Desktop-presentation/agent-transcripts/2fd08559-e013-4801-b1a3-bf7468fb85f3/2fd08559-e013-4801-b1a3-bf7468fb85f3.jsonl', 'r') as f:
        file_content = ""
        for line in f:
            try:
                data = json.loads(line)
                if 'message' in data and 'content' in data['message']:
                    for block in data['message']['content']:
                        if block.get('type') == 'tool_use' and block.get('name') in ['Write', 'StrReplace']:
                            input_data = block.get('input', {})
                            if input_data.get('path') == '/Users/iclicks/Desktop/presentation/src/components/slides/Slide1.css':
                                if block['name'] == 'Write':
                                    file_content = input_data.get('contents', '')
                                elif block['name'] == 'StrReplace':
                                    old = input_data.get('old_string', '')
                                    new = input_data.get('new_string', '')
                                    if old in file_content:
                                        file_content = file_content.replace(old, new)
            except Exception as e:
                pass
        
        with open('extracted_Slide1.css', 'w') as out:
            out.write(file_content)
        print("Done css")
except Exception as e:
    print(f"Error: {e}")
