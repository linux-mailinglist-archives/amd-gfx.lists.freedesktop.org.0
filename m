Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A245B957B2
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 08:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35B6E5EA;
	Tue, 20 Aug 2019 06:53:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632196E5EA
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 06:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4dm0vHe6qJRBaCm21KtN3Gun+3iQVeg9zoFKdNLNZbnYQArF0qquKTf3Y1Bb6YGQipPydmQvJBOd/IJp4z5qAvuy6c/5soZ7Us4ZWWxCxhUt9sUX8qG3V5ju/cVKt9NvH2hxitISKQ39GQT4r/hB53vSl5P9hjpvU0KT86SlCbsCNFAQQuORdAmwmgmYqkM+lt8YPc9yrq+v9jG2lnUZrFWKaeLWJ1N0Xk1BGqCSI9dW+/5+aw0vb9rvwSyAxoXyte9JEMyF/Tf8BWTZHCfSaPtxqMbpGzROOp3QWHSJ36pApx3OWjrxnwhtg4P2y6J6HI2cPEHtG1jOGbokUxM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GiBbsebbiq4o3ZPNGvTZ6sAnlqQyEoXtj6cJ3qfH1E=;
 b=LhTZWfxC701v78d3FSKSVcXM/kF3z4C1UrlYVnoC7Jfa1pY5l2CHtdbK1eSafKM4nLgpBBUvDgt/fGFJAnqjmN3sH39IQLiFDLa2uocHVMRa95sj3cvopfFQsMk67fqLXFSPGKrUL2evDyer7YDHsxuMA6Pae39otfpIa3WHZs22HkGGdHQUyY2H8yIp4BN7vo2Lu4E3N5dOiUfb/s0X3FG04bUPmL3wFX83nBTsjMnSs/k0widBL8irS2tkOV6gpMdKLqT8LW/MtmhOszK5PFohcc0W+heDh6PH6AX8kLJFPutl+LAplzn+CM3cBq8jLGqLbR+Ufi1H0xgM77qR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB2928.namprd12.prod.outlook.com (20.179.83.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 06:53:37 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 06:53:37 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: disable MMHUB PG on navi10/14
Thread-Topic: [PATCH] drm/amd/powerplay: disable MMHUB PG on navi10/14
Thread-Index: AQHVVyFHN3aiiOnSuke6b8ffVe1JHqcDmTkAgAAAagA=
Date: Tue, 20 Aug 2019 06:53:37 +0000
Message-ID: <MN2PR12MB3598423F010E9F490EE697648EAB0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1566282828-12032-1-git-send-email-kenneth.feng@amd.com>
 <DM5PR12MB14183EF7144894962032471CFCAB0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14183EF7144894962032471CFCAB0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6c59c91-d29a-48c7-3117-08d7253b20b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2928; 
x-ms-traffictypediagnostic: MN2PR12MB2928:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2928669D9EBE0F43FC75CCBC8EAB0@MN2PR12MB2928.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(13464003)(199004)(189003)(66476007)(26005)(966005)(76176011)(110136005)(8936002)(74316002)(99286004)(2906002)(66946007)(7696005)(2501003)(476003)(55016002)(66066001)(498600001)(25786009)(6246003)(33656002)(9686003)(6306002)(229853002)(76116006)(64756008)(186003)(6506007)(102836004)(14454004)(3846002)(8676002)(6116002)(53936002)(305945005)(52536014)(446003)(5660300002)(81156014)(81166006)(6436002)(486006)(86362001)(71200400001)(53546011)(71190400001)(11346002)(66556008)(66446008)(7736002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2928;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7QRs+6TwpbgA/hiIwxSEPavVNnXlEhqyj71g3ibrMmZpHt6umaL65Nq9qsD5eAxuKrMKN5X/OYdsDwE9uHG8L2GKTlSy/kKKpZHMetoGvdI1yFmOtmAHvLbRXYWegBrUAa5lFQwVLImTYiejkZThO9YGJtHIRlwG7LbH8V1JiONTT22vUHzbHUtsw4j/iMDjcsfWBOskZX8tdGH5sOGwerjIp1GYzx60JySFv3Sux4WPtUdm5MUoR2/QPttQxg44BF76PiyXWXVkQ+RdFB963xTAJ32pG0GcuAngyf4eFFBFtnskhnTwsEaerEvqvv2ShMTaUctKB9T2IYwOVB3vtaxoPZrUnpinkNFEPWPYU4RigzdLd7wVkesgtc8MQai44HT+f3hA58GwdzikJBYN22/rg9QNHHkw9ZFw3OOtudc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c59c91-d29a-48c7-3117-08d7253b20b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 06:53:37.6461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFnF/pkkwQoWO3eIhnInAsFFS3UcbE/ZWha4UbQdWkwgys+XUU/wjy/jfpODJI6H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GiBbsebbiq4o3ZPNGvTZ6sAnlqQyEoXtj6cJ3qfH1E=;
 b=AhN0znVAMB6wipGSNpxOKrbjgM4VtJULPax41HWzQA2yloZZMNID1cA6cI3gDSNEXP91CpK+I8vxsTmpKuNTBuh8LDgjw3o3MBkV9MmIOVsPfptrWsussrMwBBmaCvbgVmBzbbKs1XZp0CiQ7W9HQdUm2WpWIsZakkCVqvko4gs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

R290IGl0LCBJIHdpbGwgbWFrZSBhIHYyIHBhdGNoLg0KVGhhbmtzLg0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBaaGFuZywgSGF3a2luZyANClNlbnQ6IFR1ZXNkYXksIEF1
Z3VzdCAyMCwgMjAxOSAyOjUyIFBNDQpUbzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFt
ZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZC9wb3dl
cnBsYXk6IGRpc2FibGUgTU1IVUIgUEcgb24gbmF2aTEwLzE0DQoNCkhpIEtlbm5ldGgsDQoNCldl
IHNob3VsZCBjb250cm9sIFBHIGZlYXR1cmUgb24vb2ZmIGZyb20gbnZfY29tbW9uX2Vhcmx5X2lu
aXQgYnkgc2V0dGluZyBpbml0aWFsIHZhbHVlIG9mIHBnX2ZsYWcsIGluc3RlYWQgb2YgaGFyZC1j
b2RlIGl0IGZyb20gU01VIHNpZGUuDQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEtlbm5ldGggRmVuZw0KU2VudDogMjAxOeW5tDjmnIgy
MOaXpSAxNDozNA0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRmVuZywg
S2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQv
cG93ZXJwbGF5OiBkaXNhYmxlIE1NSFVCIFBHIG9uIG5hdmkxMC8xNA0KDQpEaXNhYmxlIE1NSFVC
IFBHIG9uIG5hdmkxMCBhbmQgbmF2aTE0IGFjY29yZGluZyB0byB0aGUgcHJvZHVjdGlvbiByZXF1
aXJlbWVudC4NCg0KU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8
IDMgLS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCmluZGV4IDkyMDE1NmUuLjhiMzA2ZDEgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KQEAgLTM2MSw5
ICszNjEsNiBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LA0KIAkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayAmPSB+RkVBVFVSRV9NQVNL
KEZFQVRVUkVfRldfRFNUQVRFX0JJVCk7DQogCX0NCiANCi0JaWYgKHNtdS0+YWRldi0+cGdfZmxh
Z3MgJiBBTURfUEdfU1VQUE9SVF9NTUhVQikNCi0JCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sg
fD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1IVUJfUEdfQklUKTsNCi0NCiAJaWYgKHNtdS0+YWRl
di0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9BVEhVQikNCiAJCSoodWludDY0X3QgKilmZWF0
dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfQVRIVUJfUEdfQklUKTsNCiANCi0tDQoy
LjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
