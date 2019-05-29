Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FD2D586
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 08:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512E6E08A;
	Wed, 29 May 2019 06:32:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D54A6E08A
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 06:32:13 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3711.namprd12.prod.outlook.com (10.255.236.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Wed, 29 May 2019 06:32:12 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 06:32:12 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH 0/3] always enable PCIE atomics
Thread-Topic: [PATCH 0/3] always enable PCIE atomics
Thread-Index: AQHVFeg/UUZqPiX5d0y8E0p4xthmlQ==
Date: Wed, 29 May 2019 06:32:11 +0000
Message-ID: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:2e::21) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a820fa1f-50fb-4e77-d316-08d6e3ff619d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3711; 
x-ms-traffictypediagnostic: MN2PR12MB3711:
x-microsoft-antispam-prvs: <MN2PR12MB3711EC30E93B91EAB1BC96FFEF1F0@MN2PR12MB3711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(66446008)(72206003)(64756008)(2906002)(68736007)(3846002)(6116002)(14454004)(2501003)(478600001)(66556008)(66476007)(66946007)(73956011)(6636002)(7736002)(4326008)(8676002)(476003)(2616005)(25786009)(305945005)(486006)(71200400001)(71190400001)(386003)(66066001)(6506007)(186003)(8936002)(50226002)(5660300002)(110136005)(6512007)(102836004)(26005)(4744005)(81166006)(81156014)(6486002)(6436002)(99286004)(86362001)(52116002)(256004)(53936002)(14444005)(36756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3711;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8LMGnyajQq/gpNOBaqaL4zDqoaC75DolYwa5LcpMeY3lPYGl7hZOtUsEOpamxweQuKekK2igA30BMt+bMqWMuxxGnuZ+5cfLY/XHtLVWOvYf3/95kAY6Tl0YLoR04yw8ZkrmNs+HoHh3kgEUzV1X1kO1lv32WgF7+ZTUgV6M7ICpa9hCIYBWGd7bVhh24FDQu60T9HUIxGY3M3Jvh/VN/+ogA1JpdwSJB03HARQeTV4DHmPbN+FJTZZYx39pHORVJpr0lRThcqeDVLIY1Ro5a6KvmNQk54Udd96S+p+udagea/qK0vKNrVelwRgKBnclDZkKUMxDPcV4Y0eAvmw0uqaGUYvm6Z1Zg5NKGVbXrbpLFicynF+B69t6Xy9hrK9QrYHaQ7bwrWHLx0BwDL+kUUj3SbuircCSmSYP6aT8NM0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a820fa1f-50fb-4e77-d316-08d6e3ff619d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 06:32:11.8069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ9Kzc1AIxHhnOdPzpXCgzNrgKu5OZmWOXZT5t7TTXA=;
 b=KyW4Z07ptsZgSmUAgovn+vSHRZGEekbzGW5u9Xx3wX8dXdbfuItcA3Wm+wG8ZXIzrgyNDzC3aCETNcIRHEvh0ZUfXiOIdawMMisqXopWpfpyUXs63uDU7qh9xihmrmFbqnbcs5NVrHMxoPvYW2ClYWik2ixR8Gk1H87k922s5T4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

R1BVIGF0b21pY3Mgb3BlcmF0aW9uIGRlcGVuZHMgb24gUENJRSBhdG9taWNzIHN1cHBvcnQuDQpB
bHdheXMgZW5hYmxlIFBDSUUgYXRvbWljcyBvcHMgc3VwcG9ydCBpbiBjYXNlIHRoYXQNCml0IGhh
c24ndCBiZWVuIGVuYWJsZWQuDQoNCkFkZCBmaWVsZCB0byBhbWRncHUgZGV2aWNlLCB0aGF0IGNh
biBiZSBleHBvc2VkIHRvIFVNRCBvcg0Ka2ZkIGluZGljYXRpbmcgd2hldGhlciB0aGUgc3lzdGVt
IGhhcyBQQ0lFIGF0b21pY3Mgc3VwcG9ydC4NCg0KSmFjayBYaWFvICgzKToNCiAgZHJtL2FtZGdw
dTogYWRkIGZpZWxkIGluZGljYXRpbmcgaWYgaGFzIFBDSUUgYXRvbWljcyBzdXBwb3J0DQogIGRy
bS9hbWRncHU6IGVuYWJsZSBQQ0lFIGF0b21pY3Mgb3BzIHN1cHBvcnQNCiAgZHJtL2FtZGtmZDog
cmVtb3ZlIGR1cGxpY2F0ZWQgUENJRSBhdG9taWNzIHJlcXVlc3QNCg0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICB8ICAxICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAgNyArKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIHwgIDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyB8IDExICsrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jICAgIHwgMTAgKysrKy0tLS0tLQ0KIDUgZmlsZXMgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KLS0gDQoxLjkuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
