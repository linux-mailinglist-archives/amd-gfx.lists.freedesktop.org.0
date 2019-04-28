Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFEB590
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874689124;
	Sun, 28 Apr 2019 07:44:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810052.outbound.protection.outlook.com [40.107.81.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B3E890FE
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:06 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:04 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:04 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/27] drm/amdkfd: Add sdma allocation debug message
Thread-Topic: [PATCH 02/27] drm/amdkfd: Add sdma allocation debug message
Thread-Index: AQHU/ZYnA4iRk1LKGkanyEtACcdSfQ==
Date: Sun, 28 Apr 2019 07:44:04 +0000
Message-ID: <20190428074331.30107-3-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379c5f91-52ff-405c-8baf-08d6cbad4951
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933315EF83E2D7013F1E35592380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(4744005)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003)(15650500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Io7Mt/d9qJHsBo8LTSW8dha4MLg8x6m/DgOrYYyJIS/5SYfB5EHbmiv5xB2SU42lwE/pm6QAiJkBdZhveHwEpeodMI8dflFr6CDIxRf9OCyGTQbAfKhKgYVbm4Z+WVwMNJA1USDKvEtPQQ19iEDCgJ8mR7tfjzt3ghZolc/f3ZXO0pbQWkpM9eAOpkhkxe6PNFaf3zrH4ycUlEPE0XSKiEhUlbs5Dmj0Vrjv9uL4Kg9Z4wzDj+Yf4igIFH+z8ODz07hiA4kQXs7Uk7mTUeL5sQwGSCZ5AMOCbedDcJbIIUzZQQXrHZxxjC5lnvTXyVziSvOfgn8AEyzSTEqobVpXHcHzgWHKbNEfcRZut+io4dJEKjKOfA9yuOZuoaHPX6ABFFttttO34+xlvTNGElqhrPvE/SIcTwg9xL43d0hNpi0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379c5f91-52ff-405c-8baf-08d6cbad4951
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:04.6510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srcy2lDC56zRrwMOYkajkqKaPgV0QWuF2WUvWbEQn1s=;
 b=fTT24TCKYJWD8EUQtw1fYgFASDmIoCODLNsKvw9dXw6VtefUFWwS12fevH7hBS9UICW4VTe9rGPJzai3aOBRrPqO1hQYPZyZy/BRW+aHu11Noo/pj3DzcDmVE96eFrtbbDc8U1V43xypTrBHIbmAiE7ysz40OJv7ju67Tvs+s10=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQoNCkFkZCBkZWJ1ZyBtZXNzYWdlcyBk
dXJpbmcgU0RNQSBxdWV1ZSBhbGxvY2F0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8
T2FrLlplbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzICsrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMNCmluZGV4IDBiMTA0NGRlYTc2NS4uOTM3ZWQxYTcwNTBkIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5jDQpAQCAtMTE3Nyw2ICsxMTc3LDkgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3Bz
Y2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCiAJ
CQlxLT5zZG1hX2lkIC8gZ2V0X251bV9zZG1hX2VuZ2luZXMoZHFtKTsNCiAJCXEtPnByb3BlcnRp
ZXMuc2RtYV9lbmdpbmVfaWQgPQ0KIAkJCXEtPnNkbWFfaWQgJSBnZXRfbnVtX3NkbWFfZW5naW5l
cyhkcW0pOw0KKwkJcHJfZGVidWcoIlNETUEgaWQgaXM6ICAgICVkXG4iLCBxLT5zZG1hX2lkKTsN
CisJCXByX2RlYnVnKCJTRE1BIHF1ZXVlIGlkOiAlZFxuIiwgcS0+cHJvcGVydGllcy5zZG1hX3F1
ZXVlX2lkKTsNCisJCXByX2RlYnVnKCJTRE1BIGVuZ2luZSBpZDogJWRcbiIsIHEtPnByb3BlcnRp
ZXMuc2RtYV9lbmdpbmVfaWQpOw0KIAl9DQogDQogCXJldHZhbCA9IGFsbG9jYXRlX2Rvb3JiZWxs
KHFwZCwgcSk7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
