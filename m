Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E4C0292
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 11:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A061A6EEDA;
	Fri, 27 Sep 2019 09:43:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AB76EEDA
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 09:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCItfOiBoxyheYywcFVk2ZkqLwjsl0qpe1oGuB2eceRyCch6CdgYUe1ENR0EznYw1cFYGUaln2QqWE7P5JVqf27WVgG+z0fahaywr+S1ErczMfgcZyy1+BjlAObxAgbDCK4fN1rBHcaxBKGUheG6PRuSShlkP8wxfFKuPJXZhYvDck6lREt5QILv1quvsnAtRMTUvGDvRqulXF/c93v4CuqmD1Ro4C8twR04GKwqCALKurStqKQ47LIZdz+E9wx0251pW/evKXxJxyPGud7w8N8ReiJ2zsWTFsI3UL7ZGsIyII4ej0Ezz2GuBz606q7Q4Q6rdtREJWV5hBFiRkb/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYCWAPUSKfzUspsneI7l7XBnd0HLqbfprhTtMV5t3ps=;
 b=oDrbO9qNqK5kry4BkSRrxsI1myYaOL4DNMhUOgLqrBQleLXFreS9LZewkRDBlnyP4f9YUwBXOWK5HRtOjhKzlL8foz5K4p8Zxjw8hWic49+K+SHsVWXxcsBxQ63DLiTXI0QDTS4ay4zLYfxcaI4/6LP7AuvVc6bSl2XHXdykFrwNtSKMJRtoWHec8yRkB4j02Rz7YT3brFjV9rTKrg8sCKiNqZfXBSpMtQS4hXa5m5JkF1AEm9YgV48giJ8HoIN3B7dBw8Xj/fzWSfc303yiQsmHeCt16oxUUF91eY6BwrdHsUuKB0TzsB8DalMhOtucY2pVdW1Q5dmUVWWAZ11ogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3885.namprd12.prod.outlook.com (10.255.237.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Fri, 27 Sep 2019 09:43:05 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 09:43:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition conflict
 error
Thread-Topic: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition
 conflict error
Thread-Index: AQHVdOy5Gdeati0HikqkW7SHta/wu6c/RfUQ
Date: Fri, 27 Sep 2019 09:43:05 +0000
Message-ID: <MN2PR12MB33441312E8C5167E003EC6FAE4810@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b144586-fc9a-42af-e4c1-08d7432f18c5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3885:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB388553DA81734C84845EC00DE4810@MN2PR12MB3885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(13464003)(189003)(199004)(52536014)(6306002)(8676002)(9686003)(7696005)(76176011)(81166006)(86362001)(2501003)(53546011)(102836004)(6506007)(256004)(478600001)(81156014)(229853002)(14454004)(66066001)(74316002)(5660300002)(55016002)(7736002)(476003)(305945005)(486006)(446003)(11346002)(966005)(76116006)(26005)(6116002)(3846002)(33656002)(66556008)(66446008)(71200400001)(54906003)(71190400001)(110136005)(66476007)(2906002)(316002)(66946007)(64756008)(186003)(4326008)(25786009)(8936002)(6436002)(6246003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3885;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIhMeDcRi5CF+IknXEHaCo9yKtein9DUP4c1+L0w1OEIcHeE9CCbdBew+HuMYGUX1gos/LRKaFhCMKS16sdTnWvR3y1qrPlhpfGdFVvXcWTZwxS88zovE7v4p7vnrr9Y8lEouBNtLKJptQvR+vx6xXCLsxJcGBe1XFboRMaqbzyYJ2SDPDQYWN+6TkR/K6zlzpRLkGYpyXIRmQJBCLv5QlSD15TVqnH+T5pUMio4J/3BX5uvpJHHshcIs3KMkdfFUde79gaT+lbol4LIpw3hpMWCjKWpoe0GedLfWS/pE9e7pg57HfdPVNXCqaW6KTXtbcB7ydbpSJdirFPn3cT180S/cdI3+3T7NQIPkBors/ycG8onsrnKA8UGRS7vpUkMgqobdpmMlWR6yiIza0ZUbJtURrx7ZR2ICxlWxL71Q9KA/3BGyAZfzq88qq4UN0VYXhusmuVEnH0taTqA2HiCzg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b144586-fc9a-42af-e4c1-08d7432f18c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 09:43:05.2531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkkMKDvcYs/o33TH4UXxc1N6T7T+P10Ofc65QmZaOoeg/Jt/nCNaTR8pQxeYggSb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYCWAPUSKfzUspsneI7l7XBnd0HLqbfprhTtMV5t3ps=;
 b=bZLpGaeVXxvSytTnEN1289ldZoIEkLEM5iOF4UGxKKTj9Pj3bQhw25St/Q9tlx+Jp4KEyFdPugWfWQIimtG8tFTQTULqOlxixWjt7Mc40BH4EDl9mCmjSx+IURvvf+l6KbVvkL76PgK/3PePrJsd33PH+Zs7cv+Q+9vZSgMTvnA=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGlhbmcsIFByaWtlDQpTZW50OiBGcmlkYXksIFNlcHRl
bWJlciAyNywgMjAxOSAxMjozNCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgSHVhbmcsIFJh
eSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaCA8SGFyaXNoLkth
c2l2aXN3YW5hdGhhbkBhbWQuY29tPjsgTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29t
Pg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1ka2ZkOiBmaXgga2dkMmtmZF9kZXZpY2VfaW5pdCgp
IGRlZmluaXRpb24gY29uZmxpY3QgZXJyb3INCg0KVGhlIHBhdGNoIGM2NzA3MDcgZHJtL2FtZDog
UGFzcyBkcm1fZGV2aWNlIHRvIGtmZCBpbnRyb2R1Y2VkIHRoaXMgaXNzdWUgYW5kIGZpeCB0aGUg
Zm9sbG93aW5nIGNvbXBpbGVyIGVycm9yLg0KDQogIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLy4uL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3Iubw0KZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvL2FtZGdwdV9hbWRrZmQuYzo3NDY6NjogZXJyb3I6IGNvbmZsaWN0aW5n
IHR5cGVzIGZvciDigJhrZ2Qya2ZkX2RldmljZV9pbml04oCZDQogYm9vbCBrZ2Qya2ZkX2Rldmlj
ZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQogICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvL2FtZGdwdV9hbWRrZmQuYzoyMzowOg0KZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvL2FtZGdwdV9hbWRrZmQuaDoyNTM6Njogbm90ZTogcHJl
dmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYa2dkMmtmZF9kZXZpY2VfaW5pdOKAmSB3YXMgaGVyZSAg
Ym9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQogICAgICBeDQpz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3MzogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly9hbWRncHVfYW1ka2ZkLm8nIGZhaWxlZA0KbWFrZVsxXTogKioqIFtk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8vYW1kZ3B1X2FtZGtmZC5vXSBFcnJvciAxDQoNClNp
Z25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIHwgMSArDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmMNCmluZGV4IDIyMTA0N2QuLjkyNjY2YjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KQEAgLTc0NCw2ICs3NDQsNyBAQCBzdHJ1Y3Qg
a2ZkX2RldiAqa2dkMmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgIH0NCiANCiBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYg
KmtmZCwNCisJCQkgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsDQogCQkJIGNvbnN0IHN0cnVjdCBr
Z2Qya2ZkX3NoYXJlZF9yZXNvdXJjZXMgKmdwdV9yZXNvdXJjZXMpICB7DQogCXJldHVybiBmYWxz
ZTsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
