Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AA3BDC2
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 22:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3574890B2;
	Mon, 10 Jun 2019 20:48:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516BD890AD
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 20:48:42 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2579.namprd12.prod.outlook.com (52.132.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Mon, 10 Jun 2019 20:48:41 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 20:48:41 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Add device to topology after it is completely
 inited
Thread-Topic: [PATCH 2/2] drm/amdkfd: Add device to topology after it is
 completely inited
Thread-Index: AQHVH83i/etE5MNPEkuB6B4GOwnJxg==
Date: Mon, 10 Jun 2019 20:48:40 +0000
Message-ID: <1560199712-15472-2-git-send-email-Oak.Zeng@amd.com>
References: <1560199712-15472-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560199712-15472-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6070b91b-154b-4901-b045-08d6ede504f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2579; 
x-ms-traffictypediagnostic: BL0PR12MB2579:
x-microsoft-antispam-prvs: <BL0PR12MB2579DEF654FAA0B2DE7F4B3180130@BL0PR12MB2579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(199004)(189003)(99286004)(11346002)(68736007)(2616005)(446003)(81166006)(305945005)(7736002)(476003)(26005)(8936002)(81156014)(186003)(54906003)(8676002)(50226002)(102836004)(6506007)(72206003)(76176011)(386003)(86362001)(14454004)(52116002)(6512007)(486006)(478600001)(5660300002)(2351001)(66066001)(71190400001)(5640700003)(66446008)(316002)(71200400001)(53936002)(6116002)(66946007)(66476007)(64756008)(3846002)(6486002)(6436002)(6916009)(2906002)(25786009)(14444005)(256004)(2501003)(66556008)(73956011)(36756003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2579;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U5Cnm07LxWX/lnADOom51LXb7MwfsyEhTypyvpL6fCGlawvmnWhr7TerwbiothCl5JALKCqh/w32ZZuZCEvNKKxIPeZr/3/NUfbtLDCF9FMWh2mReGbr9ITHQUXmWBKHWJRYks4dgiasxlTy/6VOAunb+mLBE/aMjhO+fkz7ky4BKxh3xC18tet374RxQW4XY6VdK7PdC05PHWT2ZTgPoEobUPn+5fjF5EhAJnkrAfl2DkrM/+jMj4DfmlF84JoY/qV1PryuoxWdtaIAl1WnduSiSSwA7feXMkQiz4gHTwAJVJpLsvVZShStkxUagKHRZTp0vUOv2yEV3NcnFE7e5Q2Mk2oiqHiP7dQ4jJxQkiADoIZVfYAz9svSGKH0WILlD9p1+YcUaSGZErd40I9Jr9YHHZCBX/TMNU4MVyPI29k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6070b91b-154b-4901-b045-08d6ede504f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 20:48:40.9434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adFLhypVammr7+FBzsCfZHYcWBq5jJAQYdvtMo9cIKA=;
 b=g2bbhQTAGnT0ravDk65VP15rXjz9u80dyIQE/eUJHaPH00tJr0XK/NgSkDwy1o6NAPSDYQpFjmWWusRvROGxEVoQxyXxCDLS5d0CiToeVaC4pRzokiSFAzutrjrrQ2WKqacyfM82mBQ6dlCfYWmB7YBTv1iLzRCgrhOF40WIWbU=
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
 Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgaGF2ZSBkZXZpY2VzIHRoYXQgYXJlIG5vdCBjb21wbGV0ZWx5IGluaXRpYWxpemVk
IGluIGtmZCB0b3BvbG9neS4NCk90aGVyd2lzZSBpdCBpcyBhIHJhY2UgY29uZGl0aW9uIHdoZW4g
dXNlciBhY2Nlc3Mgbm90IGNvbXBsZXRlbHkNCmluaXRpYWxpemVkIGRldmljZS4gVGhpcyBhbHNv
IGFkZHJlc3NlcyBhIGtmZF90b3BvbG9neV9hZGRfZGV2aWNlIGFjY2Vzc2luZw0KTlVMTCBkcW0g
cG9pbnRlciBpc3N1ZS4NCg0KQ2hhbmdlLUlkOiBJNTNhMGZlNDk4ZTZkYWFlYjYzYWE4ZDc4MzYy
ZGYwMTk1NWYxNGEyZg0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+
DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAxMyArKysr
KystLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KaW5kZXggOWQxYjAy
Ni4uZWJhYzdkNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQpA
QCAtNjAzLDExICs2MDMsNiBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9k
ZXYgKmtmZCwNCiAJaWYgKGtmZC0+a2ZkMmtnZC0+Z2V0X2hpdmVfaWQpDQogCQlrZmQtPmhpdmVf
aWQgPSBrZmQtPmtmZDJrZ2QtPmdldF9oaXZlX2lkKGtmZC0+a2dkKTsNCiANCi0JaWYgKGtmZF90
b3BvbG9neV9hZGRfZGV2aWNlKGtmZCkpIHsNCi0JCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9y
IGFkZGluZyBkZXZpY2UgdG8gdG9wb2xvZ3lcbiIpOw0KLQkJZ290byBrZmRfdG9wb2xvZ3lfYWRk
X2RldmljZV9lcnJvcjsNCi0JfQ0KLQ0KIAlpZiAoa2ZkX2ludGVycnVwdF9pbml0KGtmZCkpIHsN
CiAJCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9yIGluaXRpYWxpemluZyBpbnRlcnJ1cHRzXG4i
KTsNCiAJCWdvdG8ga2ZkX2ludGVycnVwdF9lcnJvcjsNCkBAIC02MzEsNiArNjI2LDExIEBAIGJv
b2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KIA0KIAlrZmQtPmRi
Z21nciA9IE5VTEw7DQogDQorCWlmIChrZmRfdG9wb2xvZ3lfYWRkX2RldmljZShrZmQpKSB7DQor
CQlkZXZfZXJyKGtmZF9kZXZpY2UsICJFcnJvciBhZGRpbmcgZGV2aWNlIHRvIHRvcG9sb2d5XG4i
KTsNCisJCWdvdG8ga2ZkX3RvcG9sb2d5X2FkZF9kZXZpY2VfZXJyb3I7DQorCX0NCisNCiAJa2Zk
LT5pbml0X2NvbXBsZXRlID0gdHJ1ZTsNCiAJZGV2X2luZm8oa2ZkX2RldmljZSwgImFkZGVkIGRl
dmljZSAleDoleFxuIiwga2ZkLT5wZGV2LT52ZW5kb3IsDQogCQkga2ZkLT5wZGV2LT5kZXZpY2Up
Ow0KQEAgLTY0MCwxNCArNjQwLDEzIEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qg
a2ZkX2RldiAqa2ZkLA0KIA0KIAlnb3RvIG91dDsNCiANCitrZmRfdG9wb2xvZ3lfYWRkX2Rldmlj
ZV9lcnJvcjoNCiBrZmRfcmVzdW1lX2Vycm9yOg0KIGRldmljZV9pb21tdV9lcnJvcjoNCiAJZGV2
aWNlX3F1ZXVlX21hbmFnZXJfdW5pbml0KGtmZC0+ZHFtKTsNCiBkZXZpY2VfcXVldWVfbWFuYWdl
cl9lcnJvcjoNCiAJa2ZkX2ludGVycnVwdF9leGl0KGtmZCk7DQoga2ZkX2ludGVycnVwdF9lcnJv
cjoNCi0Ja2ZkX3RvcG9sb2d5X3JlbW92ZV9kZXZpY2Uoa2ZkKTsNCi1rZmRfdG9wb2xvZ3lfYWRk
X2RldmljZV9lcnJvcjoNCiAJa2ZkX2Rvb3JiZWxsX2Zpbmkoa2ZkKTsNCiBrZmRfZG9vcmJlbGxf
ZXJyb3I6DQogCWtmZF9ndHRfc2FfZmluaShrZmQpOw0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
