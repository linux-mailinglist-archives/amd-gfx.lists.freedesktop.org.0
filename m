Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A08BAEB2
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 09:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764C86E1CF;
	Mon, 23 Sep 2019 07:50:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7641B6E1CF
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 07:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgD1yD8n4FYOjJK/R+EiuvBERyn5RCSm9CQyAI2skZlgcjsLJoeZUAiddIuzOov9mlyzHDfSfAIPJ3qaDoMdx5jg0euvB1jQO4zc7jngukDmBaspfchKkdMNW3Gw4O/DwpCyFcL4tuxTbAdjIRXX8qs+cqZVj5+/5L+6CW35WIpVgVS0PRJKWixMx0Qb7h1uvvO27gpdMG2BrpFMD7/+DvxKKSw9Cd3jJFAnjEwldUYYNMaVIVf4jx9OUV4SVqZd00ajHx+6rBJt/75qS7a+xsvA3GeaSXIBtxkSjbVkSCTmbHczj1KYh1gby7ATYHVOKKYbuR+7CCvhgw71PM+SBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLzJgm+yA1Gv+MRa8ftSIFKBQuviPg3flSPtYcwKWaI=;
 b=ZgsnNU+vnsKGC+XjbzkIGyl2GoFeE+Xs/GSj5kZc8JlfOy1H3v43SMPr0/l0083MQn/5H6jq+NHuQmR+rc9qOhipSoMaKmU8Chkm4j55LfrDworYbhg3lHtGixe6m6dOvc2xclZVt1uOq1eklubjZZQbAvoW1MTvGvWlIyDJH8XKJB5x+QzwDKNym3mAUifybgO3kCKv6Dd5WJDYYLQ/qgongrFaK4iUWglWUnJQhGs6Lz3aeFC4gsRf4spwQX7YnaBEwTSrytY4Ez2qlO/v0C2xtTsUf/AIwP3AySl2MK4jd1lZ86P6QKgMApBFfJaaO05bHWEgttbqyqpQn6R4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3614.namprd12.prod.outlook.com (20.178.241.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 07:50:07 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:50:07 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Topic: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Index: AQHVceOELP2ZLFsHp0W/X5YJ+4Od1w==
Date: Mon, 23 Sep 2019 07:50:07 +0000
Message-ID: <20190923074954.830-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 311e1f1b-d1fc-4711-1304-08d73ffaa6c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3614; 
x-ms-traffictypediagnostic: MN2PR12MB3614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36141237B280F497A6F52DC4A2850@MN2PR12MB3614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:274;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(199004)(189003)(66476007)(66946007)(99286004)(1076003)(8936002)(36756003)(81166006)(8676002)(81156014)(54906003)(316002)(2501003)(6486002)(25786009)(4326008)(5660300002)(2906002)(6916009)(86362001)(6512007)(50226002)(256004)(305945005)(7736002)(5640700003)(6436002)(26005)(2616005)(476003)(186003)(66066001)(486006)(2351001)(71190400001)(66446008)(66556008)(6116002)(478600001)(6506007)(386003)(64756008)(3846002)(71200400001)(52116002)(14454004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3614;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0renychuFSQxXTT59KRoY/H4KhPw+XXquCnHVGY6VGht4m/bnsIjw7IRq4K2gN9awiJz/MbSvodx8xy4Vgbrv7iO1k8hptiy2A3y5jufICwwWwsztoby2JiVuppCH8v6Q1pn/aqHLAR8YHinM0IlN5YsVfJAG7BCr7bW9YJL5BcX9EELyiw/WAWDRff8BpkPfsGu1cOTPQ89KPxgvsmqAGVcUePq74Fc9EjEYYu98D2wMBSYMhGJNmKK4KTfqPiEcVDo6tkC/J7GYklFZZXjETAOUt67m5y1cJ/OWTS16xEURhnkNn/YkTfqnobnN+Wd5/BrdUzRtdsC1o+CY7HTaoHOm1AEeIbWWySz5/pZgDpvf2jjv3IX0z2pSY29bZiEVHb8LWv/KdTMsxIowGQpjWCAtzdvszDYRNZtBFLlPDw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311e1f1b-d1fc-4711-1304-08d73ffaa6c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 07:50:07.3032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17xrua98pgSDlR6PvkBLPstIsrlJnlFTdhQAR84C69XdWfm3uJKgVdUOmyZsdOl3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3614
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLzJgm+yA1Gv+MRa8ftSIFKBQuviPg3flSPtYcwKWaI=;
 b=lro8tQMQmOSTDX3D+Vqf7e5Cf0vV96fOG8bCKVuXMc5fk0C6mgwOr0iWdL5sNao4kOLrE47vAR5QQRCScbxxMC3GzBDPHEeAafxeENcxZvtifMWqmFawueEQ8bKv7sV0dm5F2gpiiFVV0SGFTfpawQTq38GL6EkW0x+Muem15qE=
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIGR1cGxpY2F0ZSBtYWNybyBvZiBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRlcwoKZml4IGNv
bW1pdDoKZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCB0aGUgaW50ZXJmYWNlIGZvciBnZXR0aW5nIHVs
dGltYXRlIGZyZXF1ZW5jeSB2MwoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndh
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggNDVkYTIxZGMy
MzU2Li41YTAwNTliOWFlYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL2FtZGdwdV9zbXUuaApAQCAtNzUyLDggKzc1Miw2IEBAIHN0cnVjdCBzbXVfZnVuY3MKIAko
KHNtdSktPnBwdF9mdW5jcy0+Z2V0X3VjbGtfZHBtX3N0YXRlcyA/IChzbXUpLT5wcHRfZnVuY3Mt
PmdldF91Y2xrX2RwbV9zdGF0ZXMoKHNtdSksIChjbG9ja3NfaW5fa2h6KSwgKG51bV9zdGF0ZXMp
KSA6IDApCiAjZGVmaW5lIHNtdV9nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyhzbXUs
IG1heF9jbG9ja3MpIFwKIAkoKHNtdSktPmZ1bmNzLT5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nr
c19ieV9kYyA/IChzbXUpLT5mdW5jcy0+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMo
KHNtdSksIChtYXhfY2xvY2tzKSkgOiAwKQotI2RlZmluZSBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRl
cyhzbXUsIGNsb2Nrc19pbl9raHosIG51bV9zdGF0ZXMpIFwKLQkoKHNtdSktPnBwdF9mdW5jcy0+
Z2V0X3VjbGtfZHBtX3N0YXRlcyA/IChzbXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0
ZXMoKHNtdSksIChjbG9ja3NfaW5fa2h6KSwgKG51bV9zdGF0ZXMpKSA6IDApCiAjZGVmaW5lIHNt
dV9iYWNvX2lzX3N1cHBvcnQoc211KSBcCiAJKChzbXUpLT5mdW5jcy0+YmFjb19pc19zdXBwb3J0
PyAoc211KS0+ZnVuY3MtPmJhY29faXNfc3VwcG9ydCgoc211KSkgOiBmYWxzZSkKICNkZWZpbmUg
c211X2JhY29fZ2V0X3N0YXRlKHNtdSwgc3RhdGUpIFwKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
