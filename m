Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A46D150
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 17:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B0E6E40C;
	Thu, 18 Jul 2019 15:47:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5796E40C
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 15:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb4fI66sP9mShpw1PEsx4gJ3jBQfimuAQP5EBiwbZIZXlp5Soqlz2PQk0lH4TwpPA1+t4l7dF1ftnjdcu6x04RapajokHB8POzS1CEmXWnMH76B2vKWA1J3GJQteXJTw76w2bP8qd78QR3cpdwQn8efuaVb0e7uU/vJG31vwMGWB8F3yAo22yHZWqc6otD6op/c+t1B38m5bq8vWGbKq6Y5kmVprJOOjN6qH2VgkoHYPwKqmO9CIwvIUON5xs1+4oWQmWpDVkSHpX3C2WhzxxvjguI43K8Od81etvbtAD0P9lUf2pni7RAzKPbWVqDudqVFBVrdGMvMvYc6RSzb8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKSZo4w2K+RlgQFjRTLHfRN94cwKZveZceJvNLhssh0=;
 b=eStWBHogfbqz7mck+yJ/w0x2C+Im4/ZuE/C70L60E4OlELKr8BfKZBGks016Dzw9B25TBXa3rHGtaQ1vKqeCSpptjctDdW7cOBNOJX8/9qLQWa1xWtW/y2vulBmO8sDBC8ahP0kj+TcHf9Hm07/SoCeJxm2bRghmBLtCnmhROcYRA9ERfedOPjsQmdN+DuToN1m2iTZTw4I64f3W3f9E8KQCPhCiEqHk4Vvw88qCSwmdm2oAppc4qvDaULanhPM8ZnbtQIZ7TM5zV24NaxFlg5I41mpC1dKgsspk+XzBeVz7BFALKQ9BqudJPepiEPz2TqxBMM77UkszooqxyTnhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2454.namprd12.prod.outlook.com (52.132.141.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:46:57 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:46:57 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/: use VCN firmware offset for cache window
Thread-Topic: [PATCH] drm/amdgpu/: use VCN firmware offset for cache window
Thread-Index: AQHVPYAIY2DyjDQpR0yOJu+nufuNTQ==
Date: Thu, 18 Jul 2019 15:46:57 +0000
Message-ID: <20190718154616.14841-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee376365-e415-4c56-ec83-08d70b972a69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2454; 
x-ms-traffictypediagnostic: DM5PR12MB2454:
x-microsoft-antispam-prvs: <DM5PR12MB2454F33FE788EE38EBEB640FE5C80@DM5PR12MB2454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(81156014)(4744005)(99286004)(476003)(66476007)(6512007)(386003)(26005)(2616005)(2906002)(186003)(36756003)(305945005)(6436002)(3846002)(2501003)(64756008)(66556008)(5660300002)(81166006)(14454004)(71200400001)(66066001)(71190400001)(66946007)(66446008)(6916009)(6116002)(50226002)(1076003)(7736002)(8936002)(256004)(6506007)(53936002)(6486002)(4326008)(68736007)(2351001)(316002)(478600001)(5640700003)(486006)(25786009)(52116002)(102836004)(8676002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2454;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R42/mh8L3P4Fp4n/2Wxs+yK4tYNOcd4dA8bRT0uOTD8eFagCTIgDDNPVERxURRvcudWFSrmfVivbJL6Sg4sXTOxY+xO4VhUpsSDlAyH814IjcbjRx4loLyg6xX1hSWX1RqXJJ8A8V5nhwtnD/Z+NEcduWpgoIAbf273/KY2tCEZm4Xq7U7cExqzZCmUR9JcR0nJZQRN4Da6gMbzOiioVF6/RJ1v7/JoZQKtchZT3uWOt+RrMew/vlzmL92IdoWd1WPutA4AIjZcULoIKE80Jl1lMT5dcFDDEmfPmXOkCV4QRteEmS9sFd8TyF21z5VGehlxNJvcJJe1O2e+hBrCsROorSTx1NMdsYuflSHhUy0nBaSgkHtt+YRCcvwTqkuq/I4kiITAggodnreNrGSHGQ1qYkegnepiCnk9lqtTcNQQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee376365-e415-4c56-ec83-08d70b972a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:46:57.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKSZo4w2K+RlgQFjRTLHfRN94cwKZveZceJvNLhssh0=;
 b=LXhfCzecsPHSi9OHD6+2U2ZuEccA2VEOjKZGsopOLTiYPYdbFF3u3QXUfdcPbjA+zbkF+1iBRv4XkWThCFcp6JOce3E3dlg4I9qQN9sPJc16uaSZoUetNtZQb9f12oX8oVs5bPxV9nkL02ylxho8lYDqFKDSOj0yovagrfZNbEo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2Ugd2UgYXJlIHVzaW5nIHRoZSBzaWduZWQgRlcgbm93LCBhbmQgYWxzbyB1c2luZyBQU1Ag
ZmlybXdhcmUgbG9hZGluZywKYnV0IGl0J3Mgc3RpbGwgcG90ZW50aWFsIHRvIGJyZWFrIGRyaXZl
ciB3aGVuIGxvYWRpbmcgRlcgZGlyZWN0bHkKaW5zdGVhZCBvZiBQU1AsIHNvIHdlIHNob3VsZCBh
ZGQgb2Zmc2V0LgoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgfCAzIC0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMK
aW5kZXggM2NiNjJlNDQ4YTM3Li44OGUzZGVkY2Y5MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYwpAQCAtMzc5LDExICszNzksOCBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9t
Y19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCVdSRUczMl9TT0MxNShVVkQs
IDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9ISUdILAogCQkJdXBwZXJfMzJfYml0
cyhhZGV2LT52Y24uaW5zdC0+Z3B1X2FkZHIpKTsKIAkJb2Zmc2V0ID0gc2l6ZTsKLQkJLyogTm8g
c2lnbmVkIGhlYWRlciBmb3Igbm93IGZyb20gZmlybXdhcmUKIAkJV1JFRzMyX1NPQzE1KFVWRCwg
MCwgbW1VVkRfVkNQVV9DQUNIRV9PRkZTRVQwLAogCQkJQU1ER1BVX1VWRF9GSVJNV0FSRV9PRkZT
RVQgPj4gMyk7Ci0JCSovCi0JCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVf
T0ZGU0VUMCwgMCk7CiAJfQogCiAJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfVkNQVV9DQUNI
RV9TSVpFMCwgc2l6ZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
