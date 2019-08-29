Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29EA1136
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 07:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B989F61;
	Thu, 29 Aug 2019 05:49:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9E89F61
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 05:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aljc6CxQG3YIxyVic2qkOgRnmb6ph1c1fh53l88CXbICfOKM8GrP9xbEMOgbgtgbLgo85jeJbDM4IDPxGBY8SPD4ESsCgt9orFbWI78GNeZcV0K+GfZaZDyqHT+VMQjQD8fycp3W5BOf2qEeyaQHvhDNaRF+DDyCrx0jQBOakmCSw/noM4z2x5xoxwwkONz+79O8hWb23dOWOu64Dp5ILByShbF5DO1zLavQ6rEypJLE7EbrfFZ1m8vSfuBarOqo1XN4oD3Ua+s8i++G4u2vnWV81RrpZcBawWUxH98ljM0TRwXzRAuvb1as05qGI1OvtNygyLXbQEt+0tbJJpCxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKAOoSEywYCX/O85YLp3sAl03CLDibJxZ5e1OmmOSPE=;
 b=Mu7XMgSq514C1uWFHr619/VHfAJZMSccNvN/DE0X/Ft4Jy9vXUFnW3zl1J/XKGM2FuRLAE52PvFoCJeHub6QSaaqBaUpSc0ZIYn5zJ/6uyOCpTl76o0vByGgn0cx3mkF2B9wETCjL37rdhspinEupRbGBXonswbr+YCdu3Hkg5ZqeKsXZfeyqVpv46wbVN3XZJn4ENdzNal1w+mg+CgaY5JFBKEYBCkcie7hruzHkILnMYQsfL5osIDKGA5wPyl2IfHX6TkK6A8C4KQ0tRxVqImqfpHulG04gGacAOP0MGAU9B6HbhIAoyMIRR8hov4JcwTfYpVI0cZuoENUbU9CZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1612.namprd12.prod.outlook.com (10.172.37.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 05:49:14 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 05:49:14 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for nbio
 v7_4
Thread-Topic: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for
 nbio v7_4
Thread-Index: AQHVXaEN2QMVUzUnx0uN5hNQm2+vgacRVekAgABJq+A=
Date: Thu, 29 Aug 2019 05:49:14 +0000
Message-ID: <DM5PR12MB1418CEF22D09FF0DFFC2C2C2FCA20@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
 <BYAPR12MB2806FE6895D90CD1AC1076D7F1A20@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2806FE6895D90CD1AC1076D7F1A20@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a05fa9c2-1382-4705-4e63-08d72c449fa8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1612; 
x-ms-traffictypediagnostic: DM5PR12MB1612:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1612243D83D34FF6EC59263EFCA20@DM5PR12MB1612.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(13464003)(186003)(53546011)(446003)(102836004)(3846002)(14444005)(5660300002)(6116002)(486006)(256004)(476003)(11346002)(86362001)(8676002)(81166006)(81156014)(6506007)(52536014)(8936002)(71190400001)(9686003)(6436002)(478600001)(966005)(53936002)(6246003)(71200400001)(66446008)(110136005)(305945005)(26005)(66476007)(6306002)(14454004)(2906002)(76176011)(76116006)(66946007)(55016002)(6636002)(66556008)(66066001)(99286004)(7696005)(74316002)(229853002)(25786009)(64756008)(2501003)(7736002)(33656002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1612;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xxGvCXFEMx8RPCaaSj9H2Q1Zg2gZYSko2UvVBt2xs3cpTRA6H35xtwyZHjy0UMReFPQGRHoLuIwt5Ik1ejskZ9rD+xusLTiTYTo4RmkIuHK5e33FeA9DWJZIGHJsDG7ZMeRCnqrav2VEAcGTZUjFnnIRWxGNNxjO/ExTMTqphQT7NSdOsPQAT9zDbWzvNZEIWjJm9RSGXStyrvSI9zzmzazMjBu5b55nqkXM5dk3svW7KOnhZ+Gnttxe4+gc9Aa6h0g1yjLdi4168uVBGudG0VK2mCzgmB5NvHWZxXp2OIigLxo3ImDXkS4dqA29Io+wUdMNcxSCOTpAcJX/BAcJB4Mp04222TAzmgKw8yCcct9ZualtZFKvymgVDVh3BiknCwLtri1ZPx7mGn5hPnZExaj402Hn7wZ8ujIrXlxZVwo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05fa9c2-1382-4705-4e63-08d72c449fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 05:49:14.3020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pse4uow8muNNbZ35WPuhql2DIe2JH4SizymL6UVmXrjLz4v1rND/hgSYlNnMUqwcA36qrkLfeEssJSWExNmkEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1612
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKAOoSEywYCX/O85YLp3sAl03CLDibJxZ5e1OmmOSPE=;
 b=Oeh5XcMtyW1SYuZpzLgiAUu1KGX44XJkdtwRKSxFOYxqer9l3xriIcRyuLx9Z9Rht6KyE+m57tN4jXQt3ERmM693C5MoBHzuOZ2QQtSyW/7uIvSAW8o8MAgBOBIdVQCxqrsm/0Ere51zQyK8wQb35taEsjMS4pME1mXRtkatn+g=
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

R29vZCBjYXRjaC4gV2lsbCB1cGRhdGUgaXQgaW4gdjIuDQoNClJlZ2FyZHMsDQpIYXdraW5nDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5D
aGVuQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDjmnIgyOeaXpSA5OjI1DQpUbzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSCA3LzddIGRybS9hbWRncHU6IHN3aXRj
aCB0byByYXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZvciBuYmlvIHY3XzQNCg0KDQpSZWdhcmRzLA0K
R3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSGF3a2luZyBa
aGFuZw0KU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjgsIDIwMTkgOTowMyBQTQ0KVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47
IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCkNjOiBaaGFu
ZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDcvN10g
ZHJtL2FtZGdwdTogc3dpdGNoIHRvIHJhc19sYXRlX2luaXQgY2FsbGJhY2sgZm9yIG5iaW8gdjdf
NA0KDQppbnZva2UgbmJpbyByYXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZ1bmN0aW9uIHRvIGRvIG5i
aW8gcmFzIGluaXQNCg0KU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDEz
ICsrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IGU3ZjI1MzkuLmY1
M2JkNTkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtMTIwNiwxMSArMTIw
NiwxNSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkg
IHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpICB7DQogCXN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxl
Ow0KKwlpbnQgcjsNCiANCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCiAJCXhncHVfYWlf
bWFpbGJveF9nZXRfaXJxKGFkZXYpOw0KIA0KLQlyZXR1cm4gMDsNCisJaWYgKGFkZXYtPm5iaW8u
ZnVuY3MtPnJhc19sYXRlX2luaXQpDQorCQlyID0gYWRldi0+bmJpby5mdW5jcy0+cmFzX2xhdGVf
aW5pdChhZGV2KTsNCisNCisJcmV0dXJuIHI7DQpbR3VjaHVuXVdlJ2QgYmV0dGVyIGluaXRpYWxp
emUgdGhlIHJldHVybiB2YWx1ZSAiciIgZmlyc3QuIElmIGFkZXYtPm5iaW8uZnVuY3MtPnJhc19s
YXRlX2luaXQgaXMgTlVMTCwgdGhlbiB3ZSB3aWxsIHJldHVybiBvbmUgdmFsdWUgbm90IGluaXRp
YWxpemVkPw0KIH0NCiANCiBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9zd19pbml0KHZvaWQgKmhh
bmRsZSkgQEAgLTEyODcsNiArMTI5MSwxMyBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9od19m
aW5pKHZvaWQgKmhhbmRsZSkNCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCiAJCXhncHVf
YWlfbWFpbGJveF9wdXRfaXJxKGFkZXYpOw0KIA0KKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0
ZWQoYWRldiwgYWRldi0+bmJpby5yYXNfaWYtPmJsb2NrKSkgew0KKwkJaWYgKGFkZXYtPm5iaW8u
ZnVuY3MtPmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0KQ0KKwkJCWFtZGdwdV9pcnFfcHV0
KGFkZXYsICZhZGV2LT5uYmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7DQorCQlpZiAoYWRldi0+
bmJpby5mdW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCkNCisJCQlhbWRn
cHVfaXJxX3B1dChhZGV2LCAmYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwgMCk7
DQorCX0NCisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
