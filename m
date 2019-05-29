Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EA2D588
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 08:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F806E0FE;
	Wed, 29 May 2019 06:32:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4256E0FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 06:32:18 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3711.namprd12.prod.outlook.com (10.255.236.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Wed, 29 May 2019 06:32:17 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 06:32:17 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: enable PCIE atomics ops support
Thread-Topic: [PATCH 2/3] drm/amdgpu: enable PCIE atomics ops support
Thread-Index: AQHVFehC67D+1E5poEOXCJNaOwfLaQ==
Date: Wed, 29 May 2019 06:32:16 +0000
Message-ID: <1559111516-21940-3-git-send-email-Jack.Xiao@amd.com>
References: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
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
x-ms-office365-filtering-correlation-id: b8556b3d-9d91-4645-ecf9-08d6e3ff64a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3711; 
x-ms-traffictypediagnostic: MN2PR12MB3711:
x-microsoft-antispam-prvs: <MN2PR12MB37110346346FBCCC137C2DE0EF1F0@MN2PR12MB3711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(66446008)(72206003)(64756008)(2906002)(68736007)(3846002)(6116002)(14454004)(2501003)(478600001)(66556008)(66476007)(66946007)(73956011)(6636002)(7736002)(4326008)(8676002)(476003)(2616005)(25786009)(305945005)(11346002)(446003)(486006)(71200400001)(71190400001)(386003)(66066001)(6506007)(186003)(8936002)(50226002)(5660300002)(110136005)(6512007)(102836004)(26005)(4744005)(81166006)(81156014)(6486002)(6436002)(76176011)(99286004)(86362001)(52116002)(256004)(53936002)(36756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3711;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kpLfV1uPPqv/k3OQLlRR0Q+KJg6eZidtaoGuaX1ElpRVb9zM4+lBGlTrLbJasLkBXi+CTNBokeLIPZgCgNAEta+ZNp50smWJCrGB+6qnN0rqWX/myoCfyaGkNCfdL9SMhc/URW8JuftLVNwjm8pvxE+yXpF/M3U3lr18j8tbONHKqDNLOebesCmWk/ao5gWpDN0IJ/HIX7deUOojUjJDZ86AQ8Zy4GcHkOOX88v3lY6EKy7YbwfpREYEHmQxX9Qd0Y4zSZHf0Id/XL0JcmVfKyxQPyc20PX9Y8NaVhCQZAbDwCsxp2ksvi2yPfGA3SgqzaLneZdu1+P4vz1av+07TtTjqwGNIZekDgVtVFRAimKBmvHq57woFx43HQ1I9IjFCXC6zg7lt/nIA5MU3E1lsSRPmvc6ZnJqeDVr2tF1Tyk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8556b3d-9d91-4645-ecf9-08d6e3ff64a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 06:32:16.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu8V63f5Ad4aPNyGg4FZKvA2eM0TO3uUsjt9KgvSy6A=;
 b=XjZeFChYRXhHV5sk2947m0FSPLfkuwS59ZwZRnV/oE2gIzoaRTQe/+8NXjXkxVOQ5S+VxxTiuylBm+AhE1TDde/Pz+hfSoT3L9nZpBKXlZsMsN5O2w98GDKAa9KWaF7ysBw8Z+Bbjhl9P21aw5SsormR7Iv9Nu6MgFqPHgVMuf0=
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
c24ndCBiZWVuIGVuYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFv
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgfCAxMSArKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCmluZGV4IGJkZDFm
ZTczLi41NTc3MmViIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMNCkBAIC0yNTYyLDYgKzI1NjIsMTcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJaWYgKGFkZXYtPnJpb19tZW0gPT0gTlVMTCkNCiAJ
CURSTV9JTkZPKCJQQ0kgSS9PIEJBUiBpcyBub3QgZm91bmQuXG4iKTsNCiANCisJLyogZW5hYmxl
IFBDSUUgYXRvbWljIG9wcyAqLw0KKwlyID0gcGNpX2VuYWJsZV9hdG9taWNfb3BzX3RvX3Jvb3Qo
YWRldi0+cGRldiwNCisJCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01QMzIgfA0KKwkJCQlQ
Q0lfRVhQX0RFVkNBUDJfQVRPTUlDX0NPTVA2NCk7DQorCWlmIChyKSB7DQorCQlhZGV2LT5oYXZl
X2F0b21pY3Nfc3VwcG9ydCA9IGZhbHNlOw0KKwkJRFJNX0lORk8oIlBDSUUgYXRvbWljIG9wcyBp
cyBub3Qgc3VwcG9ydGVkXG4iKTsNCisJfSBlbHNlIHsNCisJCWFkZXYtPmhhdmVfYXRvbWljc19z
dXBwb3J0ID0gdHJ1ZTsNCisJfQ0KKw0KIAlhbWRncHVfZGV2aWNlX2dldF9wY2llX2luZm8oYWRl
dik7DQogDQogCS8qIGVhcmx5IGluaXQgZnVuY3Rpb25zICovDQotLSANCjEuOS4xDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
