Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF3D06C2
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 06:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EE76E8D4;
	Wed,  9 Oct 2019 04:51:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710077.outbound.protection.outlook.com [40.107.71.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393186E8D3
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 04:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0s6WdS88F99Ka+izakD56uuOGZRfY8/2UgQtnIRtwGVzaX9tw5zv5ctSjLw7cNZiip/WbfxB5VxhV73US4Fkk+doTHMFYeCzrDvoNNxlcJi9svM2N2Fp0vIoyU83PsvfrZti4gVymkRBWBnGCbLG5JjeGuaXOTpcH27GJwI5yW6BCQiSiDtlj5SBcc/LVI9xI98/BlGmpWFynmHxQZNyRnWyd2gRZC0CY3HqTitJ0JfiaFL8f+eOunnAzRSjcXdjDdasTeyU5/FCuD9fun60Peig9bCr843kYgXarA05yqlKDTzFnN6ykkZZ0XOBuX4ccB4jUcGQefrKZI/WzBCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDQaaTSxZAEifMtTJaKgzD22C4nufyDWvZ8LDnbnbTQ=;
 b=k1l83q0VUY2fCpRjS5w/CzJZrVYGYxJ78OcN9seEuf2HzaRkmufc0ouO7itqOjwNejI8Bmc9ViWOYgRAMnF7aqCvIgZTp5CM9NE47qb1UkTkZQX6YE5Ee2K3nesSA9FYDbyGBmPyBNPbOxWQB65+bFN4Gmoptvz7QPhZHUeMTZLeQ/UXTYGiuN2gK0/Voj7Jkz2yP5mGiq2SMu+VxQ6Z/TnLFvI2CWPxgbEPQsQV8e46fNn+pyDOWTfcE2EqArogEW1VKibJ6s/FMOt9j4VW92blB9DZxQK4pRtUQOstyYiWxNMsKoVl7RGPp2xWeFlDNntxyEsBW+9CJFROdV2c4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3886.namprd12.prod.outlook.com (10.255.238.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Wed, 9 Oct 2019 04:51:44 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 04:51:44 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: fix typo in mvdd table setup
Thread-Topic: [PATCH] drm/amdgpu/powerplay: fix typo in mvdd table setup
Thread-Index: AQHVefaMq4Zx1vUpx0mtRYsb+xlxradRxnJw
Date: Wed, 9 Oct 2019 04:51:44 +0000
Message-ID: <MN2PR12MB3344C83FBB9A868A5F03C0FEE4950@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191003142617.7869-1-alexander.deucher@amd.com>
In-Reply-To: <20191003142617.7869-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d75a48c7-f2cf-4afd-4316-08d74c746226
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3886:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB388616C563CF0B57641B6AC3E4950@MN2PR12MB3886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(13464003)(14454004)(66066001)(81166006)(476003)(446003)(3846002)(6116002)(305945005)(229853002)(9686003)(2501003)(7696005)(11346002)(966005)(33656002)(8676002)(74316002)(81156014)(256004)(186003)(26005)(486006)(316002)(102836004)(7736002)(478600001)(71190400001)(6436002)(71200400001)(76176011)(99286004)(8936002)(86362001)(52536014)(54906003)(66946007)(66556008)(6306002)(64756008)(66476007)(2906002)(66446008)(55016002)(110136005)(76116006)(4326008)(53546011)(6506007)(5660300002)(25786009)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3886;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wyfSUmJ3pdpBV7tV/e7ZluCpdShQ65kRiVBb+cWbEve+7DLDZMeKW+Fg/QIO5EYtv5eSY/b0BrowJqKqBWBEfdduIObxonHpgHJ6voOqvXDVddtWQBy+LHz7ldXvzcO74bizQmSAb2hLwlz0GfgPzo7vT3D1KQaztLOqO23Qassf2Zga/mrz1IIzudgtMEOWyMvcpE52vkbcQYN7DDapeitXHJSUwsvjf5qxHJOm0lcHVFoPy6eDncHxmVWGexFnA6g0FWNBrhBjfM+6Dg1hfphHq+XvlOdA8hs+vUDlQkPGGoBr9UMY9rTeTX/HQGT/wr/GEhOlTwPXKEM1CpP09S0KTfZu9SJmpKZ2g2swk9LjlfPU5WjSWvKNHzMkCpRmaXxe7ZI1QkIsznTMbpXJADv5HHdRuC7UUV2e/TK3xRaISo4jPJUb/SyBRC6RQh73b7VnjrYqItcMGqJZRlWNLw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75a48c7-f2cf-4afd-4316-08d74c746226
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 04:51:44.1927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydw9FqadsDmGasVY7Bzhoq7XZOZzM6d0r1/sqzeE62CIOjRZJ0TPcVPlGQKTXztz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDQaaTSxZAEifMtTJaKgzD22C4nufyDWvZ8LDnbnbTQ=;
 b=mFMeFl56wV2kjmESZTZJE9MajGhXJeQG8tnM//dLuzDiGK+mAFG6FaEENyEZVM+3as2keToKJ8WpdIs8JjHBc/awO/BXiWbA141UL+DZyYoQK7LhDVLs5Ltq9L/DiyU7FO2VA6/jhtH5f2I/73+UX3HbqFIDsvXQDlSuXbsnyvM=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Robert Strube <rstrube@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyDQpTZW50OiBUaHVyc2RheSwg
T2N0b2JlciAzLCAyMDE5IDEwOjI2IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBS
b2JlcnQgU3RydWJlIDxyc3RydWJlQGdtYWlsLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZGdwdS9wb3dlcnBsYXk6IGZpeCB0eXBvIGluIG12ZGQgdGFibGUgc2V0dXANCg0KUG9sYXJpcyBh
bmQgdmVnYW0gdXNlIGNvdW50IGZvciB0aGUgdmFsdWUgcmF0aGVyIHRoYW4gbGV2ZWwuICBUaGlz
IGxvb2tzIGxpa2UgYSBjb3B5IHBhc3RlIHR5cG8gZnJvbSB3aGVuIHRoZSBjb2RlIHdhcyBhZGFw
dGVkIGZyb20gcHJldmlvdXMgYXNpY3MuDQoNCkknbSBub3Qgc3VyZSB0aGF0IHRoZSBTTVUgYWN0
dWFsbHkgdXNlcyB0aGlzIHZhbHVlLCBzbyBJIGRvbid0IGtub3cgdGhhdCBpdCBhY3R1YWxseSBp
cyBhIGJ1ZyBwZXIgc2UuDQoNCkJ1ZzogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTA4NjA5DQpSZXBvcnRlZC1ieTogUm9iZXJ0IFN0cnViZSA8cnN0cnViZUBn
bWFpbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvcG9s
YXJpczEwX3NtdW1nci5jIHwgMiArLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dW1nci92ZWdhbV9zbXVtZ3IuYyAgICAgfCAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVtZ3IuYw0KaW5kZXggZGM3NTQ0NDdm
MGRkLi4yM2MxMjAxOGRiYzEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jDQpAQCAtNjU1LDcgKzY1NSw3IEBA
IHN0YXRpYyBpbnQgcG9sYXJpczEwX3BvcHVsYXRlX3NtY19tdmRkX3RhYmxlKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IsDQogCQkJY291bnQgPSBTTVVfTUFYX1NNSU9fTEVWRUxTOw0KIAkJZm9yIChs
ZXZlbCA9IDA7IGxldmVsIDwgY291bnQ7IGxldmVsKyspIHsNCiAJCQl0YWJsZS0+U21pb1RhYmxl
Mi5QYXR0ZXJuW2xldmVsXS5Wb2x0YWdlID0NCi0JCQkJUFBfSE9TVF9UT19TTUNfVVMoZGF0YS0+
bXZkZF92b2x0YWdlX3RhYmxlLmVudHJpZXNbY291bnRdLnZhbHVlICogVk9MVEFHRV9TQ0FMRSk7
DQorCQkJCVBQX0hPU1RfVE9fU01DX1VTKGRhdGEtPm12ZGRfdm9sdGFnZV90YWJsZS5lbnRyaWVz
W2xldmVsXS52YWx1ZSAqIA0KK1ZPTFRBR0VfU0NBTEUpOw0KIAkJCS8qIEluZGV4IGludG8gRHBt
VGFibGUuU21pby4gRHJpdmUgYml0cyBmcm9tIFNtaW8gZW50cnkgdG8gZ2V0IHRoaXMgdm9sdGFn
ZSBsZXZlbC4qLw0KIAkJCXRhYmxlLT5TbWlvVGFibGUyLlBhdHRlcm5bbGV2ZWxdLlNtaW8gPQ0K
IAkJCQkodWludDhfdCkgbGV2ZWw7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jDQppbmRleCA3Yzk2MGIwNzc0NmYuLmFlMThmYmNi
MjZmYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92
ZWdhbV9zbXVtZ3IuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdy
L3ZlZ2FtX3NtdW1nci5jDQpAQCAtNDU2LDcgKzQ1Niw3IEBAIHN0YXRpYyBpbnQgdmVnYW1fcG9w
dWxhdGVfc21jX212ZGRfdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwNCiAJCQljb3VudCA9
IFNNVV9NQVhfU01JT19MRVZFTFM7DQogCQlmb3IgKGxldmVsID0gMDsgbGV2ZWwgPCBjb3VudDsg
bGV2ZWwrKykgew0KIAkJCXRhYmxlLT5TbWlvVGFibGUyLlBhdHRlcm5bbGV2ZWxdLlZvbHRhZ2Ug
PSBQUF9IT1NUX1RPX1NNQ19VUygNCi0JCQkJCWRhdGEtPm12ZGRfdm9sdGFnZV90YWJsZS5lbnRy
aWVzW2NvdW50XS52YWx1ZSAqIFZPTFRBR0VfU0NBTEUpOw0KKwkJCQkJZGF0YS0+bXZkZF92b2x0
YWdlX3RhYmxlLmVudHJpZXNbbGV2ZWxdLnZhbHVlICogVk9MVEFHRV9TQ0FMRSk7DQogCQkJLyog
SW5kZXggaW50byBEcG1UYWJsZS5TbWlvLiBEcml2ZSBiaXRzIGZyb20gU21pbyBlbnRyeSB0byBn
ZXQgdGhpcyB2b2x0YWdlIGxldmVsLiovDQogCQkJdGFibGUtPlNtaW9UYWJsZTIuUGF0dGVyblts
ZXZlbF0uU21pbyA9DQogCQkJCSh1aW50OF90KSBsZXZlbDsNCi0tDQoyLjIwLjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGlu
ZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
