# Stripeで決済

## Planの必須項目
- currency
- interval
- product
- amount（公式によると無料プランは0を指定するらしい）
- tiers（必須らしいが、デフォルトが設定されてるので不要？何を意味してるパラメータかは現時点では不明）
- tiers_mode（必須らしいが、デフォルトが設定されてるので不要？何を意味してるパラメータかは現時点では不明）
- ちなみにid（オプション）はstripeによってrandomに生成されるらしい
- [公式](https://stripe.com/docs/api/plans/create)に必須項目が書いているので参照

## cardのtoken取得のHTML一式
- https://stripe.com/docs/stripe-js/elements/quickstart

## テスト用クレジットカード番号
- https://stripe.com/docs/testing
- ここに乗ってるのが使える
- 年月日などは適当でOKだが、未来のものを指定しないとエラーになる（クレジットカード番号以外は全部2を入力すればスルーできる）

## 参考文献
- https://qiita.com/Rafflesia/items/5ce936656c6f99c144ef
- https://qiita.com/tady/items/7617e62b2a5402ebd0fb#%E6%9C%89%E6%96%99%E3%83%97%E3%83%A9%E3%83%B3%E3%81%AB%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B
