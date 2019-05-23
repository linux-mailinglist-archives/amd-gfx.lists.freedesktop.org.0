Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC228324
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 18:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC346E033;
	Thu, 23 May 2019 16:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF4B6E033
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 16:21:36 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3855.namprd12.prod.outlook.com (10.255.237.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Thu, 23 May 2019 16:21:35 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 16:21:35 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Topic: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Index: AQHVEYOWAinq7QfcoUCr7GVrLuNMsg==
Date: Thu, 23 May 2019 16:21:34 +0000
Message-ID: <1558628187-12380-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::28) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52000fbb-5095-4f5e-b54f-08d6df9ab921
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3855; 
x-ms-traffictypediagnostic: MN2PR12MB3855:
x-microsoft-antispam-prvs: <MN2PR12MB3855E174ED161B2FB571CEAAEF010@MN2PR12MB3855.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(71200400001)(71190400001)(6436002)(73956011)(2501003)(4326008)(66066001)(8936002)(50226002)(14454004)(36756003)(66476007)(64756008)(316002)(6636002)(66556008)(478600001)(68736007)(86362001)(66946007)(72206003)(66446008)(6486002)(2616005)(102836004)(476003)(25786009)(386003)(3846002)(6506007)(6116002)(6512007)(53936002)(99286004)(52116002)(7736002)(81156014)(81166006)(256004)(2906002)(486006)(5660300002)(8676002)(186003)(4744005)(305945005)(26005)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3855;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W26/GvSx+6FFhPIkIxSO2KB/KHDEki9V1fviJLnYJ28QDn2W/nZp0hwd8PyDIK1piqJ8B26ORT3MJs95PGUKVv5inJ6/WV3akCe8/4ndFRcgBTkCDLXlPYYssTBcy4eH7pgPcAe4396V003TezVxE45M8DaNe/uEWJQBQYZg4H+f3FjNC5pWNH8LvPjIy19bBIUMfmJurqYcKuL8EDc3zuJTn7ALdbmdpaDX/wkGfYFKXcJAheNvshjLMg8HiQxC0+pd6MHaAlwj7EuhFNzcaxGAo8oQWkdaFh9+vGs7kV/IwjsJdrjoRquXJNPlgG6AEcxcnAlj1AurjHlPD3Rp6rn92j4uP3mbNP9k3dwydFg9yAhu6TICg//4+C4c3i1A5ThY2uW/GwALvUiBcYFPUaHpucmeN192PlP55r9awmM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52000fbb-5095-4f5e-b54f-08d6df9ab921
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 16:21:34.9122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3855
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aysI7BGzy6KLSyVHiTXRhxZh9MEGYdtjjv2YCYZl0oY=;
 b=PjpIv1/N5EcbnjlOgBe2hBfnNLXIhv/Cy3cuGqkUMMI/EosL2x04ekux+Vys2W8uOA83/IhJZJBfVfGqTb+0EHE/CXcShT9qC3Zp+WtCKjC3Mj7hpWplo3bV7L2h0vVtsolqpVsulRZ4ksK5FrhDTERvXzI3y7xKumZYpIqfzLI=
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
LmMgfCA3ICsrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCmluZGV4IGJkZDFmZTczLi5h
MmM2MDY0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMN
CkBAIC0yNTYyLDYgKzI1NjIsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCiAJaWYgKGFkZXYtPnJpb19tZW0gPT0gTlVMTCkNCiAJCURSTV9J
TkZPKCJQQ0kgSS9PIEJBUiBpcyBub3QgZm91bmQuXG4iKTsNCiANCisJLyogZW5hYmxlIFBDSUUg
YXRvbWljIG9wcyAqLw0KKwlyID0gcGNpX2VuYWJsZV9hdG9taWNfb3BzX3RvX3Jvb3QoYWRldi0+
cGRldiwNCisJCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01QMzIgfA0KKwkJCQlQQ0lfRVhQ
X0RFVkNBUDJfQVRPTUlDX0NPTVA2NCk7DQorCWlmIChyKQ0KKwkJRFJNX0lORk8oIlBDSUUgYXRv
bWljIG9wcyBpcyBub3Qgc3VwcG9ydGVkXG4iKTsNCisNCiAJYW1kZ3B1X2RldmljZV9nZXRfcGNp
ZV9pbmZvKGFkZXYpOw0KIA0KIAkvKiBlYXJseSBpbml0IGZ1bmN0aW9ucyAqLw0KLS0gDQoxLjku
MQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
