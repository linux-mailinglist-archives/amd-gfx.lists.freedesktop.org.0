Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0A84276
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7C89C94;
	Wed,  7 Aug 2019 02:31:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F8F89C94
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVNJPhd6RRlrvBeQN4DyfqsuHHCRcEnqVvYjsatzwUp0BmwjNav0Is3bJSF3dz7zv1qc7MW/qDEgUesQt2f3EIUW0A3dvT6Mmzl+SmliHa5JqtZvgj5F8IH1A+EWYPY2oKaGsZQyD46XRUaXLJSb2tlMVEMMqZGa4Y/4/4KmOVa+4X1tmtEU90GWRolP60uR1NuVXCIqOQ3ScUNCgUCTXbNH0cn7WHVNeK63vXshSzXxseiwNdXIi1ECksrlaliBLj5olKC6fqXOoQ50MZLXiee1g2LkVSTTcZt/EJQE9RpdKF0jemjuuKdinwipdRDtO3+zXoBtz3EkcUuSO/2k3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toPWoLkpKvuIFlPpcjHlXHmL/F7UEqLmrpb/rYeQNhk=;
 b=GZFsbrdgwwYu6JDuX7kO3UzB1Dl4kRHGbwFEpf0wK9l481IRG9+cv8BFJKtjBFKgy1HGHuRW8jNcYX5tuEiJ1Ip3fBwJGI5tRFOQPlT2TwxrKGjQPW4/wxsL5ZnvFPykw1h1/vNo+Vynywy/c9ya79ch0+ZMNm1bYwvljRqGQbTO4xJeAM6+MFUtxbE4/pbojn0NCytByToDHj8QDmifuz9m0/M5UkTCQ9hreUh4IAinulA6KBtlyUBacwBBHRxXdXqYIHDdSPyKETCpKW/Z28/Qh9/nFfJJ10dwUI95WiR2MY1HToQAeeGFinUcD8uyMlO7J0/JghAr07P7rFaJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.10.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 02:31:08 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:31:08 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTMgrPTJV6Fs0ek65dn0x+UgRKQ==
Date: Wed, 7 Aug 2019 02:31:08 +0000
Message-ID: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b740d0a7-f481-4b69-35e3-08d71adf4dcd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2404; 
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-microsoft-antispam-prvs: <BL0PR12MB2404B3C4ED8B93CF48BBF1E880D40@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(189003)(199004)(54906003)(5640700003)(2616005)(36756003)(2351001)(64756008)(66476007)(66946007)(186003)(99286004)(66446008)(6436002)(66556008)(6486002)(3846002)(26005)(486006)(476003)(66066001)(6916009)(6512007)(2501003)(52116002)(305945005)(86362001)(53936002)(2906002)(102836004)(68736007)(7736002)(6116002)(6506007)(316002)(386003)(71200400001)(50226002)(4326008)(81156014)(81166006)(478600001)(71190400001)(5660300002)(14454004)(25786009)(8676002)(8936002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SLDYGstyvTg7iu2U3m02CMGBp3LkLkZUvgokY2+u+1XdV9gAjB+MTzXaZ2yZa12rmRNfYSHaAuhq/Up+AtSbNskQES1QmG/0JagsLqJix7O0So+94l5JuNJAvELdQI6vYEwwJpnfoTKCQpyRtXEcr2WggSfyVGi3hL1W8tcCS8elHlh9fYNPViozqU60LLaVw41bxZFwIaFL2rvNyHOXTWiMjh1VviFhxdeFyHWmnlcPorblyVCqo8/vQWAYGy5H7JibLNB4YkcFIDyqfNweAo+sRhWF3of0NRwLOOZ2GUsjzs+yDYAP5C74Tyf7GC8WUbJbQuBmKtFx+dFIHMaGeXbYoqngBh5aHRkrDRg8Ul6yEtrJ+KXSiB98xkDxCpKIZk+MTBAlqgtYBZkK/8ThxcQJh+rvA4pf1xsNZGCH26g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b740d0a7-f481-4b69-35e3-08d71adf4dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:31:08.2907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toPWoLkpKvuIFlPpcjHlXHmL/F7UEqLmrpb/rYeQNhk=;
 b=ND+52oP8L5Yh4/fb4fft5zwT6MemWRtWXgq6tBQrmaXlCuaCDguMRj5u8jG64dw5SEMsa8ULixIREyXsfPWujwSfsGib4J5CKcO9R1hDQFudTipioutLoRI9yZtCOnoizjEoCesnwxYcIGkkrdlrLlEvx0fvSzi9uaEkllkMQxY=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRlZmluaXRpb24gb2YgYWxsIHN1cHBvcnRlZCBtdHlwZXMuIFRoZSBSVyBtdHlwZQppcyBy
ZWNlbnRseSBpbnRyb2R1Y2VkIGZvciBhcmN0dXJ1cy4gQWxzbyBhZGQgZGVmaW5pdGlvbgpmb3Ig
dGhlIGNhY2hhYmxlL3Nub29wYWJsZSBiaXQsIHdoaWNoIHdpbGwgYmUgdXNlZCBsYXRlcgppbiB0
aGlzIHNlcmllcy4KCkNoYW5nZS1JZDogSTk2ZmM5YmI0YjZiMWU2MmJkYzEwYjYwMGQ4YWFhNmE4
MDIxMjhkNmQKU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCA5ICsrKysrKystLQogaW5j
bHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggICAgICAgICAgfCA0ICsrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5oCmluZGV4IDJlZGEzYTguLjdhNzc0NzcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCkBAIC04MCw4ICs4MCwxMyBAQCBzdHJ1Y3QgYW1kZ3B1
X2JvX2xpc3RfZW50cnk7CiAjZGVmaW5lIEFNREdQVV9QVEVfTVRZUEVfVkcxMChhKQkoKHVpbnQ2
NF90KShhKSA8PCA1NykKICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0sJQU1ER1BV
X1BURV9NVFlQRV9WRzEwKDNVTEwpCiAKLSNkZWZpbmUgQU1ER1BVX01UWVBFX05DIDAKLSNkZWZp
bmUgQU1ER1BVX01UWVBFX0NDIDIKK2VudW0gYW1kZ3B1X210eXBlIHsKKwlBTURHUFVfTVRZUEVf
TkMgPSAwLAorCUFNREdQVV9NVFlQRV9XQyA9IDEsCisJQU1ER1BVX01UWVBFX0NDID0gMiwKKwlB
TURHUFVfTVRZUEVfVUMgPSAzLAorCUFNREdQVV9NVFlQRV9SVyA9IDQsCit9OwogCiAjZGVmaW5l
IEFNREdQVV9QVEVfREVGQVVMVF9BVEMgIChBTURHUFVfUFRFX1NZU1RFTSAgICAgIFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBBTURHUFVfUFRFX1NOT09QRUQgICAgXApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJt
L2FtZGdwdV9kcm0uaAppbmRleCBjYTk3YjY4Li4yODg5NjYzIDEwMDY0NAotLS0gYS9pbmNsdWRl
L3VhcGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0u
aApAQCAtNTAzLDYgKzUwMywxMCBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fb3AgewogI2RlZmlu
ZSBBTURHUFVfVk1fTVRZUEVfQ0MJCSgzIDw8IDUpCiAvKiBVc2UgVUMgTVRZUEUgaW5zdGVhZCBv
ZiBkZWZhdWx0IE1UWVBFICovCiAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9VQwkJKDQgPDwgNSkK
Ky8qIFVzZSBSVyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8KKyNkZWZpbmUgQU1E
R1BVX1ZNX01UWVBFX1JXCQkoNSA8PCA1KQorLyogQ2FjaGVhYmxlL3Nub29wYWJsZSAqLworI2Rl
ZmluZSBBTURHUFVfVk1fUEFHRV9TTk9PUEVECQkoMSA8PCA5KQogCiBzdHJ1Y3QgZHJtX2FtZGdw
dV9nZW1fdmEgewogCS8qKiBHRU0gb2JqZWN0IGhhbmRsZSAqLwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
