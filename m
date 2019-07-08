Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91C62305
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 17:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A5289DE3;
	Mon,  8 Jul 2019 15:31:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790042.outbound.protection.outlook.com [40.107.79.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE489DE3
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 15:31:33 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3539.namprd12.prod.outlook.com (20.179.67.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 15:31:29 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:31:29 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Index: AQHVMbHuvmy66w4KPUSTEx2XBe+5kqbA3wnI
Date: Mon, 8 Jul 2019 15:31:29 +0000
Message-ID: <BN8PR12MB36027C3FF20B1FAD06119E2D89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190703151341.5916-1-alexander.deucher@amd.com>,
 <20190703151341.5916-2-alexander.deucher@amd.com>
In-Reply-To: <20190703151341.5916-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dc5c4c5-7b46-47aa-c09d-08d703b9590d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3539; 
x-ms-traffictypediagnostic: BN8PR12MB3539:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB35399497D88039E8313E79E089F60@BN8PR12MB3539.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(76176011)(52536014)(71200400001)(11346002)(26005)(71190400001)(66556008)(446003)(476003)(76116006)(66946007)(73956011)(66066001)(66476007)(66446008)(64756008)(3846002)(8936002)(966005)(256004)(14444005)(102836004)(33656002)(99286004)(72206003)(6116002)(478600001)(486006)(7736002)(7696005)(305945005)(6246003)(6506007)(53936002)(86362001)(2906002)(2501003)(6436002)(74316002)(68736007)(229853002)(14454004)(316002)(9686003)(6306002)(25786009)(81156014)(81166006)(8676002)(5660300002)(4326008)(55016002)(186003)(110136005)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3539;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4Vu2KwbLWa9G3Cm68jLYCrgMlwKExL92YQiX5njLq8iuAaleTIPaO5THNFnBWnPhrEldNp2ypa8nSwRMAWp1GdAOmQKUT4i3UOpx5XZUNarGc+pQQ7w7RAh4ZZLuGdiCSJ1DlTUD7+wvyf6LHRYf3EOaj1bu39JrYkyZ6D38dnQqJxm8roM5y1EugahL2MKCbM5weqxemMKgB/wmFdJj4WoMgUHCADzROszQt7h9QwhswYbg7tllcO6yJxq9+kogE4gnOcqvKd7eRqIezfdDTO5kBeE4RfsTZeYOXgjkVUWdI8XN+ktZMVCDzEWZGVXK7tVSbaCRZAogB0Gy7q610geqI69JU6ED4QxPrydo8QTJLdLLe7B9LvFJsOQuBQ8PRAbLYEQmme6aFDiapy0d5zFM3i/HH3e3JDjQzRkZn9s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc5c4c5-7b46-47aa-c09d-08d703b9590d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:31:29.3131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3539
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8z16FJO8+risDUYk9+9CYIJxOn7S5TFjVQSqYODgBk=;
 b=WVtP8DvYUAcHf2WsDgHnLYFHd7vc+eCQKsXx3vW+RXv6bMtiq1DiUlM9HeivCqETIYLmtrsczNyI7c0Gxz77yInC110jPLp16VpyB80ytonxJXOK2gVwqmBm196mU10sImD0dzcue6bOykjC1vHWS3q3YJ8N5ISNvvyRwWt8XQE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleCwKCkkgc2VlIHRoZXJlIGFyZSBtYW55ICdhdXRvJyBtb2R1bGUgcGFyYW1zIGZvciBh
bWRncHUsIGNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiBhYm91dCB0aGUgaGlzdG9yaWNhbCBpbnRl
bnRpb24gb2YgdXNpbmcgdmFsdWUgJy0xJz8KYW5kIHNoYWxsIHdlIGNoZWNrICdhbWRncHVfZGlz
Y292ZXJ5JyBhZ2FpbnN0ICctMScgZm9yIGFsbCB0aGUgY29kZSBwYXRocyBpbiBhbWRncHVfZGV2
aWNlLmMgYW5kIG5hdmkxMF9yZWdfaW5pdC5jPwoKQlIsClhpYW9qaWUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2Vz
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gb24gYmVoYWxmIG9mIEFsZXggRGV1Y2hlciA8YWxleGRl
dWNoZXJAZ21haWwuY29tPgpTZW50OiBXZWRuZXNkYXksIEp1bHkgMywgMjAxOSAxMToxMyBQTQpU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERldWNoZXIsIEFsZXhhbmRlcgpT
dWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBlbmFibGUgSVAgZGlzY292ZXJ5IGJ5IGRl
ZmF1bHQgb24gbmF2aQoKVXNlIHRoZSBJUCBkaXNjb3ZlcnkgdGFibGUgcmF0aGVyIHRoYW4gaGFy
ZGNvZGluZyB0aGUKc2V0dGluZ3MgaW4gdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYwppbmRleCA3OTQxYTUzNjhmYjUuLjZmNzc3MmVlZWI3OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTQwLDcgKzE0MCw3IEBAIHVpbnQgYW1kZ3B1X3Nt
dV9tZW1vcnlfcG9vbF9zaXplID0gMDsKIHVpbnQgYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayA9IDA7
CiBpbnQgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nID0gMTsKIGludCBhbWRncHVfbWNicCA9IDA7Ci1p
bnQgYW1kZ3B1X2Rpc2NvdmVyeSA9IDA7CitpbnQgYW1kZ3B1X2Rpc2NvdmVyeSA9IC0xOwogaW50
IGFtZGdwdV9tZXMgPSAwOwoKIHN0cnVjdCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbyA9IHsK
QEAgLTU5Miw2ICs1OTIsNyBAQCBtb2R1bGVfcGFyYW1fbmFtZWQobWNicCwgYW1kZ3B1X21jYnAs
IGludCwgMDQ0NCk7CiAvKioKICAqIERPQzogZGlzY292ZXJ5IChpbnQpCiAgKiBBbGxvdyBkcml2
ZXIgdG8gZGlzY292ZXIgaGFyZHdhcmUgSVAgaW5mb3JtYXRpb24gZnJvbSBJUCBEaXNjb3Zlcnkg
dGFibGUgYXQgdGhlIHRvcCBvZiBWUkFNLgorICogKC0xID0gYXV0byAoZGVmYXVsdCksIDAgPSBk
aXNhYmxlZCwgMSA9IGVuYWJsZWQpCiAgKi8KIE1PRFVMRV9QQVJNX0RFU0MoZGlzY292ZXJ5LAog
ICAgICAgICJBbGxvdyBkcml2ZXIgdG8gZGlzY292ZXIgaGFyZHdhcmUgSVBzIGZyb20gSVAgRGlz
Y292ZXJ5IHRhYmxlIGF0IHRoZSB0b3Agb2YgVlJBTSIpOwotLQoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
