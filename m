Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D231CA7B26
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 08:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DFA89A34;
	Wed,  4 Sep 2019 06:06:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268BA89A14
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 06:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wnk9FFzn6NlGkUImgnPqGaHy/sVy7uY91OsDSAwFeetwRXGM8QCGt8QLj1sbT7rztBuFlmbNsGFzfct+OnsUqxY9qD9RfAPz61C0VGjnqzoBY5f3XJvBL/OMYzabkVmEvyeRiprK1rgqL3yCYpgxgzDAE6QrbYWbEQtpzurfOfNoqjE4wt6vbDc7cqofmlCdC3i1fpP51oVjC9iOv0j+WdWAlIogeiEbT4/gjXSwpiXDYbNpvfm7BfobUju6rSREavxwddJWxG0txD94FvkdFYQx1Ov0fCKnj1h/8kBLdXjWkJ+KWE8a7OFFtetm45qEB6t3dptaCYi5j2936TT44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKRSBFiXfOMeu6adlpecLKsljx1N02nxC/zPpkmkITU=;
 b=IHWMaZhdEOYlK7P6nDf0UlXpag/ZgD8UO6EbdcRAQBDe6x/Ht8jrm/fw7+9HXF4z1tHPlWuCAE4TZv3HiiqLzFU5ZlGxw/MSazAu5pZI6lQOS75ptQznAPVVU/+20/FM7CEFzWxeJFkpcLTzKkl9D8HtZHjLGcmGIPfwSDuV1Dor4nhOXNSxw8mtcqmEidl61FIxAaw+i6HqjhJjL7gnqUsKAL+stfuxj9CztMizgsqn5sT+fLicwMWrLBtdEUFBQlkF4AkQn1hpkBBzPmOtav46RTvXi2RBK9Bvt/D57gcFhI2HyJFqzpBWNZhNVlBnevN+1+EPt9TiO/X6PswQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3936.namprd12.prod.outlook.com (10.255.238.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Wed, 4 Sep 2019 06:06:48 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 06:06:48 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: update renoir_ip_offset.h
Thread-Topic: [PATCH 2/2] drm/amd/display: update renoir_ip_offset.h
Thread-Index: AQHVYubvhHZrjyxu6kKowhq+dvdMVA==
Date: Wed, 4 Sep 2019 06:06:48 +0000
Message-ID: <1567577166-18064-2-git-send-email-aaron.liu@amd.com>
References: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To MN2PR12MB3838.namprd12.prod.outlook.com
 (2603:10b6:208:166::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98539610-a9a0-41b0-a5a7-08d730fe11e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3936; 
x-ms-traffictypediagnostic: MN2PR12MB3936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39362C0D57A2DE391B72F239F0B80@MN2PR12MB3936.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(53936002)(8936002)(6512007)(316002)(4326008)(6916009)(6116002)(3846002)(25786009)(64756008)(66446008)(305945005)(2501003)(6486002)(86362001)(52116002)(6436002)(36756003)(5640700003)(7736002)(71200400001)(71190400001)(54906003)(66476007)(66946007)(8676002)(14444005)(256004)(66066001)(99286004)(386003)(6506007)(478600001)(11346002)(50226002)(186003)(446003)(81156014)(81166006)(26005)(4744005)(2351001)(486006)(2616005)(102836004)(76176011)(66556008)(2906002)(5660300002)(14454004)(476003)(15650500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3936;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qpbmo53UBXqOhBoj5AfCG8JLOpB6XU21bqQgKihkcPaemXbhLGDzE3zbzaFK+tLW1gfHlrB4/vCj0OczU8LY+snc3bwJqgN45D99zYrfLoQObJMAVboGyJ+WFcBGFDA3zotw/9ArVPfkEm73ysW6HzB5mFoX1WLJboCm60rEpUqR3ROV/Ecq/JhHh/2Z+6lR52SgMC0M/gqNtndPGSinrxQ4xfpBPdq5QvXz/WFPpzj1LSguu2RRXA0Tjby1zqHNYdAKgk9szLLJhEivU14MrAco34LtM0z4a7mQk4IYSfrWzQRqXvJfGSbGnsxz3GaUjU6I6NyI9wGntYjHdTGfQeDBDQ8uZCGNy2G3zbtRB8J9ye4F0nzpsHl4f72gRmandw45h5rQofAkhWNmHjk1I/Rp4rdaLZ+cOmEAkGYTIe4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98539610-a9a0-41b0-a5a7-08d730fe11e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 06:06:48.1768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRWzkRGtUdAR4YQxYXQWKXB7f5UQUeUIOt8jI8ezWiAI1bbQrz20QQErzflZF/z8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKRSBFiXfOMeu6adlpecLKsljx1N02nxC/zPpkmkITU=;
 b=w4PGdR2YT8u0QpbAp12u0To+nc8soI0RV/p/jZiANbiaVM6ivmTta4jKAGrGC3zrNs4ue+zCevEDNLTDzt0sKSsO4icETkEzhWUt6KBv8RuhKA2mLIndbpyCY3dJKRxZMGKdTlJO4An9cUMSpJG+Ra1af2qLqV2kyHsApsGztP4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCB1cGRhdGVzIE1QMV9CQVNFIGluIHJlbm9pcl9pcF9vZmZzZXQuaAoKU2lnbmVk
LW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvcmVub2lyX2lwX29mZnNldC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9yZW5vaXJfaXBfb2Zmc2V0LmgKaW5kZXggNTU0NzE0Yy4uMDk0NjQ4YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Jlbm9pcl9pcF9vZmZzZXQuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvcmVub2lyX2lwX29mZnNldC5oCkBAIC0xNTUs
NyArMTU1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIE1QMF9CQVNFID17IHsgeyB7
IDB4MDAwMTYwMDAsIDB4MDI0M0ZDMDAsIDB4MDBEQzAwMDAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB7IHsgMCwgMCwgMCwgMCwgMCB9IH0sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAgfSB9LAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAwLCAwLCAwIH0gfSB9
IH07Ci1zdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgTVAxX0JBU0UgPXsgeyB7IHsgMHgwMDAx
NjIwMCwgMHgwMjQwMDQwMCwgMHgwMEU4MDAwMCwgMHgwMEVDMDAwMCwgMHgwMEYwMDAwMCB9IH0s
CitzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgTVAxX0JBU0UgPXsgeyB7IHsgMHgwMDAxNjAw
MCwgMHgwMjQwMDQwMCwgMHgwMEU4MDAwMCwgMHgwMEVDMDAwMCwgMHgwMEYwMDAwMCB9IH0sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeyB7IDAsIDAsIDAsIDAsIDAg
fSB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsgeyAwLCAwLCAw
LCAwLCAwIH0gfSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7IHsg
MCwgMCwgMCwgMCwgMCB9IH0sCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
