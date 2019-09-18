Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39086B59AE
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 04:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA206EDBF;
	Wed, 18 Sep 2019 02:28:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FF06EDBF
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 02:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYi6eniYyVUIBb7StM4HNyvcX7ZPNYCssZSdSjQCWba0AwRy5reJ45pLc06bnJsGoxjFm+QFuQYgyCD/OxMQXyGWp8Yh3dkbVE3G50IGxfQQ+G4+ZjmGNT4ZQHneAE9pHsuGGhEeQbppc0fvyIxRcg1TAhh8jxhsowpgpDi3Rsn+nGLTh0aFdp70zBnYFa4GJE89WY7QyY/FQ4WEF71vfIE3Btal3LOo/vKYt+nIf/BwVdj5CShADKUJHkrLZlCZN3XT0cTofGvROWZjRamsxPFCjMwnWyhajEJwfaG1TbZWdvRwvknhU2zV1sxFoNsatdQRpLSUxHSbHpt+gai/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8+22ktVt2p2VM3zh49rhxpvfUigVx38FuhTDcSCCs=;
 b=EJCWCHFZHNf/5/8ieDLEBz8dfSfixhh6TNap6PM8MJyTKKiqMGQ67YJH6eMicUqgGJzhg7IESOZgfi33yvSnQ6RnFTlTDGal7NvkwXLeM+M6anjP6aSsMwSh1dn2uV0jhlACH3yfUixgM9nKe8UnH9Xf6qiOw0yBlGlKaM/0hHX/yd/h5Lry7GfwBXgHV13mNh4DDtYNnYhE6GqOTct7lgsatl44L2fU42RVOthWrwuCH2ty/ajAc/5Sk1AGYQJR72s7ad/tE9YqlSMsNnlDpAV4UimQD9+JolTE1pYvh5oL6lnfujjVLa660/LQLuxhUcSeHEPpv9bmYttbt0QZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3845.namprd12.prod.outlook.com (52.132.245.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 02:28:51 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 02:28:51 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu/psp: invalidate the hdp read cache before
 reading the psp response
Thread-Topic: [PATCH 2/2] drm/amdgpu/psp: invalidate the hdp read cache before
 reading the psp response
Thread-Index: AQHVbZVr+hAA4qtK70mhK+dyMTbFz6cwtmyQ
Date: Wed, 18 Sep 2019 02:28:51 +0000
Message-ID: <CH2PR12MB37674E84597607EBBFF8DAD7FE8E0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190917202046.26634-1-alexander.deucher@amd.com>
 <20190917202046.26634-2-alexander.deucher@amd.com>
In-Reply-To: <20190917202046.26634-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 517971cd-a1ec-49c1-b4eb-08d73bdff1f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3845; 
x-ms-traffictypediagnostic: CH2PR12MB3845:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB384596ED4704E28D43E193EFFE8E0@CH2PR12MB3845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(13464003)(53546011)(26005)(52536014)(305945005)(76176011)(99286004)(476003)(7736002)(14454004)(74316002)(86362001)(256004)(2501003)(11346002)(110136005)(446003)(6116002)(5660300002)(486006)(2906002)(3846002)(71190400001)(6246003)(186003)(4326008)(478600001)(102836004)(7696005)(66066001)(25786009)(316002)(8936002)(229853002)(33656002)(71200400001)(6306002)(55016002)(6436002)(6506007)(966005)(66476007)(76116006)(66946007)(9686003)(81166006)(66556008)(66446008)(64756008)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3845;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N06YEzB8mTpJBziLAqxlug7YdzVoOaBKUUST6OgaLiPWIsPgxZhRW00wV4b3cjEXqpozmjOw11gTs+XI/36N+2k2bYfGfgC6YLW8XsxK0XHdfcL4kJYp62iJIGvT6H+PIgK2GF9IrOcRRPyr0FDmvKPmVvTrugNyb5//81TbSmlmjp1rcSyJEbBvPVIp1j9pmfj5xpOwEghUj49yLcbw4gf7TRYpycvz9QsjCLptJMe8yqCnarGyEW1JLMYzLAcISGNEHIXe0e9GGM9qzm9otGzZhQX+0E2kbXlDDCZOoLClU45ykQUpl9FZG/+SEl8h62ibH2ciG0M2IYDtpAmjviJ4Nc+d7wMdwF9sK1ukEFsYSAgbfdi5HKpIbGxz9/Z3Q/0iEF8XF6cr/uLMJnoiqeX+QX+xLqcuWEVzmhQztuI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517971cd-a1ec-49c1-b4eb-08d73bdff1f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 02:28:51.8113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZHU+hiLw3e04EWPd2OLAGDZCMk6ZRVgiiVRjrudtYUnq+VvoosgwGreFtWd9W1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8+22ktVt2p2VM3zh49rhxpvfUigVx38FuhTDcSCCs=;
 b=F/dw/ESoS1RBlWKIzejTX7c54ZiKWT99l39P8sH0EyhIQYrq/cZrFKo20phGemszJdUwLzb0Xd49iVBOifB20f+NZX8Io0ChuIncQaX57fazMllkTZRDql1ayIsOrI+ZE1TF8RdpNZXS69dA/7V06GlTHhKEi20yIG+iNkvW1pU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXggRGV1Y2hlcg0KU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgNDoyMSBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPg0KU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL2FtZGdwdS9wc3A6IGludmFsaWRhdGUgdGhl
IGhkcCByZWFkIGNhY2hlIGJlZm9yZSByZWFkaW5nIHRoZSBwc3AgcmVzcG9uc2UNCg0KT3RoZXJ3
aXNlIHdlIG1heSBnZXQgc3RhbGUgZGF0YS4NCg0KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KaW5kZXggYmM0NmE0
MjliNGRjLi43OTkxZWRmNTgxMjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYw0KQEAgLTE1MSwxMCArMTUxLDEyIEBAIHBzcF9jbWRfc3VibWl0X2J1ZihzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCwNCiAJCXJldHVybiByZXQ7DQogCX0NCiANCisJYW1kZ3B1X2FzaWNf
aW52YWxpZGF0ZV9oZHAocHNwLT5hZGV2LCBOVUxMKTsNCiAJd2hpbGUgKCooKHVuc2lnbmVkIGlu
dCAqKXBzcC0+ZmVuY2VfYnVmKSAhPSBpbmRleCkgew0KIAkJaWYgKC0tdGltZW91dCA9PSAwKQ0K
IAkJCWJyZWFrOw0KIAkJbXNsZWVwKDEpOw0KKwkJYW1kZ3B1X2FzaWNfaW52YWxpZGF0ZV9oZHAo
cHNwLT5hZGV2LCBOVUxMKTsNCiAJfQ0KIA0KIAkvKiBJbiBzb21lIGNhc2VzLCBwc3AgcmVzcG9u
c2Ugc3RhdHVzIGlzIG5vdCAwIGV2ZW4gdGhlcmUgaXMgbm8NCi0tIA0KMi4yMC4xDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
