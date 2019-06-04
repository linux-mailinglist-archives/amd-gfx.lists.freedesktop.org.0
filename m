Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB933D51
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 04:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4458E89286;
	Tue,  4 Jun 2019 02:52:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077AA89286
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 02:52:47 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2402.namprd12.prod.outlook.com (52.132.11.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 02:52:45 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 02:52:45 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Topic: [PATCH 2/6] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Index: AQHVGoCW1EZzTkYFD0ifGPc4Rzsk/Q==
Date: Tue, 4 Jun 2019 02:52:45 +0000
Message-ID: <1559616755-13116-2-git-send-email-Oak.Zeng@amd.com>
References: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80394fb9-d393-48ab-d2cf-08d6e897b852
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2402; 
x-ms-traffictypediagnostic: BL0PR12MB2402:
x-microsoft-antispam-prvs: <BL0PR12MB2402DE1A1BE274D588D3386B80150@BL0PR12MB2402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(446003)(11346002)(66066001)(68736007)(2351001)(8676002)(305945005)(53936002)(26005)(72206003)(7736002)(476003)(2616005)(14444005)(256004)(81156014)(76176011)(4326008)(86362001)(25786009)(386003)(6506007)(102836004)(2501003)(186003)(6916009)(5640700003)(36756003)(52116002)(8936002)(6512007)(6436002)(316002)(71200400001)(71190400001)(2906002)(54906003)(50226002)(478600001)(3846002)(6116002)(486006)(4744005)(6486002)(5660300002)(64756008)(14454004)(66556008)(66446008)(81166006)(99286004)(66946007)(66476007)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2402;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EMe0l0m5HRDlvUgXqdD9kFCvUyfNQSFR6wju4aUEu4ho7EnpO36CkEowlhx72V8zeOPuWBh8mep1AhW1m9lEvDMYloBAo1RxfqJUmjEECVn2/AKJ2Yrn+8OZxXwoRmRu1O2bc37wiNMJUv+GOJxXQ33Qn1xfDjqfjVZrfldzuIRn9A7Hs15/6jTLamqq2/iF7j9MiiSKNvkOmakfDwRJxcIToDk2HPxpJcrYPMHk1yn7nukb8gYu1NQKYgYnWUUwnVxBm+YUx6/kjzmTdgevnNfp5+KBGYmUSZdDVneReKTQ41mzj9Xkcv0i2Swqm3X2brDjcPR/8m8ltFUjudqkJYlT0m0oPc2Saz5hGuquZxTRBYS+GqBrYv6pVaLXZVNakb9UUbJKAjQLUC3TIvscqI6z0rPT9mnc+GW19lPBckY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80394fb9-d393-48ab-d2cf-08d6e897b852
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 02:52:45.3602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9rm4c3TVNF69fTUQ6oV/J/rkSmPR3rVrf/uF3E5LZc=;
 b=Q/w1mSLybRaHDhpJZooqyootCDcn6nG8078LHtApH/A/HnKnyjG4IDbLT68LQ6vN2Hl3GAX8pbG07NF1eagadHh7fljdYeSViO98uhr5WwO76dG8BWc4UNKrrx1RaZtFmSEi/04tcP90qDUESKdgXUlSP16kj8Fp/fp+Tv1HNkE=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
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
eCBlNWNiZjIxLi5kYzFhNzBiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtOTkwLDggKzk5MCwxMSBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9zZG1hX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0sDQogCWlmIChyZXR2YWwpDQogCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3Ji
ZWxsOw0KIA0KKwlpZiAoIXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KKwkJcmV0dXJuIDA7DQor
DQogCXJldHZhbCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgMCwgMCwgJnEt
PnByb3BlcnRpZXMsDQotCQkJCU5VTEwpOw0KKwkJCQljdXJyZW50LT5tbSk7DQogCWlmIChyZXR2
YWwpDQogCQlnb3RvIG91dF91bmluaXRfbXFkOw0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
