Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1466751
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8166E2CC;
	Fri, 12 Jul 2019 07:00:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700081.outbound.protection.outlook.com [40.107.70.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04AE6E2CC
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:00:22 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 07:00:20 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 07:00:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/powerplay: add standard profile dpm support for
 smu
Thread-Topic: [PATCH 2/3] drm/amd/powerplay: add standard profile dpm support
 for smu
Thread-Index: AQHVOH93QtcqPDcdnkenkbpx9aZQlw==
Date: Fri, 12 Jul 2019 07:00:20 +0000
Message-ID: <20190712065959.25753-2-kevin1.wang@amd.com>
References: <20190712065959.25753-1-kevin1.wang@amd.com>
In-Reply-To: <20190712065959.25753-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::30) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e16987d-c55c-40f2-790d-08d706969a39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3392; 
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-microsoft-antispam-prvs: <MN2PR12MB3392312C3D417FAA86567D4AA2F20@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(256004)(6506007)(86362001)(316002)(99286004)(14444005)(54906003)(66476007)(66556008)(76176011)(1076003)(2351001)(386003)(2501003)(53936002)(64756008)(66946007)(102836004)(6916009)(66446008)(52116002)(6512007)(71200400001)(478600001)(71190400001)(5640700003)(186003)(81166006)(4326008)(81156014)(8676002)(25786009)(11346002)(6436002)(305945005)(486006)(7736002)(2616005)(4744005)(476003)(50226002)(6486002)(14454004)(36756003)(66066001)(3846002)(6116002)(68736007)(26005)(8936002)(5660300002)(446003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3392;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TXiIEXhpai5NmWcJF91CWPwvxX/7CnMRYjlQkKRVaqcU9ApVfLsmUMARM5rGo3V/MPIBpeelpfeffsbpnFT7T3Kubdln2UJvAJOlQcOJBWmJsB5dHzkRqhKMahJrhOGpZ6RYgzTqwliLX0c8K2UjkI1naHRnd0OG52hPxUAwjfdSZzq8f5lllHj6MCQKSyK1/Y5eMtw4/P39HXssEyAeH78Nz7ZAzkqZEGRYxdeZgyq6RNbKR48nCa8jEeNq0BKtWLsJTYPFNv4pCCOaF2fA27cZCXPfczPsS2aMqEycfQjyEyBNPGS4DagWfkv12M+tvOr47ZraTlWAQ3ca3QyjhYRhT3pXu5MU9q8ELn1YYuuPzCb97msXDpTKtwvK2PTc7J8A/Rc8NMPGxmYgogVS6ce7fd6CPohYY27Tjwk920s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e16987d-c55c-40f2-790d-08d706969a39
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 07:00:20.2730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJJxttDQVzQmEvtrkER/doO9uQkvNJ/oYK6pkskfumM=;
 b=TgH4E6afzCh99u0yHGV2vn+meguuN5Y+BsRB3O+qhy668R4rbZH/hYy2wkRkoehvU5lET+AA6eQtJAJn9xE+YNgcaKJN3esa3/4HziiE/4bfIjwdCOcVaCxrSDcGsKSZ5bW7Fi5FgGxXGgjbRngok9felMRRcq9xpjqM53r2r0k=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS4gdGhlIHN0YW5kYXJkIGRwbSBpcyBub3Qgc3VwcG9ydCBiZWZvcmUuCjIuIHVzZSBhdXRvIHBy
b2ZpbGUgdG8gYWRhcHQgc3RhbmRhcmQgcHJvZmlsZS4KCkNoYW5nZS1JZDogSWI0YmZiZmUyZTVl
NzNjNTVjOWNkMmJiZDk2OGUxMDIxMzZjYzY4NTIKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8
a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5k
ZXggY2U3N2JiM2VjZmYzLi5kYTQzMzJkMmRiYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMKQEAgLTEzMzMsMTAgKzEzMzMsMTAgQEAgaW50IHNtdV9hZGp1
c3RfcG93ZXJfc3RhdGVfZHluYW1pYyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCWJyZWFr
OwogCiAJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfQVVUTzoKKwkJY2FzZSBBTURfRFBNX0ZP
UkNFRF9MRVZFTF9QUk9GSUxFX1NUQU5EQVJEOgogCQkJcmV0ID0gc211X3VuZm9yY2VfZHBtX2xl
dmVscyhzbXUpOwogCQkJYnJlYWs7CiAKLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9G
SUxFX1NUQU5EQVJEOgogCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfTUlOX1ND
TEs6CiAJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fTUNMSzoKIAkJY2Fz
ZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1BFQUs6Ci0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
