Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A2896FF
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 07:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839566E492;
	Mon, 12 Aug 2019 05:52:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87B6E492
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 05:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=letKwoqZr+8Ej7hDrtbIIb95NcZxMt44j7Ttaq0kvXkxrONb/azoRPFX2JC8YsqTWmfdgDRh2qGoX4sbw0Nfiqc+9pk6hRlyl93m+0+FAptfvIlUnYFjTFK6L+eYEZUf+37a7/K147oKpwz1WzdvHd9k+VbhPHBJXoVieB2Z3Y48DU4H5Bd4CKykWvCeYnhGwjr/hqXnyMxBTpHg0uE4HOcJDhLr14ceVdXpNCle6tSfE+CeyMFyiGRKEdXUmJm061YZ++m2UucWTaKX3k9qlim6qP+bNs8jd3VozRCcy2M1RUE8wb0D116hoPg7wCac0FU4UpeSm5RNebuic8Km6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdaLoguAoozD4fWHLTUMPuvxejBk/KhEl0320iYIJfA=;
 b=G9AVHAmYH6oi1blSPodj3mmBtLsk9nubMvKo1lGC5gzTdKSusAiHziSoI3XypAUxWP1bBDilqchAoD+rG62AblnMKMOeL+HU+fftJRSgRPjShnalwrnweDhQrN/x3tso70Cr+zzJR3verT3rwfeTqoWuy9NAuCHujjlERUCwNqkfhbfyp2049uxHu988vbHb8sbGcj5WvZMnFNZyuQuz3hcZMWj+FW3TjrnIuZZI/nNsnXW/1XdCJwcSef1giMAGGFXVKCMNzJy/Y3zqclDQHN7g0Yq4Z7EkvSJ0xAKQtKd2drVFdUBcCzjtPa6uzvkHdGSINdWfyFuyCApeRnfnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3005.namprd12.prod.outlook.com (20.178.241.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Mon, 12 Aug 2019 05:52:30 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.020; Mon, 12 Aug 2019
 05:52:30 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Index: AQHVTqVxl4iU4NA2yU+GtAOaR4Wqpqb3A2kQ
Date: Mon, 12 Aug 2019 05:52:30 +0000
Message-ID: <MN2PR12MB35988DD56FDB6884A2D009FF8ED30@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
 <1565350016-7071-4-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-4-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e186a6ff-aaa7-481a-cb1f-08d71ee943be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3005; 
x-ms-traffictypediagnostic: MN2PR12MB3005:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30058FC13A5961C0392E7C568ED30@MN2PR12MB3005.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(13464003)(189003)(199004)(4326008)(74316002)(305945005)(110136005)(6116002)(7736002)(26005)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(6246003)(2501003)(76176011)(99286004)(8936002)(102836004)(53546011)(7696005)(6506007)(3846002)(53936002)(11346002)(476003)(316002)(446003)(486006)(186003)(55016002)(66066001)(6306002)(9686003)(71190400001)(71200400001)(52536014)(256004)(8676002)(86362001)(25786009)(81156014)(6436002)(81166006)(14454004)(33656002)(229853002)(5660300002)(966005)(478600001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3005;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dp5CD3IY/sr13WzLkEzMzzHx8RHh+kRvAZlxleuIjeJOKz9SxDQjXV+9482acAHkPcpUBNyUMLcLqMP3ZCKQ4EAZgHEq4+L2SbU0lTTM7Fb6bHMUqJL5T9EW7Cl46znc9PGmuMT5HQArN9QaK0RKDkKQBgj7+P/o6mMeEpclSDNI7ED3JIhzTSKUfOtGWhS/qREN+l0QGHJ6MIcOhtRCjaGkrozqK13OzvUBxkvxiqTI/VkBDa3+H42OW6To0RvnZ0a8iYL3WtnavjfB9a4MUJbbqdPnsGfT5GR8WSLxD2hLZx5QSwcjn6WQIdKLUCKxTxglVuCxG4G4YqSygC63mUKB836BWcThTau8mjxzz3S2TcBocuGhRmc/YUDrRreImyekmD31CvkPBodYv24Xw4njxHOHwvcUedLiEPVCDBQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e186a6ff-aaa7-481a-cb1f-08d71ee943be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 05:52:30.7286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GC3mRPkCZ4/7JUC4ciYC27q5LLKeuL/7xubiIMHlBCJI1fi8n8hFa8gMjGe4P4c2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdaLoguAoozD4fWHLTUMPuvxejBk/KhEl0320iYIJfA=;
 b=d0ynl3n4pnbOkL1n/tI2YHncWjVRovEEWDEI4W/yPauv2SaCpQvW1xUQStAIg32oq8sio/elonoYHEYewtW8kX4Ifp228Q2F1V3MMLsb+cgyZ5tXwXpmHRznRC5WXZUFJGW6qkjKyE7FUuKpunEiWXQUJar/3xIEnzWkMCNmjgA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IFttYWlsdG86YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmIE9mIExlIE1hDQpTZW50OiBGcmlk
YXksIEF1Z3VzdCAwOSwgMjAxOSA3OjI3IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBNYSwgTGUgPExlLk1hQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggNC80XSBk
cm0vYW1kZ3B1OiBlbmFibGUgbW1odWIgY2xvY2sgZ2F0aW5nIGZvciBBcmN0dXJ1cw0KDQpbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCkluaXQgTUNfTUdDRy9MUyBmbGFnLiBBbHNvIGFwcGx5
IHRvIGF0aHViIENHLg0KDQpDaGFuZ2UtSWQ6IEljMDBjYjhlNmQ2OWViNzVkZDMyZjM0Zjc3ODM1
MmNlZTkzMDYzZWUwDQpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYyB8IDEgLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICB8IDQgKysrLQ0KIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbW1odWJfdjlfNC5jDQppbmRleCBlNTJlNGQxLi4wY2Y3ZWY0IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMNCkBAIC02MTUsNyArNjE1LDYgQEAgaW50IG1t
aHViX3Y5XzRfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KICAg
ICAgICByZXR1cm4gMDsNCiB9DQoNCi0vKiBUT0RPOiBnZXQgMiBtbWh1YiBpbnN0YW5jZXMgQ0cg
c3RhdGUgKi8gIHZvaWQgbW1odWJfdjlfNF9nZXRfY2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHUzMiAqZmxhZ3MpICB7DQogICAgICAgIGludCBkYXRhLCBkYXRhMTsNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KaW5kZXggYWVjYmExYy4uMjM1Y2I1YiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCkBAIC0xMTI2LDcgKzExMjYsOSBAQCBzdGF0aWMg
aW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkNCiAgICAgICAgICAgICAg
ICAgICAgICAgIEFNRF9DR19TVVBQT1JUX0hEUF9NR0NHIHwNCiAgICAgICAgICAgICAgICAgICAg
ICAgIEFNRF9DR19TVVBQT1JUX0hEUF9MUyB8DQogICAgICAgICAgICAgICAgICAgICAgICBBTURf
Q0dfU1VQUE9SVF9TRE1BX01HQ0cgfA0KLSAgICAgICAgICAgICAgICAgICAgICAgQU1EX0NHX1NV
UFBPUlRfU0RNQV9MUzsNCisgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX1NE
TUFfTFMgfA0KKyAgICAgICAgICAgICAgICAgICAgICAgQU1EX0NHX1NVUFBPUlRfTUNfTUdDRyB8
DQorICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9NQ19MUzsNCiAgICAgICAg
ICAgICAgICBhZGV2LT5wZ19mbGFncyA9IDA7DQogICAgICAgICAgICAgICAgYWRldi0+ZXh0ZXJu
YWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHgzMjsNCiAgICAgICAgICAgICAgICBicmVhazsN
Ci0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
