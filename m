Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407921222
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 04:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B289804;
	Fri, 17 May 2019 02:41:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DAE89804
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 02:41:57 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3424.namprd12.prod.outlook.com (20.178.243.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 02:41:50 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765%5]) with mapi id 15.20.1856.012; Fri, 17 May 2019
 02:41:50 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Thread-Topic: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Thread-Index: AQHVC94FavSrKvZPp0CPl1uF2nyUjaZunC7g
Date: Fri, 17 May 2019 02:41:49 +0000
Message-ID: <MN2PR12MB3039EAC37D6BB17BD3582D77E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558007618-24482-1-git-send-email-yttao@amd.com>
In-Reply-To: <1558007618-24482-1-git-send-email-yttao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc4b5770-1f89-4516-368e-08d6da713699
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3424; 
x-ms-traffictypediagnostic: MN2PR12MB3424:
x-microsoft-antispam-prvs: <MN2PR12MB34244628DAF7B5FF4676B7F5E50B0@MN2PR12MB3424.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(13464003)(199004)(189003)(51874003)(5660300002)(256004)(186003)(53546011)(52536014)(6506007)(74316002)(26005)(25786009)(55016002)(14454004)(102836004)(76176011)(54906003)(110136005)(7696005)(86362001)(6436002)(9686003)(99286004)(6246003)(229853002)(11346002)(446003)(72206003)(486006)(64756008)(6636002)(73956011)(76116006)(478600001)(66446008)(66556008)(66946007)(66476007)(8936002)(81166006)(476003)(8676002)(7736002)(4326008)(68736007)(3846002)(316002)(6116002)(305945005)(2906002)(33656002)(71190400001)(71200400001)(81156014)(66066001)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3424;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QXMZLD5TxkSKTgfKTDtK5FRKDbyctKljgH0GRkF//Y+FjiLpDZEXh1IoNI14RMiBXpHpR/SzxOTjsFTx+yaYxd7tCOz424kk9hYBiQw+rf8228sgdhfhgvKTp26NARpAIvlT55zaQJpwHkDrdT45YXLy5OD9BTm29KPg9Q9o47Ldjdeq1iUXAuYvY8IPpKDluWNcZ/QKGBGyYX/ZOyKLqc3rT9dCme6FXYXZC/c69JIeEMx3dDt3Tp8vJw7sTcGFNI+86WiCpiTeP/ARTSb+TkfrHK5HksRHhNkLMqHKcUjFtJtRkFKNSea/hYfMXO8q14/V598G2Wev8TPjJxmjHhZMdJxTKLbv5zragHFD5umRWVL/s5kk1bm+KYqghZeg5vbc5/njXySjH55kXZNpOeMPeT5UW740EGa1/vEklRw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4b5770-1f89-4516-368e-08d6da713699
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 02:41:49.9642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkP0VDurdF8OL9rZMX/0ClmiaYw9E4+XUJYoMC7Sk0g=;
 b=rf1rfwu2pUmydvUiejKAUnZ4AkDBUcMOr+uw9I6EsjuOXdw/C/CUlJ6IWEKS1BCE6Gyfu4mPjqLADI6RItG8plszdmUjWygiOuJ14JDZIMvCKoLzGMRi4NpouNXhQd1n1H7ZAOKzErOwZVL+r1hq5Sg6B2NiRY7PfhNPqmAw97M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuCgoKSSBoYXZlIG1vZGlmaWVkIGl0IGFjY29yZGluZyB0byB5b3VyIHN1Z2dl
c3Rpb24uIENhbiB5b3UgaGVscCByZXZpZXcgdGhpcyBhZ2Fpbj8gVGhhbmtzIGluIGFkdmFuY2Uu
CgoKQmVzdCBSZWdhcmRzCllpbnRpYW4gVGFvCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpG
cm9tOiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4gClNlbnQ6IFRodXJzZGF5LCBNYXkgMTYs
IDIwMTkgNzo1NCBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFRhbywg
WWludGlhbiA8WWludGlhbi5UYW9AYW1kLmNvbT47IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNv
bT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBza2lwIGZ3IHByaSBibyBhbGxvYyBmb3Ig
U1JJT1YKClBTUCBmdyBwcmltYXJ5IGJ1ZmZlciBpcyBub3QgdXNlZCB1bmRlciBTUklPVi4KVGhl
cmVmb3JlLCB3ZSBkb24ndCBuZWVkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgaXQuCgp2MjogcmVt
b3ZlIHN1cGVyZmx1b3VzIGNoZWNrIGZvciBhbWRncHVfYm9fZnJlZV9rZXJuZWwoKS4KClNpZ25l
ZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNb25r
IExpdSA8TW9uay5MaXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMgfCAxNyArKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jCmluZGV4IGM1NjdhNTUuLmFmOTgzNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKQEAgLTkwNSwxMyArOTA1LDE2IEBAIHN0YXRpYyBpbnQgcHNwX2xv
YWRfZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKCFwc3AtPmNtZCkKIAkJcmV0
dXJuIC1FTk9NRU07CiAKLQlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1Bf
MV9NRUcsIFBTUF8xX01FRywKLQkJCQkJQU1ER1BVX0dFTV9ET01BSU5fR1RULAotCQkJCQkmcHNw
LT5md19wcmlfYm8sCi0JCQkJCSZwc3AtPmZ3X3ByaV9tY19hZGRyLAotCQkJCQkmcHNwLT5md19w
cmlfYnVmKTsKLQlpZiAocmV0KQotCQlnb3RvIGZhaWxlZDsKKwkvKiB0aGlzIGZ3IHByaSBibyBp
cyBub3QgdXNlZCB1bmRlciBTUklPViAqLworCWlmICghYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRl
dikpIHsKKwkJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgUFNQXzFfTUVHLCBQ
U1BfMV9NRUcsCisJCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX0dUVCwKKwkJCQkJICAgICAg
JnBzcC0+ZndfcHJpX2JvLAorCQkJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwKKwkJCQkJ
ICAgICAgJnBzcC0+ZndfcHJpX2J1Zik7CisJCWlmIChyZXQpCisJCQlnb3RvIGZhaWxlZDsKKwl9
CiAKIAlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1BfRkVOQ0VfQlVGRkVS
X1NJWkUsIFBBR0VfU0laRSwKIAkJCQkJQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
