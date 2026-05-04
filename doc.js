try {
const data = JSON.parse(process.argv[2])

if (data.length === 1 && data[0].description.summary.length === 0) {
    process.exit()
}

for (const info of data) {
    if (info.description.summary.length > 0) {
        const title = info.description.summary.split(/<[^>]+>/).join("")
        const prefix = title.split("_")[0]
        switch (prefix) {
            case "a":
                console.log(`## ${title}`)
                console.log(info.description.body)
                console.log(`
\`\`\`javascript
${info.code.split('{')[0]}
\`\`\``)
                break

            case "c":
                console.log(`## ${title}`)
                console.log(info.description.body)
                break
            
            case "m":
                console.log(`## ${title}`)
                console.log(info.description.body)
                console.log(`
\`\`\`javascript
${info.code}
\`\`\``)
                break

            default:
                break
        }
        // info.description.summary.split(/<[^>]+>/).join("")
        // info.code.split('{')[0]
    }
}

} catch (e) {}