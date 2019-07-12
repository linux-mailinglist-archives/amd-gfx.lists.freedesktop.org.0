Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE966750
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A396E2C8;
	Fri, 12 Jul 2019 07:00:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB136E2C8
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:00:19 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 07:00:18 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 07:00:18 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/powerplay: add socclk profile dpm support.
Thread-Topic: [PATCH 1/3] drm/amd/powerplay: add socclk profile dpm support.
Thread-Index: AQHVOH92+k+oozx+wkCLWdXlH4fntA==
Date: Fri, 12 Jul 2019 07:00:17 +0000
Message-ID: <20190712065959.25753-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::30) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87adc7bb-e46a-4d71-3499-08d7069698be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3392; 
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-microsoft-antispam-prvs: <MN2PR12MB3392336BAF42275FCED520D5A2F20@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(256004)(6506007)(86362001)(316002)(99286004)(54906003)(66476007)(66556008)(1076003)(2351001)(386003)(2501003)(53936002)(64756008)(66946007)(102836004)(6916009)(66446008)(52116002)(6512007)(71200400001)(478600001)(71190400001)(5640700003)(186003)(81166006)(4326008)(81156014)(8676002)(25786009)(6436002)(305945005)(486006)(7736002)(2616005)(476003)(50226002)(6486002)(14454004)(36756003)(66066001)(3846002)(6116002)(68736007)(26005)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3392;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /PxF27x+DCIxjGsUFoo9ADXcx4Ojeib5ruy/pzIF5GF2fkl6KZd1PYwMKWv7NSFcrYhxieb0oMfF8owPWZw8/9SK9myOOiNKzI/vu2t8s2ZTGBKtUc4ykzcyuHLef0d9gaOZTgPIv1kOe6BRM4q3JvHhZj9R/MglSXQMIU92+Rxzfeh1HWCdv82pqG19kT2Vvuk9B4u+qq8MbPcIPr/4gCzWMrCOJas4VmAAiWJq4ok067oxyx9840hA6pDnGyGJ0/qla/mlUHUikCFpyiBxjNUfLN3hqCDjuXB+Ty6vdWw87Db5ZdSUm9q56T7jlZeGILIhDrBDWeLMDwEWR0byZ0lLtJ352w+M0I1VKTn6iorxD/z+FmynOP4vgp5pPR63q0KtZv0/iZajaCPcjlyMHC7hRx4vZPGlTHwXGNYhakQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87adc7bb-e46a-4d71-3499-08d7069698be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 07:00:17.7825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joYynsGHRYeaYmSikIzVdk6w1U2ODTY7VGp0BlsZiek=;
 b=rZVRyByebtIEGwE+1VOoZFQG2OEV5d+noeVKfn4NXAew0WYMxxFmQFQo6U++xDUADySpSG96PY+RHaAOp10OeonK2/GWaf7Lk7habrZJSyCiV2iE64Tj+gVh9zVf0gZ9yzNIcXAYC4Q34DRuqpRle7HQT07OqGvSDLct7+BW48A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS5taXNzIHNvY2NsayBwcm9maWxlIHN1cHBvcnQgd2hlbiBicmluZ3VwLgoyLmFkZCBmZWF0dXJl
IGNoZWNrIGZvciBzb2NjbGsuCgpDaGFuZ2UtSWQ6IEk4ZjViOTJkYzgzODRmZDAzYjU0MGEyZjY1
NGJkNDBmMWViZjU2Yzg1ClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwg
NiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggZThhZTZmNWExNGFhLi5jZTc3YmIz
ZWNmZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAg
LTE0OCw2ICsxNDgsMTEgQEAgaW50IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCQkJcHJfd2FybigiZ2Z4
Y2xrIGRwbSBpcyBub3QgZW5hYmxlZFxuIik7CiAJCQlyZXR1cm4gMDsKIAkJfQorCWNhc2UgU01V
X1NPQ0NMSzoKKwkJaWYgKCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVf
RFBNX1NPQ0NMS19CSVQpKSB7CisJCQlwcl93YXJuKCJzb2NrY2xrIGRwbSBpcyBub3QgZW5hYmxl
ZFxuIik7CisJCQlyZXR1cm4gMDsKKwkJfQogCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsK
QEAgLTEzNDMsNiArMTM0OCw3IEBAIGludCBzbXVfYWRqdXN0X3Bvd2VyX3N0YXRlX2R5bmFtaWMo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJcmV0dXJuIHJldDsKIAkJCXNtdV9mb3JjZV9j
bGtfbGV2ZWxzKHNtdSwgU01VX1NDTEssIDEgPDwgc2Nsa19tYXNrKTsKIAkJCXNtdV9mb3JjZV9j
bGtfbGV2ZWxzKHNtdSwgU01VX01DTEssIDEgPDwgbWNsa19tYXNrKTsKKwkJCXNtdV9mb3JjZV9j
bGtfbGV2ZWxzKHNtdSwgU01VX1NPQ0NMSywgMSA8PCBzb2NfbWFzayk7CiAJCQlicmVhazsKIAog
CQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX01BTlVBTDoKLS0gCjIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
