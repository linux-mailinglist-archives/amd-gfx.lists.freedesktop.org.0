Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C502C56FE8
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 19:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40E6E4AE;
	Wed, 26 Jun 2019 17:50:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDB76E4AE
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 17:50:53 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1549.namprd12.prod.outlook.com (10.172.56.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 17:50:48 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::c4e2:cc4f:c8b9:71d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::c4e2:cc4f:c8b9:71d%5]) with mapi id 15.20.2008.018; Wed, 26 Jun 2019
 17:50:48 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: remove unnecessary warning message on gpu
 reset
Thread-Topic: [PATCH] drm/amdkfd: remove unnecessary warning message on gpu
 reset
Thread-Index: AQHVLEeUvlzsBTyP2USjut4BOyRdSKauNs0A
Date: Wed, 26 Jun 2019 17:50:48 +0000
Message-ID: <a9fa9777-c502-22f8-9cb7-97a082330eee@amd.com>
References: <1561571394-16348-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1561571394-16348-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f02dbc92-0f3d-49c6-391f-08d6fa5ed256
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1549; 
x-ms-traffictypediagnostic: MWHPR12MB1549:
x-microsoft-antispam-prvs: <MWHPR12MB15492F05D53CD96E43028F29EAE20@MWHPR12MB1549.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(376002)(39860400002)(189003)(199004)(316002)(3846002)(6116002)(4744005)(99286004)(6246003)(66946007)(14454004)(66476007)(66556008)(5660300002)(73956011)(110136005)(446003)(66446008)(52116002)(68736007)(76176011)(6436002)(6512007)(53936002)(2616005)(11346002)(7736002)(305945005)(14444005)(256004)(64756008)(72206003)(6486002)(229853002)(386003)(478600001)(6506007)(53546011)(26005)(71200400001)(86362001)(36756003)(31696002)(71190400001)(2906002)(486006)(8936002)(66066001)(81166006)(81156014)(8676002)(476003)(25786009)(186003)(31686004)(2501003)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1549;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XI/HAl3oilxHqVAL9OG6S1ZlLKor/BFfJ3f80hpuPrXbCQnxW1Vctb0TTSQIm5vDWaszV8aYMaS++/VMKywXWgSl8Wq8tHg6+lZexUekQgg6xC2oZiZwA3bHfumgZP/wrrkcnf85XMIfPNJn+Od2MqUYEVNNf1B2CW3kTZPkU+2W+BIY9Dt9llFvzveYIEyroiVvBqJ6n9Ai8cu5ixUa1jkurTQ/zJ66gxoimHpuGAnThU3uGJ/3kz1bbrrxsqrDl5OsjO0jLZHve74rvASJwDBesTCInY7kZDVSMSUeVWcyYG7Pczs0qD/PJygp8/1RApqruu8nC14xAKsUF/tzmdLohMrd2KhFMGOu+3fbvULE1uYKAqZ/V7fVc/BgP7+CeomTn2oF6MpJi2aU95IdwqgVSjL0sV+6bgd9C/Sfim8=
Content-ID: <79A14804C34F2B4AAAACF3E6B73FD876@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02dbc92-0f3d-49c6-391f-08d6fa5ed256
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 17:50:48.5672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1549
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9rmWKVs8Remgo5bipGBf+Lo+0sFoUECFgH7h/mBfZ8=;
 b=ytSAYceFMbdGcoavz6WrVOgAQwSzirCBrUAQkqUAfhLrU6ewVtGgqVDd2J0CF2uU4Jewt8Bg6oZ8rsa4p827Il57UZOZSzGLrcacRC8LLzKeEqcUnFT26ALcO3QjhEJ6GwBDNuzq9D/QwgZWlHwJOKxbUGz2hIzq0bI64sBag2A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pg0KDQpBbmRyZXkNCg0KT24gNi8yNi8xOSAxOjUwIFBNLCBMaXUsIFNoYW95dW4gd3JvdGU6DQo+
IEluIFhHTUkgY29uZmlndXJhdGlvbiwgbW9yZSB0aGFuIG9uZSBhc2ljIGNhbiBiZSByZXNldCBh
dCBzYW1lIHRpbWUsDQo+IGtmZCBpcyBhYmxlIHRvIGhhbmRsZSB0aGlzIGFuZCBubyBuZWVkIHRv
IHRyaWdnZXIgdGhlIHdhcm5pbmcNCj4NCj4gQ2hhbmdlLUlkOiBJZjMzOTUwMzg2MGU4NmVlMWRi
ZWVkMjk0YmExYzEwM2ZjY2U3MGI3Yg0KPiBTaWduZWQtb2ZmLWJ5OiBzaGFveXVubCA8c2hhb3l1
bi5saXVAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jIHwgMSAtDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiBpbmRleCAyNmVhNDZkLi4y
ZTJmNzI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+
IEBAIC03MzgsNyArNzM4LDYgQEAgaW50IGtnZDJrZmRfcG9zdF9yZXNldChzdHJ1Y3Qga2ZkX2Rl
diAqa2ZkKQ0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICAJY291bnQgPSBh
dG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7DQo+IC0JV0FSTl9PTkNFKGNvdW50ICE9IDAs
ICJLRkQgcmVzZXQgcmVmLiBlcnJvciIpOw0KPiAgIA0KPiAgIAlhdG9taWNfc2V0KCZrZmQtPnNy
YW1fZWNjX2ZsYWcsIDApOw0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
