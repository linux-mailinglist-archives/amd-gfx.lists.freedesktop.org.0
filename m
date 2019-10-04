Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A9CBDD6
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1236EBC0;
	Fri,  4 Oct 2019 14:48:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8986EBC0
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYRkYC9eUnz1y0xcI9N7iNzFbnmRLu+CMyqC+ZXSU9uTyGbV9fAFoP8bdL2R5UBZgnaoZitfIt9z5pBbL1aPDH8hzETDbG9xJk1MZwG4f2wv+5hZ5wmofn6JCj+o6x5qmHVG6jQO6rX9qPx2iQX6moQZ8P3r31Iwg6vgM6kqF+aNPezV3sp0yOyVrrd1D12NVamCALIsKsdIvPEqRqO5T+70RTRRePd4cDI8IyhiDbUo5FICZD1ULb9R1BuJx4td2aog5k/dYoX0y+EjVQOb53XGjb6/jTlAjmPsg4PA9FCnmNuTR+vzyi4KvuzNxEGhYvS1yNtnhgChamoNSzLfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZnEzCuQO3vabgXQhTccDZRslTKg5ct/2/4QHU9RlXE=;
 b=mVWcaHjE9V9bO9VwbIM0Q/jH3WHFcAfx5VauOKH35JQsrsWPHYdOdHSKIlxPmAaYex5cOthEAGV6WobWbe7yf90YtWAiNSEJ5cvVS/otyclESJvtEE6VIXf3tGwVB4ESSj1bn2cEh5enibHUHwQMfokfRjGULQx4JHR4GzeKeRSwm8G6A0PwJisPQJfL8EdvMai0nVMhSUU1HDW2RvXRTU2NLQi/4tI31l3KD3pWAuQfiAVz9DA53a038pJY3UcQ0VoOE9zXoQsoiQVKNGGxgVioQj2L3ajZYIQhLL23OiCnVX0h4BRc4Ak/7gMBm71QwVu50fOkaws542kaO/vljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2340.namprd12.prod.outlook.com (52.132.11.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:48:50 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:48:50 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Print more sdma engine hqds in debug fs
Thread-Topic: [PATCH 2/2] drm/amdkfd: Print more sdma engine hqds in debug fs
Thread-Index: AQHVesLV18Flyd/x00yA5k+zHQ3QHg==
Date: Fri, 4 Oct 2019 14:48:49 +0000
Message-ID: <1570200515-18992-2-git-send-email-Oak.Zeng@amd.com>
References: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fb8ff8a-1ff0-4a31-e225-08d748d9f7ad
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB23406534E2E66801EA3B751C809E0@BL0PR12MB2340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(66946007)(6116002)(3846002)(5640700003)(66476007)(64756008)(2906002)(6486002)(66556008)(6436002)(66446008)(102836004)(6506007)(26005)(14444005)(386003)(71200400001)(71190400001)(256004)(52116002)(4326008)(186003)(76176011)(5660300002)(4744005)(99286004)(7736002)(305945005)(2501003)(6916009)(11346002)(446003)(8936002)(86362001)(476003)(14454004)(81166006)(478600001)(8676002)(2616005)(6512007)(54906003)(316002)(81156014)(486006)(25786009)(2351001)(50226002)(66066001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2340;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnYdbDEjJMG/6okSZ2lX9gYTRI4yYG1YUrbtVK2c8nAmgw9KbjGjpwBOjoK9Q7dMw4LAuApqjtrRyNFOimr5DW5OlDla8Yc3hTLCXNrA4uTybqlQm3/o6AcFjrnYPH8kot7nEhHdK+ok59vQh3Be2B1xJjJytOHya2WeoTBKnVwwe2GI4tcdh+hmFRwsJ7BR3OnhuBmxH9mILl5bvgmSJoj4Vl7M24NzYGqE4/bMeehuu1kE9StUA8ZId59PMCA1Whf7gjpMxr8YaYQ32dRe4qkk8zYq86Z4VfABFK1T9Cv5qTaIJWoC18BcKLCsnkzcF76vDgfwAAC40Q8+jIhuFT5syxXq0BBGhrqxr4Gpy3DW3Cm1VuAk8RueoZqubttmsgkoH2HriwxRy5sTFuTBPok7b2m/CQB83LQt4Si86uk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb8ff8a-1ff0-4a31-e225-08d748d9f7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:48:50.2012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZqHNX/74q4o1ZDuhwWl29MjmN8L64MuxR3UGUJ28CFwFfc7VHVOVRrqrKrRvw/CZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZnEzCuQO3vabgXQhTccDZRslTKg5ct/2/4QHU9RlXE=;
 b=cpbRCNg1Qdvim12sUioW6Rayx4Vf66VQl4uElNiOpe3oLOwveKnNSt75JXUWxp6bJHH5IrM7/4B0z7S7hw7+V1X9BFtheL/6TzcJ4MBhdSyJLlazItGpIPFj3gY94PefontnoQ1nGfOkIHTj0DkNAGSca4qaFyiPB6sQtr3B/10=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJldmlvdXNseSBvbmx5IFBDSWUtb3B0aW1pemVkIFNETUEgZW5naW5lIGhxZHMgd2VyZQpleHBv
c2VkIGluIGRlYnVnIGZzLiBQcmludCBhbGwgU0RNQSBlbmdpbmUgaHFkcy4KCkNoYW5nZS1JZDog
STAzNzU2ZmMwZmE5OTE2OWQ4OGUyNjU1NjBmNTA1ZWQxODYyNDJiMDIKUmVwb3J0ZWQtYnk6IEpv
bmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFu
IEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsu
WmVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwppbmRleCBlNTVkMDIxLi4wZWJjNjA0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YwpAQCAtMjQxNiw3ICsyNDE2LDcgQEAgaW50IGRxbV9kZWJ1Z2ZzX2hxZHMoc3RydWN0IHNlcV9m
aWxlICptLCB2b2lkICpkYXRhKQogCQl9CiAJfQogCi0JZm9yIChwaXBlID0gMDsgcGlwZSA8IGdl
dF9udW1fc2RtYV9lbmdpbmVzKGRxbSk7IHBpcGUrKykgeworCWZvciAocGlwZSA9IDA7IHBpcGUg
PCBnZXRfbnVtX3NkbWFfZW5naW5lcyhkcW0pICsgZ2V0X251bV94Z21pX3NkbWFfZW5naW5lcyhk
cW0pOyBwaXBlKyspIHsKIAkJZm9yIChxdWV1ZSA9IDA7CiAJCSAgICAgcXVldWUgPCBkcW0tPmRl
di0+ZGV2aWNlX2luZm8tPm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lOwogCQkgICAgIHF1ZXVl
KyspIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
