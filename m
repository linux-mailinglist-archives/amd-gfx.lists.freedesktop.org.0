Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9022B1FC
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 12:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E537A89789;
	Mon, 27 May 2019 10:19:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1D189789
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 10:19:16 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3327.namprd12.prod.outlook.com (20.178.243.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 10:19:14 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 10:19:14 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Topic: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Index: AQHVFHWiV+KPu3QpmUS98wAwuoZ18g==
Date: Mon, 27 May 2019 10:19:14 +0000
Message-ID: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbeeb2cd-eecd-4699-bf00-08d6e28cc434
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3327; 
x-ms-traffictypediagnostic: MN2PR12MB3327:
x-microsoft-antispam-prvs: <MN2PR12MB332723329975EEE1D84F891BEF1D0@MN2PR12MB3327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(5640700003)(5660300002)(14454004)(71190400001)(71200400001)(316002)(6486002)(66476007)(6436002)(478600001)(256004)(2501003)(36756003)(6512007)(72206003)(66556008)(73956011)(66946007)(53936002)(66446008)(64756008)(4744005)(7736002)(86362001)(2351001)(8676002)(26005)(3846002)(6116002)(52116002)(305945005)(66066001)(4326008)(8936002)(50226002)(81156014)(81166006)(25786009)(476003)(2616005)(486006)(68736007)(6506007)(99286004)(386003)(2906002)(186003)(6916009)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3327;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZjWQ/PFFdgqh8UI29f7ROhLfhW60Htk2jRR6UPb6Wqug6IKUzAbKC1mqSFwUzSoFyGvX8n0wnGwf9w5E3UXDAM1H5DnmC1/CXWImtmuEir5mgvAC9YjVqCSkK97iIgUPY6hdyt5FCMlH7dsr+2AaJ74bJZbOp5J/BJTDbkI/4CB6OXmNRFqPFbROijkAEq8HfO/97AY3x7zvYbK3CqkBrqrSLqw+JIcxy6PcK57CnZh86COa+KEcYAY3qGYKF0BmfpHYXZIM+o4hLVyVF329OBu2oG9eLjkRakCBvvkuxanzWq8GIhR+YFCToMAqL/26G6QH0yOJCUlYpTMCsNhKEHytXyjT5Dn694p4YDiv18FJxP5z8DlNksogYqafFIFXcyMZuNI1zirzU+hM18iSH9tRTtbA+e/D29ABoh0hqiE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeeb2cd-eecd-4699-bf00-08d6e28cc434
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 10:19:14.5007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3327
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aysI7BGzy6KLSyVHiTXRhxZh9MEGYdtjjv2YCYZl0oY=;
 b=jiEa4MnJBUXWuTflHqUK+m2Nv0qD6NYBGc5GOcc1C5MZlYdgjdDSqm84aTKVwSnzVs4U63h11wkLXCAIcK42HUM8cS6KiXD02nvqSGembW6/3e0vNZ+dZ+JU+X0QcXkoMNglPZexx5WGzjb9h/64AuvR2j0RDzHJpEta7cU0tFE=
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
