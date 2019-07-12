Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936566531
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 05:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842206E2B2;
	Fri, 12 Jul 2019 03:47:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4E6E2B2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 03:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=letetXD1y83qvU8sIaDM2FRd9IOzcmNuV7mGCa6jZ/tqYrusc2Wafcr90erIngbMldADQ1a8dKN+v2eU6olsnMLpMyd7mQcVVjSUJnMLqzkZSjP5xX+AABueNHAbzcUctbQcFthEgCBZtosLfJXfjbE1S7lcUMwCBND3k86BkV2LjntCafXSCLb0sJWFCTz83CyR4qDrhkan7J5jXm3Rxr4aCajCTXXZKnPP51ssNjawxGoiyd93uPXtNJ2zxEPg1lkf8DBjvgwBGufwQBgUnkMr26WVqNuiF1RC+dbKCUMC6SynTRpeA3kkgXR7kjGJV3J3RzXmGLAOrI7eWPYy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw7Dh/A88HT4/nOVHzb5QmXKXlTaytJVTQh1G7IhN1w=;
 b=Ed4xle1ybM+PNvdx3tDmlV3jwGtpfCaMKc02DRxmxP+tNeLuN3OCTmsGmhpF2eRZ/lgJQPj7kG6EFuuyJjg45zJDEmk8ReoW6i05GJPulfOCPZ2ry99O5CM5PJF0W7XNF9JvOH/p1dQNBpVEHvVe8QpvQ+xpi4B0xK2Y9yfM6HD+5wFs6tbYX/kDiXsOqQBuxc1wdirUFuOQpjqN1/bRgHj00CKdbItV0/Jk7btZ5TYR+Mmntn9E9ZDi01tjqd56zeYHrwxn+hQCNNsHjQ/25DhmeKoZK2f7nlfLi1FMcJ8j8oQekDcUmJKsRsi0mCvy1dkNvLBJB5aiBjwC0ubhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 03:47:48 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 03:47:48 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add pstate mclk(uclk) support for
 navi10
Thread-Topic: [PATCH] drm/amd/powerplay: add pstate mclk(uclk) support for
 navi10
Thread-Index: AQHVOGKaAPe1kugtnkWc0GEZOeMXzKbGWEOA
Date: Fri, 12 Jul 2019 03:47:47 +0000
Message-ID: <MN2PR12MB3344E51B5349AEA5E68A9745E4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712033326.12294-1-kevin1.wang@amd.com>
In-Reply-To: <20190712033326.12294-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1d40a99-e23c-4d54-2e7a-08d7067bb4d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3838; 
x-ms-traffictypediagnostic: MN2PR12MB3838:
x-microsoft-antispam-prvs: <MN2PR12MB38386847A2860BDA0C81FAFEE4F20@MN2PR12MB3838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(13464003)(199004)(189003)(2906002)(14454004)(25786009)(52536014)(71200400001)(64756008)(5660300002)(68736007)(33656002)(71190400001)(478600001)(316002)(26005)(6246003)(186003)(6116002)(81156014)(486006)(81166006)(476003)(446003)(110136005)(11346002)(99286004)(3846002)(66066001)(8676002)(55016002)(102836004)(53546011)(76176011)(6506007)(2501003)(7696005)(76116006)(305945005)(9686003)(6436002)(74316002)(229853002)(7736002)(8936002)(14444005)(256004)(4326008)(66476007)(66556008)(53936002)(66946007)(66446008)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3838;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7uVv8YlxS36EvxpkD9Yj9M4wujFrMVuyLaMMfUkCz3bl2O2NG7Uosvh65TZFE3xDAERkx2vYQPTPgdRK6+KeJPDH1F3Ek3B40uOlm/AVd8mpp/+nrt6jqNpIkPgRap+Mq2yhqdR1se0qEl/B6APKU+yIjHry9IibavW209dUbKxr9i+7G8hNgVVTGchfIIbithO/2w9bOm9WSIWAoiRzV9VRSZlykcd1L8MqCNANxXm70aNt1KnlXIOpGX+3K4n3LboTkucPT1H0U9j0NLVg/2ZVyzR+FChGtId8sFKvj4nWkuOJ/ISBQyEB7mmg7IRNRfN3AHFP4MismQesD05UYR5tRqCEyKlCnlvvhv82iGGKs+BfkyYQpqFGUDlha4W2dCUjSQlSoEu54St2QL+wfheaZI767hHveVud/ZmuxoI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d40a99-e23c-4d54-2e7a-08d7067bb4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 03:47:48.0245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw7Dh/A88HT4/nOVHzb5QmXKXlTaytJVTQh1G7IhN1w=;
 b=BvD9y6tOVLAj1lag3o58DsQ+wzjtLNOfz392rBSXtAbUPcuyjoBDAk339fg+O8v2vih5KU0eltTbO3EOKCVCoPuOBl+YV7Kozif9pFn8lbpc2njFdqOalo+xVeAiRpmjEjyGL0dpn9UDbPR8Umb+g+bmvnerBaTBMRMLP7PUO3k=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cgo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFt
ZC5jb20+Cj4gU2VudDogRnJpZGF5LCBKdWx5IDEyLCAyMDE5IDExOjM0IEFNCj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVu
Z0BhbWQuY29tPjsgUXVhbiwgRXZhbgo+IDxFdmFuLlF1YW5AYW1kLmNvbT47IFdhbmcsIEtldmlu
KFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9w
b3dlcnBsYXk6IGFkZCBwc3RhdGUgbWNsayh1Y2xrKSBzdXBwb3J0IGZvcgo+IG5hdmkxMAo+IAo+
IGFkZCBwc3RhdGUgbWNsayh1Y2xrKSBzdXBwb3J0Lgo+IAo+IENoYW5nZS1JZDogSTdmM2JjYTQ5
MDE4MzNiNGVhMjEzZmUwMjI0OWZjMDU1YjgwZTVjZGQKPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMgfCAxICsKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgfCA4ICsrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jCj4gaW5kZXggZGU2Y2M1ZDQ4OWNkLi42N2RiMjc0NmVjNGYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gQEAgLTEzNiw2
ICsxMzYsNyBAQCBpbnQgc211X2dldF9kcG1fZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQK
PiAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKPiAgCQlyZXR1cm4gLUVJTlZBTDsK
PiAKPiAgCXN3aXRjaCAoY2xrX3R5cGUpIHsKPiArCWNhc2UgU01VX01DTEs6Cj4gIAljYXNlIFNN
VV9VQ0xLOgo+ICAJCWlmICghc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsCj4gU01VX0ZFQVRV
UkVfRFBNX1VDTEtfQklUKSkgewo+ICAJCQlwcl93YXJuKCJ1Y2xrIGRwbSBpcyBub3QgZW5hYmxl
ZFxuIik7IGRpZmYgLS1naXQKPiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4g
aW5kZXggY2QzMmIyMGExM2MxLi4xNmE0YzFjYTk4Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gQEAgLTcwOSw3ICs3MDksNyBAQCBzdGF0aWMg
aW50IG5hdmkxMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dAo+ICpzbXUsICBz
dGF0aWMgaW50IG5hdmkxMF9wb3B1bGF0ZV91bWRfc3RhdGVfY2xrKHN0cnVjdCBzbXVfY29udGV4
dCAqc211KQo+IHsKPiAgCWludCByZXQgPSAwOwo+IC0JdWludDMyX3QgbWluX3NjbGtfZnJlcSA9
IDA7Cj4gKwl1aW50MzJfdCBtaW5fc2Nsa19mcmVxID0gMCwgbWluX21jbGtfZnJlcSA9IDA7Cj4g
Cj4gIAlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgU01VX1NDTEssICZtaW5fc2Ns
a19mcmVxLAo+IE5VTEwpOwo+ICAJaWYgKHJldCkKPiBAQCAtNzE3LDYgKzcxNywxMiBAQCBzdGF0
aWMgaW50IG5hdmkxMF9wb3B1bGF0ZV91bWRfc3RhdGVfY2xrKHN0cnVjdAo+IHNtdV9jb250ZXh0
ICpzbXUpCj4gCj4gIAlzbXUtPnBzdGF0ZV9zY2xrID0gbWluX3NjbGtfZnJlcSAqIDEwMDsKPiAK
PiArCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBTTVVfTUNMSywgJm1pbl9tY2xr
X2ZyZXEsCj4gTlVMTCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJc211
LT5wc3RhdGVfbWNsayA9IG1pbl9tY2xrX2ZyZXEgKiAxMDA7Cj4gKwo+ICAJcmV0dXJuIHJldDsK
PiAgfQo+IAo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
