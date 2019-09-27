Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECFEC0178
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE56EEB3;
	Fri, 27 Sep 2019 08:50:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720049.outbound.protection.outlook.com [40.107.72.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75CE6EEB3
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 08:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leuUWEecBo487fBZCEeCbCtqunsfBlZQs2Tu9cFhgdzHNbvJLnMBep0FAALSyHQkwGEFL0qMOyqOxl7cHTegJu/+xPuaJNwJC5IlApVE9LNbvR+Gic1hoqT+PHJC6AQDA1kbQAXlEkTzYrne58vGTqoIadq3D/DKIJSCHk+WVy22w0TOZ+G1aQMjjbMfN+3XgheBkkJak9cky8wxeIlEKLSycl2ZCdRlWWXg1doz1cWNJoLr8vgLxvdkvIYorNULJrMe1CLLubNcioM2LpCFDp8qVjs87rrYbdRbJ0AeZLrS7XItzN9RCeAHsV7mrvtbOJCWZ4QuFfU5wZn3eCfCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nM/rT7JzRVSB1q1rPYdDa23aqIbAj4SpCyXHGe39V8=;
 b=LMtNthjaWtcbD+2mlzZypBSgnWyqgX0qEQLhqLDSXNjgcI0ygcF7Fk/CptEYcRbkpxN3Clf17o8tmezCSIVXVWxkOfwTQgWeR053FQJSnE6DTbDFOlxBY87wuwopRTjFoYlSpgZFvhARGO86lkR/EynW21XWdkfCF1iiDMa+3ry8qFbWcRD8M6fXtCO9jzC1+MiBDcrBrR7fj5pacI53eD05ty6Wh0dg/cif2RdvXSixy/TDpwrVmAEWlWIObArFg5+Fd/U9bCoUrU9i90ohayVkX1UMxP4GJT/yOOuDFPeJruWiYI2QmfkGuQliXFuInn9FG4IdXXCVU6GuZbOmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3951.namprd12.prod.outlook.com (10.255.238.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 08:50:05 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::19b5:2b97:5b3c:8b2a%7]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 08:50:05 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Topic: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Index: AQHVdQDkhkSWJCcgM0qXIIQnUawYFqc/Norg
Date: Fri, 27 Sep 2019 08:50:05 +0000
Message-ID: <MN2PR12MB359827494153858C7DB76B778E810@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190927065727.22272-1-kevin1.wang@amd.com>
In-Reply-To: <20190927065727.22272-1-kevin1.wang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa176f34-bf41-419a-8a25-08d74327b146
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3951E6ADCE2B59E0D3929F4E8E810@MN2PR12MB3951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(13464003)(189003)(199004)(8936002)(7696005)(81156014)(26005)(25786009)(3846002)(6116002)(54906003)(4326008)(478600001)(229853002)(186003)(8676002)(110136005)(14454004)(71200400001)(5660300002)(74316002)(71190400001)(64756008)(66476007)(66446008)(66946007)(7736002)(66556008)(305945005)(76116006)(52536014)(99286004)(55016002)(6246003)(476003)(6506007)(33656002)(2906002)(102836004)(81166006)(486006)(9686003)(66066001)(86362001)(316002)(446003)(256004)(76176011)(6436002)(11346002)(2501003)(53546011)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3951;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpUVinF6CFj7rEdpaQADK+FxgByYGl/KIOT32Xb4C7o1sP3tHroAlx3erDq2l73f4ukMSuIWeMLUjO42RHMFtZc1DTFUXdcKHXZmsZE8+7zw2XmlUKmGHIgYClrDfKGxSJprNI1pSfFX8J+ce+0VRX37LjL79pOBSRZ/w2Y5bR//DBnrOqyNm3eSIYBEfqLS14hoNS3LGO0ukrsHJsnjC1kmqThBy2RY2lySa1dhHoqOXhQEIbYNWCFR/ao8olJkcV0U6L6HAvigZRWVoabnW+wLR5VkeXgQKTC1eWdGkYPjjwv+02UbkVhBKgn4XIBu+r9NEwb4+ruKvVQ4/JWIM2DntXkqm0PnFBWPhC7PAPvQbxNvenKRjptRcss/cv1BJG+JkofgknAqJsaNDieQLLWMWxHEbpPnb9l/MCf1ous=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa176f34-bf41-419a-8a25-08d74327b146
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 08:50:05.1321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NW4VW74mAOsil8tjSKUWl/6PtqvXPepT5RTBpFx1X5KPK81wr4rte88Qt2WJrtir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nM/rT7JzRVSB1q1rPYdDa23aqIbAj4SpCyXHGe39V8=;
 b=SWNVO92ZogzAFe3XtTfwgE0QCnuBX6UgEdbNzifoTd8VJOd4tJahzHwT52E5yFKCc25uxO9hXYP+39lBwwWj7ZcTYg2niiqC3nN9WBYCye5GljN8aH3G/+SJTZraQ1f9dmvxcbhHHDHaMLGjc6Pb8Wse8zdihUjYscFBXaBWn0A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+CgoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgClNlbnQ6IEZyaWRh
eSwgU2VwdGVtYmVyIDI3LCAyMDE5IDI6NTggUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29t
PjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZC9wb3dlcnBsYXk6IGluaXRsaWFsaXplIHNtdS0+aXNfYXB1IGlzIGZhbHNlIGJ5
IGRlZmF1bHQKCnRoZSBtZW1iZXIgb2YgaXNfYXB1IGluIHNtdV9jb250ZXh0IG5lZWQgdG8gaW5p
dGxpYWxpemUgYnkgZGVmYXVsdC4KCnNldCBkZWZhdWx0IHZhbHVlIGlzIGZhbHNlIChkR1BVKQoK
Zm9yIHBhdGNoOgoJZHJtL2FtZC9wb3dlcnBsYXk6IGJ5cGFzcyBkcG1fY29udGV4dCBudWxsIHBv
aW50ZXIgY2hlY2sgZ3VhcmQKCWZvciBzb21lIHNtdSBzZXJpZXMKClNpZ25lZC1vZmYtYnk6IEtl
dmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggN2I5
OTViMDgzNGViLi42YTY0Zjc2NWZjZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKQEAgLTcxMiw2ICs3MTIsNyBAQCBzdGF0aWMgaW50IHNtdV9lYXJseV9p
bml0KHZvaWQgKmhhbmRsZSkKIAogCXNtdS0+YWRldiA9IGFkZXY7CiAJc211LT5wbV9lbmFibGVk
ID0gISFhbWRncHVfZHBtOworCXNtdS0+aXNfYXB1ID0gZmFsc2U7CiAJbXV0ZXhfaW5pdCgmc211
LT5tdXRleCk7CiAKIAlyZXR1cm4gc211X3NldF9mdW5jcyhhZGV2KTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
