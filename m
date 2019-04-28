Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C325B593
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0278989139;
	Sun, 28 Apr 2019 07:44:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810045.outbound.protection.outlook.com [40.107.81.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92B89101
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:07 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:06 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:06 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/27] drm/amdkfd: Fix a potential memory leak
Thread-Topic: [PATCH 05/27] drm/amdkfd: Fix a potential memory leak
Thread-Index: AQHU/ZYop2iU36dhbUOTZzvYQ/jYaQ==
Date: Sun, 28 Apr 2019 07:44:06 +0000
Message-ID: <20190428074331.30107-6-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: f5072a20-7dad-472a-d50e-08d6cbad4ad7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933E08E46C8820B1CFB158892380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +DxH1cbwvnJMSPWP871A7XF0ISZu4TMRVfS9UyElzuoqMuYFml4n1OxO9RvFNOcUDOpXhKEL6v+t6353X7ud1X9pZWJuaqnu3a7Vokwu0vKF2AGfN8wh+OXWx4lZcsydJHPPdW7IZU63oGHC9Ewop+lwcloJJL5GE+MF5Wx1XPkjkDOREz8qYAYnY6ji1M4CRWJNd1wAAduO2OmsHlYHRDcr+DcNBw5p9T/sYlbaRrwEQ+R/NnBoONJPYgOeR1NCQIVZ1HVWV1CIjW5WyOCZIDdoYeUdfUuCHde5tMOUE5/uiGDRwBamPKaRyPtvBE0o7EOIbEXtf7+rxsadZ8xrVszvUkPZXwG2GbRuzqGxlTUBtEAnGqnd8Dn12A+Ysa5nfdgjwCzykRfTONSRsrFJ/yS14NuI00fDd4S+Wk/vjy4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5072a20-7dad-472a-d50e-08d6cbad4ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:06.7765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEUyP2l0A2Ur9MYJZOuf+HnCb4UikLaqD+UCLtJRD2Q=;
 b=1Zxx3kvtQprFwGZXttD8aGS922V54BC6jkVYdHp/snQneLV4gNmKMKzQBv6UXCV9CFkY99DrCSvwK+e3WAP4N7d7J3/3Vftcy1NqcFeUzorgaEay6vNxWclLJTED8gFKLUMJobAgoZmBH3EWnW6rdfHKR+Ws8jlllc6/mQHqPPY=
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

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQoNCkZyZWUgbXFkX21lbV9vYmogaXQgR1RU
IGJ1ZmZlciBhbGxvY2F0aW9uIGZvciBNUUQrY29udHJvbCBzdGFjayBmYWlscy4NCg0KU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVo
bGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92OS5jIHwgNSArKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3Y5LmMNCmluZGV4IDlkYmJhNjA5NDUwZS4uOGZlNzRi
ODIxYjMyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9t
YW5hZ2VyX3Y5LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFu
YWdlcl92OS5jDQpAQCAtNzYsNiArNzYsNyBAQCBzdGF0aWMgaW50IGluaXRfbXFkKHN0cnVjdCBt
cWRfbWFuYWdlciAqbW0sIHZvaWQgKiptcWQsDQogCXN0cnVjdCB2OV9tcWQgKm07DQogCXN0cnVj
dCBrZmRfZGV2ICprZmQgPSBtbS0+ZGV2Ow0KIA0KKwkqbXFkX21lbV9vYmogPSBOVUxMOw0KIAkv
KiBGcm9tIFY5LCAgZm9yIENXU1IsIHRoZSBjb250cm9sIHN0YWNrIGlzIGxvY2F0ZWQgb24gdGhl
IG5leHQgcGFnZQ0KIAkgKiBib3VuZGFyeSBhZnRlciB0aGUgbXFkLCB3ZSB3aWxsIHVzZSB0aGUg
Z3R0IGFsbG9jYXRpb24gZnVuY3Rpb24NCiAJICogaW5zdGVhZCBvZiBzdWItYWxsb2NhdGlvbiBm
dW5jdGlvbi4NCkBAIC05Myw4ICs5NCwxMCBAQCBzdGF0aWMgaW50IGluaXRfbXFkKHN0cnVjdCBt
cWRfbWFuYWdlciAqbW0sIHZvaWQgKiptcWQsDQogCX0gZWxzZQ0KIAkJcmV0dmFsID0ga2ZkX2d0
dF9zYV9hbGxvY2F0ZShtbS0+ZGV2LCBzaXplb2Yoc3RydWN0IHY5X21xZCksDQogCQkJCW1xZF9t
ZW1fb2JqKTsNCi0JaWYgKHJldHZhbCAhPSAwKQ0KKwlpZiAocmV0dmFsKSB7DQorCQlrZnJlZSgq
bXFkX21lbV9vYmopOw0KIAkJcmV0dXJuIC1FTk9NRU07DQorCX0NCiANCiAJbSA9IChzdHJ1Y3Qg
djlfbXFkICopICgqbXFkX21lbV9vYmopLT5jcHVfcHRyOw0KIAlhZGRyID0gKCptcWRfbWVtX29i
aiktPmdwdV9hZGRyOw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
