# truffle-polygon
Publishing polygon network tokens with truffle


# Wiki

[Polygon Wiki](https://wiki.polygon.technology/ko/)

[Introduction to Polygon PoS | Polygon Wiki](https://wiki.polygon.technology/docs/develop/getting-started)

# Open API

[Swagger UI](https://open-api-staging.polygon.technology/api-docs/#/)

# 폴리곤(MATIC)네트워크를 지원하는 지갑

- MetaMask
    - 이더리움 및 이더리움 기반 토큰 지원
    - iOS, android 앱, 크롬 익스텐션 지원
- Coinbase wallet
    - 멀티서명 제공
    - iOS, android 앱, 크롬 익스텐션 지원
- TokenPoket
    - 멀티서명, 2fa, 오픈 소스 코드, 브릿지 기능 제공
    - 모바일, 크롬 익스텐션, 하드웨어 지갑 지원
    - 국내 지사 운영 [https://medium.com/token-pocket-kr](https://medium.com/token-pocket-kr/%ED%86%A0%ED%81%B0%ED%8F%AC%EC%BC%93-%EC%B4%88%EB%B3%B4-%EC%82%AC%EC%9A%A9%EC%9E%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EA%B0%80%EC%9D%B4%EB%93%9C-e1d75f532408)
- Ledger
    - 콜드월렛, 핫월렛 모두 지원하지만 콜드월렛이 주력인듯
- Venly
    - 개발자 문서 정리가 잘 되어 있는 듯 보임
- D’CENT
    - 국내 커스터디 솔루션
    - 콜드월렛, 핫월렛 모두 지원
- 그 외 종류가 매우 다양하나 대부분 기능적으로 특별한 부분이 없어보임
- 지갑은 커스텀 하지 않고 제공하는 그대로 연동하는게 가장 나아보임 (메타마스크)

# 폴리곤 네트워크 기반 토큰 개발 시 사용되는 언어

- 이더리움과 동일한 언어 사용 (Solidity)
- 이더리움 네트워크(ERC-20)와 폴리곤 네트워크(Polygon)가 혼재
    - 초기에 이더리움 네트워크를 사용하다가 폴리곤 메인넷이 나온 뒤 폴리곤 네트워크 사용하는것으로 보임
    - 국내 거래소는 ERC-20으로 상장
    - 일부 거래소에서는 두 체인 혼재해서 사용 (출금 시 체인 선택지)
    - 폴리곤 메인넷 → ERC-20 브릿지 기능 존재
- 스마트 컨트랙트 작성

## 폴리곤 네트워크 기반 커스텀 토큰 발행하기

- ERC-20
    - Remix 이용
        - openzeppelin code를 이용해 메타마스크와 연동까지 가능
    - VScode 이용
        - `yarn global add truffle@5.4.30`
        - `yarn install`
        - `yarn truffle init`
        - `yarn add @openzeppelin/contracts` → 이더리움 표준 스마트 컨트랙트 라이브러리
        - `yarn add @truffle/hdwallet-provider`
        - `truffle init` 완료 후 MetaMask 폴리곤 네트워크 지갑 연결
        - `.secret` 파일 생성 (MetaMask mnemonic key 입력)
        - `truffle-config.js` 파일 수정
            
            ```jsx
            const HDWalletProvider = require("@truffle/hdwallet-provider");
            const fs = require("fs");
            const mnemonic = fs
              .readFileSync(__dirname + "/.secret")
              .toString()
              .trim();
            ...
            ...
            networks: {
                development: {
                  host: "127.0.0.1", // Localhost (default: none)
                  port: 8545, // Standard Ethereum port (default: none)
                  network_id: "*", // Any network (default: none)
                },
                polygon: {
                  provider: () => new HDWalletProvider(mnemonic, `https://polygon-rpc.com`),
                  network_id: 137,
                  confirmations: 2,
                  timeoutBlocks: 200,
                  gasPrice: 500000000000,
                  skipDryRun: true,
            		},
            },
            ...
            ...
            compilers: {
                solc: {
                  version: "0.8.11",
                  settings: {
                    optimizer: {
                      enabled: true,
                      runs: 1000,
                    },
                  },
                },
              },
            },
            ```
            
            그 외 파일들에서 solidity 버전 수정 
            
            ```solidity
            pragma solidity ^0.8.0;
            ```
            

## 토큰 발행

### Source code

[GitHub - hyeonmyung/truffle-polygon: Publishing polygon network tokens with truffle](https://github.com/hyeonmyung/truffle-polygon)

### Version

```bash
Truffle v5.7.4 (core: 5.7.4)
Ganache v7.7.3
Solidity - 0.8.17 (solc-js)
Node v14.19.0
Web3.js v1.8.1
```

### 토큰 발행 커맨드

```bash
truffle migrate --network polygon --reset
```
