Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27345C4188
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 22:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D66E822;
	Tue,  1 Oct 2019 20:03:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B396E822
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 20:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFkR5HuihdSscBds2dAjlkmg2F3Han/dqpBUPnu+Ema6NjLmBiN/GzawKD1H3GoWOMrskNoQZV192GeXmNTpmE4rihqkchwxdpDJZFyaSdALtONpEEXd0icbZk0gD/SbAvdTpydi+AV7x6nV9HlSsVzhXO2ke0oc+NeOP6fYkU9gL7BoH2fKsJOFBRKdMozaY0UO3K/IBAprb27NZve9fpA2qUILpmYfoWFLkjfqk8yypHvOt2Q7uZivCdRAZPF1sXv0Q3D6fZoibh++nZGq9dUMk32SbC18aKrauOU5tCwQmDE5vXGr9/a4rHd3htU7APyMb3aNtnegG8Hmd8qqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn4JYD6QKByoszkRK27w2+i0gacAwk0b4Cj1OwhctC4=;
 b=FpEN57n+cjQVSB/pMyNbGupwSzQ0ZUn9u8j5xPbkpLE8HFC4OFuKiByBHRQxIme0miTQWcuH9GzfNRrDlmP96MUR+zkzec2AkGdzS/hzZvsiQ26eCm7f5ydhXJG/beIJbSNhNzkII1miWTmvGSp4WQDkWeTg6cEUzuBcQbXuUwhu1rGU131hfynRsE+HhGcVyTb6uG5OriDmyeKTXY5zhIKlMZiXdmH9pj5ph9xRZsjXARuGqaHhfc4K9aRXiCFhhqYtmguGcJBj6jGc0re5XS2r+Y4YBrm5Vkjg4X24LXGyeVEY5dFd2tHSsbajBhCsMaXoOG/H5uJ9a4z4qn/0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3307.namprd12.prod.outlook.com (20.179.106.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 20:03:48 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.028; Tue, 1 Oct 2019
 20:03:48 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu : enable msix for amdgpu driver
Thread-Topic: [PATCH] drm/amdgpu : enable msix for amdgpu driver
Thread-Index: AQHVeJNW+96010Eq9kiByGXCjqQfoQ==
Date: Tue, 1 Oct 2019 20:03:48 +0000
Message-ID: <1569960219-8027-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-clientproxiedby: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dbb892a-3e3b-44b4-5304-08d746aa78fa
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3307CA0EC7E6BC8F23AFD9AEF49D0@DM6PR12MB3307.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(189003)(199004)(256004)(2906002)(186003)(66476007)(8936002)(50226002)(14454004)(4744005)(52116002)(2351001)(71190400001)(71200400001)(6916009)(5660300002)(2501003)(7736002)(25786009)(478600001)(99286004)(316002)(305945005)(66066001)(66556008)(64756008)(66446008)(476003)(66946007)(2616005)(486006)(6512007)(5640700003)(3846002)(102836004)(26005)(6506007)(386003)(6486002)(6436002)(6116002)(4326008)(8676002)(81156014)(36756003)(81166006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3307;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wjhlVKioqUMPSHz2MMy+ZzMTmKCYj20nPRaGguu++alFaiSWRBSGRmyXTg5z69atcX5Q/AM8YBnEEhQZn5kov5hoUEMzetE12QE1zZ2XSWNxjp3QKrLWtb78lZOFCTrX7YNQP+fWH2PRLVAE2zAsSEfzwcLWgXLK8qkSCg3ZrdrDnXE3REqrA8/GGakDTOY1CJz407QceVxqP66q4D5zUHE1CKqCCt7xeoetpht2pfcKiVykypcI/XcwwlTYh9LRBfyYUVSZOGHK+DLTCdfLsYBv/PD/SKlGcsCydrlL3N6Z597CfCR2I2wT7ixWmgnpU09vMNDW3+YGzkVjJCdrJ1WCLj92cBfey8KIFQQBJuy41H5AX/JPfP+z6z1agp4FjCEUktAt6bCLFnITUDLd9K53sNttgaLSMoJOHJ4A/YU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbb892a-3e3b-44b4-5304-08d746aa78fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 20:03:48.6629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Osul2uRftfRd0NNqqjHPSzcfiX8CAw0x1oLyk6QqHxwAX6SWhXLAGBWGzlyPJ2wd7pMJY21TripB7CvFsvugeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3307
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn4JYD6QKByoszkRK27w2+i0gacAwk0b4Cj1OwhctC4=;
 b=wq9nqoqbjnMaWETS1NxIQg11csF/I5R5igeylarux3GM1yiHhtDy8jrK1tdzIsvZi8+2TKQjB/98MzuOh7IDHIHQSaL97zoSZ2HrRSWjNiN8rfO8eltqbr1QGPgRFBp/fGVL34MzmhiiLthia59DJNYiXml9VAc6XLi0bQ4EGZ8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbWlnaHQgdXNlZCBvdXQgb2YgdGhlIG1zaSByZXNvdXJjZXMgaW4gc29tZSBjbG91ZCBwcm9q
ZWN0CndoaWNoIGhhdmUgYSBsb3QgZ3B1IGRldmljZXMoaW5jbHVkaW5nIFBGIGFuZCBWRiksIG1z
aXggY2FuCnByb3ZpZGUgZW5vdWdoIHJlc291cmNlcyBmcm9tIHN5c3RlbSBsZXZlbCB2aWV3CgpD
aGFuZ2UtSWQ6IEk5ZjAzNzYyMDc0YWM0MTZjMDdmMjdiOGYwMGMwNTJjYTkzYzdkNmNiClNpZ25l
ZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2lycS5jCmluZGV4IGQxZDVlN2YuLjFiZDI3ZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaXJxLmMKQEAgLTI0NSw4ICsyNDUsOSBAQCBpbnQgYW1kZ3B1X2lycV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFkZXYtPmlycS5tc2lfZW5hYmxlZCA9
IGZhbHNlOwogCiAJaWYgKGFtZGdwdV9tc2lfb2soYWRldikpIHsKLQkJaW50IHJldCA9IHBjaV9l
bmFibGVfbXNpKGFkZXYtPnBkZXYpOwotCQlpZiAoIXJldCkgeworCQlpbnQgbnZlYyA9IHBjaV9h
bGxvY19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAxLCBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+
cGRldiksCisJCQkJCVBDSV9JUlFfTVNJIHwgUENJX0lSUV9NU0lYKQorCQlpZiAobnZlYyA+IDAp
IHsKIAkJCWFkZXYtPmlycS5tc2lfZW5hYmxlZCA9IHRydWU7CiAJCQlkZXZfZGJnKGFkZXYtPmRl
diwgImFtZGdwdTogdXNpbmcgTVNJLlxuIik7CiAJCX0KLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
