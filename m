Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7CEAAF0
	for <lists+amd-gfx@lfdr.de>; Thu, 31 Oct 2019 08:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F87B6ED8E;
	Thu, 31 Oct 2019 07:22:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0466ED88
 for <amd-gfx@lists.freedesktop.org>; Thu, 31 Oct 2019 07:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDztcVrjKRN35p6qSaINmZljkEIUmTdUXhpQeN3pYsp+vyyEWu6nrXdpP5LEsTuzcx1LfkMh9KG66nt9RbogXyY8j03ZeQFHMWfmILAtF+SQUA2GKKusr7eOtdO5v+adDKh9nuW86fYg/2QJpn1jyTFBrvzZIdCxYVdeJsH81C0MbzErXIYSJs3pi6xXJQQXUTGuWrAMhOJ4rlJrF0h5aW4QLqy9u3s7QrzGFbfZoqlB3HG5hAiUBS9ET4w1fCMxnFfG31CRpB96WbxKWBtmeRQZhwYQwcmJpooyfY5QcbTiHofJwr7swt9atbRe81CPYszELDD+YfeLakl4F1vRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByoNth+qNISLdH5LIbYz+o2F4lRTSMvFIvubOVccwmM=;
 b=jbvD/2udiIgpw6mu7DBCrfs68Bpj/W+1yhPZuyKPIOUQ7zyqhP64ffEwKSzk7yLbZy+a7j9YEW2lTIOKfY22lLEowUTcrlYPAiYA5CKSXbk+om5vChKg21FoEd4cAJ5N6tnpTc3NCzY2OnSpc2bW3RtGuwIXsRnMDiP6u3u71qQzXLlW54ZS8zjzFYC4f5NLzSrSmpYuFLQH/bWLdJ25/Nq/ghofYnqls2BIUIM7LL17G5zi2wqnfw6f4qeDln5hmwMXWYhcYSg/M9/BRwPeayI7bdVujq/VcWCuMP3vyHtHeldxDabhioPNS2VDKhcM4JgI8w4AZawUfaDMMQeqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4111.namprd12.prod.outlook.com (52.135.51.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Thu, 31 Oct 2019 07:22:42 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2387.028; Thu, 31 Oct 2019
 07:22:42 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/powerplay: support xgmi pstate setting on
 powerplay routine V2
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: support xgmi pstate setting on
 powerplay routine V2
Thread-Index: AQHVj7v7SeG4FEwXikuwWxaAMm1jiA==
Date: Thu, 31 Oct 2019 07:22:41 +0000
Message-ID: <20191031072205.27537-3-evan.quan@amd.com>
References: <20191031072205.27537-1-evan.quan@amd.com>
In-Reply-To: <20191031072205.27537-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:2e::19) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ff6d87bc-a05f-467f-7cfd-08d75dd31ddd
x-ms-traffictypediagnostic: MN2PR12MB4111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4111E70BC8AADC40E431D127E4630@MN2PR12MB4111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-forefront-prvs: 02070414A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(5640700003)(305945005)(66066001)(256004)(14444005)(7736002)(6512007)(6116002)(3846002)(1076003)(6436002)(2906002)(2501003)(6486002)(5660300002)(14454004)(2351001)(54906003)(26005)(8676002)(4326008)(8936002)(478600001)(316002)(86362001)(6916009)(25786009)(71200400001)(71190400001)(99286004)(50226002)(81156014)(2616005)(476003)(76176011)(102836004)(446003)(11346002)(486006)(6506007)(386003)(36756003)(52116002)(81166006)(66476007)(66556008)(186003)(64756008)(66446008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4111;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TH2dCCBGWfwVdRkp0WpTgf6DRg8Jb6OWC+rQvEdAkAF93sq6XUjSW2QJ95UF2lkibaHDxtDUbQp3+R/DwwX1/IleWwW06mta5jI6UaOYuGQOd6312fMWVpLki55pezwpNoJoIGR72Ay8FvHeRgXBiseFIcXRO0F/XYHzH2v5jxuXY5ekIVi5ndlyN9oJ/calOyZYk8fl+zDq1wmstr1nzzQc60wJsja95R/34AR4hbMYn3CzHXUKCn6lTkCD0SNo71qMcxbX6LfUqv+lscg1JP2mVGuKuWosYi4mujSeHy7PxzwrprS/HVAmmIoqmAEzziDhnHoD4/libAgawdcwPTuuAB34WxjyNe2nI7S8zNsTyz5izRH3PMvoMfQIv1HskNYvAyvajNTo/Myb+nJXuRzYBQPEbLYxgwRGlmfx+/ysxhsiPVd1/LmQ+Zsr2Wv1
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6d87bc-a05f-467f-7cfd-08d75dd31ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2019 07:22:41.9290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xW+ehSZ/Nnd79o7iI+bK6C9W2uKPBb0LB1eo4+0Tov7iUQYDsbW2/WKFRzg3NDH0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByoNth+qNISLdH5LIbYz+o2F4lRTSMvFIvubOVccwmM=;
 b=aft1HyD8b+7/yMC5C7fcTojXgBxS2udjp8QV5RKt4TiGeZ7i/a84erRzHwYy7gQLAjBNNcq5A5rpjKzrCI3FTMHXR4KxSVdp7xcDvSLbWqCEDdDAptpYEp0dN5f5iLsH2VeYD2BXa/k3ai176viXyDoaPhWm7q+ykb+oV6k+W+U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHhnbWkgcHN0YXRlIHNldHRpbmcgb24gcG93ZXJwbGF5IHJvdXRpbmUuCgpDaGFuZ2UtSWQ6
IElmMWE0OWFhMTRjMTZmMTMzZTQzYWMxMjk4YzZiMTRlYWViNDRkNzlkClNpZ25lZC1vZmYtYnk6
IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpWMjogc3BsaXQgdGhlIGNoYW5nZSBvZiBpc19z
dXBwb3J0X3N3X3NtdV94Z21pIGludG8gYSBzZXBhcmF0ZSBwYXRjaAotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgICAgICAgfCAgNSArKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCB8ICA0ICsrKysKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyAgfCAxOCArKysrKysrKysrKysr
KysrKysKIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCAx
NSArKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21n
ci5oICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyAgICAgIHwgIDUgKy0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfeGdtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwppbmRl
eCAwMDM3MTcxM2M2NzEuLjE2N2Q5ZmJkMmM0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfeGdtaS5jCkBAIC0yODUsNiArMjg1LDExIEBAIGludCBhbWRncHVfeGdtaV9zZXRf
cHN0YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgcHN0YXRlKQogCiAJaWYgKGlz
X3N1cHBvcnRfc3dfc211X3hnbWkoYWRldikpCiAJCXJldCA9IHNtdV9zZXRfeGdtaV9wc3RhdGUo
JmFkZXYtPnNtdSwgcHN0YXRlKTsKKwllbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3Mg
JiYKKwkJIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3hnbWlfcHN0YXRlKQorCQlyZXQg
PSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF94Z21pX3BzdGF0ZShhZGV2LT5wb3dlcnBs
YXkucHBfaGFuZGxlLAorCQkJCQkJCQlwc3RhdGUpOworCiAJaWYgKHJldCkKIAkJZGV2X2Vycihh
ZGV2LT5kZXYsCiAJCQkiWEdNSTogU2V0IHBzdGF0ZSBmYWlsdXJlIG9uIGRldmljZSAlbGx4LCBo
aXZlICVsbHgsIHJldCAlZCIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUva2dkX3BwX2ludGVyZmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9w
cF9pbnRlcmZhY2UuaAppbmRleCA1OTAyZjgwZDFmY2UuLmE3ZjkyZDBiM2E5MCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCkBAIC0yMjAsNiAr
MjIwLDkgQEAgZW51bSBwcF9kZl9jc3RhdGUgewogCQkoKGdyb3VwKSA8PCBQUF9HUk9VUF9TSElG
VCB8IChibG9jaykgPDwgUFBfQkxPQ0tfU0hJRlQgfCBcCiAJCShzdXBwb3J0KSA8PCBQUF9TVEFU
RV9TVVBQT1JUX1NISUZUIHwgKHN0YXRlKSA8PCBQUF9TVEFURV9TSElGVCkKIAorI2RlZmluZSBY
R01JX01PREVfUFNUQVRFX0QzIDAKKyNkZWZpbmUgWEdNSV9NT0RFX1BTVEFURV9EMCAxCisKIHN0
cnVjdCBzZXFfZmlsZTsKIGVudW0gYW1kX3BwX2Nsb2NrX3R5cGU7CiBzdHJ1Y3QgYW1kX3BwX3Np
bXBsZV9jbG9ja19pbmZvOwpAQCAtMzE4LDYgKzMyMSw3IEBAIHN0cnVjdCBhbWRfcG1fZnVuY3Mg
ewogCWludCAoKnNldF9wcGZlYXR1cmVfc3RhdHVzKSh2b2lkICpoYW5kbGUsIHVpbnQ2NF90IHBw
ZmVhdHVyZV9tYXNrcyk7CiAJaW50ICgqYXNpY19yZXNldF9tb2RlXzIpKHZvaWQgKmhhbmRsZSk7
CiAJaW50ICgqc2V0X2RmX2NzdGF0ZSkodm9pZCAqaGFuZGxlLCBlbnVtIHBwX2RmX2NzdGF0ZSBz
dGF0ZSk7CisJaW50ICgqc2V0X3hnbWlfcHN0YXRlKSh2b2lkICpoYW5kbGUsIHVpbnQzMl90IHBz
dGF0ZSk7CiB9OwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZF9wb3dlcnBsYXkuYwppbmRleCBmNGZmMTUzNzhlNjEuLjAzMTQ0NzY3NTIwMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwpAQCAtMTU2Niw2ICsx
NTY2LDIzIEBAIHN0YXRpYyBpbnQgcHBfc2V0X2RmX2NzdGF0ZSh2b2lkICpoYW5kbGUsIGVudW0g
cHBfZGZfY3N0YXRlIHN0YXRlKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHBwX3NldF94
Z21pX3BzdGF0ZSh2b2lkICpoYW5kbGUsIHVpbnQzMl90IHBzdGF0ZSkKK3sKKwlzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyID0gaGFuZGxlOworCisJaWYgKCFod21ncikKKwkJcmV0dXJuIC1FSU5WQUw7
CisKKwlpZiAoIWh3bWdyLT5wbV9lbiB8fCAhaHdtZ3ItPmh3bWdyX2Z1bmMtPnNldF94Z21pX3Bz
dGF0ZSkKKwkJcmV0dXJuIDA7CisKKwltdXRleF9sb2NrKCZod21nci0+c211X2xvY2spOworCWh3
bWdyLT5od21ncl9mdW5jLT5zZXRfeGdtaV9wc3RhdGUoaHdtZ3IsIHBzdGF0ZSk7CisJbXV0ZXhf
dW5sb2NrKCZod21nci0+c211X2xvY2spOworCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzIHBwX2RwbV9mdW5jcyA9IHsKIAkubG9hZF9maXJtd2FyZSA9
IHBwX2RwbV9sb2FkX2Z3LAogCS53YWl0X2Zvcl9md19sb2FkaW5nX2NvbXBsZXRlID0gcHBfZHBt
X2Z3X2xvYWRpbmdfY29tcGxldGUsCkBAIC0xNjI1LDQgKzE2NDIsNSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGFtZF9wbV9mdW5jcyBwcF9kcG1fZnVuY3MgPSB7CiAJLmFzaWNfcmVzZXRfbW9kZV8y
ID0gcHBfYXNpY19yZXNldF9tb2RlXzIsCiAJLnNtdV9pMmNfYnVzX2FjY2VzcyA9IHBwX3NtdV9p
MmNfYnVzX2FjY2VzcywKIAkuc2V0X2RmX2NzdGF0ZSA9IHBwX3NldF9kZl9jc3RhdGUsCisJLnNl
dF94Z21pX3BzdGF0ZSA9IHBwX3NldF94Z21pX3BzdGF0ZSwKIH07CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCmluZGV4IDkyOTViZDkw
Yjc5Mi4uNWJjZjBkNjg0MTUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwpAQCAtNDE3Niw2ICs0MTc2LDIwIEBAIHN0YXRpYyBp
bnQgdmVnYTIwX3NldF9kZl9jc3RhdGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAlyZXR1cm4g
cmV0OwogfQogCitzdGF0aWMgaW50IHZlZ2EyMF9zZXRfeGdtaV9wc3RhdGUoc3RydWN0IHBwX2h3
bWdyICpod21nciwKKwkJCQkgIHVpbnQzMl90IHBzdGF0ZSkKK3sKKwlpbnQgcmV0OworCisJcmV0
ID0gc211bV9zZW5kX21zZ190b19zbWNfd2l0aF9wYXJhbWV0ZXIoaHdtZ3IsCisJCQkJCQkgIFBQ
U01DX01TR19TZXRYZ21pTW9kZSwKKwkJCQkJCSAgcHN0YXRlID8gWEdNSV9NT0RFX1BTVEFURV9E
MCA6IFhHTUlfTU9ERV9QU1RBVEVfRDMpOworCWlmIChyZXQpCisJCXByX2VycigiU2V0WGdtaVBz
dGF0ZSBmYWlsZWQhXG4iKTsKKworCXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHBfaHdtZ3JfZnVuYyB2ZWdhMjBfaHdtZ3JfZnVuY3MgPSB7CiAJLyogaW5pdC9maW5pIHJl
bGF0ZWQgKi8KIAkuYmFja2VuZF9pbml0ID0gdmVnYTIwX2h3bWdyX2JhY2tlbmRfaW5pdCwKQEAg
LTQyNDUsNiArNDI1OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHBfaHdtZ3JfZnVuYyB2ZWdh
MjBfaHdtZ3JfZnVuY3MgPSB7CiAJLnNldF9tcDFfc3RhdGUgPSB2ZWdhMjBfc2V0X21wMV9zdGF0
ZSwKIAkuc211X2kyY19idXNfYWNjZXNzID0gdmVnYTIwX3NtdV9pMmNfYnVzX2FjY2VzcywKIAku
c2V0X2RmX2NzdGF0ZSA9IHZlZ2EyMF9zZXRfZGZfY3N0YXRlLAorCS5zZXRfeGdtaV9wc3RhdGUg
PSB2ZWdhMjBfc2V0X3hnbWlfcHN0YXRlLAogfTsKIAogaW50IHZlZ2EyMF9od21ncl9pbml0KHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9o
d21nci5oCmluZGV4IGJkOGM5MjJkZmQzZS4uNDA0MDNiYzc2ZjFiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaApAQCAtMzU2LDYgKzM1Niw3IEBAIHN0cnVjdCBw
cF9od21ncl9mdW5jIHsKIAlpbnQgKCphc2ljX3Jlc2V0KShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
LCBlbnVtIFNNVV9BU0lDX1JFU0VUX01PREUgbW9kZSk7CiAJaW50ICgqc211X2kyY19idXNfYWNj
ZXNzKShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGFxdWlyZSk7CiAJaW50ICgqc2V0X2Rm
X2NzdGF0ZSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgZW51bSBwcF9kZl9jc3RhdGUgc3RhdGUp
OworCWludCAoKnNldF94Z21pX3BzdGF0ZSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgdWludDMy
X3QgcHN0YXRlKTsKIH07CiAKIHN0cnVjdCBwcF90YWJsZV9mdW5jIHsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggN2U4ODI5OTlhYmFkLi41ODc3ODU3NzYw
YmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0xNDYz
LDE2ICsxNDYzLDEzIEBAIGludCBzbXVfdjExXzBfc2V0X2Zhbl9zcGVlZF9ycG0oc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHJldDsKIH0KIAotI2RlZmluZSBYR01JX1NUQVRFX0Qw
IDEKLSNkZWZpbmUgWEdNSV9TVEFURV9EMyAwCi0KIGludCBzbXVfdjExXzBfc2V0X3hnbWlfcHN0
YXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCSAgICAgdWludDMyX3QgcHN0YXRlKQog
ewogCWludCByZXQgPSAwOwogCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUs
CiAJCQkJCSAgU01VX01TR19TZXRYZ21pTW9kZSwKLQkJCQkJICBwc3RhdGUgPyBYR01JX1NUQVRF
X0QwIDogWEdNSV9TVEFURV9EMyk7CisJCQkJCSAgcHN0YXRlID8gWEdNSV9NT0RFX1BTVEFURV9E
MCA6IFhHTUlfTU9ERV9QU1RBVEVfRDMpOwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
