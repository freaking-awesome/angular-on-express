var APW= require('apw')
,   fs= require('fs')
,   exec= require('child_process').exec

exports.getArch= function() { return new APW.Arch().

    /*/
     * Сборка исходников
     */
    setNode({ getId: function () { return 'build' }
    ,   run: function () {
            console.log('build src...')
            coffee= exec('coffee --compile --bare --output app/ src/')
            coffee.stdout.pipe(process.stdout)
            coffee.stderr.pipe(process.stderr)
            coffee.on('exit', function (status) {
                if (0 === status) {
                    console.log('src :)')
                }
            })
        }
    }).

    /*/
     * Сборка манифеста
     */
    setNode({ getId: function () { return 'package.json' }
    ,   run: function () {
            var yaml= require('js-yaml')
            console.log('build package.json...')
            fs.readFile('src/package.yaml', 'utf8', function (err, data) {
                if (err) throw err
                try {
                    fs.writeFile('app/package.json', JSON.stringify(yaml.load(data), null, 2), function (err) {
                        if (err) throw err
                        console.log('app/package.json :)')
                    })
                } catch (e) {
                    throw e
                }
            })
        }
    }).

    setNode({ getId: function () { return 'all' }
    ,   run: function () {
            console.log('сборка завершена')
        }
    }).

    link(['build', 'package.json'], 'all')
}