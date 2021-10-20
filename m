Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C994D4344DE
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Oct 2021 07:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091026E1BA;
	Wed, 20 Oct 2021 05:51:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01olkn0162.outbound.protection.outlook.com [104.47.93.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4BC6E1BA
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Oct 2021 05:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOJ9YvnMJdEk/12jbvMzhKBmOMtBcAI3fBy1obEXGGoZoYQyjzZPaAFDPoCRXu4YS+EdJp4kPrHQAPqIANr73Nd3sAZG4jSOD3DsEPANccm51e51z1TK+JUMQHZpFlpDF8ZpDtPX5vIYfQUZxEbsTyc1f1AeJU+9zzCLe9YdNTWubGm6G8lTN6S+51IZ1BlENvRAoVzV7S1p75Xzm7tQJZQrP3JHWUQLh36Wn75l2mJlwLp3aaAD394JhK+e8BYZsZ2Uxsrf3CuEk5Wg8A1XQlhHPwecynmJCtqxYUSGnZePe1IDWYm71fqIK0yz4fCwO7zIac7regNK79RlRbDd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edgLOijBJp+qJEpj+ZFQrgT9AudygwPNxxCPnOnDDbw=;
 b=PnmqluDHA8N1T6G/dFgCd/d3rMoAvrwO4zOTDapEgc5dDPXnfR7F9DfIMRI6ccmhF5m0AsiBvpYtEfCM6wX4TYCRw0gO1WB2LRZRDWcv5GFEe0IBY0fcAeAEop9SWo2wFP/aPuZ8OZ0KHKyhYgV40H6tOvnU7FZf4hRFqIbn3XEnXVDs0eszBpQq7aAHG67Rj3K6txaC5nuCMVuspMjX/JfDuXaKSMc6KIlOKtzSO662V9UlMK3G/6deKc3Um2e0Ojey8DWYBRzPOkqblxqKn//+EWy3ifTUr8pbXorkGlkWn79GIPoUVASuQ0zb7tRLGGRX1B8p6PUTzwfBovEysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edgLOijBJp+qJEpj+ZFQrgT9AudygwPNxxCPnOnDDbw=;
 b=DcrioSlr0fNxDKRnDsGLzHqYqs+wkJRLX0SrGkrmX2iRjCYnR9NuLMyMRknOhpaNvoa2qzYkayXeug+H3z9IZLI7oyzJokjGQke4hIcQ/9AmqIY0OtkyX17TZ+TRRFqB6bk8eKXzvkZyDX0r1HhuSjRytiomq1Ro0ROkjEZLfDBcPGOccuIEzm32QXBQet5vKKcd7mVaCF5XfS85KzASU6ZmapPJn+IFkYZMo53d5Wp73KGUvZp9UAP8Y9mmkh+7sFfw1+bQa/YtfWpdc4dqrpXoOHxwJ1EzHVFvhyXeTxmk7KDMwV9BhIZrOXfXRkES9S06AmgRGtpSJrpbC2AqiA==
Received: from TYYP286MB1066.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:cb::9) by
 TYCP286MB0991.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15; Wed, 20 Oct 2021 05:51:06 +0000
Received: from TYYP286MB1066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::196e:7c44:c00a:f853]) by TYYP286MB1066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::196e:7c44:c00a:f853%9]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 05:51:06 +0000
From: =?gb2312?B?zfUgu+E=?= <whwonderful@outlook.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: subscribe to the mailing list
Thread-Topic: subscribe to the mailing list
Thread-Index: AQHXxXZzp225dIkmNUeHFUBZVP6kXQ==
Date: Wed, 20 Oct 2021 05:51:06 +0000
Message-ID: <TYYP286MB1066938C836F7558ADFA420DB9BE9@TYYP286MB1066.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a4ad9803-6a91-d531-aeca-0dc2af29f355
x-tmn: [Y5eIV1WonC9tqtyL2C3rH6fudf9JDd5aCGoy9UMm4qI=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e30e54f6-bc6e-421d-b6ef-08d9938d9be7
x-ms-traffictypediagnostic: TYCP286MB0991:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5od2PNGes1DhyZHQ9U4ZF00UAywikpUrQ0EtpM1i+fBX0Uek925FkxQo5rKB8q07PjqLjqjeXJUtQihLKk26dftnOHpwKB3RL/ZE6WDEwiC8ZYjRxglLotTGsSdS/B0fuHnFNtPeAhhJrLHCgf30c4kdpMLiMKUtegjJqL5oZUrP+Dd0raCWSXNu8bYF740Ay1RnnQiooM0NwP6XFfAbjZsQjLFJaFwmArHLXpX0ZHXNwiPXqo0f6rFkxYNJVKqiz6qOJeBwEvLKBjszvHlqeEOJwvRcyxTyTGruEmXY+Q=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: VOFMtVMh1VfedPTvPqux2p6vpFz5THu6KO2/b+GNpxKCO5baAyjXsjTDXbEUR5pAslkjRbRH2RhYf/ETucR7mmE/v00BEKqlTTBcC5NaF5fKZ3T2BEcDjhk9A7JKEAEo9+D9OyRKVcKEdyUoTXEsvM8qfKB33bYZK4Hktcf/5RXaYlf24RwOR6qX3DRMMEazBkF56eAk81qp7o0bbDu8u95sP3C2PAf1EfVjbmsCo+w1wTYEOoJ6dJOtB6naIq9qS+LC3n0uTcTcst6YIYAyKRr4MZxv2XdzACjpxTKB5Q4WYWg7wlX0wdLjQcOTajotZ0yxIYO891zaSvxoE0oa7J8gZ3TxHQpWAyb1tmiNd8I+qTu/Bbr0wMka3ABmLDm6pTMga8Vdqw0f2/0s9nWnUgXXXLZ4NowX1f3un/gErZH3jdO5AICNNfiqpJNeeDpm4LVlijIyP64McDYqSKC6Tm4iJiV+HokLJtnoOSILsiE++W21R13v7+tIiiAY9N2zv+TylK0I5z5yXjv3qBc094ypxN3Mxp6ERe0Z3AiU3UFfiK8KcweKzqpdqQCsjJuu/Kn0rPWbcvJZtwRL5Mqa9FEbVNMcqhPMm47Sb9MBsErS2rBdHY3LRBuldFqb69f37RyT6WFmAnA49ktxX9NR7OgJGC43mOuDt+vPifWguKfjQq1tIEU7thsZN+zWEt/ApPPYZSxJ7JccrinlifjSIW100S01cBDPXB1+CVb1TEOfyb4kfo7FgDZc50oj147mhO91HfnXVSlCvleF/lkrAdxno8k7+ZpsCMCCjs+QiC75eXEPt3Np60AzX+DNZc5GpWhroahX2WPUloxV+bYwCg==
Content-Type: multipart/alternative;
 boundary="_000_TYYP286MB1066938C836F7558ADFA420DB9BE9TYYP286MB1066JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1066.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e30e54f6-bc6e-421d-b6ef-08d9938d9be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 05:51:06.4175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-userprincipalname: whwonderful@outlook.com
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0991
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_TYYP286MB1066938C836F7558ADFA420DB9BE9TYYP286MB1066JPNP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmtzIQ0K

--_000_TYYP286MB1066938C836F7558ADFA420DB9BE9TYYP286MB1066JPNP_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks!</div>
</body>
</html>

--_000_TYYP286MB1066938C836F7558ADFA420DB9BE9TYYP286MB1066JPNP_--
