Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D811A7511
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAE7898B6;
	Tue,  3 Sep 2019 20:37:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91245898B6
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 20:37:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZJ2EzdQ43NolTAYXeJVOyURmvdN4caUs7k/Kkb/MDkFUY9p93b2xu+1BFsbpksGJgByoavFiRoCkRu58zYd+GpDoAsvCe0BnMAo+q30dMLu396vvFO/n15b2Ma7liOWYw1zmqweTx4lNap1Yjl867oewFU7o74sUcu0doEFsJKt48Lr124IQmTQzOREq6WLvJ0jYUFVIteAPlsPkgO05LyLVskS3GeTApf3ejvUs8T6PcPHs4wpW/baAWS9ESTqYRRqEnRArDJo4PhFXj9eM2PRBpkHOYjyBuPbm7pJOOIoYVCaF99ys9biDRL0OZ7R4di9cQFxd+Q/snadpPagmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ra71Nj/jzXjt9dQG6oH8SkXDxD82343iqnWQlpxViE=;
 b=OafoXnDaEVK7ibtzfVaoO0n+724qr5pp6fI1+q5LjYYBaaeb2kK97z+kYJB1cRQQ3fvXDvX+A+/lAvYkAc8Fg1h8MfICAT/OTHc8nJnCeyGfz7kA3egXhyzYNaPq5bz+PZj3UsJe3cwJNBrdVfSkIBzLf93U3JxFrj/Q3xPPFkEWh2ibndEb9Xz8fjScxkj6vSHRYwDJWkRtAON7T/h8juD/Lo3LQTNql5iE+GHiHBg/cXfFgsByOn24CgkMYkXRKlwh30z5WEQmJ0gMPMKWsC4/7cUuX1rx0APtktIWIbwv9QmWyKTHBaGdYJyVp030j0vSEbURzSYtbCfCFCCIGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3243.namprd12.prod.outlook.com (20.179.105.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 20:37:26 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 20:37:26 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: use moving fence instead of exclusive for
 VM updates
Thread-Topic: [PATCH 1/3] drm/amdgpu: use moving fence instead of exclusive
 for VM updates
Thread-Index: AQHVYXyCiYM/mn9zd0+I0SHzFarQ9acaa9CA
Date: Tue, 3 Sep 2019 20:37:26 +0000
Message-ID: <a3fa0403-63a4-e9d1-aeed-79ed0fb66379@amd.com>
References: <20190902105219.2813-1-christian.koenig@amd.com>
In-Reply-To: <20190902105219.2813-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d214960-ad18-437e-5481-08d730ae883e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3243; 
x-ms-traffictypediagnostic: DM6PR12MB3243:
x-microsoft-antispam-prvs: <DM6PR12MB3243612A1F60EE528D1416DE92B90@DM6PR12MB3243.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(99286004)(7736002)(2906002)(478600001)(3846002)(229853002)(15650500001)(81166006)(8676002)(81156014)(2501003)(6486002)(6116002)(65956001)(66066001)(65806001)(31686004)(52116002)(36756003)(305945005)(8936002)(86362001)(31696002)(66574012)(64756008)(66446008)(316002)(4744005)(53546011)(5660300002)(6506007)(386003)(6436002)(25786009)(14454004)(110136005)(58126008)(186003)(53936002)(256004)(14444005)(66946007)(446003)(6512007)(2616005)(476003)(76176011)(66476007)(486006)(66556008)(6246003)(71200400001)(71190400001)(11346002)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3243;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Yu6mdDuLH2hJv8oZDIXnIpD/7Rol69371Be3nQ/zf6h/GIm8LnWjHkwIXwb+ivxNLPaWP7E07W822Fsq2dx+5Uilyg7abK96r0981eUwi2l2eMK8NuC3c2ma0VXEN/tIWFGo2cumLLHTbcYpvZQd7A+7VxPrTrdyBuNaKSpkJmeH73x6SwLnqY/mm8jKThYdw5sz+AIr6pcNFjdP1fL4Tulv5FpQjE5xGa/5SgPXlBveOGkuxDzO/BUAQBpkQRjMLs1GJvG0muw+fGFnLFVtj0hv2utL80whuo6RVfmsrz603wQaOmSUmf3aYFdROJQ0ptjf4dbCXh8jUqyw0BD9qhuJA9eRX3jTgGfUU5kvP92syV7ncmMZpqw/NdL6zFfEI5GceRlKphqq3PsqVs6xSsndzBwrctdRWMp2pwMrHs=
x-ms-exchange-transport-forked: True
Content-ID: <96388496CC366F48B5D74C7F08CF82A8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d214960-ad18-437e-5481-08d730ae883e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:37:26.6222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bw4l1kuki6Z6a/04N+xqHJ2OhWLpo7gg9bBZbpiSzmocD56DcWaVTPS/dhu/SZ7x24Fl2QXqPvhYn+2ekeHRiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3243
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ra71Nj/jzXjt9dQG6oH8SkXDxD82343iqnWQlpxViE=;
 b=A3QLhKouFrAoljs887XBcMwzXDxYXYopZ5qptWoleX3KFrXlSYGvW9bhodwc+fW+xJknxRbvyZVNgKqlH9bqKv4UEjWiyxeZUhuXXXnpfxk91eBqVoFY6DtJjYotCENM8MFHcFr7CCQOXDtZ5Es4JTI8mtQWmc/A89dNutsBP+s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wOS0wMiA2OjUyIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IE1ha2Ug
Vk0gdXBkYXRlcyBkZXBlbmQgb24gdGhlIG1vdmluZyBmZW5jZSBpbnN0ZWFkIG9mIHRoZSBleGNs
dXNpdmUgb25lLg0KDQpJbiBlZmZlY3QsIHRoaXMgbWFrZXMgdGhlIHBhZ2UgdGFibGUgdXBkYXRl
IGRlcGVuZCBvbiB0aGUgbGFzdCBtb3ZlIG9mIA0KdGhlIEJPLCByYXRoZXIgdGhhbiB0aGUgbGFz
dCBjaGFuZ2Ugb2YgdGhlIGJ1ZmZlciBjb250ZW50cy4gTWFrZXMgc2Vuc2UuDQoNClJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+DQo+IE1h
a2VzIGl0IGxlc3MgbGlrZWx5IHRvIGFjdHVhbGx5IGhhdmUgYSBkZXBlbmRlbmN5Lg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiBpbmRleCAxODlhZDU2OTk5
NDYuLjUwMWUxMzQyMDc4NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMNCj4gQEAgLTE3MDYsNyArMTcwNiw3IEBAIGludCBhbWRncHVfdm1fYm9fdXBkYXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCXR0bSA9IGNvbnRhaW5lcl9vZihiby0+
dGJvLnR0bSwgc3RydWN0IHR0bV9kbWFfdHQsIHR0bSk7DQo+ICAgCQkJcGFnZXNfYWRkciA9IHR0
bS0+ZG1hX2FkZHJlc3M7DQo+ICAgCQl9DQo+IC0JCWV4Y2x1c2l2ZSA9IHJlc2VydmF0aW9uX29i
amVjdF9nZXRfZXhjbChiby0+dGJvLnJlc3YpOw0KPiArCQlleGNsdXNpdmUgPSBiby0+dGJvLm1v
dmluZzsNCj4gICAJfQ0KPiAgIA0KPiAgIAlpZiAoYm8pIHsNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
