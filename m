Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719034D135
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5E16E58A;
	Thu, 20 Jun 2019 15:01:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680074.outbound.protection.outlook.com [40.107.68.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869566E58A
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:01:31 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3173.namprd12.prod.outlook.com (20.179.92.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Thu, 20 Jun 2019 15:01:26 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::54fa:fc7d:555f:c9ba]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::54fa:fc7d:555f:c9ba%3]) with mapi id 15.20.1987.013; Thu, 20 Jun 2019
 15:01:26 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Francis, David"
 <David.Francis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Topic: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Index: AQHVJ2R4K9A0FbrJv0GrUOv4VpTxh6akjYeAgAAOZQCAAAdXgA==
Date: Thu, 20 Jun 2019 15:01:26 +0000
Message-ID: <fda7ee75-ec08-f859-e788-48e82eed82e0@amd.com>
References: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
 <BN8PR12MB3217FE6149291E3A7D053139EFE40@BN8PR12MB3217.namprd12.prod.outlook.com>
 <BN6PR12MB1809A334E8D4AB00D4BCB178F7E40@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809A334E8D4AB00D4BCB178F7E40@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94c480f0-f4a7-4d07-eeaa-08d6f5902a7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3173; 
x-ms-traffictypediagnostic: BYAPR12MB3173:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB3173DCDF6BC844E4E0D8ACADECE40@BYAPR12MB3173.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(366004)(199004)(189003)(229853002)(68736007)(5660300002)(11346002)(31696002)(102836004)(81156014)(8676002)(256004)(71200400001)(81166006)(71190400001)(2616005)(316002)(72206003)(6116002)(186003)(7736002)(64756008)(2906002)(3846002)(8936002)(86362001)(66556008)(66476007)(966005)(66946007)(66446008)(26005)(110136005)(36756003)(15650500001)(606006)(99286004)(73956011)(446003)(486006)(6246003)(76176011)(31686004)(105004)(476003)(478600001)(6506007)(14454004)(54896002)(6306002)(6486002)(66066001)(236005)(25786009)(4326008)(52116002)(6512007)(6436002)(53546011)(386003)(53936002)(19627405001)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3173;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nesRghOXG5nZYKWLLj4hDkRBXAE5vn99CpSI6AJZlGZA85wsFDTTCnU1jp4g9bl2wImMrPlZNANcshAnch0G5u7GQGj+E2u42ZGtGsSGIsSTBAR9yAILifrgDrU3CwZ5g5olztHPp+4VJurNZFT1756vqUYiab85lL1dMPELt1KxdPUqoaNGOKpwL8tCyMpNfTpNHL5sbID9/WkYdfoq6KiMxKZFT7vACnGXmW2wFzbCXwjCK8nhZT0IyrF3TikNB9EDOFedNa3uL5Ac7H/DKYiqnB09xhiV1OSJS5kg4FHfAmlDLu2CnOR3OlVAxipnawHkx/5i0b9+fHocNge8zZG1C6SY9TWJQ/80slikMNrtaMXJcoZKa1KhXtUIOKGrpGJzMDDs2VjzLJflnq5iXfLRT7WD0S7kkLne3j4trQE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c480f0-f4a7-4d07-eeaa-08d6f5902a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:01:26.0234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odXQXPmFGUztHbvMtxejrquXbO3BWYgbNYZ67gB1FiM=;
 b=bkR3be3vvRvaogHkJjx2tquJj+8Zrr8tvY4jqYH/xLbRXgUEM8Gmlz8jpybHcr1OW3dRaHcW5OYkh2frKuBANg5fnJUkyJp/nNm7rrzemi/JixjiSWnb6Wu73OlcIrDAirKwLYXAjlBGEG95dPGWdA4/yF5WXS8ma2tswArVs6A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============1448968544=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1448968544==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_fda7ee75ec08f859e78848e82eed82e0amdcom_"

--_000_fda7ee75ec08f859e78848e82eed82e0amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U3VyZSwgaXQncyBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MTA5NDkgLg0KDQpJJ3ZlIGFkZGVkIGl0IHRvIHRoZSBjb21taXQsIHRoYW5rcy4NCg0KTmljaG9s
YXMgS2F6bGF1c2thcw0KDQpPbiA2LzIwLzE5IDEwOjM1IEFNLCBEZXVjaGVyLCBBbGV4YW5kZXIg
d3JvdGU6DQpJcyB0aGVyZSBhIGJ1Z3ppbGxhIHRoaXMgZml4ZXM/ICBJZiBzbywgY2FuIHlvdSBh
ZGQgYSBsaW5rPw0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz48bWFpbHRv
OmFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBGcmFu
Y2lzLCBEYXZpZCA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPjxtYWlsdG86RGF2aWQuRnJhbmNpc0Bh
bWQuY29tPg0KU2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIwMTkgOTo0MyBBTQ0KVG86IEthemxh
dXNrYXMsIE5pY2hvbGFzOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQpDYzogV2VudGxhbmQsIEhhcnJ5DQpTdWJqZWN0
OiBSZTogW1BBVENIXSBSZXZlcnQgImRybS9hbWQvZGlzcGxheTogRW5hYmxlIGZhc3QgcGxhbmUg
dXBkYXRlcyB3aGVuIHN0YXRlLT5hbGxvd19tb2Rlc2V0ID0gdHJ1ZSINCg0KDQpSZXZpZXdlZC1i
eTogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNpc0BhbWQuY29tPjxtYWlsdG86ZGF2aWQuZnJh
bmNpc0BhbWQuY29tPg0KDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+PG1haWx0
bzphbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgTmlj
aG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPjxtYWlsdG86bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KU2VudDogSnVuZSAyMCwgMjAxOSA4OjM0OjAzIEFN
DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8bWFpbHRvOmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPg0KQ2M6IEZyYW5jaXMsIERhdmlkOyBXZW50bGFuZCwgSGFycnk7IEth
emxhdXNrYXMsIE5pY2hvbGFzDQpTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiZHJtL2FtZC9kaXNw
bGF5OiBFbmFibGUgZmFzdCBwbGFuZSB1cGRhdGVzIHdoZW4gc3RhdGUtPmFsbG93X21vZGVzZXQg
PSB0cnVlIg0KDQpUaGlzIHJldmVydHMgY29tbWl0IGViYzhjNmYxODMyMmFkNTQyNzU5OTdhODg4
Y2ExNzMxZDc0YjcxMWYuDQoNClRoZXJlIGFyZSBzdGlsbCBtaXNzaW5nIGNvcm5lciBjYXNlcyB3
aXRoIGN1cnNvciBpbnRlcmFjdGlvbiBhbmQgdGhlc2UNCmZhc3QgcGxhbmUgdXBkYXRlcyBvbiBQ
aWNhc3NvIGFuZCBSYXZlbjIgbGVhZGluZyB0byBlbmRsZXNzIFBTVEFURQ0Kd2FybmluZ3MgZm9y
IHR5cGljYWwgZGVza3RvcCB1c2FnZSBkZXBlbmRpbmcgb24gdGhlIHVzZXJzcGFjZS4NCg0KVGhp
cyBjaGFuZ2Ugc2hvdWxkIGJlIHJldmVydGVkIHVudGlsIHRoZXNlIGlzc3VlcyBoYXZlIGJlZW4g
cmVzb2x2ZWQuDQoNCkNjOiBEYXZpZCBGcmFuY2lzIDxkYXZpZC5mcmFuY2lzQGFtZC5jb20+PG1h
aWx0bzpkYXZpZC5mcmFuY2lzQGFtZC5jb20+DQpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+PG1haWx0bzpoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KU2lnbmVkLW9m
Zi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPjxt
YWlsdG86bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDggKysrKysrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KaW5kZXggMzNkY2Q0MTg3MTU3Li5kNmFjYmNm
YTU3MGMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jDQpAQCAtNjQ3MSw2ICs2NDcxLDE0IEBAIHN0YXRpYyBib29sIHNob3VsZF9y
ZXNldF9wbGFuZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsDQogICAgICAgICBzdHJ1
Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlOw0KICAgICAgICAgaW50IGk7DQoNCisg
ICAgICAgLyoNCisgICAgICAgICogVE9ETzogUmVtb3ZlIHRoaXMgaGFjayBvbmNlIHRoZSBjaGVj
a3MgYmVsb3cgYXJlIHN1ZmZpY2llbnQNCisgICAgICAgICogZW5vdWdoIHRvIGRldGVybWluZSB3
aGVuIHdlIG5lZWQgdG8gcmVzZXQgYWxsIHRoZSBwbGFuZXMgb24NCisgICAgICAgICogdGhlIHN0
cmVhbS4NCisgICAgICAgICovDQorICAgICAgIGlmIChzdGF0ZS0+YWxsb3dfbW9kZXNldCkNCisg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCisNCiAgICAgICAgIC8qIEV4aXQgZWFybHkgaWYg
d2Uga25vdyB0aGF0IHdlJ3JlIGFkZGluZyBvciByZW1vdmluZyB0aGUgcGxhbmUuICovDQogICAg
ICAgICBpZiAob2xkX3BsYW5lX3N0YXRlLT5jcnRjICE9IG5ld19wbGFuZV9zdGF0ZS0+Y3J0YykN
CiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPg0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQoNCg==

--_000_fda7ee75ec08f859e78848e82eed82e0amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <22BE816E4DB75947BBB87F6275A256AA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5TdXJlLCBp
dCdzIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDk0OSI+DQpodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTA5NDk8L2E+IC48YnI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+PGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJtb3ot
Y2l0ZS1wcmVmaXgiPkkndmUgYWRkZWQgaXQgdG8gdGhlIGNvbW1pdCwgdGhhbmtzLjxicj4NCjwv
ZGl2Pg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij48YnI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9Im1vei1jaXRlLXByZWZpeCI+TmljaG9sYXMgS2F6bGF1c2thczxicj4NCjwvZGl2Pg0KPGRp
diBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij48YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9Im1vei1j
aXRlLXByZWZpeCI+T24gNi8yMC8xOSAxMDozNSBBTSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3Rl
Ojxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOkJONlBSMTJN
QjE4MDlBMzM0RThENEFCMDBENEJDQjE3OEY3RTQwQEJONlBSMTJNQjE4MDkubmFtcHJkMTIucHJv
ZC5vdXRsb29rLmNvbSI+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0eWxlPSJkaXNwbGF5Om5v
bmU7Ij4gUCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9IDwvc3R5bGU+DQo8ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsN
CiAgICAgICAgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpJcyB0aGVy
ZSBhIGJ1Z3ppbGxhIHRoaXMgZml4ZXM/Jm5ic3A7IElmIHNvLCBjYW4geW91IGFkZCBhIGxpbms/
PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsNCiAgICAgICAgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOw0KICAgICAgICBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkFsZXg8YnI+DQo8L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxh
eTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPg0KPGRpdiBpZD0iZGl2UnBs
eUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJmb250LXNpemU6MTFwdCIgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBhbWQtZ2Z4DQo8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyI+DQombHQ7YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyZndDs8L2E+IG9uIGJlaGFsZiBvZiBGcmFuY2lzLCBEYXZpZCA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86RGF2aWQuRnJhbmNpc0BhbWQu
Y29tIj4NCiZsdDtEYXZpZC5GcmFuY2lzQGFtZC5jb20mZ3Q7PC9hPjxicj4NCjxiPlNlbnQ6PC9i
PiBUaHVyc2RheSwgSnVuZSAyMCwgMjAxOSA5OjQzIEFNPGJyPg0KPGI+VG86PC9iPiBLYXpsYXVz
a2FzLCBOaWNob2xhczsgPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0i
bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIj4NCmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPC9hPjxicj4NCjxiPkNjOjwvYj4gV2VudGxhbmQsIEhhcnJ5PGJyPg0KPGI+
U3ViamVjdDo8L2I+IFJlOiBbUEFUQ0hdIFJldmVydCAmcXVvdDtkcm0vYW1kL2Rpc3BsYXk6IEVu
YWJsZSBmYXN0IHBsYW5lIHVwZGF0ZXMgd2hlbiBzdGF0ZS0mZ3Q7YWxsb3dfbW9kZXNldCA9IHRy
dWUmcXVvdDs8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9kaXY+DQo8c3R5bGUgdHlwZT0i
dGV4dC9jc3MiIHN0eWxlPSJkaXNwbGF5Om5vbmUiPg0KPCEtLQ0KcA0KCXttYXJnaW4tdG9wOjA7
DQoJbWFyZ2luLWJvdHRvbTowfQ0KLS0+DQo8L3N0eWxlPg0KPGRpdiBkaXI9Imx0ciI+DQo8ZGl2
IGlkPSJ4X2RpdnRhZ2RlZmF1bHR3cmFwcGVyIiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtc2l6ZTox
MnB0OyBjb2xvcjojMDAwMDAwOw0KICAgICAgICAgIGZvbnQtZmFtaWx5OkNhbGlicmksSGVsdmV0
aWNhLHNhbnMtc2VyaWYiPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDsgbWFyZ2luLWJvdHRvbTow
Ij5SZXZpZXdlZC1ieTogRGF2aWQgRnJhbmNpcyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86ZGF2aWQuZnJhbmNpc0BhbWQuY29tIj4NCiZsdDtkYXZpZC5mcmFu
Y2lzQGFtZC5jb20mZ3Q7PC9hPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7IG1hcmdpbi1i
b3R0b206MCI+PGJyPg0KPC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDsgbWFyZ2luLWJvdHRv
bTowIj48YnI+DQo8L3A+DQo8L2Rpdj4NCjxociB0YWJpbmRleD0iLTEiIHN0eWxlPSJkaXNwbGF5
OmlubGluZS1ibG9jazsgd2lkdGg6OTglIj4NCjxkaXYgaWQ9InhfZGl2UnBseUZ3ZE1zZyIgZGly
PSJsdHIiPjxmb250IHN0eWxlPSJmb250LXNpemU6MTFwdCIgZmFjZT0iQ2FsaWJyaSwgc2Fucy1z
ZXJpZiIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBhbWQtZ2Z4DQo8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyI+DQombHQ7YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyZndDs8L2E+IG9uIGJlaGFsZiBvZiBOaWNob2xhcyBLYXpsYXVza2FzIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20iPg0KJmx0O25pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbSZndDs8L2E+PGJyPg0KPGI+U2Vu
dDo8L2I+IEp1bmUgMjAsIDIwMTkgODozNDowMyBBTTxicj4NCjxiPlRvOjwvYj4gPGEgY2xhc3M9
Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIj4NCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPjxicj4NCjxi
PkNjOjwvYj4gRnJhbmNpcywgRGF2aWQ7IFdlbnRsYW5kLCBIYXJyeTsgS2F6bGF1c2thcywgTmlj
aG9sYXM8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gW1BBVENIXSBSZXZlcnQgJnF1b3Q7ZHJtL2FtZC9k
aXNwbGF5OiBFbmFibGUgZmFzdCBwbGFuZSB1cGRhdGVzIHdoZW4gc3RhdGUtJmd0O2FsbG93X21v
ZGVzZXQgPSB0cnVlJnF1b3Q7PC9mb250Pg0KPGRpdj4mbmJzcDs8L2Rpdj4NCjwvZGl2Pg0KPGRp
diBjbGFzcz0ieF9Cb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTFwdCI+DQo8ZGl2IGNsYXNzPSJ4X1BsYWluVGV4dCI+VGhpcyByZXZlcnRzIGNvbW1p
dCBlYmM4YzZmMTgzMjJhZDU0Mjc1OTk3YTg4OGNhMTczMWQ3NGI3MTFmLjxicj4NCjxicj4NClRo
ZXJlIGFyZSBzdGlsbCBtaXNzaW5nIGNvcm5lciBjYXNlcyB3aXRoIGN1cnNvciBpbnRlcmFjdGlv
biBhbmQgdGhlc2U8YnI+DQpmYXN0IHBsYW5lIHVwZGF0ZXMgb24gUGljYXNzbyBhbmQgUmF2ZW4y
IGxlYWRpbmcgdG8gZW5kbGVzcyBQU1RBVEU8YnI+DQp3YXJuaW5ncyBmb3IgdHlwaWNhbCBkZXNr
dG9wIHVzYWdlIGRlcGVuZGluZyBvbiB0aGUgdXNlcnNwYWNlLjxicj4NCjxicj4NClRoaXMgY2hh
bmdlIHNob3VsZCBiZSByZXZlcnRlZCB1bnRpbCB0aGVzZSBpc3N1ZXMgaGF2ZSBiZWVuIHJlc29s
dmVkLjxicj4NCjxicj4NCkNjOiBEYXZpZCBGcmFuY2lzIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpkYXZpZC5mcmFuY2lzQGFtZC5jb20iPg0KJmx0O2Rhdmlk
LmZyYW5jaXNAYW1kLmNvbSZndDs8L2E+PGJyPg0KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpoYXJyeS53ZW50bGFuZEBhbWQu
Y29tIj4NCiZsdDtoYXJyeS53ZW50bGFuZEBhbWQuY29tJmd0OzwvYT48YnI+DQpTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzpuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20iPg0KJmx0O25pY2hvbGFz
LmthemxhdXNrYXNAYW1kLmNvbSZndDs8L2E+PGJyPg0KLS0tPGJyPg0KJm5ic3A7ZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDggJiM0MzsmIzQzOyYj
NDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOzxicj4NCiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoJiM0MzspPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jPGJyPg0KaW5kZXggMzNkY2Q0MTg3MTU3Li5k
NmFjYmNmYTU3MGMgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYzxicj4NCiYjNDM7JiM0MzsmIzQzOyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM8YnI+DQpAQCAtNjQ3MSw2ICYj
NDM7NjQ3MSwxNCBAQCBzdGF0aWMgYm9vbCBzaG91bGRfcmVzZXRfcGxhbmUoc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLDxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlOzxi
cj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpbnQg
aTs8YnI+DQombmJzcDs8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAvKjxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICogVE9ETzogUmVtb3ZlIHRoaXMgaGFjayBvbmNlIHRoZSBjaGVja3MgYmVsb3cgYXJlIHN1
ZmZpY2llbnQ8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAqIGVub3VnaCB0byBkZXRlcm1pbmUgd2hlbiB3ZSBuZWVkIHRvIHJlc2V0IGFsbCB0aGUg
cGxhbmVzIG9uPGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgKiB0aGUgc3RyZWFtLjxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICovPGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgaWYgKHN0YXRlLSZndDthbGxvd19tb2Rlc2V0KTxicj4NCiYjNDM7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiB0cnVlOzxicj4NCiYjNDM7PGJyPg0KJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8qIEV4aXQgZWFybHkgaWYg
d2Uga25vdyB0aGF0IHdlJ3JlIGFkZGluZyBvciByZW1vdmluZyB0aGUgcGxhbmUuICovPGJyPg0K
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChvbGRf
cGxhbmVfc3RhdGUtJmd0O2NydGMgIT0gbmV3X3BsYW5lX3N0YXRlLSZndDtjcnRjKTxicj4NCiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gdHJ1ZTs8YnI+DQot
LSA8YnI+DQoyLjE3LjE8YnI+DQo8YnI+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXzxicj4NCmFtZC1nZnggbWFpbGluZyBsaXN0PGJyPg0KPGEgY2xhc3M9
Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT48YnI+DQo8YSBo
cmVmPSJodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngiIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4PC9hPjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4N
CjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPHA+PGJyPg0KPC9wPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_fda7ee75ec08f859e78848e82eed82e0amdcom_--

--===============1448968544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1448968544==--
