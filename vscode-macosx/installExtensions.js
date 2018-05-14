const fs = require('fs')
const { exec } = require('child_process')

const extensions = fs.readFileSync('extensions', { encoding: 'utf-8' }).split('\n')

console.log('Installing extensions...', JSON.stringify(extensions, null, 2))

extensions.forEach(extension => {
  exec(`code --install-extension ${extension}`, (error, stdout, stderr) => {
    if (error) console.log(error)
    if (stdout) console.log(stdout)
    if (stderr) console.log(stderr)
  })
})