Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9242DC9970
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 10:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6186E2A5;
	Thu,  3 Oct 2019 08:03:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D676E2A5
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 08:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3Ea3Es51e63THu86crlp/+0UvdPhpuJcfoVqjA9QSnXlcmyliLnQS3S9Ppt3VWR6OtJXIw7c28FukUjo46G9j94jxyE9gyD1hjNOlQDqMDBECWb20g3QeKBBlrdaqg4nJdb27AvLA5JBWhLy/Ohi4fznF+a1v08WCqfAGgtP5dxVdhgOWiJFerHCQ3sYA53XjK2NS+WrmFhy1emkgm8U7OJJ6eRIwm3LTQbm5S13VKuLtd1cZV/1uIgk4mLm9a/+CF6WCFPpteOg17/AEKeFBMKmitrokJoJaw+HBznRWhHd56NNDI+F1qPSkW8dYGqE0iTN+Tr04gr5+7tgTB6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAkLZNuYsSdm4jiVOTf4u1AOOlTIPBnV+Yt62DeiuKM=;
 b=GNcVwLHVyd0upraiL4EunDXNpCCutyHKUzTgEfWS0sZCQ2FA9nKKR+0V3s7R1GIQH4QksMnD1Bqm7zIfh5Jts4qfnOukxzJwlBhevqzxyiX5tRDP2hcsp17DAxPsNgeNwkgSFrfdUH/AnMvHa42UhSNS6QTZTCTmkF0LLeHIV4YBXWqbgIZAWs9rgUu7Z4o51hse6J0mGMUoe0BLns63068e0an/ywwvLxv5UVqRcsD1GGQi7hJaKufExTegcO41k+eAjtiHeFzCnlXmZdJKtFun0lgZZHD87iogLMU14jR6EIfJFhVnMvc87XQt2fvNkR4OTcHx9IiGdL/A789mMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB2521.namprd12.prod.outlook.com (10.172.91.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 08:03:43 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 08:03:43 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Topic: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Index: AQHVecESlri34d569kWl8OF1vO+U7A==
Date: Thu, 3 Oct 2019 08:03:42 +0000
Message-ID: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21)
 To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.rc1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a26b9c18-de63-42a8-daec-08d747d8351c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR1201MB2521:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB2521F0DD25936692C0B4F68D8D9F0@DM5PR1201MB2521.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(199004)(189003)(6436002)(71190400001)(71200400001)(7736002)(8676002)(2906002)(6306002)(66476007)(66446008)(64756008)(50226002)(66946007)(66556008)(81156014)(5640700003)(6512007)(305945005)(81166006)(8936002)(6486002)(52116002)(102836004)(2351001)(386003)(5660300002)(86362001)(55236004)(6506007)(316002)(66066001)(99286004)(2616005)(486006)(3846002)(256004)(14454004)(476003)(25786009)(26005)(186003)(6116002)(36756003)(2501003)(6916009)(4326008)(4744005)(478600001)(966005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2521;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvEZG8c4du6zfMa7qi6jtCqHV89nqz8hFMXDCJ/tzZBNb3yGEaXra5GdS1O6TQ6pnl/FHrClxn0fLrgiYltKQPHHGE+StmwyY/a8oRyXSBe8Ry8mYjNOVQyGsrfaS2Bws89nzfsIam24wT/ikO9jc4kryXCWxyqrPZSwrVBJHOEYiragOA86coQRtbnk5UFRBJG+w5SuK7tZkDH0oJeSZsfhu/4TM/ZPgeK/rAatgt7aa/ZB56vzKrxO65c4XjujfbEHkKSKCgWyH9svDQtyI32QdqhoEsSm/QmTcDXRxU3wLUvpSJvVIPv90RlsZgLkLZ2LJsGnaz85o2xFf6Rie+NTrNjx/ExrmTThPtMzwLrlbBXsIiT0WgU8dJ5ZmPovyotP0F7D0qam8FLXm8StgaP5SvRXcbUn/NsWarTCzYbDVYxpk7tI9qj/K+b90RgsU8gbodXBospUHsFQtCii1A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26b9c18-de63-42a8-daec-08d747d8351c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 08:03:42.9134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hrid32XFiHSG8WPuojcsZdd1lGTvYO+SXBfE8KlNCpC9ikk6TKGWUFInc2iuFOqEkUIDGy8roqud5DDXkBugnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAkLZNuYsSdm4jiVOTf4u1AOOlTIPBnV+Yt62DeiuKM=;
 b=F9NGcFq53EfZ0Vy8jGB3LZ3yDf+RuxWVfPi8Sq51v9NXyqZz+x4wK0/vh4EOPc5mAyX5vYSaoy8ggjsR6TNDBOwIogMW2irz7ixJY0OTSoPMWhOOzmf6rFCVi5J7SIRIGOv0VfppuPa9dyqwuoeAHuQ5ECGZRYgh5hCMcbvjSZs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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
Cc: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBjYW4gYmUgc2FmZWx5IHNraXBwZWQgZW50aXJlbHkuClRoaXMgc2VlbXMgdG8gaGVscCB3
aXRoIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTQ4MS4K
ClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIDxwaWVycmUtZXJpYy5w
ZWxsb3V4LXByYXllckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggNjA2NTU4MzRkNjQ5Li5hYTE2
M2U2NzlmMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCkBAIC0yMjcs
NiArMjI3LDExIEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lZCBudW1faWJzLAogCQkgICAgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgLyog
Zm9yIFNSSU9WIHByZWVtcHRpb24sIFByZWFtYmxlIENFIGliIG11c3QgYmUgaW5zZXJ0ZWQgYW55
d2F5ICovCiAJCQljb250aW51ZTsKIAorCQlpZiAoaWItPmxlbmd0aF9kdyA9PSAwKSB7CisJCQkv
KiBPbiBOYXZpIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiIGVtaXRzIDAgc2l6ZWQgSUIgKi8KKwkJ
CWNvbnRpbnVlOworCQl9CisKIAkJYW1kZ3B1X3JpbmdfZW1pdF9pYihyaW5nLCBqb2IsIGliLCBz
dGF0dXMpOwogCQlzdGF0dXMgJj0gfkFNREdQVV9IQVZFX0NUWF9TV0lUQ0g7CiAJfQotLSAKMi4y
My4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
