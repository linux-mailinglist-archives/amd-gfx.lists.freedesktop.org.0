Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C953E7561C
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 19:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C636E7E2;
	Thu, 25 Jul 2019 17:48:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB6B6E7E2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 17:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ4VSZ0iik6xoMI7tFhIVrbxi0cV1fZSKDI/p+Ns1BxqjihROJOM0EWKS2M5Ybh2rxPzYg/nHMNJlSA/JSAcexbz9jIWGgTRlTgGHKV3hbKGCPYOeDh9w1sC+7U56tAaGz/6woiXPGbdOBypG36e/ZFI867aBk7GCz7V5ypQnKFx3XkgKhedtwlW5VotPiyqNN/PxMxUKq99tPjV5mZhgFUelYhMmdpABRbTsXJ8gpXdddWrgVATJxPwljU+LZTdKuhD+s9SjDAAh4nCyra9yhnkQqTuEfcv2MkbgaLa3eN7i3xyU3rJM1sbwsg09X0jIPuM7milCIy9W36GPcZ28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlplf7P7ZpUc63etHDDDffq/EyKuHf8GuJUmjvWBPzw=;
 b=i3fxwzMtRHBohfc8v50gbhkDLzSq4v9VIHDDsMuFa6aC6EDu8Q79LuvumMGWmO+rWbDLro2YWr/iNPK6/OZEc9SI5Nj33gWkLOz5yYSV370J+7UMLcBcdaGbSy+E0MrWzwCl+ev1asOVN2YLtyGZd/h/SmW6nQHGxoMrUybcm2T7fk/ElGJNFy2YfAGXA8mlMOgMxgqRTavTN7FeI9qRUzF11asK8N5ItsGjTyf2HLQD+QfCUQavCa1Xj1XTIRagGFyyLY4Q37kwu8DYxNZZKaQ5OcT913X/gG+hT4jhJ9agJNBN5Q/VrYVvpGDJZ5oFAKts8yX/N54HTamEIdt9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3030.namprd12.prod.outlook.com (20.178.53.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 17:48:19 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 17:48:19 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: Use switch table for dc_to_smu_clock_type
Thread-Topic: [PATCH] drm/amd/display: Use switch table for
 dc_to_smu_clock_type
Thread-Index: AQHVQxASIWAURH3GCEu87yL5Oty+CqbbnCeA
Date: Thu, 25 Jul 2019 17:48:19 +0000
Message-ID: <aa203078-1655-1fdf-6aad-7a4879c0f883@amd.com>
References: <20190725174029.27009-1-sunpeng.li@amd.com>
In-Reply-To: <20190725174029.27009-1-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c8c95d8-8da6-4de9-2f96-08d7112847a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3030; 
x-ms-traffictypediagnostic: BYAPR12MB3030:
x-microsoft-antispam-prvs: <BYAPR12MB3030687FE984EC2B7ED64713ECC10@BYAPR12MB3030.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(3846002)(14454004)(6116002)(2906002)(6506007)(386003)(66476007)(36756003)(66066001)(102836004)(305945005)(6436002)(66946007)(25786009)(68736007)(486006)(446003)(11346002)(31696002)(6486002)(2501003)(53936002)(229853002)(476003)(2616005)(86362001)(7736002)(186003)(8936002)(6246003)(71190400001)(110136005)(99286004)(8676002)(6636002)(4326008)(81156014)(316002)(26005)(81166006)(64756008)(66556008)(256004)(5660300002)(66446008)(6512007)(53546011)(71200400001)(478600001)(76176011)(31686004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3030;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: agCXTCUBSJf40GKeZW9ZV32E5xMimZjoXvsvq4MjuTP7mbaC/RbPcH4eQHZUFRDkxa3wwX/Wn3JGqCY0KQrvd8OB8QkbtZydBO+U4iI+h1iuw/Ts/uqPLhIZtVB4aLqibWWUsA+JFLXhGYRZDeClUqplS2Zd2uwEiOafYiQbtdq8FiASLxNTWfh4+9T1zE+NcgqmlNhyBf7bR2mkZKU+Nc2o07TBqnGGBuWYGraSYIarKYUbZjicBp6Qg7aeBeGjECCuK8virpsa5Vd+gSzPHEiUlhW+VL+my/x8Y1eEETUfeGzqMqU3NQlFBkLZ7VQTvoV26ptge7aw7SWvJPSMNItVx8UapDEC1kjq8QL762iv4I4k1Ozrl6IZXGloFWKrvcYfPUXTPtZZKA9GLSbZCJ7NhhwMvWU539FFs1MC6XY=
Content-ID: <E9BAC489B874BB4A814FA40E0999FBC6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8c95d8-8da6-4de9-2f96-08d7112847a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 17:48:19.7268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlplf7P7ZpUc63etHDDDffq/EyKuHf8GuJUmjvWBPzw=;
 b=P4cxofJedhHr0NQEqqK1lDVIKT8/eeuc/S1amB4CGh7YvJ5FW/0xftlNDZhz2aefjUT60wN1EtPWc+7qm8WhPxOMqvgQokyLVqak7kn7VTZwsHOvQ3kqWXDUrrmi7CwOL1lVbqBs9Vf9PdWf2zcXNmLZtjqSeREIkN2TpSL3cBo=
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
Cc: "natechancellor@gmail.com" <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSAxOjQwIFBNLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPiANCj4gVXNpbmcgYSBzdGF0aWMgaW50IGFycmF5
IHdpbGwgY2F1c2UgZXJyb3JzIGlmIHRoZSBnaXZlbiBkbV9wcF9jbGtfdHlwZQ0KPiBpcyBvdXQt
b2YtYm91bmRzLiBGb3Igcm9idXN0bmVzcywgdXNlIGEgc3dpdGNoIHRhYmxlLCB3aXRoIGEgZGVm
YXVsdA0KPiBjYXNlIHRvIGhhbmRsZSBhbGwgaW52YWxpZCB2YWx1ZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgIHwgMzggKysrKysrKysrKysrKy0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9wcF9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jDQo+IGluZGV4IDIwZTgyYzlmNmQ2Ny4uZGYxZWZiODIz
OGQ2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9wcF9zbXUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYw0KPiBAQCAtMTUyLDE4ICsxNTIsMzIgQEAgc3Rh
dGljIHZvaWQgZ2V0X2RlZmF1bHRfY2xvY2tfbGV2ZWxzKA0KPiAgIHN0YXRpYyBlbnVtIHNtdV9j
bGtfdHlwZSBkY190b19zbXVfY2xvY2tfdHlwZSgNCj4gICAJCWVudW0gZG1fcHBfY2xvY2tfdHlw
ZSBkbV9wcF9jbGtfdHlwZSkNCj4gICB7DQo+IC0jZGVmaW5lIERDQ0xLX01BUF9TTVVDTEsoZGNj
bGssIHNtdWNsaykgXA0KPiAtCVtkY2Nsa10gPSBzbXVjbGsNCj4gLQ0KPiAtCXN0YXRpYyBpbnQg
ZGNfY2xrX3R5cGVfbWFwW10gPSB7DQo+IC0JCURDQ0xLX01BUF9TTVVDTEsoRE1fUFBfQ0xPQ0tf
VFlQRV9ESVNQTEFZX0NMSywJU01VX0RJU1BDTEspLA0KPiAtCQlEQ0NMS19NQVBfU01VQ0xLKERN
X1BQX0NMT0NLX1RZUEVfRU5HSU5FX0NMSywJU01VX0dGWENMSyksDQo+IC0JCURDQ0xLX01BUF9T
TVVDTEsoRE1fUFBfQ0xPQ0tfVFlQRV9NRU1PUllfQ0xLLAlTTVVfTUNMSyksDQo+IC0JCURDQ0xL
X01BUF9TTVVDTEsoRE1fUFBfQ0xPQ0tfVFlQRV9EQ0VGQ0xLLAlTTVVfRENFRkNMSyksDQo+IC0J
CURDQ0xLX01BUF9TTVVDTEsoRE1fUFBfQ0xPQ0tfVFlQRV9TT0NDTEssCVNNVV9TT0NDTEspLA0K
PiAtCX07DQo+IC0NCj4gLQlyZXR1cm4gZGNfY2xrX3R5cGVfbWFwW2RtX3BwX2Nsa190eXBlXTsN
Cj4gKwllbnVtIHNtdV9jbGtfdHlwZSBzbXVfY2xrX3R5cGUgPSAwOw0KDQpUaGlzIHNob3VsZG4n
dCBiZSAwLCBidXQgYW4gYWN0dWFsIHZhbHVlIGZyb20gdGhlIGVudW0uDQoNClJpZ2h0IG5vdyB0
aGlzIG1vZGlmaWVzIEdGWCBjbG9jayBpZiB0aGUgY2xvY2sgaXMgaW52YWxpZCwgYnV0IHdlIHNo
b3VsZCANCnByb2JhYmx5IGJlIHJldHVybmluZyBTTVVfQ0xLX0NPVU5UIGluc3RlYWQuDQoNCk5p
Y2hvbGFzIEthemxhdXNrYXMNCg0KPiArDQo+ICsJc3dpdGNoIChkbV9wcF9jbGtfdHlwZSkgew0K
PiArCWNhc2UgRE1fUFBfQ0xPQ0tfVFlQRV9ESVNQTEFZX0NMSzoNCj4gKwkJc211X2Nsa190eXBl
ID0gU01VX0RJU1BDTEs7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgRE1fUFBfQ0xPQ0tfVFlQRV9F
TkdJTkVfQ0xLOg0KPiArCQlzbXVfY2xrX3R5cGUgPSBTTVVfR0ZYQ0xLOw0KPiArCQlicmVhazsN
Cj4gKwljYXNlIERNX1BQX0NMT0NLX1RZUEVfTUVNT1JZX0NMSzoNCj4gKwkJc211X2Nsa190eXBl
ID0gU01VX01DTEs7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgRE1fUFBfQ0xPQ0tfVFlQRV9EQ0VG
Q0xLOg0KPiArCQlzbXVfY2xrX3R5cGUgPSBTTVVfRENFRkNMSzsNCj4gKwkJYnJlYWs7DQo+ICsJ
Y2FzZSBETV9QUF9DTE9DS19UWVBFX1NPQ0NMSzoNCj4gKwkJc211X2Nsa190eXBlID0gU01VX1NP
Q0NMSzsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJRFJNX0VSUk9SKCJETV9QUExJ
QjogaW52YWxpZCBjbG9jayB0eXBlOiAlZCFcbiIsDQo+ICsJCQkgIGRtX3BwX2Nsa190eXBlKTsN
Cj4gKwkJc211X2Nsa190eXBlID0gMDsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIHNtdV9jbGtfdHlwZTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGVudW0gYW1kX3BwX2Ns
b2NrX3R5cGUgZGNfdG9fcHBfY2xvY2tfdHlwZSgNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
