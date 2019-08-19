Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD8948D9
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 17:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69C89CB9;
	Mon, 19 Aug 2019 15:47:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1889CB9
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 15:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtrNMpxynSGKWXp9/r6f1EGFv/A2weQU0cuGq0vLDsoWf5ehecjNzJNYed9Iy2XbX/QT//NxN82eC/9WEarUdbkGRGRI8W7v13zPZJaRW+YDapFO8FTf7IEwPqSr1f/9UbIX0ye79BnUPJvVorr9QcudpcGrw7EPLUmO9SXR61kSZUgiVLzHYLqrj5OGvY/4LEGhhG0WFtnr7A95H/A+cLDxicdOthCn3/IgGgLWMqegyW8AdD/MjiEHysV1YHYfjJRCji0Ct3jw2h4MUNOJ+xGpr3jaq/rYUKkcfo8cpSQE2Z05PLON5ttwip1eQFMx/kV72XGTU4ffS+oWRwSEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC7GwXC9TN+U9PogHKilHTCiw3AYOWa3eLHqPi88WSw=;
 b=R2eVAjy3cgLG10VaThNm1Npu6OZs/9XkCHmVoPMHGsmhRz2hJ1KH9+zqO3RKs5TuANoM8vQ9mTs14BN5UhAFx2uHInhKRJBBzTzcPtqFg24azxMOwOJZa+YkSxyeT8gPNfJbklVZIDpPQmIt0JmJICAkHwphoBCLNTUtMGJbJjr4nyPA7+zt0xDqgznWTxN39oEpVuma1wyW0i5XWt2j9IFAPuJviDcBbo+N0Jw6Nat4rzvRmswWXBKfpoRborMA4vGjwT7p3IXXqsqtSP81W64nstuI9cznoM/LRy6ti0T26k8DzBXTqR83VX0beLqcv7EpNiW2YXrtLVhBkMetWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3613.namprd12.prod.outlook.com (20.178.240.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 15:47:23 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Mon, 19 Aug 2019
 15:47:23 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: fix variable type errors in
 smu_v11_0_setup_pptable
Thread-Topic: [PATCH] drm/amd/powerplay: fix variable type errors in
 smu_v11_0_setup_pptable
Thread-Index: AQHVVqVkbw9TL9+6GkiVUFYVeD8gwA==
Date: Mon, 19 Aug 2019 15:47:23 +0000
Message-ID: <20190819154701.17647-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 119927d1-66fb-4c95-5aa0-08d724bc86b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3613; 
x-ms-traffictypediagnostic: MN2PR12MB3613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3613E88690C72109FA19446EA2A80@MN2PR12MB3613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(8936002)(81156014)(81166006)(8676002)(99286004)(53936002)(6486002)(478600001)(14444005)(256004)(50226002)(102836004)(36756003)(54906003)(6436002)(5640700003)(186003)(6512007)(52116002)(386003)(6506007)(6916009)(66446008)(26005)(66556008)(64756008)(486006)(71200400001)(71190400001)(14454004)(4326008)(2616005)(476003)(25786009)(316002)(7736002)(2906002)(305945005)(66946007)(66476007)(66066001)(3846002)(6116002)(86362001)(5660300002)(2351001)(2501003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3613;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SVdp9Kmgo2dmUJLH6rJHX58TnMWGeOqEjn522uEMB9ExfWp7NrdmuAeT3PT7/fiUgVQto2UYbmRDcFZXmhRSUrXpYB5XBlxo1YA1kUWZ+WOHXQdcEmITKZYK3Q71OZp9vpN/I/U+Dk5Nr2rfCP6CSeU+At86caQp4t6j0Jf4lkJyCcBJY64P5lEuGqdDB50xMTwh7CMkyQlI25HSpDMTnipAFPSX8qN539ImTUoHFlqJ9Sy2K26TbIRYD2Y2VVV+NHI2UNU7q9+gtM56xNNouSM97CwZNnl3heflV62xlMqaubFxfprX2ML/6Repc4HK5asUf+lLjgP3J1E/JA4bs8LtiYZjZN9qDKYBZTBZzkc1vDlLjtIyZxACycF/WdgKBjyT+P6lOt66NRwBkNte5osDNYP55Ee4UQerGMuArYA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119927d1-66fb-4c95-5aa0-08d724bc86b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 15:47:23.3734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /P2iLJhOFqe1m15wHeqwuQ4/QCWpgnd7EgqfpuVub+QFrWeL1GsflJOYNTqactZh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC7GwXC9TN+U9PogHKilHTCiw3AYOWa3eLHqPi88WSw=;
 b=s8z+tq05CJLYMgRgF9ytVbdd7eOFKSu/uuvWP2Mx9RDXKtKovQwkWWEsCis9wH7Z/2os08ZD898I+QwiU3Q4yuI97t4AKi5iJbZitP7afndYosgy7LGnJYk/uFNFI7MhKqRhyMBteRa7hxsR79PxfQYagMBjpc7XycLgu9Em2c8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4IHNpemUgdHlwZSBlcnJvcnMsIGZyb20gdWludDMyX3QgdG8gdWludDE2X3QuCml0IHdpbGwg
Y2F1c2Ugb25seSBpbml0aWFsaXplcyB0aGUgaGlnaGVzdCAxNiBiaXRzIGluCnNtdV9nZXRfYXRv
bV9kYXRhX3RhYmxlIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4x
LndhbmdAYW1kLmNvbT4KUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggYjY5NjMy
ZmU4NTZiLi5lOWEwMjI0NDdhYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jCkBAIC0zNjgsNiArMzY4LDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2V0dXBf
cHB0YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAljb25zdCBzdHJ1Y3Qgc21jX2Zpcm13
YXJlX2hlYWRlcl92MV8wICpoZHI7CiAJaW50IHJldCwgaW5kZXg7CiAJdWludDMyX3Qgc2l6ZTsK
Kwl1aW50MTZfdCBhdG9tX3RhYmxlX3NpemU7CiAJdWludDhfdCBmcmV2LCBjcmV2OwogCXZvaWQg
KnRhYmxlOwogCXVpbnQxNl90IHZlcnNpb25fbWFqb3IsIHZlcnNpb25fbWlub3I7CkBAIC0zOTUs
MTAgKzM5NiwxMSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211KQogCQlpbmRleCA9IGdldF9pbmRleF9pbnRvX21hc3Rlcl90YWJsZShh
dG9tX21hc3Rlcl9saXN0X29mX2RhdGFfdGFibGVzX3YyXzEsCiAJCQkJCQkgICAgcG93ZXJwbGF5
aW5mbyk7CiAKLQkJcmV0ID0gc211X2dldF9hdG9tX2RhdGFfdGFibGUoc211LCBpbmRleCwgKHVp
bnQxNl90ICopJnNpemUsICZmcmV2LCAmY3JldiwKKwkJcmV0ID0gc211X2dldF9hdG9tX2RhdGFf
dGFibGUoc211LCBpbmRleCwgJmF0b21fdGFibGVfc2l6ZSwgJmZyZXYsICZjcmV2LAogCQkJCQkg
ICAgICAodWludDhfdCAqKikmdGFibGUpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKKwkJ
c2l6ZSA9IGF0b21fdGFibGVfc2l6ZTsKIAl9CiAKIAlpZiAoIXNtdS0+c211X3RhYmxlLnBvd2Vy
X3BsYXlfdGFibGUpCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
