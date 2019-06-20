Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9A4C6BB
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 07:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945D16E4A7;
	Thu, 20 Jun 2019 05:18:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800053.outbound.protection.outlook.com [40.107.80.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A856D6E4A7
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 05:18:30 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3879.namprd12.prod.outlook.com (52.132.246.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 05:18:24 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 05:18:24 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: set max df perfmon to 4
Thread-Topic: [PATCH] drm/amdgpu: set max df perfmon to 4
Thread-Index: AQHVJyeVn/hUjy54fkKE1c6aLgE3kQ==
Date: Thu, 20 Jun 2019 05:18:24 +0000
Message-ID: <20190620051811.118880-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d0af271-60c9-4c79-f35b-08d6f53eb7f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3879; 
x-ms-traffictypediagnostic: CH2PR12MB3879:
x-microsoft-antispam-prvs: <CH2PR12MB387985E69F35183FD42B21F285E40@CH2PR12MB3879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(6486002)(72206003)(4326008)(2906002)(99286004)(73956011)(86362001)(52116002)(6436002)(66066001)(66946007)(5660300002)(81156014)(5640700003)(81166006)(25786009)(2351001)(14454004)(386003)(6506007)(102836004)(8676002)(1076003)(6116002)(3846002)(66556008)(50226002)(71190400001)(71200400001)(7736002)(36756003)(305945005)(316002)(53936002)(186003)(486006)(2501003)(26005)(68736007)(6512007)(476003)(8936002)(66446008)(66476007)(64756008)(6916009)(2616005)(478600001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3879;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NGae7Po8P7C8j7lVZZHJaGcqDuirTu3+l28a0FtS2qt4GPfvdEgzmirxOr7ngstzYOup6qY6GfdWdKIvlUtBD8vIr6xl150JuaV4Por2ctU2pUXbNE/6NyLRNQRqmtXePAW40QZPsC5JL5eN9oj8NF0odH9/bJJWtyuNsXQllH8REQGaWl097ICoiMa1cT+OO3ig+NhBentjP1WJUnKXdnHg0xnLQR5BBZXvn/U59/xQFs4R7zhG2WGn9jRfqx++dX6LMsSEak/WW6rlGEpsT49gaBXEQ3tcUlx5EkQ6q5C8gzYPctKshT9Dh+ISYccHACOJzH7i+9sMQsMTkcBorscY08mui4nTU26BwNTZiVpu/wme9jmZLJN5VWzpjAeR7K9usEvIc2Luw1qFz6sc1rb3+ymwO+YFgaofPJeSh5g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0af271-60c9-4c79-f35b-08d6f53eb7f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 05:18:24.5273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3879
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrS55DLVTHlEl6i5ormFT15h1LFkhVqpCvnkBW11udE=;
 b=f6L28wmkbb3ip6QjhBQRaIcB1UVUbGTcviW1ONpA7FyhIBazzAgPBHg51QVspsyhukBuBnm7usILTHT567d7B0xZAoPUwX0/DuAYMKwhXODY26aLZNZlisSOPjoU9Z+WhE/kY1wF0cQC7kFMF1KL6uyu6hvdYlzQd0sKaPFbGaU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4ZWQgZGYgcGVybW9uIHRvIDQgYW5kIHJlbW92ZSBub3QgbmVlZGVkIHJldA0KDQpDaGFuZ2Ut
SWQ6IElhOTg5NzYxMjkzN2U2NTJlN2Y4YTA5YzFkMjNiYjFjMGU2ZjNkOGY3DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDIgKy0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jICB8IDEgLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQppbmRl
eCBiMjI3Yzk1NmI4YTkuLmMzZWQwOWNkMjY3OCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaA0KQEAgLTczMiw3ICs3MzIsNyBAQCBzdHJ1Y3QgYW1kX3Bvd2VycGxheSB7DQogfTsN
CiANCiAjZGVmaW5lIEFNREdQVV9SRVNFVF9NQUdJQ19OVU0gNjQNCi0jZGVmaW5lIEFNREdQVV9N
QVhfREZfUEVSRk1PTlMgMTYNCisjZGVmaW5lIEFNREdQVV9NQVhfREZfUEVSRk1PTlMgNA0KIHN0
cnVjdCBhbWRncHVfZGV2aWNlIHsNCiAJc3RydWN0IGRldmljZQkJCSpkZXY7DQogCXN0cnVjdCBk
cm1fZGV2aWNlCQkqZGRldjsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KaW5kZXggMGFm
YmNjODBlYTYxLi4wMTQ1NDlhMzA0NDYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
DQpAQCAtMTA2Nyw3ICsxMDY3LDYgQEAgc3RhdGljIHZvaWQgc29jMTVfZG9vcmJlbGxfcmFuZ2Vf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiBzdGF0aWMgaW50IHNvYzE1X2NvbW1v
bl9od19pbml0KHZvaWQgKmhhbmRsZSkNCiB7DQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KLQlpbnQgcmV0Ow0KIA0KIAkvKiBl
bmFibGUgcGNpZSBnZW4yLzMgbGluayAqLw0KIAlzb2MxNV9wY2llX2dlbjNfZW5hYmxlKGFkZXYp
Ow0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
