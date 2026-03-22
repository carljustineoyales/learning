import anthropic

client = anthropic.Anthropic(api_key="your-api-key-here")

print("Connection test...")

response = client.messages.create(
    model="claude-haiku-4-5-20251001",
    max_tokens=100,
    messages=[
        {"role": "user", "content": "Say: connection successful"}
    ]
)

print(response.content[0].text)