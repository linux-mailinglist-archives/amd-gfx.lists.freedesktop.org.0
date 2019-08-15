Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C38F31C
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 20:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D46589FA5;
	Thu, 15 Aug 2019 18:19:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814A89F6D
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 18:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOSS4Axbr3u5lMzCdENP3cq3aQtKwxQ6pZu9gRJY0XEgdjePG+w1k4wcCgEDgZxhXGpl8x/VLBzoEQxl88lzlY1hRsO32+QzZbd4Rw5MVxbUThrHmY/BGDYJKLzqu+/9Tf4jAcj/TvICYOEpntuTj6MsbxWgq1G5ll0YTq+pMuAdOturU5DLqrIgS0ZThmqmUZwlFDSHMphUMGgfUWFujpA2IXaKW8sPCWXuF/Wopx9kfn6Baq2D/7w0fVZCUBy6Hy1IM6f6n1isRtBLc5me4H2KFQUm7Zs+uLrz5qxCdRJsjJmEwXZMp52RKgsAl1XVrs88vau6X/0IDThF43+Ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdj2RzIM+INWtXwuyQjrGz000HOv3JkU8cpQUxbAlG4=;
 b=TT2bDUbEFrIPfl3Qf1Cc5wZXnXjrqJm1jvERQDJH7MVa939hkRYe4mIXEUBdWBWS8z0fOdNOWiQmhJoX7b5GlSJEshuOA/JLvr88MdfUjFz00/uGAWNtQNAjvNREIxKNZpZ9GbRKVDv7Mp1p6Y+3rFklnnYDmV6ZiGtHsl3bl8OonF//fhiYSRFgXp1XjFw43OkMnfmWWCUt127yoQZdJTgKZpNGIpCDMXBn0dDHHD3EKtBgrRPR7chsjlFWys+MpniJ/fb29ejucd0BKn56W0F2IVK6Wh6cOSiUt+g0BmrgbXsp7Od+Twkotc2c5DEY+KIopIvRm1V9wL3lDfxk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0003.namprd12.prod.outlook.com (10.172.111.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 18:19:49 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:19:49 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: enable VCN DPG for Renoir
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable VCN DPG for Renoir
Thread-Index: AQHVU5YGwA02ormwi0u9ToSTakdsyw==
Date: Thu, 15 Aug 2019 18:19:48 +0000
Message-ID: <20190815181940.4897-2-thong.thai@amd.com>
References: <20190815181940.4897-1-thong.thai@amd.com>
In-Reply-To: <20190815181940.4897-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa79e6d-b37c-4179-0741-08d721ad2864
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0003; 
x-ms-traffictypediagnostic: BN6PR1201MB0003:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB00031D4214882C535432D5089DAC0@BN6PR1201MB0003.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(6116002)(71200400001)(8676002)(14444005)(2906002)(1076003)(99286004)(50226002)(7736002)(2501003)(305945005)(316002)(8936002)(256004)(86362001)(71190400001)(36756003)(2616005)(66066001)(81166006)(4326008)(26005)(386003)(5660300002)(11346002)(446003)(476003)(2351001)(3846002)(81156014)(186003)(4744005)(6916009)(102836004)(76176011)(14454004)(478600001)(66476007)(6506007)(66446008)(6436002)(66946007)(6486002)(25786009)(5640700003)(486006)(6512007)(52116002)(53936002)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0003;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gxKz0iZ4amZJJTR3FX9j3eQBqkLzI6KWxKm/XWzb9HXC7/u9A2MDaaHwXmqAom+nRv/wRnLhgIBEYkW3fPq59dBDECydVAclwvhZSmXP0aaow+8Q3Gs2OB7uYmxnOebQ0Ro10wOD8HpBkqaK6aYicaUwRQHyOCdU1lPq0JG9vGbggJDFLlBcOf6vMoVtlszOrRW/Jx4W99Z6ZzNA39vz7CPPj/YjWbFAA7JZpCjzzlmt22sEMZl2qate0HSDUPqRxEDO8hKFKaUO9Go0ZIkgmEYP8yvpJsr6uWTvtNBsmlf9NVqJ9QbfM6iBORRUV/GgRARJ+wTUGm+vfInaH8PojUweS9/+S0qCMUUUmIJ03X3guJE8xdVUWdAD4VjcQbOqZqGPmD3YJ5THt4EX0rYEndOndEtDhiYqROyi7VtK1CM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa79e6d-b37c-4179-0741-08d721ad2864
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:19:49.0155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bncb1O7YPZG0qiS5MGfW4OR997KUumxuTj9AgW6sIXkBPPSOdFnoFmEUSYVdozkIRkYZ+FYqT7m/legnzVf1rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdj2RzIM+INWtXwuyQjrGz000HOv3JkU8cpQUxbAlG4=;
 b=BZfN5a02nY6l3k5W03LTkOtPYSH6D5ymEsktJAgzJzezxLRj6FMw3MewLm+9wVjqnZFFwoJYfuDjT+mayURJxtZokaexsR17Hcw26f7orPbl6qDk6mvpnRga31Sx23MWFgxn4U0zZ0M86LaNHaGGP51p3s8Oceu5OQae6ZaWf1w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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
Cc: "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RW5hYmxlIFZDTiBEeW5hbWljIFBvd2VyZ2F0aW5nIG9uIFJlbm9pciBkZXZpY2VzLgoKVGhpcyB3
aWxsIGFsc28gZW5hYmxlIGluZGlyZWN0IFNSQU0gbG9hZGluZyBvZiBWQ04gZmlybXdhcmUgb24g
UmVub2lyLgoKU2lnbmVkLW9mZi1ieTogVGhvbmcgVGhhaSA8dGhvbmcudGhhaUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYwppbmRleCA0M2E0NDE4ZjA1NjAuLjRkNzQ2MzI1ZDdlNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMDM4LDcgKzEwMzgsOSBAQCBzdGF0aWMgaW50IHNvYzE1
X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCQkgQU1EX0NHX1NVUFBPUlRfQVRI
VUJfTFMgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9NR0NHIHwKIAkJCQkgQU1EX0NHX1NV
UFBPUlRfREZfTUdDRzsKLQkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9TRE1BOwor
CQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JUX1NETUEgfAorCQkJCSBBTURfUEdfU1VQ
UE9SVF9WQ04gfAorCQkJCSBBTURfUEdfU1VQUE9SVF9WQ05fRFBHOwogCQlhZGV2LT5leHRlcm5h
bF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDkxOwogCiAJCWlmIChhZGV2LT5wbS5wcF9mZWF0
dXJlICYgUFBfR0ZYT0ZGX01BU0spCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
