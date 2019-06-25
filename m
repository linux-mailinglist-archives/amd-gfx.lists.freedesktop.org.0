Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D346555292
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 16:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7A6E0DD;
	Tue, 25 Jun 2019 14:53:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FCC6E0DD
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 14:53:14 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3269.namprd12.prod.outlook.com (20.179.93.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:53:10 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 14:53:10 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu/display: switch udelay to msleep
Thread-Topic: [PATCH 2/2] drm/amdgpu/display: switch udelay to msleep
Thread-Index: AQHVK14d+YNYRVinWkCKU4I2w2B8E6asdKmA
Date: Tue, 25 Jun 2019 14:53:09 +0000
Message-ID: <81e54eba-3d58-2a1f-c618-b4c98787663e@amd.com>
References: <20190625135830.26173-1-alexander.deucher@amd.com>
 <20190625135830.26173-2-alexander.deucher@amd.com>
In-Reply-To: <20190625135830.26173-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e00ae6d-12af-4d03-fffb-08d6f97cd6ec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3269; 
x-ms-traffictypediagnostic: BYAPR12MB3269:
x-microsoft-antispam-prvs: <BYAPR12MB326988DEDA664B80EF84588BECE30@BYAPR12MB3269.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(199004)(189003)(2501003)(66066001)(3846002)(6116002)(71200400001)(5660300002)(316002)(71190400001)(478600001)(110136005)(31696002)(86362001)(4326008)(25786009)(6246003)(53936002)(36756003)(72206003)(386003)(53546011)(6506007)(6512007)(99286004)(68736007)(8936002)(6486002)(229853002)(73956011)(11346002)(14454004)(446003)(52116002)(186003)(64756008)(66446008)(8676002)(66476007)(7736002)(66946007)(476003)(2616005)(102836004)(14444005)(256004)(26005)(66556008)(76176011)(6436002)(486006)(81166006)(81156014)(2906002)(305945005)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3269;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: guSSr7Fn0XydoGGuYPlR4mC98WU8hPs6C9gmM1vkA6klUTL+UE92gJo8p3lL4EdtPJqlq7TY9C6GrQ74abdnLg0L6lDsMRpCOz0ARX9BHK8hgpsYRwyw1/uitSGnaYvi/a0k0i9utnDrx0skOvO34dZ8VSsQ4JvB4rQHH3rUpWl6LvCNxVPLZ3Iy3TkJJA7HgUMfyH7zAJucVg1D0W/a8sAoPpILw8UMkmPSsVxz0d0G7hsK+GgGVr7R0Kkm6Rqq9UheYbR4nfnacQIkeF10bn5+ygmKa50VsOib7rRKYWnHp9Gwp7M3X3NwPGQdCJVOApwik/p+o0ilkAtC+tI8gW13IQzlC3Hd/AM3e1/MLxYN3V6B7hJVGiHbWO79uqEjPHW1G2dsl9LHEWOe8yroXRK2Ztq3XTE6HPmTTyiia9Y=
Content-ID: <7E9C5971172E894B94A601F2FAD32667@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e00ae6d-12af-4d03-fffb-08d6f97cd6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:53:09.8779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNCsnJMZw8faPSrxmrY3SJa6cxDUVfOloshkIE2tk8I=;
 b=zdRnP7mBre/lT+JyHEc4ucRsCPOkaGQ0Q1WFUbTkEd/iDv1HZGU7lrwDQCXTDxHad6gptPvJxsKnS3lXQs+RHob+o6e9G4RyGIijKZMrb50CmKksoMK0PRkBN91QLdoMqIwAjSx5czjVE66i3/bXyL+A841ROZbYR/tdI1EvgE4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNi8yNS8xOSA5OjU4IEFNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFdlIG1heSBuZWVkIHRv
IHNsZWVwIGZvciB1cCB0byA4MG1zOg0KPiANCj4gLyogRmlyc3QgRFBDRCByZWFkIGFmdGVyIFZE
RCBPTiBjYW4gZmFpbCBpZiB0aGUgcGFydGljdWxhciBib2FyZA0KPiAgICogZG9lcyBub3QgaGF2
ZSBIUEQgcGluIHdpcmVkIGNvcnJlY3RseS4gU28gaWYgRFBDRCByZWFkIGZhaWxzLA0KPiAgICog
d2hpY2ggaXQgc2hvdWxkIG5ldmVyIGhhcHBlbiwgcmV0cnkgYSBmZXcgdGltZXMuIFRhcmdldCB3
b3JzdA0KPiAgICogY2FzZSBzY2VuYXJpbyBvZiA4MCBtcy4NCj4gICAqLw0KPiANCj4gU3dpdGNo
IHVkZWxheSB0byBtc2xlZXAgdG8gYXZvaWQgbGltaXRzIG9uIGFybS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4N
Cg0KVGVjaG5pY2FsbHkgdGhpcyBzdGlsbCBtaXNtYXRjaGVzIHdoYXQgdGhlIGNvbW1lbnQgc2F5
cyBhYm92ZSB0aGUgYmxvY2ssIA0KYnV0IHRoaXMgcmV0YWlucyB0aGUgc2FtZSBiZWhhdmlvciBh
cyBiZWZvcmUuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jDQo+IGluZGV4IGQ2ZjhiZTY1NGMy
ZS4uYzE3ZGI1YzE0NGFhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jDQo+IEBAIC01NTAsNyArNTUwLDcgQEAgc3RhdGljIHZvaWQgcmVh
ZF9lZHBfY3VycmVudF9saW5rX3NldHRpbmdzX29uX2RldGVjdChzdHJ1Y3QgZGNfbGluayAqbGlu
aykNCj4gICAJCQlicmVhazsNCj4gICAJCX0NCj4gICANCj4gLQkJdWRlbGF5KDgwMDApOw0KPiAr
CQltc2xlZXAoOCk7DQo+ICAgCX0NCj4gICANCj4gICAJQVNTRVJUKHN0YXR1cyA9PSBEQ19PSyk7
DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
