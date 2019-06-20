Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B44DB9B
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 22:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA216E7DB;
	Thu, 20 Jun 2019 20:50:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730075.outbound.protection.outlook.com [40.107.73.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030C66E7DB
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 20:50:01 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.11.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 20:49:58 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 20:49:58 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Topic: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Index: AQHVIsotz50EMl3zyE2mDAYgdJl9qqalDcTA
Date: Thu, 20 Jun 2019 20:49:58 +0000
Message-ID: <BL0PR12MB258031372BD105DB756ACB8380E40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1560527975-18868-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560527975-18868-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db7e0550-5631-43b9-8ae1-08d6f5c0db6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2404; 
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-microsoft-antispam-prvs: <BL0PR12MB2404FD74A5ECE2F8BC4A53EB80E40@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(13464003)(189003)(199004)(186003)(33656002)(6916009)(9686003)(476003)(2906002)(11346002)(5660300002)(52536014)(76176011)(68736007)(26005)(486006)(6246003)(316002)(66066001)(446003)(53546011)(6506007)(7696005)(99286004)(76116006)(53936002)(14454004)(74316002)(81166006)(66476007)(102836004)(81156014)(55016002)(73956011)(66446008)(66556008)(6116002)(4326008)(8676002)(478600001)(72206003)(5640700003)(3846002)(305945005)(7736002)(66946007)(6436002)(256004)(8936002)(71190400001)(2501003)(86362001)(25786009)(64756008)(71200400001)(229853002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HPgUqhFJtEvdcnyI5brjRnoYr3I/zINChv2vtDrGUzf2xzTq2HF+Nlx7+x6QbMERNT2Hcv8tJuNih/Q/kMNo0UtY0kvzBx2wU6moIgX17aserHen6OYHD5o7ZeicxdSB3XdtZZcbUKlbaJ7hKBtcFmr8uECdKRqWuMungprQaPF8OE2ABwEZSQCHd1mWAyQ4PapUG8uQ0eDi2j+fXNqNLJAsVXORCNkALs2fJLV4jYtbebvzSNyuma+uPHO2ZCg1UyoDmhUDcm7Tc4U/Mqgl4jOWvbDAT/DFVMjHbH3hskoQqo5soPQFMzJXjFCP/SLv3q74l8dT/A804z97ZRSIt8idzpiMOfDJSo9bUXerKU78MRue05u82Q8zgKlmFY9S2AKi54s12Y1aUGbnw2IPM0Bohx5jzW7dr1bTG8X6iYU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7e0550-5631-43b9-8ae1-08d6f5c0db6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 20:49:58.1775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhg8ErBsnF2wSIFQ5rXBXccObA5fKKeJvzJkIPUdMNM=;
 b=Y1I2APw1F+8MPfgtZyp5PRxLWBnbm4AxiY64czLxJKSieBBCwNbfBa8TZNvyK1Kw52jFM3w0FcEPQaHSxwR6sB9ibzmYVcNiWBsAa5FnQeKg2Up6uwO/0bXeMSmsVgZIAD6rCUkkYzIebN6fkE1NPdpI7xrmyzYXTJKA2efF5Ts=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRmVsaXgsDQoNCkNhbiB5b3UgdGFrZSBhIGxvb2sgb2YgdGhpcyBjaGFuZ2U/DQoNClJlZ2Fy
ZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFplbmcsIE9hayA8
T2FrLlplbmdAYW1kLmNvbT4gDQpTZW50OiBGcmlkYXksIEp1bmUgMTQsIDIwMTkgMTI6MDAgUE0N
ClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEt1ZWhsaW5nLCBGZWxpeCA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNvbT4NClN1
YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGtmZDogU2V0IGd3c19tYXNrIHRvIDY0IGJpdCAxcw0KDQpQ
cmV2aW91cyBrZmQgZG9lc24ndCB1c2UgZ3dzIHNvIHRoaXMgbWFzayB3YXMgc2V0IHRvIDAuDQpT
ZXQgaXQgdG8gNjQgYml0IDFzIGJlY2F1c2Ugbm93IGtmZCBjYW4gdXNlIGFsbCA2NCBnd3MgcmVz
b3VyY2VzLg0KDQpDaGFuZ2UtSWQ6IEljODIxN2Q2ZDEzNTA5OWYzMzk1MDE3YmJjOWMwZmU5NGE3
MzlhYTkzDQpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwg
NCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmMNCmluZGV4IGU1YzZkYjEuLjI1MDc5OGIgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC05
OTMsOCArOTkzLDggQEAgc3RhdGljIGludCBzZXRfc2NoZWRfcmVzb3VyY2VzKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KIA0KIAkJcmVzLnF1ZXVlX21hc2sgfD0gKDF1bGwgPDwg
aSk7DQogCX0NCi0JcmVzLmd3c19tYXNrID0gcmVzLm9hY19tYXNrID0gcmVzLmdkc19oZWFwX2Jh
c2UgPQ0KLQkJCQkJCXJlcy5nZHNfaGVhcF9zaXplID0gMDsNCisJcmVzLmd3c19tYXNrID0gMHhG
RkZGRkZGRkZGRkZGRkZGOw0KKwlyZXMub2FjX21hc2sgPSByZXMuZ2RzX2hlYXBfYmFzZSA9IHJl
cy5nZHNfaGVhcF9zaXplID0gMDsNCiANCiAJcHJfZGVidWcoIlNjaGVkdWxpbmcgcmVzb3VyY2Vz
OlxuIg0KIAkJCSJ2bWlkIG1hc2s6IDB4JThYXG4iDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
