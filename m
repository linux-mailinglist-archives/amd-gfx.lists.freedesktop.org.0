Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B718C9A568
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 04:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1886EBAE;
	Fri, 23 Aug 2019 02:17:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F936EBAF
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 02:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBKdjnGh4HJf8SMADtK27h3p6vDvWCdJDGZzTTBB+9fuS/cqJtjr+EhFS2++xrpzWgfudhzb8ClkGT1TOsS6uL4SvcaJP7pi+z9cOTEASN7M3JAtgcS3X+N2DabRuhFOV5RUkYinXMcD27Uy7DrMUQor40+5S2+3QczPD1qCWuuZpZwTj1IQX9EtoWbZenNVgavqbW36apNeoaOKuGaNuuRBgOrpy6Oe/+uClWYtk4cI1ecHyW6yyr/QuM76HDtzmmLyPkj29Oz9xrkv0E5naU/T1dkE/QQrLdwAuYAufmcEoCgoV7IQaN1fAf2ZjkIpFFyJwWfFsxsqptq+LTKCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvUoNqEPjqV/YxrgKNZFwnpWfpjZdTk9XRkhFJ7KNww=;
 b=QI+rW2f5zSxXqSOzQiu/5f9+TwV7SzsHOz7GHxgu3JaR7Z0bqNpXfQx+e9PkDaxBH99H78I4uTkCOstCaPHOsUI3Qt6+JqgDU+xDaUskAa6rODa0YQy7t7efIH6yhbo1IYMnQYyIWbgZ+SWAXi6FEKwGfwb3oCwUi1jZXwFlumdeqxMV1836cjOH4+dg1iwFOe71dsMqNR3swPpYANjge0sh9Jd0mQTnx+vdTpA32i7GmOEjWktsJ/jCckospe/cm9rt0E59nyqGNn02MEGEX3QtWJ0WHe5yUTZ3WBBkAY8hLLumfjziVM7vnbKahL3s3sCcAxuXfPetrtAJj3YRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4334.namprd12.prod.outlook.com (52.135.48.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 02:16:56 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 02:16:56 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Topic: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Index: AQHVWFtfk9XNdJTaO0iRi1uReYMRJ6cGhsbggAC/D4CAALrUAA==
Date: Fri, 23 Aug 2019 02:16:56 +0000
Message-ID: <MN2PR12MB305437611047FDE19ACC251AB0A40@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566417719-1528-1-git-send-email-andrey.grodzovsky@amd.com>
 <1566417719-1528-2-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054832C9FC9C73A7F9AD539B0A50@MN2PR12MB3054.namprd12.prod.outlook.com>
 <ce52910d-0d1f-402c-7cd0-a8a283a2cda8@amd.com>
In-Reply-To: <ce52910d-0d1f-402c-7cd0-a8a283a2cda8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15f9f7c4-1137-4138-5f4a-08d7276ff8db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4334; 
x-ms-traffictypediagnostic: MN2PR12MB4334:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4334D0D12B10C8BAAB4D403DB0A40@MN2PR12MB4334.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(13464003)(199004)(189003)(110136005)(53936002)(86362001)(6246003)(5660300002)(52536014)(966005)(30864003)(486006)(11346002)(66066001)(446003)(76176011)(6306002)(6436002)(316002)(53946003)(186003)(14454004)(476003)(3846002)(6116002)(305945005)(102836004)(66446008)(2906002)(64756008)(66556008)(76116006)(2501003)(7736002)(99286004)(9686003)(256004)(33656002)(6506007)(8676002)(8936002)(81166006)(4326008)(53546011)(66476007)(25786009)(14444005)(55016002)(71190400001)(81156014)(26005)(229853002)(478600001)(66946007)(7696005)(74316002)(71200400001)(54906003)(461764006)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4334;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bV+HOpQ+Fij+SeHIDEp2qzMee6+Iy5TWvCMO9vl1iy4l08juzkpeqiWNesmijRaB/cRY3YR8NBVROQLaQ4lI5f60hqClpDUxRMZRq/Vl3v6+tyrAlDtF2TPfcnkDCg13j39CQtRaMMcKnM9kKA/OIP8szBF6cTC2DR2n7kb8RphmJ3xqgPF8wqdtRDNwmZCZ84vvua1VDGuqJ3hMo9SKp7qYZQlih7rZBFv5Zzbo/KR3eikk6NLcjDe1bK1+zckelISfNGpMBUvmbJQ2vuVnzi9fTQ5yHMqb3YLz9N2w+0byJ1pSko5xhitAfyYdHFYEdCId+mHjf1yXFmhaHzCXkOUyFuybVdydMgXFijMfsosrjTl1AfJcRfclHZDRpHd5aeZw5Kfo08phrW18MtxGQwoazR1AH7csGgJnyNDjKkk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f9f7c4-1137-4138-5f4a-08d7276ff8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 02:16:56.4874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfqEPRd+Bv3uloXjF7YgwjTxro1kyzXiQSmC3PvgdC9HnoTFZ1ezdd+4JhMAsERS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvUoNqEPjqV/YxrgKNZFwnpWfpjZdTk9XRkhFJ7KNww=;
 b=gFaAHTzezyou3yf2p97i3iBakmM12B1hqEY/Qvr9BvInyqYv8daCOz4R8jO0PORs4FIq1WzKlzYQWrityi+8bcPkAZufa+Vy2noz4frW0RYMxY81w1gmYOiHOQKUrJZk26664Q8+HtyL0sBIBR1VnGb8ljm2kXsHxyrlE64jj5U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Panariti, David" <David.Panariti@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Tuikov, 
 Luben" <Luben.Tuikov@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCkZyb206IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4g
DQpTZW50OiAyMDE55bm0OOaciDIy5pelIDIzOjA3DQpUbzogWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWku
UGFuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgVHVp
a292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+OyBMYXphciwgTGlqbyA8TGlqby5MYXph
ckBhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBQYW5hcml0aSwgRGF2
aWQgPERhdmlkLlBhbmFyaXRpQGFtZC5jb20+OyBSdXNzZWxsLCBLZW50IDxLZW50LlJ1c3NlbGxA
YW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS80XSBkcm0vYW1kZ3B1OiBBZGQgUkFT
IEVFUFJPTSB0YWJsZS4NCg0KDQpPbiA4LzIyLzE5IDEyOjEzIEFNLCBaaG91MSwgVGFvIHdyb3Rl
Og0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNr
eSBtYWlsdG86YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbQ0KU2VudDogMjAxOeW5tDjmnIgyMuaX
pSA0OjAyDQpUbzogbWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1
Y2hlciwgQWxleGFuZGVyIG1haWx0bzpBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tOyBQYW4sIFhp
bmh1aQ0KbWFpbHRvOlhpbmh1aS5QYW5AYW1kLmNvbTsgWmhhbmcsIEhhd2tpbmcgbWFpbHRvOkhh
d2tpbmcuWmhhbmdAYW1kLmNvbTsNClR1aWtvdiwgTHViZW4gbWFpbHRvOkx1YmVuLlR1aWtvdkBh
bWQuY29tOyBMYXphciwgTGlqbyBtYWlsdG86TGlqby5MYXphckBhbWQuY29tOw0KUXVhbiwgRXZh
biBtYWlsdG86RXZhbi5RdWFuQGFtZC5jb207IFBhbmFyaXRpLCBEYXZpZA0KbWFpbHRvOkRhdmlk
LlBhbmFyaXRpQGFtZC5jb207IFJ1c3NlbGwsIEtlbnQgbWFpbHRvOktlbnQuUnVzc2VsbEBhbWQu
Y29tOyBaaG91MSwNClRhbyBtYWlsdG86VGFvLlpob3UxQGFtZC5jb207IEdyb2R6b3Zza3ksIEFu
ZHJleQ0KbWFpbHRvOkFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20NClN1YmplY3Q6IFtQQVRDSCB2
NCAxLzRdIGRybS9hbWRncHU6IEFkZCBSQVMgRUVQUk9NIHRhYmxlLg0KDQpBZGQgUkFTIEVFUFJP
TSB0YWJsZSBtYW5hZ2VyIHRvIGVhbmJsZSBSQVMgZXJyb3JzIHRvIGJlIHN0b3JlZCB1cG9uDQph
cHBlYXJhbmNlIGFuZCByZXRyaXZlZCBvbiBkcml2ZXIgbG9hZC4NCg0KdjI6IEZpeCBzb21lIHBy
aW50cy4NCg0KdjM6DQpGaXggY2hlY2tzdW0gY2FsY3VsYXRpb24uDQpNYWtlIHRhYmxlIHJlY29y
ZCBhbmQgaGVhZGVyIHN0cnVjdHMgcGFja2VkIHRvIGRvIGNvcnJlY3QgYnl0ZSB2YWx1ZSBzdW0u
DQpGaXggcmVjb3JkIGNyb3NzaW5nIEVFUFJPTSBwYWdlIGJvdW5kcnkuDQoNCnY0Og0KRml4IGJ5
dGUgc3VtIHZhbCBjYWxjdWxhdGlvbiBmb3IgcmVjb3JkIC0gbG9vayBhdCBzaXplb2YocmVjb3Jk
KS4NCkZpeCBzb21lIHN0eWxlIGNvbW1lbnRzLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSBtYWlsdG86YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbQ0KLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMiArLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICAgICAgfCAgIDMgKw0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCA0ODINCisrKysrKysrKysr
KysrKysrKysrKysrKysNCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVw
cm9tLmggfCAgOTAgKysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDU3NiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQNCmRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQpiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L01ha2VmaWxlDQppbmRleCAyOGQ3NmJkLi5mMDE2Y2YxIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L01ha2VmaWxlDQpAQCAtNTQsNyArNTQsNyBAQCBhbWRncHUteSArPSBhbWRncHVfZGV2
aWNlLm8gYW1kZ3B1X2ttcy5vIFwNCiAJYW1kZ3B1X2d0dF9tZ3IubyBhbWRncHVfdnJhbV9tZ3Iu
byBhbWRncHVfdmlydC5vDQphbWRncHVfYXRvbWZpcm13YXJlLm8gXA0KIAlhbWRncHVfdmZfZXJy
b3IubyBhbWRncHVfc2NoZWQubyBhbWRncHVfZGVidWdmcy5vDQphbWRncHVfaWRzLm8gXA0KIAlh
bWRncHVfZ21jLm8gYW1kZ3B1X3hnbWkubyBhbWRncHVfY3NhLm8gYW1kZ3B1X3Jhcy5vDQphbWRn
cHVfdm1fY3B1Lm8gXA0KLQlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9kaXNjb3Zlcnkubw0KKwlh
bWRncHVfdm1fc2RtYS5vIGFtZGdwdV9wbXUubyBhbWRncHVfZGlzY292ZXJ5Lm8NCmFtZGdwdV9y
YXNfZWVwcm9tLm8NCg0KIGFtZGdwdS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3Bt
dS5vDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmgNCmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQppbmRleCAyNzY1
ZjJkLi44ZDViY2Q4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgN
CkBAIC0yOSw2ICsyOSw3IEBADQogI2luY2x1ZGUgImFtZGdwdS5oIg0KICNpbmNsdWRlICJhbWRn
cHVfcHNwLmgiDQogI2luY2x1ZGUgInRhX3Jhc19pZi5oIg0KKyNpbmNsdWRlICJhbWRncHVfcmFz
X2VlcHJvbS5oIg0KDQogZW51bSBhbWRncHVfcmFzX2Jsb2NrIHsNCiAJQU1ER1BVX1JBU19CTE9D
S19fVU1DID0gMCwNCkBAIC0zMzMsNiArMzM0LDggQEAgc3RydWN0IGFtZGdwdV9yYXMgew0KIAlz
dHJ1Y3QgbXV0ZXggcmVjb3ZlcnlfbG9jazsNCg0KIAl1aW50MzJfdCBmbGFnczsNCisNCisJc3Ry
dWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgZWVwcm9tX2NvbnRyb2w7DQogfTsNCg0KIHN0
cnVjdCByYXNfZnNfZGF0YSB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhc19lZXByb20uYw0KYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzX2VlcHJvbS5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uYmYw
NzUxNQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhc19lZXByb20uYw0KQEAgLTAsMCArMSw0ODIgQEANCisvKg0KKyAqIENvcHlyaWdodCAy
MDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4NCisgKg0KKyAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uDQorb2J0YWluaW5n
IGENCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlv
biBmaWxlcyAodGhlDQorIlNvZnR3YXJlIiksDQorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUg
d2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQNCitsaW1pdGF0aW9uDQorICog
dGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1
dGUsDQorc3VibGljZW5zZSwNCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJl
LCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbQ0KK3RoZQ0KKyAqIFNvZnR3YXJlIGlzIGZ1
cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQor
ICoNCisgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5v
dGljZSBzaGFsbCBiZQ0KK2luY2x1ZGVkIGluDQorICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlh
bCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuDQorICoNCisgKiBUSEUgU09GVFdBUkUgSVMgUFJP
VklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwNCitFWFBSRVNTIE9S
DQorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElF
UyBPRg0KK01FUkNIQU5UQUJJTElUWSwNCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8NCkVWRU5UDQorU0hBTEwNCisgKiBUSEUg
Q09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0s
DQorREFNQUdFUyBPUg0KKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04g
T0YgQ09OVFJBQ1QsIFRPUlQgT1INCitPVEhFUldJU0UsDQorICogQVJJU0lORyBGUk9NLCBPVVQg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUg0KVEhFIFVTRQ0KK09SDQor
ICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KKyAqDQorICovDQorDQorI2luY2x1
ZGUgImFtZGdwdV9yYXNfZWVwcm9tLmgiDQorI2luY2x1ZGUgImFtZGdwdS5oIg0KKyNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiDQorI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4NCisNCisjZGVmaW5lIEVF
UFJPTV9JMkNfVEFSR0VUX0FERFIgMHhBMA0KKw0KKyNkZWZpbmUgRUVQUk9NX1RBQkxFX0hFQURF
Ul9TSVpFIDIwDQorI2RlZmluZSBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkUgMjQNCltUYW9dIHNo
b3VsZCB3ZSByZXBsYWNlIGZpeGVkIHZhbHVlIHdpdGggc2l6ZW9mIGZvciB0aGUgdHdvIG1hY3Jv
cz8NCg0KTm8sIGFzIEkgYWxyZWFkeSBleHBsYWluZWQgYmVmb3JlIHRoZSBFRVBST01fVEFCTEVf
SEVBREVSL1JFQ09SRF9TSVpFIHJlcHJlc2VudCB0aGUgYWN0dWFsIHNpemUgaW4gYnl0ZXMgdGhh
dCB0aG9zZSBlbnRpdGllcyBvY2N1cHkgaW4gdGhlIEVFUFJPTSBtZW1vcnkgYW5kIGFzIGRlZmlu
ZWQgaW4gdGhlIEVFUFJPTSB0YWJsZSBkZXNjcmlwdGlvbiB3aGlsZSBzdHJ1Y3QgZWVwcm9tX3Rh
YmxlX3JlY29yZCB3b3VsZCBiZSBsYXJnZXIgYmVjYXVzZSBmb3IgZXhhbXBsZSB0byBzdG9yZSA2
YiBvZiBSZXRpZWRQYWdlIEkgaGF2ZSB0byB1c2UgdWludDY0IHdoaWNoIGlzIDhiLiBJIGNvdWxk
IG9mIGNvdXJzZSB1c2Ugc29tZSBraW5kIG9mIGJpdHZlY3RvciAoYml0c2V0KSB0byBzdG9yZSB0
aGVtIGNvbXBhY3RseSBidXQgaXQgc2VlbXMgdG8gbWUgYXMgYW4gb3ZlcmtpbGwuIEkgd2FzIHRv
bGQgd2UgYXJlIG5vdCBleHBlY3RpbmcgdG8gbXVjaCByZWNvcmRzIGZvciBhbnkgZ2l2ZW4gc3lz
dGVtIGFueXdheSBkdXJpbmcgaXQncyBsaWZlIHRpbWUgc28gdGhlIGR5bmFtaWMgbWVtb3J5IHNh
dmVkIHdvdWxkIGJlIHNtYWxsIGFueXdheS4gDQoNCltUYW9dIE9LLCBjb3VsZCB5b3UgYWRkIGEg
Y29tbWVudCBpbiB0aGUgY29kZSB0byBjbGFyaWZ5IHRoZSB0d28gdHlwZXMgb2YgU0laRT8NCg0K
DQoNCisjZGVmaW5lIEVFUFJPTV9BRERSRVNTX1NJWkUgMHgyDQorDQorLyogVGFibGUgaGRyIGlz
ICdBTURSJyAqLw0KKyNkZWZpbmUgRUVQUk9NX1RBQkxFX0hEUl9WQUwgMHg0MTRkNDQ1MiAjZGVm
aW5lDQpFRVBST01fVEFCTEVfVkVSDQorMHgwMDAxMDAwMA0KKw0KKy8qIEFzc3VtZSAyIE1iaXQg
c2l6ZSAqLw0KKyNkZWZpbmUgRUVQUk9NX1NJWkVfQllURVMgMjU2MDAwDQorI2RlZmluZSBFRVBS
T01fUEFHRV9fU0laRV9CWVRFUyAyNTYNCisjZGVmaW5lIEVFUFJPTV9IRFJfU1RBUlQgMA0KKyNk
ZWZpbmUgRUVQUk9NX1JFQ09SRF9TVEFSVCAoRUVQUk9NX0hEUl9TVEFSVCArDQorRUVQUk9NX1RB
QkxFX0hFQURFUl9TSVpFKSAjZGVmaW5lIEVFUFJPTV9NQVhfUkVDT1JEX05VTQ0KKygoRUVQUk9N
X1NJWkVfQllURVMgLSBFRVBST01fVEFCTEVfSEVBREVSX1NJWkUpIC8NCitFRVBST01fVEFCTEVf
UkVDT1JEX1NJWkUpICNkZWZpbmUgRUVQUk9NX0FERFJfTVNCX01BU0sNCkdFTk1BU0soMTcsIDgp
DQorDQorI2RlZmluZSB0b19hbWRncHVfZGV2aWNlKHgpIChjb250YWluZXJfb2YoeCwgc3RydWN0
IGFtZGdwdV9yYXMsDQorZWVwcm9tX2NvbnRyb2wpKS0+YWRldg0KKw0KK3N0YXRpYyB2b2lkIF9f
ZW5jb2RlX3RhYmxlX2hlYWRlcl90b19idWZmKHN0cnVjdA0KYW1kZ3B1X3Jhc19lZXByb21fdGFi
bGVfaGVhZGVyICpoZHIsDQorCQkJCQkgIHVuc2lnbmVkIGNoYXIgKmJ1ZmYpDQorew0KKwl1aW50
MzJfdCAqcHAgPSAodWludDMyX3QgKikgYnVmZjsNCisNCisJcHBbMF0gPSBjcHVfdG9fbGUzMiho
ZHItPmhlYWRlcik7DQorCXBwWzFdID0gY3B1X3RvX2xlMzIoaGRyLT52ZXJzaW9uKTsNCisJcHBb
Ml0gPSBjcHVfdG9fbGUzMihoZHItPmZpcnN0X3JlY19vZmZzZXQpOw0KKwlwcFszXSA9IGNwdV90
b19sZTMyKGhkci0+dGJsX3NpemUpOw0KKwlwcFs0XSA9IGNwdV90b19sZTMyKGhkci0+Y2hlY2tz
dW0pOw0KK30NCisNCitzdGF0aWMgdm9pZCBfX2RlY29kZV90YWJsZV9oZWFkZXJfZnJvbV9idWZm
KHN0cnVjdA0KYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVyICpoZHIsDQorCQkJCQkgIHVu
c2lnbmVkIGNoYXIgKmJ1ZmYpDQorew0KKwl1aW50MzJfdCAqcHAgPSAodWludDMyX3QgKilidWZm
Ow0KKw0KKwloZHItPmhlYWRlciAJICAgICAgPSBsZTMyX3RvX2NwdShwcFswXSk7DQorCWhkci0+
dmVyc2lvbiAJICAgICAgPSBsZTMyX3RvX2NwdShwcFsxXSk7DQorCWhkci0+Zmlyc3RfcmVjX29m
ZnNldCA9IGxlMzJfdG9fY3B1KHBwWzJdKTsNCisJaGRyLT50Ymxfc2l6ZSAJICAgICAgPSBsZTMy
X3RvX2NwdShwcFszXSk7DQorCWhkci0+Y2hlY2tzdW0gCSAgICAgID0gbGUzMl90b19jcHUocHBb
NF0pOw0KK30NCisNCitzdGF0aWMgaW50IF9fdXBkYXRlX3RhYmxlX2hlYWRlcihzdHJ1Y3QgYW1k
Z3B1X3Jhc19lZXByb21fY29udHJvbA0KKmNvbnRyb2wsDQorCQkJCSB1bnNpZ25lZCBjaGFyICpi
dWZmKQ0KK3sNCisJaW50IHJldCA9IDA7DQorCXN0cnVjdCBpMmNfbXNnIG1zZyA9IHsNCisJCQku
YWRkcgk9IEVFUFJPTV9JMkNfVEFSR0VUX0FERFIsDQorCQkJLmZsYWdzCT0gMCwNCisJCQkubGVu
CT0gRUVQUk9NX0FERFJFU1NfU0laRSArDQpFRVBST01fVEFCTEVfSEVBREVSX1NJWkUsDQorCQkJ
LmJ1Zgk9IGJ1ZmYsDQorCX07DQorDQorDQorCSoodWludDE2X3QgKilidWZmID0gRUVQUk9NX0hE
Ul9TVEFSVDsNCisJX19lbmNvZGVfdGFibGVfaGVhZGVyX3RvX2J1ZmYoJmNvbnRyb2wtPnRibF9o
ZHIsIGJ1ZmYgKw0KK0VFUFJPTV9BRERSRVNTX1NJWkUpOw0KKw0KKwlyZXQgPSBpMmNfdHJhbnNm
ZXIoJmNvbnRyb2wtPmVlcHJvbV9hY2Nlc3NvciwgJm1zZywgMSk7DQorCWlmIChyZXQgPCAxKQ0K
KwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gd3JpdGUgRUVQUk9NIHRhYmxlIGhlYWRlciwgcmV0OiVk
IiwNCnJldCk7DQorDQorCXJldHVybiByZXQ7DQorfQ0KKw0KK3N0YXRpYyB1aW50MzJfdCAgX19j
YWxjX2hkcl9ieXRlX3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbA0KKypjb250
cm9sKTsNCisNCitpbnQgYW1kZ3B1X3Jhc19lZXByb21faW5pdChzdHJ1Y3QgYW1kZ3B1X3Jhc19l
ZXByb21fY29udHJvbCAqY29udHJvbCkNCnsNCisJaW50IHJldCA9IDA7DQorCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsNCisJdW5zaWduZWQg
Y2hhciBidWZmW0VFUFJPTV9BRERSRVNTX1NJWkUgKw0KRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpF
XSA9IHsgMCB9Ow0KKwlzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVyICpoZHIg
PSAmY29udHJvbC0+dGJsX2hkcjsNCisJc3RydWN0IGkyY19tc2cgbXNnID0gew0KKwkJCS5hZGRy
CT0gRUVQUk9NX0kyQ19UQVJHRVRfQUREUiwNCisJCQkuZmxhZ3MJPSBJMkNfTV9SRCwNCisJCQku
bGVuCT0gRUVQUk9NX0FERFJFU1NfU0laRSArDQpFRVBST01fVEFCTEVfSEVBREVSX1NJWkUsDQor
CQkJLmJ1Zgk9IGJ1ZmYsDQorCX07DQorDQorCW11dGV4X2luaXQoJmNvbnRyb2wtPnRibF9tdXRl
eCk7DQorDQorCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQorCWNhc2UgQ0hJUF9WRUdBMjA6
DQorCS8qVE9ETyBBZGQgTUktNjAgKi8NCisJCWJyZWFrOw0KKw0KKwlkZWZhdWx0Og0KKwkJcmV0
dXJuIDA7DQorCX0NCisNCisJaWYgKHJldCkgew0KKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5p
dCBJMkMgY29udHJvbGxlciwgcmV0OiVkIiwgcmV0KTsNCisJCXJldHVybiByZXQ7DQorCX0NCisN
CisJLyogUmVhZC9DcmVhdGUgdGFibGUgaGVhZGVyIGZyb20gRUVQUk9NIGFkZHJlc3MgMCAqLw0K
KwlyZXQgPSBpMmNfdHJhbnNmZXIoJmNvbnRyb2wtPmVlcHJvbV9hY2Nlc3NvciwgJm1zZywgMSk7
DQorCWlmIChyZXQgPCAxKSB7DQorCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZWFkIEVFUFJPTSB0
YWJsZSBoZWFkZXIsIHJldDolZCIsDQpyZXQpOw0KKwkJcmV0dXJuIHJldDsNCisJfQ0KKw0KKwlf
X2RlY29kZV90YWJsZV9oZWFkZXJfZnJvbV9idWZmKGhkciwgJmJ1ZmZbMl0pOw0KKw0KKwlpZiAo
aGRyLT5oZWFkZXIgPT0gRUVQUk9NX1RBQkxFX0hEUl9WQUwpIHsNCisJCWNvbnRyb2wtPm51bV9y
ZWNzID0gKGhkci0+dGJsX3NpemUgLQ0KRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFKSAvDQorCQkJ
CSAgICBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkU7DQorCQlEUk1fREVCVUdfRFJJVkVSKCJGb3Vu
ZCBleGlzdGluZyBFRVBST00gdGFibGUgd2l0aCAlZA0KcmVjb3JkcyIsDQorCQkJCSBjb250cm9s
LT5udW1fcmVjcyk7DQorDQorCX0gZWxzZSB7DQorCQlEUk1fSU5GTygiQ3JlYXRpbmcgbmV3IEVF
UFJPTSB0YWJsZSIpOw0KKw0KKwkJaGRyLT5oZWFkZXIgPSBFRVBST01fVEFCTEVfSERSX1ZBTDsN
CisJCWhkci0+dmVyc2lvbiA9IEVFUFJPTV9UQUJMRV9WRVI7DQorCQloZHItPmZpcnN0X3JlY19v
ZmZzZXQgPSBFRVBST01fUkVDT1JEX1NUQVJUOw0KKwkJaGRyLT50Ymxfc2l6ZSA9IEVFUFJPTV9U
QUJMRV9IRUFERVJfU0laRTsNCisNCisJCWFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21fY29udHJv
bC50YmxfYnl0ZV9zdW0gPQ0KKwkJCQlfX2NhbGNfaGRyX2J5dGVfc3VtKCZhZGV2LT5wc3AucmFz
LnJhcy0NCmVlcHJvbV9jb250cm9sKTsNCisJCXJldCA9IF9fdXBkYXRlX3RhYmxlX2hlYWRlcihj
b250cm9sLCBidWZmKTsNCisJfQ0KKw0KKwkvKiBTdGFydCBpbnNlcnRpbmcgcmVjb3JkcyBmcm9t
IGhlcmUgKi8NCisJYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sLm5leHRfYWRkciA9
DQpFRVBST01fUkVDT1JEX1NUQVJUOw0KKw0KKwlyZXR1cm4gcmV0ID09IDEgPyAwIDogLUVJTzsN
Cit9DQorDQordm9pZCBhbWRncHVfcmFzX2VlcHJvbV9maW5pKHN0cnVjdCBhbWRncHVfcmFzX2Vl
cHJvbV9jb250cm9sDQoqY29udHJvbCkNCit7DQorCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsNCisNCisJc3dpdGNoIChhZGV2LT5hc2ljX3R5
cGUpIHsNCisJY2FzZSBDSElQX1ZFR0EyMDoNCisJCS8qVE9ETyBBZGQgTUktNjAgKi8NCisJCWJy
ZWFrOw0KKw0KKwlkZWZhdWx0Og0KKwkJcmV0dXJuOw0KKwl9DQorfQ0KKw0KK3N0YXRpYyB2b2lk
IF9fZW5jb2RlX3RhYmxlX3JlY29yZF90b19idWZmKHN0cnVjdA0KYW1kZ3B1X3Jhc19lZXByb21f
Y29udHJvbCAqY29udHJvbCwNCisJCQkJCSAgc3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKnJl
Y29yZCwNCisJCQkJCSAgdW5zaWduZWQgY2hhciAqYnVmZikNCit7DQorCV9fbGU2NCB0bXAgPSAw
Ow0KKwlpbnQgaSA9IDA7DQorDQorCS8qIE5leHQgYXJlIGFsbCByZWNvcmQgZmllbGRzIGFjY29y
ZGluZyB0byBFRVBST00gcGFnZSBzcGVjIGluIExFDQpmb3JhbXQgKi8NCisJYnVmZltpKytdID0g
cmVjb3JkLT5lcnJfdHlwZTsNCisNCisJYnVmZltpKytdID0gcmVjb3JkLT5iYW5rOw0KKw0KKwl0
bXAgPSBjcHVfdG9fbGU2NChyZWNvcmQtPnRzKTsNCisJbWVtY3B5KGJ1ZmYgKyBpLCAmdG1wLCA4
KTsNCisJaSArPSA4Ow0KW1Rhb10gSSB0aGluayBzaXplb2YocmVjb3JkLT50cykgaXMgYmV0dGVy
DQoNCisNCisJdG1wID0gY3B1X3RvX2xlNjQoKHJlY29yZC0+b2Zmc2V0ICYgMHhmZmZmZmZmZmZm
ZmYpKTsNCltUYW9dICgweDFVTEwgPDwgNDkgLSAxKSBpcyBtb3JlIHJlYWRhYmxlIHRoYW4gJiAw
eGZmZmZmZmZmZmZmZiwgb3IgYSBtYWNybyBjYW4gYmUgZGVmaW5lZCwgYnV0IGVpdGhlciB3YXkg
aXMgT0suDQoNCisJbWVtY3B5KGJ1ZmYgKyBpLCAmdG1wLCA2KTsNCisJaSArPSA2Ow0KKw0KKwli
dWZmW2krK10gPSByZWNvcmQtPm1lbV9jaGFubmVsOw0KKwlidWZmW2krK10gPSByZWNvcmQtPm1j
dW1jX2lkOw0KKw0KKwl0bXAgPSBjcHVfdG9fbGU2NCgocmVjb3JkLT5yZXRpcmVkX3BhZ2UgJiAw
eGZmZmZmZmZmZmZmZikpOw0KKwltZW1jcHkoYnVmZiArIGksICZ0bXAsIDYpOw0KK30NCisNCitz
dGF0aWMgdm9pZCBfX2RlY29kZV90YWJsZV9yZWNvcmRfZnJvbV9idWZmKHN0cnVjdA0KYW1kZ3B1
X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCisJCQkJCSAgICBzdHJ1Y3QgZWVwcm9tX3Rh
YmxlX3JlY29yZA0KKnJlY29yZCwNCisJCQkJCSAgICB1bnNpZ25lZCBjaGFyICpidWZmKQ0KK3sN
CisJX19sZTY0IHRtcCA9IDA7DQorCWludCBpID0gIDA7DQorDQorCS8qIE5leHQgYXJlIGFsbCBy
ZWNvcmQgZmllbGRzIGFjY29yZGluZyB0byBFRVBST00gcGFnZSBzcGVjIGluIExFDQpmb3JhbXQg
Ki8NCisJcmVjb3JkLT5lcnJfdHlwZSA9IGJ1ZmZbaSsrXTsNCisNCisJcmVjb3JkLT5iYW5rID0g
YnVmZltpKytdOw0KKw0KKwltZW1jcHkoJnRtcCwgYnVmZiArIGksIDgpOw0KKwlyZWNvcmQtPnRz
ID0gbGU2NF90b19jcHUodG1wKTsNCisJaSArPSA4Ow0KKw0KKwltZW1jcHkoJnRtcCwgYnVmZiAr
IGksIDYpOw0KKwlyZWNvcmQtPm9mZnNldCA9IChsZTY0X3RvX2NwdSh0bXApICYgMHhmZmZmZmZm
ZmZmZmYpOw0KKwlpICs9IDY7DQorDQorCWJ1ZmZbaSsrXSA9IHJlY29yZC0+bWVtX2NoYW5uZWw7
DQorCWJ1ZmZbaSsrXSA9IHJlY29yZC0+bWN1bWNfaWQ7DQorDQorCW1lbWNweSgmdG1wLCBidWZm
ICsgaSwgIDYpOw0KKwlyZWNvcmQtPnJldGlyZWRfcGFnZSA9IChsZTY0X3RvX2NwdSh0bXApICYg
MHhmZmZmZmZmZmZmZmYpOyB9DQorDQorLyoNCisgKiBXaGVuIHJlYWNoaW5nIGVuZCBvZiBFRVBS
T00gbWVtb3J5IGp1bXAgYmFjayB0byAwIHJlY29yZCBhZGRyZXNzDQorICogV2hlbiBuZXh0IHJl
Y29yZCBhY2Nlc3Mgd2lsbCBnbyBiZXlvbmQgRUVQUk9NIHBhZ2UgYm91bmRhcnkgbW9kaWZ5DQor
Yml0cyBBMTcvQTgNCisgKiBpbiBJMkMgc2VsZWN0b3IgdG8gZ28gdG8gbmV4dCBwYWdlDQorICov
DQorc3RhdGljIHVpbnQzMl90IF9fY29ycmVjdF9lZXByb21fZGVzdF9hZGRyZXNzKHVpbnQzMl90
IGN1cnJfYWRkcmVzcykgew0KKwl1aW50MzJfdCBuZXh0X2FkZHJlc3MgPSBjdXJyX2FkZHJlc3Mg
Kw0KRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFOw0KKw0KKwkvKiBXaGVuIGFsbCBFRVBST00gbWVt
b3J5IHVzZWQganVtcCBiYWNrIHRvIDAgYWRkcmVzcyAqLw0KKwlpZiAobmV4dF9hZGRyZXNzID4g
RUVQUk9NX1NJWkVfQllURVMpIHsNCisJCURSTV9JTkZPKCJSZWFjaGVkIGVuZCBvZiBFRVBST00g
bWVtb3J5LCBqdW1waW5nIHRvIDANCiINCisJCQkgImFuZCBvdmVycmlkaW5nIG9sZCByZWNvcmQi
KTsNCisJCXJldHVybiBFRVBST01fUkVDT1JEX1NUQVJUOw0KKwl9DQorDQorCS8qDQorCSAqIFRv
IGNoZWNrIGlmIHdlIG92ZXJmbG93IHBhZ2UgYm91bmRhcnkgIGNvbXBhcmUgbmV4dCBhZGRyZXNz
DQp3aXRoDQorCSAqIGN1cnJlbnQgYW5kIHNlZSBpZiBiaXRzIDE3Lzggb2YgdGhlIEVFUFJPTSBh
ZGRyZXNzIHdpbGwgY2hhbmdlDQorCSAqIElmIHRoZXkgZG8gc3RhcnQgZnJvbSB0aGUgbmV4dCAy
NTZiIHBhZ2UNCisJICoNCisJICogaHR0cHM6Ly93d3cuc3QuY29tL3Jlc291cmNlL2VuL2RhdGFz
aGVldC9tMjRtMDItZHIucGRmIHNlYy4NCjUuMS4yDQorCSAqLw0KKwlpZiAoKGN1cnJfYWRkcmVz
cyAmIEVFUFJPTV9BRERSX01TQl9NQVNLKSAhPSAobmV4dF9hZGRyZXNzICYNCkVFUFJPTV9BRERS
X01TQl9NQVNLKSkgew0KKwkJRFJNX0RFQlVHX0RSSVZFUigiUmVhY2hlZCBlbmQgb2YgRUVQUk9N
IG1lbW9yeQ0KcGFnZSwganVtcGltbmcgdG8gbmV4dDogJWx4IiwNCisJCQkJKG5leHRfYWRkcmVz
cyAmDQpFRVBST01fQUREUl9NU0JfTUFTSykpOw0KKw0KKwkJcmV0dXJuICAobmV4dF9hZGRyZXNz
ICYgRUVQUk9NX0FERFJfTVNCX01BU0spOw0KKwl9DQorDQorCXJldHVybiBjdXJyX2FkZHJlc3M7
DQorfQ0KKw0KKw0KK3N0YXRpYyB1aW50MzJfdCAgX19jYWxjX2hkcl9ieXRlX3N1bShzdHJ1Y3Qg
YW1kZ3B1X3Jhc19lZXByb21fY29udHJvbA0KKypjb250cm9sKSB7DQorCWludCBpOw0KKwl1aW50
MzJfdCB0Ymxfc3VtID0gMDsNCisNCisJLyogSGVhZGVyIGNoZWNrc3VtLCBza2lwIGNoZWNrc3Vt
IGZpZWxkIGluIHRoZSBjYWxjdWxhdGlvbiAqLw0KKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKGNv
bnRyb2wtPnRibF9oZHIpIC0gc2l6ZW9mKGNvbnRyb2wtDQp0YmxfaGRyLmNoZWNrc3VtKTsgaSsr
KQ0KKwkJdGJsX3N1bSArPSAqKCgodW5zaWduZWQgY2hhciAqKSZjb250cm9sLT50YmxfaGRyKSAr
IGkpOw0KKw0KKwlyZXR1cm4gdGJsX3N1bTsNCit9DQorDQorc3RhdGljIHVpbnQzMl90ICBfX2Nh
bGNfcmVjc19ieXRlX3N1bShzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywNCisJ
CQkJICAgICAgaW50IG51bSkNCit7DQorCWludCBpLCBqOw0KKwl1aW50MzJfdCB0Ymxfc3VtID0g
MDsNCisNCisJLyogUmVjb3JkcyBjaGVja3N1bSAqLw0KKwlmb3IgKGkgPSAwOyBpIDwgbnVtOyBp
KyspIHsNCisJCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQgPSAmcmVjb3Jkc1tp
XTsNCisNCisJCWZvciAoaiA9IDA7IGogPCBzaXplb2YoKnJlY29yZCk7IGorKykgew0KKwkJCXRi
bF9zdW0gKz0gKigoKHVuc2lnbmVkIGNoYXIgKilyZWNvcmQpICsgaik7DQorCQl9DQorCX0NCisN
CisJcmV0dXJuIHRibF9zdW07DQorfQ0KKw0KK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgIF9fY2Fs
Y190YmxfYnl0ZV9zdW0oc3RydWN0DQphbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9s
LA0KKwkJCQkgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLCBpbnQNCm51bSkg
ew0KKwlyZXR1cm4gX19jYWxjX2hkcl9ieXRlX3N1bShjb250cm9sKSArDQpfX2NhbGNfcmVjc19i
eXRlX3N1bShyZWNvcmRzLA0KK251bSk7IH0NCisNCisvKiBDaGVja3N1bSA9IDI1NiAtKChzdW0g
b2YgYWxsIHRhYmxlIGVudHJpZXMpIG1vZCAyNTYpwqAqLyBzdGF0aWMgdm9pZA0KK19fdXBkYXRl
X3RibF9jaGVja3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwN
CisJCQkJICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywgaW50DQpudW0sDQor
CQkJCSAgdWludDMyX3Qgb2xkX2hkcl9ieXRlX3N1bSkNCit7DQorCS8qDQorCSAqIFRoaXMgd2ls
bCB1cGRhdGUgdGhlIHRhYmxlIHN1bSB3aXRoIG5ldyByZWNvcmRzLg0KKwkgKg0KKwkgKiBUT0RP
OiBXaGF0IGhhcHBlbnMgd2hlbiB0aGUgRUVQUk9NIHRhYmxlIGlzIHRvIGJlIHdyYXBwZWQNCmFy
b3VuZA0KKwkgKiBhbmQgb2xkIHJlY29yZHMgZnJvbSBzdGFydCB3aWxsIGdldCBvdmVycmlkZGVu
Lg0KKwkgKi8NCisNCisJLyogbmVlZCB0byByZWNhbGN1bGF0ZSB1cGRhdGVkIGhlYWRlciBieXRl
IHN1bSAqLw0KKwljb250cm9sLT50YmxfYnl0ZV9zdW0gLT0gb2xkX2hkcl9ieXRlX3N1bTsNCisJ
Y29udHJvbC0+dGJsX2J5dGVfc3VtICs9IF9fY2FsY190YmxfYnl0ZV9zdW0oY29udHJvbCwgcmVj
b3JkcywNCm51bSk7DQorDQorCWNvbnRyb2wtPnRibF9oZHIuY2hlY2tzdW0gPSAyNTYgLSAoY29u
dHJvbC0+dGJsX2J5dGVfc3VtICUgMjU2KTsgfQ0KW1Rhb10gd2UgY2FuIGNoYW5nZSAyNTYgdG8g
RUVQUk9NX1BBR0VfX1NJWkVfQllURVMNCg0KVGhpcyAyNTYganVzdCBhY2NpZGVudGFsbHkgaGFz
IHNhbWUgdmFsdWUgYXPCoCBFRVBST01fUEFHRV9fU0laRV9CWVRFUyBidXQgZG9lc24ndCByZWxh
dGUgaW4gYW55IHdheSwgaXQncyBwYXJ0IG9mIGJ5dGUgdmFsdWUgY2hlY2tzdW0gYWxnb3JpdGht
IEkgd2FzIGdpdmVuLg0KQW5kcmV5DQoNCg0KDQorDQorLyogdGFibGUgc3VtIG1vZCAyNTYgKyBj
aGVja3N1bSBtdXN0IGVxdWFscyAyNTYgKi8gc3RhdGljIGJvb2wNCitfX3ZhbGlkYXRlX3RibF9j
aGVja3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCisJCQkg
ICAgc3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKnJlY29yZHMsIGludCBudW0pIHsNCisJY29u
dHJvbC0+dGJsX2J5dGVfc3VtID0gX19jYWxjX3RibF9ieXRlX3N1bShjb250cm9sLCByZWNvcmRz
LCBudW0pOw0KKw0KKwlpZiAoY29udHJvbC0+dGJsX2hkci5jaGVja3N1bSArIChjb250cm9sLT50
YmxfYnl0ZV9zdW0gJSAyNTYpICE9IDI1NikNCnsNCisJCURSTV9XQVJOKCJDaGVja3N1bSBtaXNt
YXRjaCwgY2hlY2tzdW06ICV1ICIsIGNvbnRyb2wtDQp0YmxfaGRyLmNoZWNrc3VtKTsNCisJCXJl
dHVybiBmYWxzZTsNCisJfQ0KKw0KKwlyZXR1cm4gdHJ1ZTsNCit9DQorDQoraW50IGFtZGdwdV9y
YXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKHN0cnVjdA0KYW1kZ3B1X3Jhc19lZXByb21fY29udHJv
bCAqY29udHJvbCwNCisJCQkJCSAgICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZA0KKnJlY29y
ZHMsDQorCQkJCQkgICAgYm9vbCB3cml0ZSwNCisJCQkJCSAgICBpbnQgbnVtKQ0KK3sNCisJaW50
IGksIHJldCA9IDA7DQorCXN0cnVjdCBpMmNfbXNnICptc2dzOw0KKwl1bnNpZ25lZCBjaGFyICpi
dWZmczsNCisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNv
bnRyb2wpOw0KKw0KKwlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfVkVHQTIwKQ0KKwkJcmV0
dXJuIDA7DQorDQorCWJ1ZmZzID0ga2NhbGxvYyhudW0sIEVFUFJPTV9BRERSRVNTX1NJWkUgKw0K
RUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFLA0KKwkJCSBHRlBfS0VSTkVMKTsNCisJaWYgKCFidWZm
cykNCisJCXJldHVybiAtRU5PTUVNOw0KKw0KKwltdXRleF9sb2NrKCZjb250cm9sLT50YmxfbXV0
ZXgpOw0KKw0KKwltc2dzID0ga2NhbGxvYyhudW0sIHNpemVvZigqbXNncyksIEdGUF9LRVJORUwp
Ow0KKwlpZiAoIW1zZ3MpIHsNCisJCXJldCA9IC1FTk9NRU07DQorCQlnb3RvIGZyZWVfYnVmZjsN
CisJfQ0KKw0KKwkvKiBJbiBjYXNlIG9mIG92ZXJmbG93IGp1c3Qgc3RhcnQgZnJvbSBiZWdpbm5p
bmcgdG8gbm90IGxvc2UgbmV3ZXN0DQpyZWNvcmRzICovDQorCWlmICh3cml0ZSAmJiAoY29udHJv
bC0+bmV4dF9hZGRyICsgRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFICoNCm51bSA+IEVFUFJPTV9T
SVpFX0JZVEVTKSkNCisJCWNvbnRyb2wtPm5leHRfYWRkciA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7
DQorDQorDQorCS8qDQorCSAqIFRPRE8gQ3VycmVudGx5IG1ha2VzIEVFUFJPTSB3cml0ZXMgZm9y
IGVhY2ggcmVjb3JkLCB0aGlzDQpjcmVhdGVzDQorCSAqIGludGVybmFsIGZyYWdtZW50YXRpb24u
IE9wdGltaXplZCB0aGUgY29kZSB0byBkbyBmdWxsIHBhZ2Ugd3JpdGUgb2YNCisJICogMjU2Yg0K
KwkgKi8NCisJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7DQorCQl1bnNpZ25lZCBjaGFyICpi
dWZmID0gJmJ1ZmZzW2kqKEVFUFJPTV9BRERSRVNTX1NJWkUgKw0KRUVQUk9NX1RBQkxFX1JFQ09S
RF9TSVpFKV07DQorCQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkID0gJnJlY29y
ZHNbaV07DQorCQlzdHJ1Y3QgaTJjX21zZyAqbXNnID0gJm1zZ3NbaV07DQorDQorCQljb250cm9s
LT5uZXh0X2FkZHIgPQ0KK19fY29ycmVjdF9lZXByb21fZGVzdF9hZGRyZXNzKGNvbnRyb2wtPm5l
eHRfYWRkcik7DQorDQorCQkvKg0KKwkJICogVXBkYXRlIGJpdHMgMTYsMTcgb2YgRUVQUk9NIGFk
ZHJlc3MgaW4gSTJDIGFkZHJlc3MgYnkNCnNldHRpbmcgdGhlbQ0KKwkJICogdG8gYml0cyAxLDIg
b2YgRGV2aWNlIGFkZHJlc3MgYnl0ZQ0KKwkJICovDQorCQltc2ctPmFkZHIgPSBFRVBST01fSTJD
X1RBUkdFVF9BRERSIHwNCisJCQkgICAgICAgKChjb250cm9sLT5uZXh0X2FkZHIgJg0KRUVQUk9N
X0FERFJfTVNCX01BU0spID4+IDE1KTsNCisJCW1zZy0+ZmxhZ3MJPSB3cml0ZSA/IDAgOiBJMkNf
TV9SRDsNCisJCW1zZy0+bGVuCT0gRUVQUk9NX0FERFJFU1NfU0laRSArDQpFRVBST01fVEFCTEVf
UkVDT1JEX1NJWkU7DQorCQltc2ctPmJ1Zgk9IGJ1ZmY7DQorDQorCQkvKiBJbnNlcnQgdGhlIEVF
UFJPTSBkZXN0IGFkZGVzcywgYml0cyAwLTE1ICovDQorCQlidWZmWzBdID0gKChjb250cm9sLT5u
ZXh0X2FkZHIgPj4gOCkgJiAweGZmKTsNCisJCWJ1ZmZbMV0gPSAoY29udHJvbC0+bmV4dF9hZGRy
ICYgMHhmZik7DQorDQorCQkvKiBFRVBST00gdGFibGUgY29udGVudCBpcyBzdG9yZWQgaW4gTEUg
Zm9ybWF0ICovDQorCQlpZiAod3JpdGUpDQorCQkJX19lbmNvZGVfdGFibGVfcmVjb3JkX3RvX2J1
ZmYoY29udHJvbCwgcmVjb3JkLCBidWZmDQorDQorRUVQUk9NX0FERFJFU1NfU0laRSk7DQorDQor
CQkvKg0KKwkJICogVGhlIGRlc3RpbmF0aW9uIEVFUFJPTSBhZGRyZXNzIG1pZ2h0IG5lZWQgdG8g
YmUNCmNvcnJlY3RlZCB0byBhY2NvdW50DQorCQkgKiBmb3IgcGFnZSBvciBlbnRpcmUgbWVtb3J5
IHdyYXBwaW5nDQorCQkgKi8NCisJCWNvbnRyb2wtPm5leHRfYWRkciArPSBFRVBST01fVEFCTEVf
UkVDT1JEX1NJWkU7DQorCX0NCisNCisJcmV0ID0gaTJjX3RyYW5zZmVyKCZjb250cm9sLT5lZXBy
b21fYWNjZXNzb3IsIG1zZ3MsIG51bSk7DQorCWlmIChyZXQgPCAxKSB7DQorCQlEUk1fRVJST1Io
IkZhaWxlZCB0byBwcm9jZXNzIEVFUFJPTSB0YWJsZSByZWNvcmRzLA0KcmV0OiVkIiwgcmV0KTsN
CisNCisJCS8qIFRPRE8gUmVzdG9yZSBwcmV2IG5leHQgRUVQUk9NIGFkZHJlc3MgPyAqLw0KKwkJ
Z290byBmcmVlX21zZ3M7DQorCX0NCisNCisNCisJaWYgKCF3cml0ZSkgew0KKwkJZm9yIChpID0g
MDsgaSA8IG51bTsgaSsrKSB7DQorCQkJdW5zaWduZWQgY2hhciAqYnVmZiA9DQomYnVmZnNbaSoo
RUVQUk9NX0FERFJFU1NfU0laRSArIEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSldOw0KW1Rhb10g
c3BhY2UgaXMgbmVlZGVkIGJlZm9yZSBhbmQgYWZ0ZXIgIioiDQoNCisJCQlzdHJ1Y3QgZWVwcm9t
X3RhYmxlX3JlY29yZCAqcmVjb3JkID0gJnJlY29yZHNbaV07DQpbVGFvXSBhZGQgYSBzcGFjZSBh
ZnRlciAiKiINCg0KKw0KKwkJCV9fZGVjb2RlX3RhYmxlX3JlY29yZF9mcm9tX2J1ZmYoY29udHJv
bCwgcmVjb3JkLA0KYnVmZiArIEVFUFJPTV9BRERSRVNTX1NJWkUpOw0KKwkJfQ0KKwl9DQorDQor
CWlmICh3cml0ZSkgew0KKwkJdWludDMyX3Qgb2xkX2hkcl9ieXRlX3N1bSA9IF9fY2FsY19oZHJf
Ynl0ZV9zdW0oY29udHJvbCk7DQorDQorCQkvKg0KKwkJICogVXBkYXRlIHRhYmxlIGhlYWRlciB3
aXRoIHNpemUgYW5kIENSQyBhbmQgYWNjb3VudCBmb3INCnRhYmxlDQorCQkgKiB3cmFwIGFyb3Vu
ZCB3aGVyZSB0aGUgYXNzdW1wdGlvbiBpcyB0aGF0IHdlIHRyZWF0IGl0IGFzDQplbXB0eQ0KKwkJ
ICogdGFibGUNCisJCSAqDQorCQkgKiBUT0RPIC0gQ2hlY2sgdGhlIGFzc3VtcHRpb24gaXMgY29y
cmVjdA0KKwkJICovDQorCQljb250cm9sLT5udW1fcmVjcyArPSBudW07DQorCQljb250cm9sLT5u
dW1fcmVjcyAlPSBFRVBST01fTUFYX1JFQ09SRF9OVU07DQorCQljb250cm9sLT50YmxfaGRyLnRi
bF9zaXplICs9IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSAqDQpudW07DQorCQlpZiAoY29udHJv
bC0+dGJsX2hkci50Ymxfc2l6ZSA+IEVFUFJPTV9TSVpFX0JZVEVTKQ0KKwkJCWNvbnRyb2wtPnRi
bF9oZHIudGJsX3NpemUgPQ0KRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFICsNCisJCQljb250cm9s
LT5udW1fcmVjcyAqIEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRTsNCisNCisJCV9fdXBkYXRlX3Ri
bF9jaGVja3N1bShjb250cm9sLCByZWNvcmRzLCBudW0sDQpvbGRfaGRyX2J5dGVfc3VtKTsNCisN
CisJCV9fdXBkYXRlX3RhYmxlX2hlYWRlcihjb250cm9sLCBidWZmcyk7DQorCX0gZWxzZSBpZiAo
IV9fdmFsaWRhdGVfdGJsX2NoZWNrc3VtKGNvbnRyb2wsIHJlY29yZHMsIG51bSkpIHsNCisJCURS
TV9XQVJOKCJFRVBST00gVGFibGUgY2hlY2tzdW0gbWlzbWF0Y2ghIik7DQorCQkvKiBUT0RPIFVu
Y29tbWVudCB3aGVuIEVFUFJPTSByZWFkL3dyaXRlIGlzIHJlbGxpYWJsZQ0KKi8NCisJCS8qIHJl
dCA9IC1FSU87ICovDQorCX0NCisNCitmcmVlX21zZ3M6DQorCWtmcmVlKG1zZ3MpOw0KKw0KK2Zy
ZWVfYnVmZjoNCisJa2ZyZWUoYnVmZnMpOw0KKw0KKwltdXRleF91bmxvY2soJmNvbnRyb2wtPnRi
bF9tdXRleCk7DQorDQorCXJldHVybiByZXQgPT0gbnVtID8gMCA6IC1FSU87DQorfQ0KKw0KK3Zv
aWQgYW1kZ3B1X3Jhc19lZXByb21fdGVzdChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJv
bA0KKmNvbnRyb2wpDQorew0KKwlpbnQgaTsNCisJc3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQg
KnJlY3MgPSBrY2FsbG9jKDEsIHNpemVvZigqcmVjcyksDQorR0ZQX0tFUk5FTCk7DQorDQorCWlm
ICghcmVjcykNCisJCXJldHVybjsNCisNCisJZm9yIChpID0gMDsgaSA8IDEgOyBpKyspIHsNCisJ
CXJlY3NbaV0uYWRkcmVzcyA9IDB4ZGVhZGJlZWY7DQorCQlyZWNzW2ldLnJldGlyZWRfcGFnZSA9
IGk7DQorCX0NCisNCisJaWYgKCFhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhjb250
cm9sLCByZWNzLCB0cnVlLCAxKSkgew0KKw0KKwkJbWVtc2V0KHJlY3MsIDAsIHNpemVvZigqcmVj
cykgKiAxKTsNCisNCisJCWNvbnRyb2wtPm5leHRfYWRkciA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7
DQorDQorCQlpZiAoIWFtZGdwdV9yYXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKGNvbnRyb2wsIHJl
Y3MsIGZhbHNlLA0KMSkpIHsNCisJCQlmb3IgKGkgPSAwOyBpIDwgMTsgaSsrKQ0KKwkJCQlEUk1f
SU5GTygicmVjLmFkZHJlc3MgOjB4JWxseCwNCnJlYy5yZXRpcmVkX3BhZ2UgOiVsbHUiLA0KKwkJ
CQkJIHJlY3NbaV0uYWRkcmVzcywgcmVjc1tpXS5yZXRpcmVkX3BhZ2UpOw0KKwkJfSBlbHNlDQor
CQkJRFJNX0VSUk9SKCJGYWlsZWQgaW4gcmVhZGluZyBmcm9tIHRhYmxlIik7DQorDQorCX0gZWxz
ZQ0KKwkJRFJNX0VSUk9SKCJGYWlsZWQgaW4gd3JpdGluZyB0byB0YWJsZSIpOyB9DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaA0KYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oDQpuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uNDFmM2ZjYg0KLS0tIC9kZXYvbnVsbA0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaA0KQEAgLTAsMCAr
MSw5MCBAQA0KKy8qDQorICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywg
SW5jLg0KKyAqDQorICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFy
Z2UsIHRvIGFueSBwZXJzb24NCitvYnRhaW5pbmcgYQ0KKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUNCisiU29mdHdhcmUiKSwN
CisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRp
bmcgd2l0aG91dA0KK2xpbWl0YXRpb24NCisgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9k
aWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwNCitzdWJsaWNlbnNlLA0KKyAqIGFuZC9v
ciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3
aG9tDQordGhlDQorICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRv
IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoNCisgKg0KKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlDQoraW5jbHVkZWQgaW4N
CisgKiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4N
CisgKg0KKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJB
TlRZIE9GIEFOWSBLSU5ELA0KK0VYUFJFU1MgT1INCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVU
IE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GDQorTUVSQ0hBTlRBQklMSVRZLA0KKyAq
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJ
TiBOTw0KRVZFTlQNCitTSEFMTA0KKyAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhP
UihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwNCitEQU1BR0VTIE9SDQorICogT1RIRVIgTElB
QklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUg0KK09USEVS
V0lTRSwNCisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhF
IFNPRlRXQVJFIE9SDQpUSEUgVVNFDQorT1INCisgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09G
VFdBUkUuDQorICoNCisgKi8NCisNCisjaWZuZGVmIF9BTURHUFVfUkFTX0VFUFJPTV9IDQorI2Rl
ZmluZSBfQU1ER1BVX1JBU19FRVBST01fSA0KKw0KKyNpbmNsdWRlIDxsaW51eC9pMmMuaD4NCisN
CitzdHJ1Y3QgYW1kZ3B1X2RldmljZTsNCisNCitlbnVtIGFtZGdwdV9yYXNfZWVwcm9tX2Vycl90
eXBlew0KKwlBTURHUFVfUkFTX0VFUFJPTV9FUlJfUExBQ0VfSE9MREVSLA0KKwlBTURHUFVfUkFT
X0VFUFJPTV9FUlJfUkVDT1ZFUkFCTEUsDQorCUFNREdQVV9SQVNfRUVQUk9NX0VSUl9OT05fUkVD
T1ZFUkFCTEUNCit9Ow0KKw0KK3N0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV90YWJsZV9oZWFkZXIg
ew0KKwl1aW50MzJfdCBoZWFkZXI7DQorCXVpbnQzMl90IHZlcnNpb247DQorCXVpbnQzMl90IGZp
cnN0X3JlY19vZmZzZXQ7DQorCXVpbnQzMl90IHRibF9zaXplOw0KKwl1aW50MzJfdCBjaGVja3N1
bTsNCit9X19hdHRyaWJ1dGVfXygoX19wYWNrZWRfXykpOw0KKw0KK3N0cnVjdCBhbWRncHVfcmFz
X2VlcHJvbV9jb250cm9sIHsNCisJc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX3RhYmxlX2hlYWRl
ciB0YmxfaGRyOw0KKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgZWVwcm9tX2FjY2Vzc29yOw0KKwl1aW50
MzJfdCBuZXh0X2FkZHI7DQorCXVuc2lnbmVkIGludCBudW1fcmVjczsNCisJc3RydWN0IG11dGV4
IHRibF9tdXRleDsNCisJYm9vbCBidXNfbG9ja2VkOw0KKwl1aW50MzJfdCB0YmxfYnl0ZV9zdW07
DQorfTsNCisNCisvKg0KKyAqIFJlcHJlc2VudHMgc2luZ2xlIHRhYmxlIHJlY29yZC4gUGFja2Vk
IHRvIGJlIGVhc2lseSBzZXJpYWxpemVkIGludG8NCitieXRlDQorICogc3RyZWFtLg0KKyAqLw0K
K3N0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkIHsNCisNCisJdW5pb24gew0KKwkJdWludDY0X3Qg
YWRkcmVzczsNCisJCXVpbnQ2NF90IG9mZnNldDsNCisJfTsNCisNCisJdWludDY0X3QgcmV0aXJl
ZF9wYWdlOw0KKwl1aW50NjRfdCB0czsNCisNCisJZW51bSBhbWRncHVfcmFzX2VlcHJvbV9lcnJf
dHlwZSBlcnJfdHlwZTsNCisNCisJdW5pb24gew0KKwkJdW5zaWduZWQgY2hhciBiYW5rOw0KKwkJ
dW5zaWduZWQgY2hhciBjdTsNCisJfTsNCisNCisJdW5zaWduZWQgY2hhciBtZW1fY2hhbm5lbDsN
CisJdW5zaWduZWQgY2hhciBtY3VtY19pZDsNCit9X19hdHRyaWJ1dGVfXygoX19wYWNrZWRfXykp
Ow0KKw0KK2ludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJv
bV9jb250cm9sICpjb250cm9sKTsNCit2b2lkIGFtZGdwdV9yYXNfZWVwcm9tX2Zpbmkoc3RydWN0
IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wNCipjb250cm9sKTsNCisNCitpbnQgYW1kZ3B1X3Jh
c19lZXByb21fcHJvY2Vzc19yZWNvZHMoc3RydWN0DQphbWRncHVfcmFzX2VlcHJvbV9jb250cm9s
ICpjb250cm9sLA0KKwkJCQkJICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkDQoqcmVjb3Jk
cywNCisJCQkJCSAgICBib29sIHdyaXRlLA0KKwkJCQkJICAgIGludCBudW0pOw0KKw0KK3ZvaWQg
YW1kZ3B1X3Jhc19lZXByb21fdGVzdChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbA0K
KmNvbnRyb2wpOw0KKw0KKyNlbmRpZiAvLyBfQU1ER1BVX1JBU19FRVBST01fSA0KLS0NCjIuNy40
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
