Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79563DC3A5
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 13:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023F289C5E;
	Fri, 18 Oct 2019 11:07:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CC689C5E
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 11:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAX27Bl9+djIhuIOYCdeUlFuYhXdLLar5iQELDrk+kXrBLVG2j6y/Sl7rQT6LJyZ1vwq1fwcv9SFpQmnw/DLfAalkoj1TgK1yVBmUs0rr6lzRnyIZksGPk3DpBrVqvVEa+ky+AL9FZw6F9Ixz+C88lHXUowG0dpsgXMJ00erStdL5x0lob+CEkcAsOSupgUSg5qfx3lG6u7n3xeu+Ye2eYhJWjrl4swSS+FWcud/UNMp54ejz+EI8/fKCzMpVuvbDfed3kyvxxt0umpdxLjjWFALVJ7pUv1Ximdd8CL9urn3Hs7MYBinl/wr5Ekp8CRoA8XG+bUzIYipTF3x09kjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9mZ1mzd/b1Zaj1ZsK+GZYLFP73DmPAjCj2bcv7JGIY=;
 b=oB4Cj58cImAcAhMyhOMGFT/WFhjexYzfI5DyyKP+Cv+2cj6kCR/AeFyemjObOgzmlML4bt2AVe6ZEf2/ABHGRSIf8akDlVFWuEpx56t2IOJ7BR1qo3mgr/RPywEFvUwAXCB84T97BUmHzXD1XelHbjz8zXelOI0594r+fiIbx1wCZTzvrNWEkFsomtR4IV+FABzRNjD+rfSk56ckSB8nSWMBxqtruCyY4ciIor3xqR3WPSu/G2sN9Ebzv9M0tEB53ZjJGrz57Ukhj2xl4OC8Ro3qJffGJwFVS0yCuzh6tptLlAfoV2kDTD2D9VauZzSWtfjHb8KFRztIL3SXwerI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB3487.namprd12.prod.outlook.com (20.178.241.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 11:07:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1418:9723:719:a8e4]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1418:9723:719:a8e4%6]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 11:07:06 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Subject: Re: [PATCH 2/2] drm/amdgpu/psp11: fix typo in comment
Thread-Topic: [PATCH 2/2] drm/amdgpu/psp11: fix typo in comment
Thread-Index: AQHVhaMqvAUI4fTt+ES0S4YMgB/JdadgPROA
Date: Fri, 18 Oct 2019 11:07:06 +0000
Message-ID: <CA97BC1A-E475-4E59-B7AC-9C28256267F6@amd.com>
References: <20191018105923.8277-2-xiaojie.yuan@amd.com>
In-Reply-To: <20191018105923.8277-2-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.65.61.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93258d7f-6672-4011-cf3c-08d753bb5061
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3487:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3487ECCF9F64B84D6CB1B855FE6C0@MN2PR12MB3487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(6436002)(6486002)(11346002)(6862004)(76176011)(186003)(229853002)(102836004)(81166006)(446003)(316002)(8676002)(14444005)(71200400001)(8936002)(71190400001)(4326008)(66066001)(81156014)(6512007)(99286004)(6506007)(486006)(256004)(476003)(2616005)(26005)(6306002)(86362001)(6246003)(37006003)(64756008)(14454004)(66476007)(66556008)(6636002)(478600001)(66446008)(76116006)(5660300002)(2906002)(66946007)(305945005)(91956017)(33656002)(966005)(54906003)(3846002)(6116002)(25786009)(36756003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3487;
 H:MN2PR12MB3775.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sr2Bm7xcfpDJaqalpg0jxQCn8y/4zez7592zwVcGQY/28WyuMHhOn5H+P7ovUyK7sV/gTEcZNO7HSdlEHQLlN4g62P+D436sikrxznacZ6AcoHo0ns+JEgTTMDIXMhmhvQJcmq3iXJ/zvpBsZ28MQtfY9SChGT4Bb4CEKDs+jv0WqGUx2jla5+TZGGW3HTLjBBmkIUSdQmJESSQxSqRr0+NOg9zGSpnoj5Ht5yqd78cxrYLeyLhyKHLFnf+ueJo4zqMHjOPRl/S+T/IXPEyzu8qGC1c6QPWZO4X4t9F0jxRbT1vCtQ9DG4UynLPEPMfaFytBuU0yl382ygj1WA7eVk8DYeuuRtDWOy0HYe+3QhkHkYwnp3j4PVGHchDzD1gUVRooOkCdZidh21BNTj2bB4CXh6RJqJsqH6VLj94QIb0aRQf9U1inK8T858hGEsIAocKXRMQCMg95mgrYdMnOYg==
Content-ID: <E24876707E38A241BC74A208E2E3A34F@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93258d7f-6672-4011-cf3c-08d753bb5061
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 11:07:06.7632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1N3uQYCt4/hWwnxxEY61fdkHu8CxiWNaJeSufAA+7Lk7E2AyiRlRxjS9/E3TKWbq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9mZ1mzd/b1Zaj1ZsK+GZYLFP73DmPAjCj2bcv7JGIY=;
 b=PJQhqyLSEcVGWjHK0au+zdwbaSoG36ehj5vbIpfuuftf5kOYRQIpOlYI5ZcxF+g1LT72tYDbztxkwc1LaThsRRm8TKHsMERHAXlLGO2VxnTN67/fp/ZpfeCSMA9ldOcGBdepzmzKZEpb+BI1cNGH6KsYz1M7gUa7H8JMiKN/5T8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIHJldmlld2VkIGJ5IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCg0K
PiDlnKggMjAxOeW5tDEw5pyIMTjml6XvvIwxODo1Oe+8jFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUu
WXVhbkBhbWQuY29tPiDlhpnpgZPvvJoNCj4gDQo+IO+7v1NpZ25lZC1vZmYtYnk6IFhpYW9qaWUg
WXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+DQo+IC0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9wc3BfdjExXzAuYyB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEx
XzAuYw0KPiBpbmRleCBkZmU4NWExZDc5YTUuLjRlYjViYWNiNTVmNyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMNCj4gQEAgLTIzMiw3ICsyMzIsNyBAQCBzdGF0
aWMgaW50IHBzcF92MTFfMF9ib290bG9hZGVyX2xvYWRfa2RiKHN0cnVjdCBwc3BfY29udGV4dCAq
cHNwKQ0KPiAgICAvKiBDb3B5IFBTUCBLREIgYmluYXJ5IHRvIG1lbW9yeSAqLw0KPiAgICBtZW1j
cHkocHNwLT5md19wcmlfYnVmLCBwc3AtPmtkYl9zdGFydF9hZGRyLCBwc3AtPmtkYl9iaW5fc2l6
ZSk7DQo+IA0KPiAtICAgIC8qIFByb3ZpZGUgdGhlIHN5cyBkcml2ZXIgdG8gYm9vdGxvYWRlciAq
Lw0KPiArICAgIC8qIFByb3ZpZGUgdGhlIFBTUCBLREIgdG8gYm9vdGxvYWRlciAqLw0KPiAgICBX
UkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM2LA0KPiAgICAgICAgICAgKHVp
bnQzMl90KShwc3AtPmZ3X3ByaV9tY19hZGRyID4+IDIwKSk7DQo+ICAgIHBzcF9nZnhkcnZfY29t
bWFuZF9yZWcgPSBQU1BfQkxfX0xPQURfS0VZX0RBVEFCQVNFOw0KPiAtLSANCj4gMi4yMC4xDQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
