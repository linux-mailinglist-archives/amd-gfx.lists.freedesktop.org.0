Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CCC292C
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 23:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7936E4B3;
	Mon, 30 Sep 2019 21:55:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730040.outbound.protection.outlook.com [40.107.73.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FEB6E4B3
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 21:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuffXxVjU+Ij5TEB3za51/m3ZOJFZtRRgUUaZ788xcCG4s8w7VqNaWKBptJXijAFOuULKsZqcqEmNMyNEw1TK9SOV1p99II/XGrXg/jq5+0J78YVdTd/ts0RTpQ9A1vyM7PPPDlHzD1Xaon7SCgxBB9QdqwIE6s4vdRYgZtPrh+A/hHCAzJRWcLsAUpbRlazRx7KhX4atkRbGvSxICWQw0xII2PpTEAjbnr/m7B4/XgFSFaGbZjRSydKOQQy9Vs2g+EnBdSrikF0Q7PkU2q2AtnRTJQbEfPXZkGUeG8vCnFoKE4JmoEk7iJB2MRbCDrmKhFmaWJQ+4ImlZmIj/sJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeC3+muYHh00bq5/oNkgMFf8K2P1URyPypRj2nsle8w=;
 b=Ll0sA1g8DV1rtBW633VRfyFGDMsawYNYXRVJ+E8gVaKFOlhbxMvhXu9ms8umJVb+X7cFCdz/GeFF+bTH7Biwe0Rck1nHl9Ih+v/nuqTR+RKSaKzV0ku2jbLWCsHoWXJW+hzxVHEy2ZHGL6wXUVo7kTTY5EQjFOnD+ZTmeUFLDbVpJ2uAi4o3v9K3+vcSMDUSmo8cAwCYpz1au8yS9lXLYfQhdPELnPfwLjfpjRzDvmsWOaNIkdHtLVExO6dJyeKG5lidIXDHrhcHF6Ug2WliL/Q0LtKvLniGqazzKLklmixnx5WeCD5zbk0O5Y27ROvxoLC/R3ZN9M/ppjvPbMkKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3611.namprd12.prod.outlook.com (20.178.199.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 21:55:27 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 21:55:27 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Improve KFD IOCTL printing
Thread-Topic: [PATCH] drm/amdkfd: Improve KFD IOCTL printing
Thread-Index: AQHVd9nEEN35uuHp/0SrpqOpwBARLQ==
Date: Mon, 30 Sep 2019 21:55:26 +0000
Message-ID: <20190930215513.3570-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50b7b945-e5fc-4784-28bd-08d745f0e716
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3611:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36110784401CBE10AEF547F2F0820@DM6PR12MB3611.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:276;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(189003)(199004)(25786009)(5640700003)(26005)(186003)(476003)(81166006)(81156014)(4326008)(71200400001)(2616005)(71190400001)(52116002)(86362001)(66066001)(486006)(5660300002)(6506007)(386003)(102836004)(1076003)(99286004)(478600001)(66556008)(66446008)(66946007)(66476007)(305945005)(2351001)(6436002)(2501003)(2906002)(8936002)(6916009)(36756003)(6116002)(8676002)(7736002)(6512007)(3846002)(14454004)(64756008)(316002)(256004)(6486002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3611;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DxWPsIVUnYBG3hWWkpdGktR6otr49H/cX8ZFa0B0iUotRgAgOROdyK0S5UPPprNtYF4LS51otn4KOiOztrMQOnthxgAWnJFLBE8A7xw/SbAq7FTijGvCbwrXGpI8S3s75jwrSW9nWl9EC5btRTG72xnm3ZSdBtINGsYHdLREMK4v6scdxKs/00VsyWcEICry8BJ9H8f4Ks+9z98QcG2F/1/Vm3dqMJ/hyUA6q3gwyYRkwaL/+q402Pl0CC0WzL1WaiYZMg4/nZHMD75pngpeFoT+IoZ+ZuFUFUZ1F6geD2VWMdJLNPpU3KsBXv3k1JwLm7Q9k9YXx7KRO2gEqCld+bEGfR8Pwb249EzHXp+6pvH97XomqjAgMWv2bwd9EcgC/fprmYxUK4cwrQcv5IyETY+YRMkJjHAWHlTagpcvVxY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b7b945-e5fc-4784-28bd-08d745f0e716
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 21:55:27.0479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsLtZY0tU8KbM/0tzhqyiH/4aeVZD6kbRW9ve/T78B11sn3RCeqkTgsvbmJaKW7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3611
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeC3+muYHh00bq5/oNkgMFf8K2P1URyPypRj2nsle8w=;
 b=o+o5w22Mdg46Mzp6azz7vP+ZGM8QHTIPTa4G7yM+0yWKJVUsaNbCwAvJYf2w7Ak4dk2M/zKd9JfPCEIO8y7ST2XIB8eGkFtF8r2jZSw16/rXdIMTnP7BH4ILUFMNkupo+L5bU1jld4WV0G04ZRXRKXu6rtipenNGvdyIqoM/E5A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNvZGUgdXNlIGhleCBkZWZpbmUsIHNvIHNob3VsZCB0aGUgcHJpbnRpbmcuCgpDaGFuZ2Ut
SWQ6IElhN2NjNzY5MDU1M2JiMDQzOTE1YjNkOGMwMTU3MjE2YzY0NDIxYTYwClNpZ25lZC1vZmYt
Ynk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
aGFyZGV2LmMKaW5kZXggYzI4YmEwYzFkN2FjLi5kOWUzNmRiZjEzZDUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwpAQCAtMTg0MCw3ICsxODQwLDcgQEAgc3RhdGlj
IGxvbmcga2ZkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5zaWduZWQgaW50IGNtZCwgdW5z
aWduZWQgbG9uZyBhcmcpCiAJfSBlbHNlCiAJCWdvdG8gZXJyX2kxOwogCi0JZGV2X2RiZyhrZmRf
ZGV2aWNlLCAiaW9jdGwgY21kIDB4JXggKCMlZCksIGFyZyAweCVseFxuIiwgY21kLCBuciwgYXJn
KTsKKwlkZXZfZGJnKGtmZF9kZXZpY2UsICJpb2N0bCBjbWQgMHgleCAoIzB4JXgpLCBhcmcgMHgl
bHhcbiIsIGNtZCwgbnIsIGFyZyk7CiAKIAlwcm9jZXNzID0ga2ZkX2dldF9wcm9jZXNzKGN1cnJl
bnQpOwogCWlmIChJU19FUlIocHJvY2VzcykpIHsKQEAgLTE4OTUsNyArMTg5NSw4IEBAIHN0YXRp
YyBsb25nIGtmZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsIHVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQogCQlrZnJlZShrZGF0YSk7CiAKIAlpZiAocmV0Y29kZSkKLQkJZGV2
X2RiZyhrZmRfZGV2aWNlLCAicmV0ID0gJWRcbiIsIHJldGNvZGUpOworCQlkZXZfZGJnKGtmZF9k
ZXZpY2UsICJpb2N0bCBjbWQgKCMweCV4KSwgYXJnIDB4JWx4LCByZXQgPSAlZFxuIiwKKwkJCQlu
ciwgYXJnLCByZXRjb2RlKTsKIAogCXJldHVybiByZXRjb2RlOwogfQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
