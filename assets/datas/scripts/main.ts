import { Worker } from 'worker_threads'
import { createWriteStream } from 'fs'
import http from 'http'
import path from 'path'
import process from 'process'
import express from 'express'


class ArgParser {
    constructor() {
        this.args = process.argv.slice(2);
        this.parsed = this.parse();
    }
    parse() {
        const result = {};
        const positional = [];
        for (let i = 0; i < this.args.length; i++) {
            const arg = this.args[i];
            if (arg.startsWith('--')) {
                const [key, value] = arg.substring(2).split('=');
                if (value !== undefined) {
                    result[key] = this.parseValue(value);
                } else {
                    const nextArg = this.args[i + 1];
                    if (nextArg && !nextArg.startsWith('-')) {
                        result[key] = this.parseValue(nextArg);
                        i++;
                    } else {
                        result[key] = true;
                    }
                }
            } else if (arg.startsWith('-') && arg.length === 2) {
                const key = arg.substring(1);
                const nextArg = this.args[i + 1];
                if (nextArg && !nextArg.startsWith('-')) {
                    result[key] = this.parseValue(nextArg);
                    i++;
                } else {
                    result[key] = true;
                }
            } else {
                positional.push(arg);
            }
        }

        result._ = positional;
        return result;
    }

    parseValue(value) {
        if (/^\d+$/.test(value)) {
            return parseInt(value);
        }
        if (value === 'true') return true;
        if (value === 'false') return false;
        if (value.startsWith('{') || value.startsWith('[')) {
            try {
                return JSON.parse(value);
            } catch (e) {
                return value;
            }
        }
        return value;
    }

    get(key, defaultValue = null) {
        return this.parsed[key] !== undefined ? this.parsed[key] : defaultValue;
    }

    has(key) {
        return this.parsed[key] !== undefined;
    }

    all() {
        return this.parsed;
    }

    positional() {
        return this.parsed._ || [];
    }

    help() {
        console.log(`
Usage: node script.js [Options] [Args...]
Options:
  -h, --help
  --frontend_port
  --backend_port
  --data_dir
  --work_dir
        `);
    }
}

let dataDirPath: string
let workDirPath: string

let subStoreFrontendServer: http.Server
let subStoreBackendWorker: Worker

function dataDir(): string {
    return dataDirPath
}

function subStoreDir(): string {
    return path.join(workDirPath, 'substore')
}

function logDir(): string {
    return path.join(workDirPath, 'substore-logs')
}

function substoreLogPath(): string {
    const date = new Date()
    const year = date.getFullYear()
    const month = String(date.getMonth() + 1).padStart(2, '0')
    const day = String(date.getDate()).padStart(2, '0')
    const name = `sub-store-${year}-${month}-${day}`
    return path.join(logDir(), `${name}.log`)
}

async function startSubStoreFrontendServer(port: number): Promise<void> {
    const subStoreHost = '127.0.0.1'
    await stopSubStoreFrontendServer()

    const app = express()
    app.use(express.static(path.join(dataDir(), 'sub-store-frontend')))
    subStoreFrontendServer = app.listen(port, subStoreHost)
}

async function stopSubStoreFrontendServer(): Promise<void> {
    if (subStoreFrontendServer) {
        subStoreFrontendServer.close()
    }
}

async function startSubStoreBackendServer(port: number): Promise<void> {
    const subStoreHost = '127.0.0.1';
    const subStoreBackendSyncCron = '';
    const subStoreBackendDownloadCron = '';
    const subStoreBackendUploadCron = '';

    await stopSubStoreBackendServer()

    const stdout = createWriteStream(substoreLogPath(), { flags: 'a' })
    const stderr = createWriteStream(substoreLogPath(), { flags: 'a' })
    const env = {
        SUB_STORE_BACKEND_API_PORT: port.toString(),
        SUB_STORE_BACKEND_API_HOST: subStoreHost,
        SUB_STORE_DATA_BASE_PATH: subStoreDir(),
        // SUB_STORE_BACKEND_CUSTOM_ICON: icon.toDataURL(),
        SUB_STORE_BACKEND_CUSTOM_NAME: 'Clash Party',
        SUB_STORE_BACKEND_SYNC_CRON: subStoreBackendSyncCron,
        SUB_STORE_BACKEND_DOWNLOAD_CRON: subStoreBackendDownloadCron,
        SUB_STORE_BACKEND_UPLOAD_CRON: subStoreBackendUploadCron,
        SUB_STORE_MMDB_COUNTRY_PATH: path.join(dataDir(), 'country.mmdb'),
        SUB_STORE_MMDB_ASN_PATH: path.join(dataDir(), 'ASN.mmdb')
    }
    subStoreBackendWorker = new Worker(path.join(dataDir(), 'sub-store-backend/sub-store.bundle.cjs'), {
        env: env
    })
    subStoreBackendWorker.on('message', (message) => {
        console.log(`message: ${message}`);
    });
    subStoreBackendWorker.on('error', (error) => {
        console.log(`error: ${error}`);
    });
    subStoreBackendWorker.on('exit', (code) => {
        console.log(`exit: ${code}`);
    });
    subStoreBackendWorker.stdout.pipe(stdout)
    subStoreBackendWorker.stderr.pipe(stderr)
}

async function stopSubStoreBackendServer(): Promise<void> {
    if (subStoreBackendWorker) {
        subStoreBackendWorker.terminate()
    }
}

async function init(): Promise<void> {
    const parser = new ArgParser();
    const args = parser.all();
    //console.log('args:', args);
    dataDirPath = args.data_dir
    workDirPath = args.work_dir
    await startSubStoreFrontendServer(args.frontend_port)
    await startSubStoreBackendServer(args.backend_port)
    console.log('started');
}

init();