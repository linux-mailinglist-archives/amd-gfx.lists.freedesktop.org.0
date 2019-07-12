Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA4669F4
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC676E328;
	Fri, 12 Jul 2019 09:32:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFD06E328
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmeOvOp9xS3mWBalNxbFkx7hqob5gEXKiTgSDOhd9CdN552DoFfkBd4wghTIbf9ul6vX4wjTUAl6XSQGcdIUgEj9PMwNIrxvnQ2OdSswLKB8X+5ZZ27RVQZbM1AO8RdM1J6iUrIHTV6nbyXV5Gp6xR16yFlZoaSn9quMESW6mWpGMcz4nv485hxIOkMzQG5AUL8OP7SiSmzp6VvTrEnw1HopTebZuFrGYy3eHSeNY1O/MBFOi/SDtA1kLOaAHCuVlzINWgCOOPg3AIAmM/Mxsl66mi1nefz4GuIVQNdyvgqFEZmXgWebUlKp3h3YKmIKZ0MF6wKcHN3lg3UrT7vTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD1/PQMESKHkFEDhe/vCdQz7LXe0w0Pfw8Q6ZIdXpcc=;
 b=dvAOK26rzzBUGovFPdCV249+7N4mOgcDPM4L/pyJaqPLA2eMFMmRrn52DFFd37IqRuLwZZrObjCDmTq+7VnWNCnOtsTt/DBHMzMyUZyLd6Io5Dq3kzwvbj9Bw8c6pdR5KfGDUBEAnhOZfMF0cGW4rVfqnz3ArY5PxzBM+lWoV7caPyLdLdBCcx7wC46vWiz+kVfrHh12ZvBmLTKMaMZcaTijZ1LnNDBsd3uhRyXcECCOLltUJpkCvmqcsTOms/l93g+JxDfda7ZoTECIhCkV93DHmWigC0GF/r8rDYxGhh8WUYdq0ML4Qa/EviklMjQZ6C/56jeFHTnEsbb1VBbWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4174.namprd12.prod.outlook.com (10.255.224.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Fri, 12 Jul 2019 09:32:34 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 09:32:34 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Topic: [PATCH 2/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Index: AQHVOJJPc/7UAMcT6kG+EeawaSAB+KbGt/Pw
Date: Fri, 12 Jul 2019 09:32:34 +0000
Message-ID: <MN2PR12MB334456E5EC925FD1968EC77EE4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712091454.13478-1-kevin1.wang@amd.com>
 <20190712091454.13478-2-kevin1.wang@amd.com>
In-Reply-To: <20190712091454.13478-2-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7d50457-9646-4589-e100-08d706abdead
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4174; 
x-ms-traffictypediagnostic: MN2PR12MB4174:
x-microsoft-antispam-prvs: <MN2PR12MB4174C8D076F907772C8A236BE4F20@MN2PR12MB4174.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(13464003)(189003)(199004)(229853002)(33656002)(11346002)(6506007)(446003)(54906003)(316002)(110136005)(2906002)(68736007)(25786009)(8936002)(14454004)(71190400001)(4326008)(102836004)(86362001)(53546011)(76176011)(71200400001)(26005)(53936002)(186003)(256004)(6246003)(66066001)(478600001)(14444005)(52536014)(2501003)(66476007)(66556008)(64756008)(66446008)(5660300002)(7696005)(305945005)(99286004)(7736002)(8676002)(81166006)(81156014)(76116006)(9686003)(6436002)(476003)(486006)(3846002)(6116002)(55016002)(74316002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4174;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KtWThuscFurHN7V/mh/jHc8HZ0Aie1Db1fMdHBQ7Td0ZRC8FeFu76Unhi/qC4VCImhtiVCE/uWrTSph20r0Gv3WTr1vqrj9EYcSVy7qNnKUxfDbxhXFyxKUEn7jitrMDA8hiH0z1ezwU3GnDMSjXR9yHbZlDWqaIkdwrA93nZx2zVIAVp8sUyBL6+Z/SHb8wrtFqdcaTEVjfCWKmhHmz91XPekqLdowqnBWcycIOMycyMJ/St/YA+P3i8iT+b/iSmNbhri3nsUl06GQc3/VfiDfwVQ+SYQZs5KQF1RWMYL4xrpKc/fM2Q/XST+b1XWWLkmb9eclMvTSFuI9/QPZqOgw781OKsaBfaJwt3ri9B/Tq8tdzba7ngWq87UXLwRkRCp9JQwA93mwvlWrQu7bcOeEIKMSGpLGMXaYMd56LM5Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d50457-9646-4589-e100-08d706abdead
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:32:34.0426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD1/PQMESKHkFEDhe/vCdQz7LXe0w0Pfw8Q6ZIdXpcc=;
 b=Ptdy4ydnHto1B9w4FDqpjwYSgkzi/pSSeW00PidC7SkPN91/aZNP0K5455LlxNnaGSTKtfKJ767dbSuQ1mXGeoKkK70zhJiM+QzSexbnwlwlozNDU5EwzK6B6pUzdufDnptXeNYwAIehhYvpShtm+is6lsd70egnfxUdn5lA0Ck=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiB0aGUgdW5mb3JjZV9kcG1fbGV2ZWxzIGRvZXNuJ3QgbmVlZCB0byBjaGVjayBmZWF0dXJlIGVu
YWJsZSwgYmVjYXVzZSB0aGUKPiBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlIGZ1bmN0aW9uIGhhcyBj
aGVjayBmZWF0dXJlIGxvZ2ljLgplbmFibGUgLT4gZW5hYmxlbWVudAoKV2l0aCB0aGF0IGZpeGVk
LCByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdA
YW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkgNToxNSBQTQo+IFRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZl
bmdAYW1kLmNvbT47IFF1YW4sIEV2YW4KPiA8RXZhbi5RdWFuQGFtZC5jb20+OyBYdSwgRmVpZmVp
IDxGZWlmZWkuWHVAYW1kLmNvbT47IFdhbmcsCj4gS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFt
ZC5jb20+Cj4gU3ViamVjdDogW1BBVENIIDIvM10gZHJtL2FtZC9wb3dlcnBsYXk6IGF2b2lkIGRv
dWJsZSBjaGVjayBmZWF0dXJlCj4gZW5hYmxlZAo+IAo+IHRoZSB1bmZvcmNlX2RwbV9sZXZlbHMg
ZG9lc24ndCBuZWVkIHRvIGNoZWNrIGZlYXR1cmUgZW5hYmxlLCBiZWNhdXNlIHRoZQo+IHNtdV9n
ZXRfZHBtX2ZyZXFfcmFuZ2UgZnVuY3Rpb24gaGFzIGNoZWNrIGZlYXR1cmUgbG9naWMuCj4gCj4g
Q2hhbmdlLUlkOiBJNmFlNjJiMzU1YWE3NmEwMGYwZjZlMTY0Y2Q5ODQ4ZmIzMmZjN2MxMgo+IFNp
Z25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDIzICsrKysrKysrLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
Cj4gaW5kZXggMTZhNGMxY2E5OGNmLi44OTVhNGU1OTJkNWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gQEAgLTgzMywyNyArODMzLDIwIEBAIHN0
YXRpYyBpbnQgbmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZShzdHJ1Y3QKPiBzbXVfY29udGV4
dCAqc211LCBib29sIGhpZ2hlc3QpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gCj4gLXN0YXRpYyBp
bnQgbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgewo+
IC0KPiArc3RhdGljIGludCBuYXZpMTBfdW5mb3JjZV9kcG1fbGV2ZWxzKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KSB7Cj4gIAlpbnQgcmV0ID0gMCwgaSA9IDA7Cj4gIAl1aW50MzJfdCBtaW5fZnJl
cSwgbWF4X2ZyZXE7Cj4gIAllbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZTsKPiAKPiAtCXN0cnVj
dCBjbGtfZmVhdHVyZV9tYXAgewo+IC0JCWVudW0gc211X2Nsa190eXBlIGNsa190eXBlOwo+IC0J
CXVpbnQzMl90CWZlYXR1cmU7Cj4gLQl9IGNsa19mZWF0dXJlX21hcFtdID0gewo+IC0JCXtTTVVf
R0ZYQ0xLLCBTTVVfRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVH0sCj4gLQkJe1NNVV9NQ0xLLCAgIFNN
VV9GRUFUVVJFX0RQTV9VQ0xLX0JJVH0sCj4gLQkJe1NNVV9TT0NDTEssIFNNVV9GRUFUVVJFX0RQ
TV9TT0NDTEtfQklUfSwKPiArCWVudW0gc211X2Nsa190eXBlIGNsa3NbXSA9IHsKPiArCQlTTVVf
R0ZYQ0xLLAo+ICsJCVNNVV9NQ0xLLAo+ICsJCVNNVV9TT0NDTEssCj4gIAl9Owo+IAo+IC0JZm9y
IChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY2xrX2ZlYXR1cmVfbWFwKTsgaSsrKSB7Cj4gLQkJaWYg
KCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwKPiBjbGtfZmVhdHVyZV9tYXBbaV0uZmVhdHVy
ZSkpCj4gLQkJICAgIGNvbnRpbnVlOwo+IC0KPiAtCQljbGtfdHlwZSA9IGNsa19mZWF0dXJlX21h
cFtpXS5jbGtfdHlwZTsKPiAtCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShjbGtzKTsg
aSsrKSB7Cj4gKwkJY2xrX3R5cGUgPSBjbGtzW2ldOwo+ICAJCXJldCA9IHNtdV9nZXRfZHBtX2Zy
ZXFfcmFuZ2Uoc211LCBjbGtfdHlwZSwgJm1pbl9mcmVxLAo+ICZtYXhfZnJlcSk7Cj4gIAkJaWYg
KHJldCkKPiAgCQkJcmV0dXJuIHJldDsKPiAtLQo+IDIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
