Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F446D85
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jun 2019 03:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6996C8941D;
	Sat, 15 Jun 2019 01:27:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF298941D
 for <amd-gfx@lists.freedesktop.org>; Sat, 15 Jun 2019 01:27:53 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2417.namprd12.prod.outlook.com (52.132.11.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Sat, 15 Jun 2019 01:27:52 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.013; Sat, 15 Jun 2019
 01:27:52 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 4/4] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVIxmMzW9Qz78yK06HukDPsrG5zQ==
Date: Sat, 15 Jun 2019 01:27:51 +0000
Message-ID: <1560562057-19810-4-git-send-email-Oak.Zeng@amd.com>
References: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1372741-1d5d-419d-f553-08d6f130aece
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2417; 
x-ms-traffictypediagnostic: BL0PR12MB2417:
x-microsoft-antispam-prvs: <BL0PR12MB241799683B5F5CD761582E4980E90@BL0PR12MB2417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(51234002)(199004)(189003)(6486002)(6116002)(72206003)(36756003)(14454004)(2906002)(6436002)(476003)(11346002)(6512007)(53936002)(5640700003)(14444005)(256004)(2351001)(64756008)(68736007)(3846002)(76176011)(446003)(6916009)(7736002)(52116002)(99286004)(305945005)(81166006)(66066001)(26005)(102836004)(25786009)(81156014)(4326008)(6506007)(486006)(73956011)(50226002)(54906003)(316002)(386003)(2501003)(2616005)(86362001)(5660300002)(66946007)(8676002)(66446008)(71200400001)(66476007)(71190400001)(478600001)(66556008)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2417;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ExOxxj5Grs7rXBYdoGR4PI2f6Xubi4eHwl8rMPHZKjMzxjAV22LIWA/yuFHX6x7vLA1sAgrzeQ9eHqC+0q930UUgmls854uGPlgIQJ4dMyJUzkf2HY2PA2iM5yv27HoH1fjsaBXTDxoZu8ok8LNZD8Dg/ftrJL+MQRgCX3DB4+4EnL6iilmEOedsnzFW38k80z0YfwGcj4LqRUHfDKOn7FfEoWB+eIWCAHpwvefwAJZbsOJ030f+bhOdbpB+J7mPAvU1qSs2IEASH6FHp/lgpl12rd4b0kVk7x/VUaPbJwh6ajnLHXC3qsAezB8SzlBrNrLDJKg2B6C3LOtskfN2So+TTXEgzCBC5ZlsDwc3SVrBsbUOw8rIPlzm+zDj/uUltwACgcHk5xDpIQ2N5Z1zzE1Y24RY3Ol+aJO7snLM4QU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1372741-1d5d-419d-f553-08d6f130aece
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 01:27:51.9673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pra6NQLVjdDaGzHYK/sfK8na8cNV7CVQeKEvAVEXw+8=;
 b=NcFXxJ4gjHtpla39UhiUNcr9QdHyZpvhcmCxxpggSTiBBUuQLtrANmwqEMnoT56kEuzFIda6gKQdejOXS5SzW7bFvxdc4Sz586GaHLAtlcIOzFGD9TA+fT/tbd17l1oQu8BgiczI1f4YZGdjdBFAd9qBs4KC0Y/5HwkSi2bw5rc=
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

U0RNQSBxdWV1ZSBhbGxvY2F0aW9uIHJlcXVpcmVzIHRoZSBkcW0gbG9jayBhcyBpdCBtb2RpZnkN
CnRoZSBnbG9iYWwgZHFtIG1lbWJlcnMuIEVuY2xvc2UgaXQgaW4gdGhlIGRxbV9sb2NrLg0KDQpD
aGFuZ2UtSWQ6IEkyZmQzN2E2MDYxM2MwNjMzM2UwOGZjZmU5MGI2ZGRiMzY3ZWE0M2VlDQpTaWdu
ZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgNyArKysrKystDQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
Yw0KaW5kZXggZTA3N2RiOC4uYjRhNWI0OCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAgLTExNDQsNyArMTE0
NCw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVf
bWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQogDQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5
cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSB8fA0KIAkJcS0+cHJvcGVydGllcy50eXBlID09IEtG
RF9RVUVVRV9UWVBFX1NETUFfWEdNSSkgew0KKwkJZHFtX2xvY2soZHFtKTsNCiAJCXJldHZhbCA9
IGFsbG9jYXRlX3NkbWFfcXVldWUoZHFtLCBxKTsNCisJCWRxbV91bmxvY2soZHFtKTsNCiAJCWlm
IChyZXR2YWwpDQogCQkJZ290byBvdXQ7DQogCX0NCkBAIC0xMjAzLDggKzEyMDUsMTEgQEAgc3Rh
dGljIGludCBjcmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0sIHN0cnVjdCBxdWV1ZSAqcSwNCiAJZGVhbGxvY2F0ZV9kb29yYmVsbChxcGQsIHEpOw0KIG91
dF9kZWFsbG9jYXRlX3NkbWFfcXVldWU6DQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZE
X1FVRVVFX1RZUEVfU0RNQSB8fA0KLQkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9U
WVBFX1NETUFfWEdNSSkNCisJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9T
RE1BX1hHTUkpIHsNCisJCWRxbV9sb2NrKGRxbSk7DQogCQlkZWFsbG9jYXRlX3NkbWFfcXVldWUo
ZHFtLCBxKTsNCisJCWRxbV91bmxvY2soZHFtKTsNCisJfQ0KIG91dDoNCiAJcmV0dXJuIHJldHZh
bDsNCiB9DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
