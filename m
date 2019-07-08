Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4101162584
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 18:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0689EF7;
	Mon,  8 Jul 2019 16:00:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FDE89EF7
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 16:00:52 +0000 (UTC)
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2597.namprd12.prod.outlook.com (20.176.255.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 16:00:51 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69%3]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 16:00:51 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Topic: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Index: AQHVM3IYc6NZ+CX1eECxUCc6u7Xv/abA5bqA
Date: Mon, 8 Jul 2019 16:00:51 +0000
Message-ID: <d3e236e2-e2f6-ecbb-b654-1911e926f19a@amd.com>
References: <20190705204142.10231-1-alexander.deucher@amd.com>
In-Reply-To: <20190705204142.10231-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bb91298-d639-4cb7-d9b0-08d703bd7355
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2597; 
x-ms-traffictypediagnostic: BYAPR12MB2597:
x-microsoft-antispam-prvs: <BYAPR12MB2597461BD18FDDDFF731A06E82F60@BYAPR12MB2597.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(189003)(199004)(229853002)(4326008)(186003)(2616005)(446003)(11346002)(66556008)(102836004)(66946007)(66476007)(68736007)(73956011)(64756008)(66446008)(52116002)(99286004)(386003)(6506007)(53546011)(486006)(2906002)(86362001)(25786009)(31696002)(14454004)(2501003)(36756003)(6486002)(476003)(6246003)(26005)(81166006)(31686004)(81156014)(6512007)(6436002)(478600001)(305945005)(8676002)(7736002)(8936002)(14444005)(5660300002)(256004)(316002)(53936002)(66066001)(76176011)(110136005)(3846002)(72206003)(71200400001)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2597;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sQSKsnHr3EbD42GSQ4MxN29G3x1G3n1bAj/14wwuXg5uRF2ikpl1kNYXHHFyp9/tzkQbk0UtXsuC4QWwO/2OC4/4IJGPPApaPYjKMbAsx5jD74nt3nidRsWND1sU5ulSckg0w11hc/1PWBLhj1zx9/VV6DDr72GJOSgW9NNraIxt60UbHbPlhKfSuWEqcj91hOCKFYplP3CCA8EbZiQ0I560p7Oh502t+3fiy6e7LMyMEn2WW1kA/1IymCEmpVV5AVRwOZ9hHb69GlzGB6uojHn7G4OoBpsDjU4+qy3CTTOgn7R6umiR2T2h1twC5QBufOiqk2kDYbI3B0I0/h15v9l8pbQWpnQWo0tuo40EJ2ZPKfVQknk3sQwL+WZFgS+7FIf4Y7ToocivjDSUI9pa4OeXIkoOOo564zvGeYxhr4E=
Content-ID: <92636908E044B447A19F2CA7EF1B9544@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb91298-d639-4cb7-d9b0-08d703bd7355
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 16:00:51.6282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FqYpxNzYSCKNfPy9EGSGdEoAmkcwyCDYjcWBFrz01g=;
 b=tZUfmqGW6oIow72bJ6C9a1fcG1BiOCYsUFUTx9Z+6ONEQ4EvSCRrs2f76uQhBZc6gcfgLTbVXaJcu7hqXi0py/ZnGk0drO4/VQg7nN4LZlzyZqvugwn5T52/0X0fMLtp/KXKQAndt3CWq0oK8vCKNnMGyRNyOgalh3JwhLu8wDs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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

DQoNCk9uIDIwMTktMDctMDUgNDo0MSBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IE5lZWQg
dG8gYWRkIGFwcHJvcHJpYXRlIGlmZGVmLg0KPiANCg0KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMNCj4gaW5kZXggYTA5MGUzZmRjNzYyLi5lZTM5Y2I3NDBkNDEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYw0KPiBAQCAtMzUyLDggKzM1MiwxMiBAQCBp
bnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAkJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOw0KPiAg
CQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpDQo+ICAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3ZpcnR1YWxf
aXBfYmxvY2spOw0KPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMpDQo+ICAJCWVsc2Ug
aWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpDQo+ICAJCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxvY2spOw0KPiArI2Vsc2UNCj4gKyMJd2Fy
bmluZyAiRW5hYmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24gbmF2
aS4iDQo+ICsjZW5kaWYNCj4gIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdm
eF92MTBfMF9pcF9ibG9jayk7DQo+ICAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYs
ICZzZG1hX3Y1XzBfaXBfYmxvY2spOw0KPiAgCQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBl
ID09IEFNREdQVV9GV19MT0FEX0RJUkVDVCAmJg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
