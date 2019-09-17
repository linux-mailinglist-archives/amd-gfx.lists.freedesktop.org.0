Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30754B5865
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 01:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F44D6ED90;
	Tue, 17 Sep 2019 23:08:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8536ED90
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 23:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SczRhlSO7iH6G2vzjnin/J5+b1BRZZemFLQ/AQVVFSJ+cOAZOvS3fLW9QYdFZSOuei60h5OfCyYRxYW1XkcPzpFc2JK0PB7DK59m3HCnqkS2eKkv6u4kw5i6lXXHpd2MNuBl8bnKso2rBHYbj/iY0Heit3n3jf9YLpJ0ZdXdug1vjfF7G66PqlvuHJcfKzSVDZYUM0H4IY8RlXtjrnDZWx3F7GZ/+S+nCKBvJ6oos6RAFFN0oX6Htlkyg0sgRQL4oT/216rUc7J13U3+QNoNf9z4sZ1hDB+Vu+mH6x06GgogLJAeg+vwfiPvtNJRPO9gFzxnfrIAvjPGgdL6cwL5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMGs1XoEDpLrf4dYAKTiLwE8b5Tsukn+FQpanuk0M4k=;
 b=N0Qjueb2PZzp/uTUKJsTZkvj9+LmFjoqtkPNmWs6VeF4H5OIQXJdC3Q5X8LNwnPKMqiBQmo9uGsskoCQ8VKehVhgMmzsCavOj92Nw/1WXlk2QIPz5PQYnthx5OTyOcTZEMTRwbkQSZHhNDPVzQ2vEZSWtjUq0IfK0wv8q6qyVRY+O5UouxaBlNtDcY41lV15fxxvpbvKBy+Dp2CFGaviq1FLV0Xv3to5AK2iVH7rXuYUqlqf7/Sm2tqWIDp391m5Hz7wSq8IEjjKlMCQUKHFo3gMZb7KA2HrhjTQf1rO91aCwW6skr3DpSw27+ngTr4BijnDuNksKpvs2lTtLuGbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Tue, 17 Sep 2019 23:08:42 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 23:08:42 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Clements, John"
 <John.Clements@amd.com>
Subject: [PATCH] drm/amdgpu: add psp ip block for arct
Thread-Topic: [PATCH] drm/amdgpu: add psp ip block for arct
Thread-Index: AQHVbazZc/fSn9WQJk+Qu2YQdLR8nw==
Date: Tue, 17 Sep 2019 23:08:42 +0000
Message-ID: <20190917230828.6818-1-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d03c2a7c-e2c8-4401-157f-08d73bc3fb86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1564; 
x-ms-traffictypediagnostic: DM5PR12MB1564:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1564628B9B6BD85C8B46FC12FC8F0@DM5PR12MB1564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(66066001)(50226002)(3846002)(25786009)(6486002)(66946007)(14454004)(6636002)(110136005)(316002)(6116002)(86362001)(8936002)(6436002)(2906002)(5660300002)(6506007)(386003)(99286004)(8676002)(81156014)(81166006)(52116002)(36756003)(476003)(2501003)(71200400001)(71190400001)(486006)(2616005)(66446008)(26005)(66476007)(186003)(478600001)(66556008)(64756008)(256004)(14444005)(102836004)(4326008)(7736002)(1076003)(305945005)(6512007)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Tv0hZ/IjO01m1K2oc1ie7uz2Yceid0sp0j8v+QRXW9IHOYanewv0KutOy048c9KDQHlJECUO/AoWgcFmsrRIZs13LuznBbRc9e4uCsVDiM4QFk5p6EKvgi58kfbqUDp42w0AQjdYOkV76Wt2J5Nvk9i2oJ5KxFi9pFtg6fZgR0xiLihpVRJk9H88Cdllh1huPmcIKaiv2gtGJsFnrIGsjTCZLyMYrBNAPoqZln2UWxa2Wcguvcz5wvbnMgYeCCXlLKeBY8JtwfR2utpwat9izEY69m71V+H4B0T4kmLdvqIH5AJcOCjyWFXgWukXe7jM2PujD/ESUxa0OPHabcBC8uwfHHAft5O9bnA5IXdOjKKsLXlzsWoieCrwGo061p5kIFtS8MgKAy7laIoSJld5hOGILqqEKPWK5lrSQ7em00=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03c2a7c-e2c8-4401-157f-08d73bc3fb86
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 23:08:42.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diEkVJLd1kIBI9xO6ttay2drpvg23Ug5f0PVLa/Uxfc5t7ozNgMBDh79ZgTInLi6lVvMC63Rnp/aQqAjxGR+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMGs1XoEDpLrf4dYAKTiLwE8b5Tsukn+FQpanuk0M4k=;
 b=X+4jVyjXxbJWIcSvRYxRzA/PEpozFYrP0Di8Vu0hV/7lz25IEELM3iDC9Z6Hq7TNl1DjHnkC4rgwvjwT8BBKF3nyfh1mb2Kk0i24aY+XFkVuu1LMEK9okIOGC8cDMVklUiIKih9205QiPJMISkbXsdLq+odhCbn2EOFlY0190sg=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlIHBzcCBibG9jayBmb3IgZmlybXdhcmUgbG9hZGluZyBhbmQgb3RoZXIgc2VjdXJpdHkK
ZmVhdHVyZSBzZXR1cC4KClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCmluZGV4IDI4NGE2NDM1YmZkYy4uNmZhYTFmNjI1ODk2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKQEAgLTc1NSw2ICs3NTUsOCBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2Nr
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19h
ZGQoYWRldiwgJnZlZ2ExMF9jb21tb25faXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmZ21jX3Y5XzBfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsKKwkJaWYgKGxpa2VseShhZGV2LT5m
aXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSkKKwkJCWFtZGdwdV9kZXZp
Y2VfaXBfYmxvY2tfYWRkKGFkZXYsICZwc3BfdjExXzBfaXBfYmxvY2spOwogCQlpZiAoYWRldi0+
ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCQlhbWRn
cHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3ZpcnR1YWxfaXBfYmxvY2spOwogCQlh
bWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3Y5XzBfaXBfYmxvY2spOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
