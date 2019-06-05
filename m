Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866A360C8
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B7D89C82;
	Wed,  5 Jun 2019 16:06:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8205189C7F
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:06:47 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2561.namprd12.prod.outlook.com (52.132.27.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 16:06:45 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 16:06:45 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Topic: [PATCH 2/6] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Index: AQHVG7isIH9ZNLDEnU60Ve2hxxrP4Q==
Date: Wed, 5 Jun 2019 16:06:45 +0000
Message-ID: <1559750793-16608-2-git-send-email-Oak.Zeng@amd.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f4b9356-453a-4697-7a21-08d6e9cfce6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2561; 
x-ms-traffictypediagnostic: BL0PR12MB2561:
x-microsoft-antispam-prvs: <BL0PR12MB2561ADAA9593769F8BF25DB380160@BL0PR12MB2561.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(54906003)(66066001)(6116002)(8676002)(81156014)(81166006)(3846002)(8936002)(4326008)(4744005)(50226002)(316002)(25786009)(6486002)(2906002)(476003)(36756003)(66446008)(64756008)(66476007)(73956011)(6916009)(71190400001)(71200400001)(66946007)(7736002)(6436002)(86362001)(2501003)(53936002)(102836004)(6506007)(5660300002)(386003)(305945005)(26005)(14454004)(68736007)(5640700003)(186003)(2351001)(76176011)(478600001)(99286004)(2616005)(14444005)(486006)(72206003)(66556008)(11346002)(52116002)(256004)(446003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2561;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CI2dbIoN5Yiuq8Rv/MGSLSCffswn6RWph7EKMpMB7L9AoFqMYA2OYKHe/oyj4ymOtkHet3y2d6wq7pMj6+WVd7hqoPFazU8AEEecwRL8E3SN67wr8I4YdKB/WF+5mEsxC4cpjuDjG4dUqV1k3V3ZMdibGRRARLXejBMOveozpdNQQnPo4UERooDp/hH2nG2Duef/S72oqt4aJEZk0wlEyV4usXQAcTAts1RdevjFsdEDssoet2okZ5CUBWctqliYQnpupxhR/YFaMYDoIdUeFFHJWjCzZ33a5/MXPqyLxMeGBldcbk9BUrVDHRGU2jxZOdBESA3CO/KmYNVtjMCW4kCeBO44OtI3KYa0LEmPDLscyfaRB1d3LFgJE1y15b0RXdPppsDz3MFE6TX+y/33DoYQV/LRD4YaNd/oQ8vPyW4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4b9356-453a-4697-7a21-08d6e9cfce6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 16:06:45.2964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2561
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t0T1fV0KkWOcRgKEBtZiJs/JKpPKPemVSIOoYaXIS4=;
 b=WWGMK2L3aOvf/WrI9Z5xydtmKDAd6cLWJk6wuRBL3Cc4oWYhHItHHcAAH6AzaEMjTE8PSbcKgIBoQ1/eP7PYXow2qV5GE5VRvNX/KBHn+3Y8YRF4gdt3WQCCWGtk0FY902Yq8/UjgNSj++UTYrDIgvS4emG/JsLVcYJQslEEmrY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxzbyBjYWxscyBsb2FkX21xZCB3aXRoIGN1cnJlbnQtPm1tIHN0cnVjdC4gVGhlIG1tDQpzdHJ1
Y3QgaXMgdXNlZCB0byByZWFkIGJhY2sgdXNlciB3cHRyIG9mIHRoZSBxdWV1ZS4NCg0KQ2hhbmdl
LUlkOiBJMGY2ZDA4NTg3ODM1OGRjZDNhNDEzMDU0ZGJlNjFkMWNhMGZkZjY2ZA0KU2lnbmVkLW9m
Zi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDUgKysrKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRl
eCAwMGNhM2RkLi5kYWI2ZWY0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtOTk1LDggKzk5NSwxMSBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9zZG1hX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0sDQogCWlmIChyZXR2YWwpDQogCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3Ji
ZWxsOw0KIA0KKwlpZiAoIXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KKwkJcmV0dXJuIDA7DQor
DQogCXJldHZhbCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgMCwgMCwgJnEt
PnByb3BlcnRpZXMsDQotCQkJCU5VTEwpOw0KKwkJCQljdXJyZW50LT5tbSk7DQogCWlmIChyZXR2
YWwpDQogCQlnb3RvIG91dF91bmluaXRfbXFkOw0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
