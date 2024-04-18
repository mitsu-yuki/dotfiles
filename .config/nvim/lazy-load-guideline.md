# 遅延ロードのガイドライン

- インサートモードに入ったときに読み込む: `InsertEnter`
- バッファを開いたとき: `BufEnter`
- バッファにファイルを開いたとき :`BufRead`
- 起動してしばらくしたときにロードする: `CursorHold`, `CursorHoldI`
- LSPが開始してからロードする: `LspAttach`
