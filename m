Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A290486F8B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 04:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44AC6ECE8;
	Fri,  9 Aug 2019 02:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEC76ECE8
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 02:15:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeMFZmQt4hIzC4b+Fi0yze1RcXVdmFqNtDZEfxkxm/suJBMSVUnkR0NJKnZXjiPMT21MPBYyEreb7w49uEiUT4Ba2cEgxuX7dY3GH1WoV5nIBaV4cZSj/wgVA3yZg8kKYghoBrWXXp4olnGqk9ZxqT1MJxkiDx98Ah9YGLl+rB2KOw5en5VK/Ifn8W30Wx5QV4lNpuagoaoL4G69YGmjhJeHYLqCF44mgdGiHxkx25kYM6+tJzZUsa1rkxgoVm3P1YFYULC5NfHqAcIHG0YyL20868JEdE9go9sOzkUxyc/i6o4paJCX8W3+I/H9aC8fZDWpYqlei/9mf5QVi2bkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V70s8kZklztDwspFmjObpGA9i0EzGSjPDQngHkIAQPc=;
 b=kbC/HtiNAMARHDD6Uz6G++ds2U0b1rTJAVkbDnxJ5Ke+BqwHmUN56vatHjY0sT8XB4a26htsDqasa+VQCtZAouC7gi/sL9zjjZoxWUG2MhR+su80PrafXZiEkux71eddgoaWoG8hjgTXER7bfyPtJA24bGqfFOiGmr2ATt9rzykyQNQXqVt7nCv/+T8J4aV6ViTk1pCCj+fwsZ3OerX6mC245stHYe37ClI8Yy6c0G55ZFYQg1l2GV6ZciCAfaxX+VDqgx85i0duMdpPSkmVvDtx/G1qveItselidBBRH9amrtRdZyIqTR8/geaOGBUhnkRQsA9E0aNy+0blG5M2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2436.namprd12.prod.outlook.com (52.132.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 02:15:36 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 02:15:36 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTlhUHR9uJdXlpECqARkusLOo4g==
Date: Fri, 9 Aug 2019 02:15:36 +0000
Message-ID: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3d994b1-e5fd-4341-3afa-08d71c6f772d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2436; 
x-ms-traffictypediagnostic: BL0PR12MB2436:
x-microsoft-antispam-prvs: <BL0PR12MB243694B7585B3DA73EA2DF9580D60@BL0PR12MB2436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2616005)(14454004)(5660300002)(99286004)(305945005)(316002)(7736002)(478600001)(6116002)(36756003)(386003)(6506007)(8936002)(2351001)(6486002)(53936002)(26005)(52116002)(186003)(3846002)(6916009)(54906003)(476003)(71200400001)(71190400001)(2906002)(102836004)(81156014)(6436002)(8676002)(256004)(86362001)(25786009)(5640700003)(486006)(66066001)(66476007)(81166006)(66446008)(6512007)(66946007)(66556008)(64756008)(50226002)(2501003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2436;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lhGetWM+aDZSQm0tFO588pIhr/tdkJYwBy8YgAK1TXdpbicwsoaja+59mWwzGTV7rjaiEsdE3PXIrBaFCVsOEWIMoQdgtkr9MejyOSB37eWt6hs8uxTVqFL164QHEEy+d+mG/NxDbHoAuLsa/OBqundeDY6Gy0eOznCHR9C2wcZVGRpRPwnYfHdr50yXPhuwQijPrksvCNAVpvfm9SVlgQavIS63Z5H2j5zAkT4qRVkR6DhvZrX4SK60v1lIhnqjrZ1h/Hs4AUl7EpG37aGq/a7SHI9NFYOjIKTcMGx0vyZz1K7eanozUtGRIxuJdgJrKfcmuvJn4FIXVunQQK22YpPaQIgPPsQpjtQvgdLyTUabZiAvXUaLWK8wI0rGJGZRa/tF+2MXJ1Gpiw2aHtKqqj8lABDi3d+qNon7bRq5Tt0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d994b1-e5fd-4341-3afa-08d71c6f772d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 02:15:36.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpHnzCStt5NNJS38Ia1kceSlcpyHyhZHkVz3OHah5JF+amMF52eMVHwFo8BD5Iu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V70s8kZklztDwspFmjObpGA9i0EzGSjPDQngHkIAQPc=;
 b=HeE7LY1zvhOUCho23bGG4XKXmi9dmMjcUwUlLnDDynwUGAt4dmm+RwiihQnyXo7a7orQld+9+0BEGcq/qUkzr+6+BwCwtRaNyzq2K0XuWd/Mr+B1p/6a+BiLrMAI/75MZP4zpGr9f4JaXJmP3FJS+e9FSq8fEvOBH795iCzZS0w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRlZmluaXRpb24gb2YgYWxsIHN1cHBvcnRlZCBtdHlwZXMuIFRoZSBSVyBtdHlwZQppcyBy
ZWNlbnRseSBpbnRyb2R1Y2VkIGZvciBhcmN0dXJ1cy4gQWxzbyBhZGQgZGVmaW5pdGlvbgpvZiBh
IGZsYWcgdG8gcHJvYmUgYW5kIHBvc3NpYmx5IGludmFsaWRhdGUgcmVtb3RlIEdQVQpjYWNoZSwg
d2hpY2ggd2lsbCBiZSB1c2VkIGxhdGVyIGluIHRoaXMgc2VyaWVzLgoKQ2hhbmdlLUlkOiBJOTZm
YzliYjRiNmIxZTYyYmRjMTBiNjAwZDhhYWE2YTgwMjEyOGQ2ZApTaWduZWQtb2ZmLWJ5OiBPYWsg
WmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uaCB8IDkgKysrKysrKy0tCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAg
ICAgICAgICB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKaW5kZXggMmVk
YTNhOC4uN2E3NzQ3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKQEAg
LTgwLDggKzgwLDEzIEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsKICNkZWZpbmUgQU1E
R1BVX1BURV9NVFlQRV9WRzEwKGEpCSgodWludDY0X3QpKGEpIDw8IDU3KQogI2RlZmluZSBBTURH
UFVfUFRFX01UWVBFX1ZHMTBfTUFTSwlBTURHUFVfUFRFX01UWVBFX1ZHMTAoM1VMTCkKIAotI2Rl
ZmluZSBBTURHUFVfTVRZUEVfTkMgMAotI2RlZmluZSBBTURHUFVfTVRZUEVfQ0MgMgorZW51bSBh
bWRncHVfbXR5cGUgeworCUFNREdQVV9NVFlQRV9OQyA9IDAsCisJQU1ER1BVX01UWVBFX1dDID0g
MSwKKwlBTURHUFVfTVRZUEVfQ0MgPSAyLAorCUFNREdQVV9NVFlQRV9VQyA9IDMsCisJQU1ER1BV
X01UWVBFX1JXID0gNCwKK307CiAKICNkZWZpbmUgQU1ER1BVX1BURV9ERUZBVUxUX0FUQyAgKEFN
REdQVV9QVEVfU1lTVEVNICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IEFNREdQVV9QVEVfU05PT1BFRCAgICBcCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2Ft
ZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCmluZGV4IGNhOTdiNjgu
Ljk3ZThlNTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCisrKyBi
L2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCkBAIC01MDMsNiArNTAzLDEwIEBAIHN0cnVj
dCBkcm1fYW1kZ3B1X2dlbV9vcCB7CiAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9DQwkJKDMgPDwg
NSkKIC8qIFVzZSBVQyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8KICNkZWZpbmUg
QU1ER1BVX1ZNX01UWVBFX1VDCQkoNCA8PCA1KQorLyogVXNlIFJXIE1UWVBFIGluc3RlYWQgb2Yg
ZGVmYXVsdCBNVFlQRSAqLworI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfUlcJCSg1IDw8IDUpCisv
KiBDYWNoZWFibGUvc25vb3BhYmxlICovCisjZGVmaW5lIEFNREdQVV9WTV9QQUdFX0lOVkFMSURB
VEVfUFJPQkUJKDEgPDwgOSkKIAogc3RydWN0IGRybV9hbWRncHVfZ2VtX3ZhIHsKIAkvKiogR0VN
IG9iamVjdCBoYW5kbGUgKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
