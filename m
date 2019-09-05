Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4310AAB30
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 20:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E4A6E122;
	Thu,  5 Sep 2019 18:37:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201F36E122
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 18:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a81oU42CmxnTRX8BzywxV8BkY9r2Jh+DIWejU3A7c5vUShaNmzB8I4lbsWBKjBOhZYCbErUyKJeoVK/dekdasxygk4GrIQTzw7Z+kGXOenjNYA83h4iCReP5aOWcbkTKIAjhtop6MyV5mXKQZjrf2tKxWDPf0ME0ANOgg1y76GOX1KnAYCgvIajX8dLg0GC0Mz3p4iLzojxzgBSO/RUEex1tFraAV2Yjs3K7J9+zsUCgAOeXo0dm460LIqbsQajOQJG8GJ36dMJ434wjUU9oXfKHMWHWCWPysAy6zSLqcFcyyfc3Q9Qprs/cw7aFJyEA7kugDf9c3XgPkijuzS/Slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08sved/18IvP2AVkm29W7hYkapzrQ8+DMJIYoWtODoM=;
 b=iLbbiHmMiB4cdzotmx6tyUPLE8VjzLanN4DPzX4XEjFroqCAd/8unamNBHMAHyT2ctJob1w9LetzM85FqwcEGBstSk8A+SaSyIvsG84rFPc5m+eGeqsQ0D7CFMli4KyXg2GfPisG47i1fKcIuYmCDpCt8q7bVpVu3IXVgUUBUHvRYHMlCRCiJ/OVz9KYkH3A2AT3m0Xmbyw3NTBYuPZRi0yMO1fSV/kobKOi0ke1DDn2wG6U8OiehOUUMKzV6fWwJoJhbASJ5E9a7KEL3BINZIP0ylll/2C2t0sHh7ElU7MhfqXQSUL8oBn4MrbC2LLegezCWE6glaJ8p48fTumZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 18:36:57 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 18:36:57 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 02/10] drm/amdkfd: add renoir kfd device info (v2)
Thread-Topic: [PATCH v2 02/10] drm/amdkfd: add renoir kfd device info (v2)
Thread-Index: AQHVZBjlmk8obdApXkucv/JRQUeehg==
Date: Thu, 5 Sep 2019 18:36:57 +0000
Message-ID: <1567708597-18831-2-git-send-email-ray.huang@amd.com>
References: <1567708597-18831-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1567708597-18831-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e85d67d-8b53-40ca-44ae-08d7323007f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2877; 
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2877B1C606A9F548ABC01277ECBB0@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(71190400001)(3846002)(2351001)(316002)(256004)(54906003)(71200400001)(6916009)(66066001)(76176011)(8936002)(5660300002)(102836004)(6506007)(8676002)(386003)(86362001)(81156014)(81166006)(4326008)(50226002)(36756003)(25786009)(6116002)(446003)(5640700003)(7736002)(11346002)(305945005)(2906002)(486006)(2616005)(186003)(26005)(2501003)(476003)(99286004)(6486002)(6512007)(52116002)(6436002)(66446008)(64756008)(66556008)(66476007)(66946007)(53936002)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZV3fdd8kXChTskz/qF+hS2elD503tHfOC5cnFKC9CVJeuFDrZWtb+djrdmYXR+fCmBSFXPJBp3QdOI4kEVi49+PxOoAwAxdZr3oIXQOX/vSBNYmFQdQLiLD83bSl+Y0bZQC8wT7YwBqKjpZ6rVZ6w8r0ie2jgHo/slfANfaYD+/At/L73Wa4aitd7Bqhx6u9Hq9BrOooz1HI4+nMLR4VxYIS3G1WqsNqrLZkXmBB43TDKtTH6CgnECE/NlwgkvaIj+3gvwUY1BEhqvuFH7VicjyBNkpP+DeHSD6uF03SwAwdRq8r14uLqQwZFCvy0rimVbcoXHuDZd5a0GO4lsMtB8mUXn2jIAveZkWpTt38vD0YsWisRqJ064Jt2DAKk4v9mRBUcGOZX/vz2gjw1ooKVO4XuYXt+RAKVJo03IiwzM0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e85d67d-8b53-40ca-44ae-08d7323007f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:36:57.3178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InEMw5SiURo151/XW1biOnJGLl3QP8Rqqu9tXo0X0/A6EtQxK2mJkzpT4xfJfx3MxF18wFYHY+L46CtK4mwErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08sved/18IvP2AVkm29W7hYkapzrQ8+DMJIYoWtODoM=;
 b=KP3k4t9Ra7WNs0blBrCNGxZwvtzGxDIJzWuOXeAyQp16xxYKHwyJ7jEYLIDN0u5px4b3fvb5ecHOq8T2W0gq/vXwnS1mjD0LH5qMdiGpDfUwpgnrCD8T9icbM45HV3NR7I93HzRgirZBXSdXz1izMPFMkmooWawscrxye7a6WEA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpbml0cyByZW5vaXIga2ZkIGRldmljZSBpbmZvLCBzbyB3ZSB0cmVhdCByZW5v
aXIgYXMgImRncHUiCihieXBhc3MgaW9tbXUgdjIpLiBXaWxsIGVuYWJsZSBuZWVkc19pb21tdV9k
ZXZpY2UgdGlsbCByZW5vaXIgaW9tbXUgaXMgcmVhZHkuCgp2MjogcmViYXNlIGFuZCBhbGlnbiB0
aGUgZHJtLW5leHQKClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMTggKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwppbmRleCAyNjdlYjJlLi5jNTEyMGYzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCkBAIC0zNTEsNiArMzUxLDIzIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIGFyY3R1cnVzX2RldmljZV9pbmZv
ID0gewogCS5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDgsCiB9OwogCitzdGF0aWMgY29u
c3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByZW5vaXJfZGV2aWNlX2luZm8gPSB7CisJLmFzaWNf
ZmFtaWx5ID0gQ0hJUF9SRU5PSVIsCisJLm1heF9wYXNpZF9iaXRzID0gMTYsCisJLm1heF9ub19v
Zl9ocWQgID0gMjQsCisJLmRvb3JiZWxsX3NpemUgID0gOCwKKwkuaWhfcmluZ19lbnRyeV9zaXpl
ID0gOCAqIHNpemVvZih1aW50MzJfdCksCisJLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVu
dF9pbnRlcnJ1cHRfY2xhc3NfdjksCisJLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LAorCS5tcWRf
c2l6ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwKKwkuc3VwcG9ydHNfY3dzciA9IHRydWUs
CisJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLAorCS5uZWVkc19wY2lfYXRvbWljcyA9IGZh
bHNlLAorCS5udW1fc2RtYV9lbmdpbmVzID0gMSwKKwkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0g
MCwKKwkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSAyLAorfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gbmF2aTEwX2RldmljZV9pbmZvID0gewogCS5hc2ljX2Zh
bWlseSA9IENISVBfTkFWSTEwLAogCS5hc2ljX25hbWUgPSAibmF2aTEwIiwKQEAgLTM4NCw2ICs0
MDEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1cHBvcnRl
ZF9kZXZpY2VzW11bMl0gPSB7CiAJW0NISVBfVkVHQTEyXSA9IHsmdmVnYTEyX2RldmljZV9pbmZv
LCBOVUxMfSwKIAlbQ0hJUF9WRUdBMjBdID0geyZ2ZWdhMjBfZGV2aWNlX2luZm8sIE5VTEx9LAog
CVtDSElQX1JBVkVOXSA9IHsmcmF2ZW5fZGV2aWNlX2luZm8sIE5VTEx9LAorCVtDSElQX1JFTk9J
Ul0gPSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVMTH0sCiAJW0NISVBfQVJDVFVSVVNdID0geyZh
cmN0dXJ1c19kZXZpY2VfaW5mbywgJmFyY3R1cnVzX2RldmljZV9pbmZvfSwKIAlbQ0hJUF9OQVZJ
MTBdID0geyZuYXZpMTBfZGV2aWNlX2luZm8sIE5VTEx9LAogfTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
