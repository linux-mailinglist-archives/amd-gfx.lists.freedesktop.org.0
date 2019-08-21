Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE897AA0
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 15:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF56E313;
	Wed, 21 Aug 2019 13:23:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7596E313
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 13:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVp+hP0Uy3NdHeGKWCluW+hsx52vlN84IicNiDFMw9hN/BtwMDQ9eSpQPVAOtS+a0SHdNGXjlZrsQyRCbgQvqM9RUu/pkSePdTMbLXzWMJUZyJ7PiJ4wDu7wQYo0pmDK0FLe9OpVRGmMh16UyYVenGEqMHff+01BhTfxD0YdK/o0fcsIMa98Z4jAA9eNsFUujTywFsW6TFflOnMkRGuZ1HTvMGRujRfdRIYpWP2b5YNfHOVyLIkS1RjKaXqWz7eOF0IpcSAXLmDPv3hXoL0gsT6/nhi3SoB8gFR7vYCZS1CeRoCxESq/POocVTRoAvSyzS80vQMvTMExNO4puujsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohDjyMxp2oj+0RkhhDOmSu2YBhz0fBu3wDWBTLiXsiA=;
 b=Xhmi1QL+Z/ft+MegzIc7nFXaq1/2LeDkue3QWZFYIDZHNsO7Tox9P5TG08mHPHE22p2RTnaxnY/NmT9EeDo6wojGg7cXzpTUKAU+C3IUkQ+R1/cGsaRLXiA0sMgBSjdi7iSJj7Wf0GWyHHcy2XFq0BzRE+EL2mpQK5/czhuxwCpU4vQ6k/MflZfgrr7h809N3vCEiCAvy5cFk1nq1In6p2hJXuMBJUcyh3pmokusTQ7rl4i0x+1GHVWyO2xI7wlq6+PKYf4Vs9pp2aak0shpcQm7ocuYht4Bd4ikFWxlteaijbKIDldrPAUIQaKI/4OiEKoCgids4u7gffP4PSVD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3345.namprd12.prod.outlook.com (20.178.209.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 13:23:45 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 13:23:45 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Index: AQHVWCOoLidr91jxG0O5rhrubHo1MQ==
Date: Wed, 21 Aug 2019 13:23:45 +0000
Message-ID: <20190821132312.917-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0056.apcprd04.prod.outlook.com
 (2603:1096:202:14::24) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba2be4bf-34c7-4cda-af88-08d7263acaec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3345; 
x-ms-traffictypediagnostic: BN8PR12MB3345:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3345C1C403D5993308E61E0B89AA0@BN8PR12MB3345.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(189003)(199004)(102836004)(6512007)(50226002)(2351001)(8676002)(4326008)(71200400001)(478600001)(71190400001)(54906003)(14454004)(186003)(6436002)(81156014)(66066001)(6916009)(6486002)(316002)(256004)(8936002)(81166006)(14444005)(26005)(6506007)(386003)(6116002)(2501003)(2906002)(99286004)(52116002)(64756008)(486006)(5660300002)(5640700003)(305945005)(66946007)(66446008)(7736002)(3846002)(66476007)(66556008)(1076003)(476003)(2616005)(86362001)(36756003)(25786009)(53936002)(32563001)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3345;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mNZtjpNF8YG6JOKgi7NiaG3U0lLo77CUTycNC96Cvh1xa5skQbayU7DtrlnfV1woRI2h3sOn8Yz4LnBZ28uIVi94xMz13MU+zYEyx3aK5gZUInLG3AbQD463+PrEBTRkY0GZNYUoy526isxlEuFzY9XscybZXvIr8pOmcy5UP6/bLyQ3uHNh2iTwbepcubvAsrXGKdYRcpy0iV04x/NSy2ZSm3RFX5YL8czmTQQ3mPXDzoMao+57qiJPt9gncYwBDeRLkL1bwveRxJamZ+ggTN57BXW55ZfMlCNlGgqQYa+MNcWj70Zl50K82LMUDbqSiDuDFYqB41Cc2xNwt+gY6Ml4BdTEo/SS8CRpLZaux8XqTRk9UQQaEmaJJK9ndtmQ4opg+WFeI38zoWOVFQQmMJW502/6OvR//c/l5nrh4d4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2be4bf-34c7-4cda-af88-08d7263acaec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 13:23:45.3550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85ce49xb6ltJOAlWBrBpyezOikMB8wvPG7e3tpT5Zol9xiseFe7zwalbxMCQYeVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohDjyMxp2oj+0RkhhDOmSu2YBhz0fBu3wDWBTLiXsiA=;
 b=pVKPwbq1ubwRs54L3/5rtcwpSQtEJcqx6x9VZC2lHCnUjibIdbnArdrwIHgC4bDwA6au2ZRrnNHNlVFqUGxrhmMMsEOZRhnox4zmBLpKnyw144tRDgPlCUcK8po89Ps9546MoRWk2rM7SwY2ub/SXnkxab9NQ6majAvaziNd2wc=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bmF2aTF4IGhhcyAyIHNkbWEgZW5naW5lcyBidXQgY29tbWl0CiJlN2I1OGQwM2I2NzggZHJtL2Ft
ZGdwdTogcmVvcmdhbml6ZSBzZG1hIHY0IGNvZGUgdG8gc3VwcG9ydCBtb3JlIGluc3RhbmNlcyIK
Y2hhbmdlcyB0aGUgbWF4IG51bWJlciBvZiBzZG1hIGlycSB0eXBlcyAoQU1ER1BVX1NETUFfSVJR
X0xBU1QpIGZyb20gMiB0byA4CndoaWNoIGNhdXNlcyBhbWRncHVfaXJxX2dwdV9yZXNldF9yZXN1
bWVfaGVscGVyKCkgdG8gcmVjb3ZlciBpcnEgb2Ygc2RtYQplbmdpbmVzIHdpdGggZm9sbG93aW5n
IGxvZ2ljOgoKKGVuYWJsZSBpcnEgZm9yIHNkbWEwKSAqIDEgdGltZQooZW5hYmxlIGlycSBmb3Ig
c2RtYTEpICogMSB0aW1lCihkaXNhYmxlIGlycSBmb3Igc2RtYTEpICogNiB0aW1lcwoKYXMgYSBy
ZXN1bHQsIGFmdGVyIGdwdSByZXNldCwgaW50ZXJydXB0IGZvciBzZG1hMSBpcyBsb3N0LgoKZm9y
IGFzaWNzIHdpdGggbW9yZSBzZG1hNSBlbmdpbmVzLCB3ZSBuZWVkIHRvIHNldCAnbnVtX3R5cGVz
JyBkZXBlbmRpbmcKb24gYXNpYyB0eXBlIGp1c3QgbGlrZSB3aGF0IHNkbWFfdjRfMF9zZXRfaXJx
X2Z1bmNzKCkgZG9lcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFu
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCmluZGV4IDQxOTMyZDhiODhjMy4uMzJiY2Uz
ZWI1ZmMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpAQCAtMTYyNSw3
ICsxNjI1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBzZG1h
X3Y1XzBfaWxsZWdhbF9pbnN0X2lycV9mdW5jcyA9IHsKIAogc3RhdGljIHZvaWQgc2RtYV92NV8w
X3NldF9pcnFfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JYWRldi0+c2Rt
YS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RNQV9JUlFfTEFTVDsKKwlhZGV2LT5zZG1h
LnRyYXBfaXJxLm51bV90eXBlcyA9IEFNREdQVV9TRE1BX0lSUV9JTlNUQU5DRTI7CiAJYWRldi0+
c2RtYS50cmFwX2lycS5mdW5jcyA9ICZzZG1hX3Y1XzBfdHJhcF9pcnFfZnVuY3M7CiAJYWRldi0+
c2RtYS5pbGxlZ2FsX2luc3RfaXJxLmZ1bmNzID0gJnNkbWFfdjVfMF9pbGxlZ2FsX2luc3RfaXJx
X2Z1bmNzOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
