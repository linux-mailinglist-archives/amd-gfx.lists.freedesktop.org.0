Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582CDFBA7
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 04:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8F6E2FF;
	Tue, 22 Oct 2019 02:28:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C666E2FF
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 02:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doAwjq32tSIMUadADkOiRoE4RULl7gCnSp9v1jXfMY93qvToIwkS8sEG5ITP+/yV6nEG8/Sp/TWAezVetpHRc65n52k1E0YZeH5l6P/slIeinkj1xYiEWbpLKtcB70VX1xg4v8LDYGy/Qy3sno9sR3PmWSnHl05Kb0JAw0yAThwlxBZfxi80lTpdGoGFyvSoeYV1imgwW5PLuUDTChfI6zwu4RPpDWaDN6QodsbQSrJ5iKt4S0FsASAOYfQWlYX62f989gyJ0HAmS/NhPXgoLo5Vccupp6dte9Z7/XECOU3NzTfGOzF0wZyZQCh9dUyF4R+Hd4EjkxicKyc0w3UfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtZbWNWy5cyWDkoVIVGuaxHfFYoo+jISSRxHogB0mlI=;
 b=lD8O0sOXpF6960uCh+HD8mKiy/tpmt8a8wmwOpqBfhIBl/HcK3jbPBHAVM9fmsNsfw5qvR7envmkmHeOICzANgaaqcQXwsTkcWvM8xIeZkFlk6jX2SwYq36wMXb4CbkdybU+tSoGujxgoBROXwKwBqH5PZWT603PSii9/+C2rc4pHnP8jJMeo7Ir8i4fZMJO2w2S5YwYuPCXe0gXfvvbAhK+EfaZFwTifJ3IHFWMm80bEhaxeHQR9CYAuQYvh3+PY81Y7xzkfN/6xxogTw9mfZxaVt4xZdVsyKWIabCRTGu2tIVB5ErUFUmkymNTNIgMv3iWesVH7LcerzJgHmM3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2775.namprd12.prod.outlook.com (20.176.255.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 02:28:48 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 02:28:47 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case (v3)
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
 (v3)
Thread-Index: AQHViIBvWcfkdVGdFkWgzEH1K6V/cg==
Date: Tue, 22 Oct 2019 02:28:47 +0000
Message-ID: <20191022022810.10067-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d90edc1f-27b6-4c4f-4760-08d756979168
x-ms-traffictypediagnostic: BYAPR12MB2775:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB277556AD4D91B34289DE513EF1680@BYAPR12MB2775.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(189003)(199004)(305945005)(7736002)(4326008)(110136005)(54906003)(6486002)(316002)(6436002)(102836004)(52116002)(2501003)(36756003)(386003)(6506007)(66066001)(26005)(6636002)(478600001)(14454004)(71190400001)(1076003)(3846002)(256004)(71200400001)(8676002)(486006)(86362001)(81166006)(8936002)(25786009)(2616005)(81156014)(186003)(50226002)(476003)(5660300002)(99286004)(6512007)(66446008)(64756008)(66556008)(6116002)(66476007)(2906002)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2775;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PVdEhhdLcJOdis+QlNKrA7ITCxR2V5FojGHCLgwhGizvZ3b0zOxe3e1TQTUwXW/+7eybXKvf9Lmv1LK2HOkwGYXEqr9sE+a7pxM3X4IEUOpHf+85TRHBUYGUm5JrOdjfj3iytcP77kZOEFR34sNrbRB8YUwOSVevLZLRZxUW/RAJKdpmzr8zd3LWLPG16WYLJ6ukMZoAQPuu3naUI/5Pz6jbb/9hc1CF1/sBKsH7MHKO9h8GKqriW+pzYved5bxp8VcWU050O/D34nNeMYJLBsCHi0bAoy8D4PaLc13dJNR39qjf77XcGInL1s23XoLtTc5Beu8ksCiVu4P4v7k++4JK05V+L17aU73+msK+4EdsDuAl7bOXV1x5nUanEhgx+JuQsa3gGnFizsHX1rboEeUQZJ3b4EjKnauZ2YzIFjLz2r1yLirc3MC8Z8EeXXYq
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90edc1f-27b6-4c4f-4760-08d756979168
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 02:28:47.7774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYj/Oa3I+5VS3jWrieKQoBfLUkMwt+RkvoZRF2bD3sQFD/nnTRNTvakbUcU4q2gPPjOVZBduRE2o62Re3w9iHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2775
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtZbWNWy5cyWDkoVIVGuaxHfFYoo+jISSRxHogB0mlI=;
 b=uXNT9mt64ecPsTzh8kUXbGjpqInrkM+2qwDtFSrJRF8HinyR/odjwFltZ6bx0FVYwqkCIWx+JPpTto1C1Cdtaa33+VbFyTYC+7up4hiVf0T3ksjW5ttNtWiD6OtZFZPueINGG6DDmpOAPOJr0Hp0WnhN+DzI7EG57xsSKywF3Dk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmFzIHJlYm9vdCBkZWJ1Z2ZzIG5vZGUgYWxsb3dzIHVzZXIgb25lIGVhc3kgY29udHJvbCB0byBh
dm9pZApncHUgcmVjb3ZlcnkgaGFuZyBwcm9ibGVtIGFuZCBkaXJlY3RseSByZWJvb3Qgc3lzdGVt
IHBlciBjYXJkCmJhc2lzLCBhZnRlciByYXMgdW5jb3JyZWN0YWJsZSBlcnJvciBoYXBwZW5zLiBI
b3dldmVyLCBpdCBpcwpvbmUgY29tbW9uIGVudHJ5LCB3aGljaCBzaG91bGQgZ2V0IHJpZCBvZiBy
YXNfY3RybCBub2RlIGFuZApyZW1vdmUgaXAgZGVwZW5kZW5jZSB3aGVuIGlucHV0dGluZyBieSB1
c2VyLiBTbyBhZGQgb25lIG5ldwphdXRvX3JlYm9vdCBub2RlIGluIHJhcyBkZWJ1Z2ZzIGRpciB0
byBhY2hpZXZlIHRoaXMuCgp2MjogaW4gY29tbWl0IG1zc2FnZSwgYWRkIGp1c3RpZmljYXRpb24g
d2h5IHJhcyByZWJvb3QgZGVidWdmcwpub2RlIGlzIG5lZWRlZC4KdjM6IHVzZSBkZWJ1Z2ZzX2Ny
ZWF0ZV9ib29sIHRvIGNyZWF0ZSBkZWJ1Z2ZzIGZpbGUgZm9yIGJvb2xlYW4gdmFsdWUKClNpZ25l
ZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA2MjIwMzk0NTIxZTQuLjJkOWUx
M2QyYTcxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTUz
LDggKzE1Myw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0
YShzdHJ1Y3QgZmlsZSAqZiwKIAkJb3AgPSAxOwogCWVsc2UgaWYgKHNzY2FuZihzdHIsICJpbmpl
Y3QgJTMycyAlOHMiLCBibG9ja19uYW1lLCBlcnIpID09IDIpCiAJCW9wID0gMjsKLQllbHNlIGlm
IChzc2NhbmYoc3RyLCAicmVib290ICUzMnMiLCBibG9ja19uYW1lKSA9PSAxKQotCQlvcCA9IDM7
CiAJZWxzZSBpZiAoc3RyWzBdICYmIHN0clsxXSAmJiBzdHJbMl0gJiYgc3RyWzNdKQogCQkvKiBh
c2NpaSBzdHJpbmcsIGJ1dCBjb21tYW5kcyBhcmUgbm90IG1hdGNoZWQuICovCiAJCXJldHVybiAt
RUlOVkFMOwpAQCAtMjE4LDEyICsyMTYsMTEgQEAgc3RhdGljIHN0cnVjdCByYXNfbWFuYWdlciAq
YW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIHZhbHVl
IHRvIHRoZSBhZGRyZXNzLgogICoKICAqIFNlY29uZCBtZW1iZXI6IHN0cnVjdCByYXNfZGVidWdf
aWY6Om9wLgotICogSXQgaGFzIGZvdXIga2luZHMgb2Ygb3BlcmF0aW9ucy4KKyAqIEl0IGhhcyB0
aHJlZSBraW5kcyBvZiBvcGVyYXRpb25zLgogICoKICAqIC0gMDogZGlzYWJsZSBSQVMgb24gdGhl
IGJsb2NrLiBUYWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4KICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0
aGUgYmxvY2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRhLgogICogLSAyOiBpbmplY3QgZXJyb3Jz
IG9uIHRoZSBibG9jay4gVGFrZSA6OmluamVjdCBhcyBpdHMgZGF0YS4KLSAqIC0gMzogcmVib290
IG9uIHVucmVjb3ZlcmFibGUgZXJyb3IKICAqCiAgKiBIb3cgdG8gdXNlIHRoZSBpbnRlcmZhY2U/
CiAgKiBwcm9ncmFtczoKQEAgLTMwNSw5ICszMDIsNiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVf
cmFzX2RlYnVnZnNfY3RybF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIg
KgogCQkvKiBkYXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBpbnN0ZWFkIG9mIGFic29sdXRl
IGdwdSBhZGRyZXNzICovCiAJCXJldCA9IGFtZGdwdV9yYXNfZXJyb3JfaW5qZWN0KGFkZXYsICZk
YXRhLmluamVjdCk7CiAJCWJyZWFrOwotCWNhc2UgMzoKLQkJYW1kZ3B1X3Jhc19nZXRfY29udGV4
dChhZGV2KS0+cmVib290ID0gdHJ1ZTsKLQkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0ID0gLUVJ
TlZBTDsKIAkJYnJlYWs7CkBAIC0xMDM3LDYgKzEwMzEsMTcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1
X3Jhc19kZWJ1Z2ZzX2NyZWF0ZV9jdHJsX25vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19jdHJsX29wcyk7CiAJZGVidWdmc19jcmVh
dGVfZmlsZSgicmFzX2VlcHJvbV9yZXNldCIsIFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRpciwK
IAkJCQlhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2VlcHJvbV9vcHMpOworCisJLyoKKwkgKiBB
ZnRlciBvbmUgdW5jb3JyZWN0YWJsZSBlcnJvciBoYXBwZW5zLCB1c3VhbGx5IEdQVSByZWNvdmVy
eSB3aWxsCisJICogYmUgc2NoZWR1bGVkLiBCdXQgZHVlIHRvIHRoZSBrbm93biBwcm9ibGVtIGlu
IEdQVSByZWNvdmVyeSBmYWlsaW5nCisJICogdG8gYnJpbmcgR1BVIGJhY2ssIGJlbG93IGludGVy
ZmFjZSBwcm92aWRlcyBvbmUgZGlyZWN0IHdheSB0bworCSAqIHVzZXIgdG8gcmVib290IHN5c3Rl
bSBhdXRvbWF0aWNhbGx5IGluIHN1Y2ggY2FzZSB3aXRoaW4KKwkgKiBFUlJFVkVOVF9BVEhVQl9J
TlRFUlJVUFQgZ2VuZXJhdGVkLiBOb3JtYWwgR1BVIHJlY292ZXJ5IHJvdXRpbmUKKwkgKiB3aWxs
IG5ldmVyIGJlIGNhbGxlZC4KKwkgKi8KKwlkZWJ1Z2ZzX2NyZWF0ZV9ib29sKCJhdXRvX3JlYm9v
dCIsIFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRpciwKKwkJCQkmY29uLT5yZWJvb3QpOwogfQog
CiB2b2lkIGFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
