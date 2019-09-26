Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D85BF2D3
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA686ECCB;
	Thu, 26 Sep 2019 12:22:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CC36ECCB
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agDiKBLkH9yWWi3DtFDyfoSj41I9psrgFDQc6ApXl6w64z79t/7Ix/PzM56y3RAQJSBPuOhYf8GDthswVBC3BLeAd7q/Cpoy2pvMsP2s9ATCw+4bjO50TGnS2ULna8S7L+l9kSxtyXJ+iLlBLEvTFYTggahkR7lXR17tL0uccK9IEtj1tPa+lTlCoBz05ifg5EiZKoB3GkgVjcCi17IzHlfnjMvdRZ/liz/21mxlfb3hww8bMp89SppX8VudNz2q1IuoaVzV/ZQgQXhowhC6j3dkxZzBmbWJTL1AsZ3jVcFfInMz/M6xDS3+TDn1GWg76qkl1uWiznmR9HGfTWW6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOn51NEZPpzFnwiPaLCF3TdjCuK3hNd54li0pARI3IM=;
 b=D3PKejLZAaRb7BN7CKgU1PeVvlmsHXhi5EX7VhdGkT1xZJ0S9HCmOB2fIdgTv999yVxbBkOZ5jHFchbO5DZm0/g8ex1L4jE8805optI2PCCJp7V+xw8QHZy8VfAgi1aIktNH0xa2s8vMyp4fuv1P5vGk2E/Rxuq+8crbzp+zalPLbc8xrIZF7IfZa7RMNAd7mRR646TQ1bw9UHRDRV8+YiqfyX5T/YMljA4N5YSOcqVGXNndoWH1ARmg0N4Fuuvqpd9broN1fIrCIpUlCMDQ7QP1FkyaB9lNbNGeOgXh6PKRrr9/V0dLAQV4fi9dlBRttkN2oWOHVCKsaR/iFWR07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4127.namprd12.prod.outlook.com (52.135.48.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 12:22:09 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 12:22:09 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add sensor lock support for smu
Thread-Index: AQHVdEhK0bSwCh5/8EGqfc2q81jtb6c94PFw
Date: Thu, 26 Sep 2019 12:22:09 +0000
Message-ID: <MN2PR12MB334488D05D2FAEF84C6D550EE4860@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190926085607.2510-1-kevin1.wang@amd.com>
 <20190926085607.2510-2-kevin1.wang@amd.com>
In-Reply-To: <20190926085607.2510-2-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ce2d66f-3960-479b-a62a-08d7427c2735
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4127; 
x-ms-traffictypediagnostic: MN2PR12MB4127:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4127F3E6A9F853B7773AB606E4860@MN2PR12MB4127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(13464003)(189003)(199004)(81166006)(6506007)(8936002)(81156014)(7736002)(486006)(229853002)(52536014)(66066001)(76116006)(55016002)(256004)(14444005)(99286004)(4326008)(478600001)(5660300002)(66946007)(14454004)(25786009)(966005)(76176011)(71200400001)(33656002)(102836004)(71190400001)(54906003)(6306002)(305945005)(110136005)(6116002)(26005)(2906002)(3846002)(9686003)(316002)(86362001)(6436002)(7696005)(6246003)(446003)(11346002)(66556008)(66476007)(66446008)(64756008)(53546011)(8676002)(476003)(74316002)(2501003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4127;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Md6WHwAGDu4164iHX1ggd7rBYaY7FQ9n1xAAyRJKuy/3qRSa8m88WFkVoLmWFN5gUANCkHbAraw1IAngGorGKI6P3QRYmZk+Dto4RJkjcICuMzsars313AOxMXf2wCQDpLaDsFTVxcpbv/6du9WwtqPvYuCLulbfvuNMoayRu4VonvLmo3/UOelrBTZ9LurG8zlpHuK0Y951l25S0IdXuMWVmOq8DQaft2YjGY7AOM8PQppDKpa6eA2AFv+1GeQzsWLYoR6I4W2FmhPWSyq4pAQZYBQOsvJmb3SbroRyd6dEaKJHTuwvECFnAyndd25P4LmqdPMf3f4o4ZCIw0IqWbdWZCewmuwRr549uVyG+PPvXQV6M99awSxhx75foZUTUY4DPNJoL+jyybH7fEw+jNexELpUdJtEiyFisRzAxLzVGq+BxuMf5UYH3TydgjToH5FEZ3J4QchUF5kowJ66SQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce2d66f-3960-479b-a62a-08d7427c2735
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:22:09.5231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7U1kHOm/boNR910AjJ2wPDOGvHENltjw2Smiwx+MvvR9j9yFAttEQjf0uih5+DQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOn51NEZPpzFnwiPaLCF3TdjCuK3hNd54li0pARI3IM=;
 b=t8El3BSMxdtQg1rCApSQmta6Mrp9RlgHUphgohjjpTpoYIVpigNxAbAUoDVBD3cmpiUZdBaKAhUNczDiHIps7NMjRrg+wW4bbfc6uwaFl9BwHNAAjljr91jtZ/sIp+sBCz3J9j9R6KSuPgML5JMvIi2TGyQQ7SeC63niLqsjyAc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SG93IGFib3V0IGFkZGluZyB0aGUgbXV0ZXggcHJvdGVjdGlvbiBpbiBzbXVfdjExXzBfc2VuZF9t
c2dfd2l0aF9wYXJhbSBhbmQgc211X3YxMV8wX3NlbmRfbXNnPw0KVGhhdCBzZWVtcyBhYmxlIHRv
IHNpbXBsaWZ5IHRoZSBjb2RlLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
YW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIFdhbmcsIEtldmluKFlhbmcpDQpTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE5
IDQ6NTYgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5j
b20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQ
QVRDSCAyLzJdIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgc2Vuc29yIGxvY2sgc3VwcG9ydCBmb3Ig
c211DQoNCndoZW4gbXVsdGl0aHJlYWRpbmcgYWNjZXNzIHN5c2ZzIG9mIGFtZGdwdV9wbV9pbmZv
IGF0IHRoZSBzYW1ldGltZS4NCnRoZSBzd3NtdSBkcml2ZXIgY2F1c2Ugc211IGZpcm13YXJlIGhh
bmcuDQoNCmVnOg0Kc2luZ2xlIHRocmVhZCBhY2Nlc3M6DQpNZXNzYWdlIEEgKyBQYXJhbSBBID09
PiByaWdodA0KTWVzc2FnZSBCICsgUGFyYW0gQiA9PT4gcmlnaHQNCk1lc3NhZ2UgQyArIFBhcmFt
IEMgPT0+IHJpZ2h0DQptdWx0aXRocmVhZGluZyBhY2Nlc3M6DQpNZXNzYWdlIEEgKyBQYXJhbSBC
ID09PiBlcnJvcg0KTWVzc2FnZSBCICsgUGFyYW0gQSA9PT4gZXJyb3INCk1lc3NhZ2UgQyArIFBh
cmFtIEMgPT0+IHJpZ2h0DQoNCnRoZSBwYXRjaCB3aWxsIGFkZCBzZW5zb3IgbG9jayhtdXRleCkg
dG8gYXZvaWQgdGhpcyBlcnJvci4NCg0KU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4x
LndhbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyAgICAgfCAyICsrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVy
dXNfcHB0LmMgICB8IDIgKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oIHwgMSArDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jICAgICB8IDIgKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmMgICAgIHwgMiArKw0KIDUgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCmluZGV4IDIzMjkzZTE1NjM2
Yi4uZGY1MTBjYjg2ZGE1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMNCkBAIC04NDAsNiArODQwLDggQEAgc3RhdGljIGludCBzbXVfc3dfaW5pdCh2b2lk
ICpoYW5kbGUpDQogCXNtdS0+c211X2JhY28uc3RhdGUgPSBTTVVfQkFDT19TVEFURV9FWElUOw0K
IAlzbXUtPnNtdV9iYWNvLnBsYXRmb3JtX3N1cHBvcnQgPSBmYWxzZTsNCiANCisJbXV0ZXhfaW5p
dCgmc211LT5zZW5zb3JfbG9jayk7DQorDQogCXNtdS0+d2F0ZXJtYXJrc19iaXRtYXAgPSAwOw0K
IAlzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA9IFBQX1NNQ19QT1dFUl9QUk9GSUxFX0JPT1RVUF9E
RUZBVUxUOw0KIAlzbXUtPmRlZmF1bHRfcG93ZXJfcHJvZmlsZV9tb2RlID0gUFBfU01DX1BPV0VS
X1BST0ZJTEVfQk9PVFVQX0RFRkFVTFQ7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hcmN0dXJ1c19wcHQuYw0KaW5kZXggYTA0N2E3ZWMzNjk4Li5iOWI3YjczMzU0YTAgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCkBAIC0xMDI1
LDYgKzEwMjUsNyBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LA0KIAlpZiAoIWRhdGEgfHwgIXNpemUpDQogCQlyZXR1cm4gLUVJTlZBTDsN
CiANCisJbXV0ZXhfbG9jaygmc211LT5zZW5zb3JfbG9jayk7DQogCXN3aXRjaCAoc2Vuc29yKSB7
DQogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NQVhfRkFOX1JQTToNCiAJCSoodWludDMyX3QgKilk
YXRhID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsgQEAgLTEwNTEsNiArMTA1Miw3IEBAIHN0YXRp
YyBpbnQgYXJjdHVydXNfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCWRl
ZmF1bHQ6DQogCQlyZXQgPSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBz
aXplKTsNCiAJfQ0KKwltdXRleF91bmxvY2soJnNtdS0+c2Vuc29yX2xvY2spOw0KIA0KIAlyZXR1
cm4gcmV0Ow0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaA0KaW5kZXggNWM4OTg0NDRmZjk3Li5iYzRiNzNlMDcxOGUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQpAQCAtMzUwLDYgKzM1
MCw3IEBAIHN0cnVjdCBzbXVfY29udGV4dA0KIAljb25zdCBzdHJ1Y3Qgc211X2Z1bmNzCQkqZnVu
Y3M7DQogCWNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzCSpwcHRfZnVuY3M7DQogCXN0cnVjdCBt
dXRleAkJCW11dGV4Ow0KKwlzdHJ1Y3QgbXV0ZXgJCQlzZW5zb3JfbG9jazsNCiAJdWludDY0X3Qg
cG9vbF9zaXplOw0KIA0KIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQJc211X3RhYmxlOw0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KaW5kZXggZGIyZTE4MWJh
NDVhLi5jMGI2NDBkOGQ5ZTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYw0KQEAgLTEzODcsNiArMTM4Nyw3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3JlYWRf
c2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KIAlpZighZGF0YSB8fCAhc2l6ZSkNCiAJ
CXJldHVybiAtRUlOVkFMOw0KIA0KKwltdXRleF9sb2NrKCZzbXUtPnNlbnNvcl9sb2NrKTsNCiAJ
c3dpdGNoIChzZW5zb3IpIHsNCiAJY2FzZSBBTURHUFVfUFBfU0VOU09SX01BWF9GQU5fUlBNOg0K
IAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVtUnBtOyBAQCAtMTQxMCw2
ICsxNDExLDcgQEAgc3RhdGljIGludCBuYXZpMTBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsDQogCWRlZmF1bHQ6DQogCQlyZXQgPSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwg
c2Vuc29yLCBkYXRhLCBzaXplKTsNCiAJfQ0KKwltdXRleF91bmxvY2soJnNtdS0+c2Vuc29yX2xv
Y2spOw0KIA0KIAlyZXR1cm4gcmV0Ow0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS92ZWdhMjBfcHB0LmMNCmluZGV4IDkwODJkYTE1NzhkMS4uZjY1NWViZDliYTIyIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCkBAIC0zMDE3LDYgKzMw
MTcsNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwNCiAJaWYoIWRhdGEgfHwgIXNpemUpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCisJbXV0
ZXhfbG9jaygmc211LT5zZW5zb3JfbG9jayk7DQogCXN3aXRjaCAoc2Vuc29yKSB7DQogCWNhc2Ug
QU1ER1BVX1BQX1NFTlNPUl9NQVhfRkFOX1JQTToNCiAJCSoodWludDMyX3QgKilkYXRhID0gcHB0
YWJsZS0+RmFuTWF4aW11bVJwbTsgQEAgLTMwNDIsNiArMzA0Myw3IEBAIHN0YXRpYyBpbnQgdmVn
YTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KIAlkZWZhdWx0Og0KIAkJ
cmV0ID0gc211X3NtY19yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7DQogCX0N
CisJbXV0ZXhfdW5sb2NrKCZzbXUtPnNlbnNvcl9sb2NrKTsNCiANCiAJcmV0dXJuIHJldDsNCiB9
DQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
