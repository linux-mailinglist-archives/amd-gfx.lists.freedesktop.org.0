Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A0763FBA
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EB3899EA;
	Wed, 10 Jul 2019 03:59:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72DA899BE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:59:13 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 03:59:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:59:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Topic: [PATCH 3/5] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Index: AQHVNtPTVZf+21bL/UqfFVpJWy9RNg==
Date: Wed, 10 Jul 2019 03:59:09 +0000
Message-ID: <20190710035848.26966-3-Felix.Kuehling@amd.com>
References: <20190710035848.26966-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190710035848.26966-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a53a972a-a2af-4a43-4694-08d704eaf5f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3001; 
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-microsoft-antispam-prvs: <DM6PR12MB30019165130C9083E6AA3F7992F00@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(86362001)(76176011)(52116002)(68736007)(36756003)(2501003)(53936002)(71190400001)(71200400001)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(6512007)(2351001)(3846002)(6116002)(316002)(99286004)(478600001)(2906002)(6486002)(50226002)(14454004)(25786009)(1076003)(5660300002)(26005)(11346002)(476003)(186003)(486006)(446003)(2616005)(5640700003)(305945005)(7736002)(6436002)(102836004)(6506007)(81156014)(8936002)(81166006)(386003)(8676002)(256004)(66066001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wdlkKI4T1GnbfmpQH1PG6cLRLBJc50uZRVbemauOBaAbuDUy5JU6bm6p7tVwQC7+llZlUOTi2bLzsLbiSJCQWVn9gNUxs5pmvRmabuLtDM5Z2Vdhl3KKOOsiQbG9XGuXu6kSjoI71yg/ruNlNXop+7a5GQd5Hs5hj4X/x/7p5D8kAaCni56gEXZV/3T1sYqjRreKtgGrzYBFQLaC5QE7SoNAh+cBOFOR7pNGcvjHFh/Hxr0lrAW/1jSE3v8WMpTYWr3gkswCSeMi9SJUbHirhQ/7k0Lh3Mi5VUuBH1oGG4qI/AzhrEUb8kjmWLwgu6vD4eKEDeQu3Y64lAghI8RJfVrZvzLV8wf8Whxxt1VHYc/bHibwbPFtwMomigXVMcKhkkJIHzkWWVe1djbFboTggXg9ZkYOHwDTh0Jsn5urWC0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53a972a-a2af-4a43-4694-08d704eaf5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:59:09.3436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FwOILOlrBvqJLknF7lig/bNDv35Zf2YXs3eje1W5fc=;
 b=GCFdzt5Lm18odz1m3b30EdFRK/lasBvg2b8C/WYHSexrvB+9btqmIxGDRUpQM5U0HsxnCGghtsyeqm67Om7Ok8qNaXEVxZW9zQQn2skyJgzfYBJemdb0XI1CnDaVX1Vr86C9xIfcH/awbshwghsI8dOLtKJxCrbJoR9AibgxB58=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBub3RpZmllcyB0aGUgZHJpdmVyIHRoYXQgYSBCTyBpcyBhYm91dCB0byBiZSByZWxlYXNl
ZC4KClJlbGVhc2luZyBhIEJPIGFsc28gaW52b2tlcyB0aGUgbW92ZV9ub3RpZnkgY2FsbGJhY2sg
ZnJvbQp0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSwgYnV0IHRoYXQgaGFwcGVucyB0b28gbGF0
ZSBmb3IgYW55dGhpbmcKdGhhdCB3b3VsZCBhZGQgZmVuY2VzIHRvIHRoZSBCTyBhbmQgcmVxdWly
ZSBhIGRlbGF5ZWQgZGVsZXRlLgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8
ICAzICsrKwogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEwICsrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4
IDU4YzQwM2VkYTA0ZS4uMjA3MGU4YTU3ZWQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTY3MSw2
ICs2NzEsOSBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikK
IAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2OwogCXN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXTsKIAorCWlm
IChiby0+YmRldi0+ZHJpdmVyLT5yZWxlYXNlX25vdGlmeSkKKwkJYm8tPmJkZXYtPmRyaXZlci0+
cmVsZWFzZV9ub3RpZnkoYm8pOworCiAJZHJtX3ZtYV9vZmZzZXRfcmVtb3ZlKCZiZGV2LT52bWFf
bWFuYWdlciwgJmJvLT52bWFfbm9kZSk7CiAJdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwog
CXR0bV9tZW1faW9fZnJlZV92bShibyk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAppbmRleCBjOWI4
YmE0OTJmMjQuLmQ2OTEyMWM0M2U1OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCkBAIC0zOTAs
NiArMzkwLDE2IEBAIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHsKIAkgKiBub3RpZnkgZHJpdmVyIHRo
YXQgYSBCTyB3YXMgZGVsZXRlZCBmcm9tIExSVS4KIAkgKi8KIAl2b2lkICgqZGVsX2Zyb21fbHJ1
X25vdGlmeSkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CisKKwkvKioKKwkgKiBOb3Rp
ZnkgdGhlIGRyaXZlciB0aGF0IHdlJ3JlIGFib3V0IHRvIHJlbGVhc2UgYSBCTworCSAqCisJICog
QGJvOiBCTyB0aGF0IGlzIGFib3V0IHRvIGJlIHJlbGVhc2VkCisJICoKKwkgKiBHaXZlcyB0aGUg
ZHJpdmVyIGEgY2hhbmNlIHRvIGRvIGFueSBjbGVhbnVwLCBpbmNsdWRpbmcKKwkgKiBhZGRpbmcg
ZmVuY2VzIHRoYXQgbWF5IGZvcmNlIGEgZGVsYXllZCBkZWxldGUKKwkgKi8KKwl2b2lkICgqcmVs
ZWFzZV9ub3RpZnkpKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogfTsKIAogLyoqCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
