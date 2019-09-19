Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280CB7D29
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 16:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB256F75C;
	Thu, 19 Sep 2019 14:47:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680049.outbound.protection.outlook.com [40.107.68.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9E6F75C
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO+uLGbXlQ/T7fBCwoOBP8oSZoy8vCPqABD18TdFl9AwCIQIirGdSXz95FPXC7+aIAz74rrLGgp7qjjW61LLXSH0B7JKnWNTB1rxuK3ZEaaEKzeBHI0HjcfdYTBXZNX83JL2NyeAWBAP/bcSvJZoZ4YGnvNyGJfnsznvaYIFv/x3mm4OqMkOjjh4laSmf90r36OBLESg7M8ns3BPBcVLVWYiBho/qVM4BQIiaNXbIuTkC/zHRk8Qx+HVzLZPMTsKTP/eqV7ZGNfWWlSGp0LV0ubB9tfgs9iaOOba1PK6QiocrcE1sYcKB5IzrbbqblWtpGYRog7MDUS5+5C5Ud1eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRhAZfTx/hqRJuNX+vydX3z3Bb8qjbqwC8QWgWxSpDU=;
 b=kPCemuwD2chWBspU9Y4+gbMMCbds+BUEmEevfW/Hjf8lg4WQDmlzHWuIsu63RPog09AHY6UxEBvZQRwbhrJA/FojDE9kgkkwBlJX4xZOrbHaa+de2XmVBWJpCz2C5QMcV2KHQKuCeb+W6ZBvU07W1SY+xNwDwFmsCAPIUbgg0UTZE+lyraBn/bsfdnd6H/jjxSyaH48iAHAptrcwAOF+51Z8cP1E9NaRGIOjm6WzZ3vTfIXDJTvrkfUMx0FXUzRQg4FO9SpR6sSE8itz50wQufaXfhGsUSU0kzj+UsGv60g7/4wq28S0J2mETIjNYusA/1FY3d9kwkipurO6YYqMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.16; Thu, 19 Sep 2019 14:47:33 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:47:33 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVbrmftYdwjXX48kuvTRvm902rG6czB1SAgAANUiA=
Date: Thu, 19 Sep 2019 14:47:33 +0000
Message-ID: <DM5PR12MB14183065D27A0C25D8A8EC2BFC890@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-6-tao.zhou1@amd.com>
 <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 238cc4f1-917d-49ff-8d76-08d73d104dfb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1628; 
x-ms-traffictypediagnostic: DM5PR12MB1628:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1628E6C13EBF547867CA81A0FC890@DM5PR12MB1628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(13464003)(55016002)(305945005)(64756008)(66066001)(14454004)(486006)(9686003)(2906002)(25786009)(7696005)(6246003)(33656002)(6506007)(53546011)(76176011)(66946007)(71190400001)(71200400001)(66556008)(66446008)(99286004)(478600001)(102836004)(76116006)(86362001)(7736002)(66476007)(8676002)(81156014)(81166006)(5660300002)(6436002)(26005)(476003)(110136005)(8936002)(316002)(6116002)(229853002)(74316002)(256004)(3846002)(52536014)(11346002)(446003)(186003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1628;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CfIGdK6Y0JMgBFr6LLK3WIMn0ur3zhfuwSkR7OrJil/H0xtXfnl7yEG+2n0/gqHDvS5qcr98n1YTRvTia/+8Um9+iHtd2Bm2JEOOYrAr/sxETv2iXdFjo4qSh6dIwwfjLsJRRyeRXbWWQSMm/SkJ8IGx6FRhTcGOZ0ESyfjxNvDFPJEKja80PFI5D4GrgoQwKtb7lh9X+AQBSwfMJ/DMsH42Q3L6OMIBDMTxP0uEr1nPpLqWzOsZo0cW0scD9emKNFBtov8eNwQkpcnuC41MPwsjRD/GM80qhoBfYZaeVMxQD6gVveum3qysHI7vsaE8sr8hHRBuHwScbR93fjfTOV9ZaghvZw7r2WFZt8EPcO5tJsyYOjdC83hRQBlr3r7+q+0dHfwGtDTYYvKwYj1qbMCfYJpnS++4b5Vo9fofbgQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238cc4f1-917d-49ff-8d76-08d73d104dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 14:47:33.2477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYTDKGVbEKhXIHUoWLddHrs1Kghm/SCf37v25xLZqneNV5kqyfBRJlel7nhaeYSdPx9Bvy9Duo2TPxa+o8y1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRhAZfTx/hqRJuNX+vydX3z3Bb8qjbqwC8QWgWxSpDU=;
 b=h3OFBLBPZVhr4cPorIL+qZ99l8boZ67mapIv+whGZcghHoFJMCEN07iWNO5HUznA9M7v8nsu8UiNcBF4Gumw2sUoR74JXIaZccYAiS1Xw19UO13R1K92cdFp77gfLjKELYwJSmouElJRosaUVmAlODMxx7y6x7em3iwG2Ab63L0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGV0J3MgYWRkIGNvbW1lbnRzIHRvIGNsYXJpZnlpbmcgd2h5IGNoZWNraW5nIEdGWCBJUCBCTE9D
SyBmb3IgU0RNQSBpbnRlcnJ1cHQgc28gcGVvcGxlIHdpbGwgbm90IGJlIGNvbmZ1c2luZyBoZXJl
Lg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPiANClNlbnQ6IDIwMTnlubQ55pyI
MTnml6UgMjE6NTkNClRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPg0KU3ViamVjdDogUkU6IFtQQVRDSCAwNS8yMV0gZHJtL2FtZGdwdTogcmVmaW5lIHNkbWE0
IHJhc19kYXRhX2NiDQoNCg0KDQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPiANClNlbnQ6
IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMTkgMzoxMyBQTQ0KVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaGFu
ZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8gPFRhby5a
aG91MUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDA1LzIxXSBkcm0vYW1kZ3B1OiByZWZpbmUg
c2RtYTQgcmFzX2RhdGFfY2INCg0Kc2ltcGxpZnkgY29kZSBsb2dpYyBhbmQgcmVmaW5lIHJldHVy
biB2YWx1ZQ0KDQpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDMyICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KaW5k
ZXggYThlNGI3ZDg4MGZlLi5mNjg1YTIzNzc2MTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NF8wLmMNCkBAIC0xOTQyLDI1ICsxOTQyLDI3IEBAIHN0YXRpYyBpbnQgc2RtYV92
NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCXVp
bnQzMl90IGVycl9zb3VyY2U7DQogCWludCBpbnN0YW5jZTsNCiANCi0JaWYgKCFhbWRncHVfcmFz
X2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQotCQlpbnN0YW5j
ZSA9IHNkbWFfdjRfMF9pcnFfaWRfdG9fc2VxKGVudHJ5LT5jbGllbnRfaWQpOw0KLQkJaWYgKGlu
c3RhbmNlIDwgMCkNCi0JCQlyZXR1cm4gMDsNCisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVk
KGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX0dGWCkpDQorCQlnb3RvIG91dDsNCiANCi0JCXN3aXRj
aCAoZW50cnktPnNyY19pZCkgew0KLQkJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX1NSQU1f
RUNDOg0KLQkJCWVycl9zb3VyY2UgPSAwOw0KLQkJCWJyZWFrOw0KLQkJY2FzZSBTRE1BMF80XzBf
X1NSQ0lEX19TRE1BX0VDQzoNCi0JCQllcnJfc291cmNlID0gMTsNCi0JCQlicmVhazsNCi0JCWRl
ZmF1bHQ6DQotCQkJcmV0dXJuIDA7DQotCQl9DQorCWluc3RhbmNlID0gc2RtYV92NF8wX2lycV9p
ZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7DQorCWlmIChpbnN0YW5jZSA8IDApDQorCQlnb3Rv
IG91dDsNCiANCi0JCWFtZGdwdV9zZG1hX3Byb2Nlc3NfcmFzX2RhdGFfY2IoYWRldiwgZXJyX2Rh
dGEsIGVudHJ5KTsNCisJc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7DQorCWNhc2UgU0RNQTBfNF8w
X19TUkNJRF9fU0RNQV9TUkFNX0VDQzoNCisJCWVycl9zb3VyY2UgPSAwOw0KW0d1Y2h1bl1Mb29r
cyBubyBvbmUgdXNlcyB0aGlzIHZhcmlhYmxlLiBDYW4gd2UgcmVtb3ZlIGl0IGRpcmVjdGx5PyBJ
IGFtIG5vdCBzdXJlIHdoeSB3ZSBhZGRlZCBvbmUgc3dpdGNoIGNhc2UgaGVyZS4NCg0KKwkJYnJl
YWs7DQorCWNhc2UgU0RNQTBfNF8wX19TUkNJRF9fU0RNQV9FQ0M6DQorCQllcnJfc291cmNlID0g
MTsNCisJCWJyZWFrOw0KKwlkZWZhdWx0Og0KKwkJZ290byBvdXQ7DQogCX0NCiANCisJYW1kZ3B1
X3NkbWFfcHJvY2Vzc19yYXNfZGF0YV9jYihhZGV2LCBlcnJfZGF0YSwgZW50cnkpOw0KKw0KK291
dDoNCiAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsNCiB9DQogDQotLSANCjIuMTcuMQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
