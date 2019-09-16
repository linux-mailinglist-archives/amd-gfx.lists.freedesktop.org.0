Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF55B406F
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD26EA2F;
	Mon, 16 Sep 2019 18:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037B46EA2F
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIaKUd69BQ9sJqqrw/jZk5k4G6/gVjY1Y81e6mBBINgQ8ULtBCqNZi8G/IL7jOV7DczgTV5dYiflRNY70v2fblWvW2/m098ftgfHn2iwqsNNmif9twC5b6oCdnspKy3aJx/Cub3nQaz1+9d6c863s5QGPwQOmzGGx6QaWx8+588GwGBs9vHKCz9I0FBpqgXiih/KwN488dweee7OPafkAtYMg+1aDrYGUGaXtttps7U1Gg0/N+VtcirYkiveCDhaVfWu+Rd2iVHndc7G9FVSOCfMgPzVdnppB0aSoyom5meHGyiofCFB5Ms1WbbLcoRSsoDW4sHYKkilQLMKlAO2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1upA/XBGJO68EoojW6bAUFyd56g9CV+HUty+qSBF4CE=;
 b=VMxQJeBFtJ4EdsrjFt9sHXSpEiPCr4jXngcIQRJ0e9s/sE1PpJOsAHMsV+hkq0tp4lcZjvg1sNVtpECwszs96FApe1nCnlCBiWjAu3HWgrlZp969ftBXHfSEOhS/TX3rUOgoMoednPgxEul/Tbl9qz6rle7A1CT9NdxznmWLpTcu46TWueE9WmIJjnHX+Z8fuoCxD89Tv/yBoQH59zl35702c3Dol1XdAqaQ41SPHxg2Ex+fux7eHd1jtz5Hbq+Q7lzr+D7gUzR1gL/kyDLzvvbIOXJCb7N3zzBJj8k84rwa6roAWeAKszHV3bPKuka+m9qPCjAsjOE6hNQjrqGryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1743.namprd12.prod.outlook.com (10.175.55.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Mon, 16 Sep 2019 18:38:31 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.023; Mon, 16 Sep
 2019 18:38:31 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/vm: fix documentation for amdgpu_vm_bo_param
Thread-Topic: [PATCH] drm/amdgpu/vm: fix documentation for amdgpu_vm_bo_param
Thread-Index: AQHVbLu7wZMSPRcmwEih3riCeaFi3acuomUA
Date: Mon, 16 Sep 2019 18:38:31 +0000
Message-ID: <b2a0591d-b845-da91-451d-b57153a9aaf8@amd.com>
References: <20190916182228.11860-1-alexander.deucher@amd.com>
In-Reply-To: <20190916182228.11860-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::39) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa74a121-d254-455e-da04-08d73ad5127c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1743; 
x-ms-traffictypediagnostic: MWHPR12MB1743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB17431FC50C5DE4D94C2D20D0EA8C0@MWHPR12MB1743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(199004)(189003)(2906002)(2501003)(81156014)(81166006)(86362001)(53936002)(256004)(66066001)(31696002)(5660300002)(14444005)(8936002)(31686004)(316002)(4744005)(4326008)(14454004)(110136005)(478600001)(6246003)(66446008)(486006)(66556008)(66476007)(64756008)(446003)(11346002)(66946007)(99286004)(229853002)(2616005)(25786009)(476003)(6506007)(386003)(6116002)(53546011)(71190400001)(3846002)(7736002)(6436002)(102836004)(186003)(6486002)(305945005)(6512007)(26005)(71200400001)(76176011)(8676002)(36756003)(52116002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1743;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DBjXKqFZYa36Z2DpZN5RizaHlKhmxVBd8oRPlh/BMv5iwxai0PRWtIdugvKISarcG/5Grb67G2qJ1FSeeN2CmnoW9AaY1iikJfTmou/TzlZC0tmngyxgT3OC88tkv9PR29JXBjb+upSIePqfe/FaxPQldtMrz918dhkNLDvCVqPittG9FYnwS4Msw5TGzyj8qwr+DjZyXQtLvdknBBUviKbZx2EmZEK49kJ37uK/l4VXqwCmMRBT16Xj33cQ6ECDEfnnD7aPhcPBfMhJ4Z8fp/71xU31kE24dJW2PpEJWXLtE2V/GuIYMJeXQTNIEYBcFBVTLAcenaw99zCbFbJaxh7h/alr/1J/uPHEboxMxEDpQiBAC1/dboUzm9hPe3sqVoADjPUymD2cuTCrM3gFfYbNp/mFfaAWCWEiIJcATtg=
Content-ID: <29B48F4A2C4C3B43B7A141D57FAC634C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa74a121-d254-455e-da04-08d73ad5127c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 18:38:31.1780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phnw5HoUYul5Pbl4dLaQA/FGYmzv1mTaLhfTKyP5BfZ4OOhZn2m4qDXuMX14KZGU9UWy0GlJJ3x5jYiP3+XqQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1upA/XBGJO68EoojW6bAUFyd56g9CV+HUty+qSBF4CE=;
 b=RoPiukiXr52+rH+9LxQG/na2IXapgMGn4hp0V3Y8i3HEwvzsfEHYEllgsF+G72uPBhb4WyHLGrCjRmi/2qiIWRO/ljP6ZQqrHeXX6yVonwMwJDLpA3CdZsnBjTDkvXGpW9b6y7TYJgWBGbbZ8jHu+2BzMxdWWplySFTyiB9Zsrw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

UmV2aWV3ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pg0KDQpBbmRyZXkNCg0KT24gOS8xNi8xOSAyOjIyIFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
IEFkZCBuZXcgcGFyYW1ldGVycy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IGluZGV4
IGYxMTc1ZjlmNGI4MC4uNTQ1NDlhMjZlZTAxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYw0KPiBAQCAtODI1LDYgKzgyNSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZtX2NsZWFyX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgICAqDQo+ICAgICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiAgICAqIEB2bTogcmVxdWVzdGluZyB2bQ0K
PiArICogQGxldmVsOiB0aGUgcGFnZSB0YWJsZSBsZXZlbA0KPiArICogQGRpcmVjdDogdXNlIGEg
ZGlyZWN0IHVwZGF0ZQ0KPiAgICAqIEBicDogcmVzdWx0aW5nIEJPIGFsbG9jYXRpb24gcGFyYW1l
dGVycw0KPiAgICAqLw0KPiAgIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9ib19wYXJhbShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
