Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85148D9896
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 19:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3506E985;
	Wed, 16 Oct 2019 17:39:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8C86E985
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 17:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNL11lxPwbrWLU2B1mXbRZ1wa/LsuLlWY2O41bPUcHBA/mrVKKqPbE7tlKqRy+MAMxBROzfiEA5x3En9VIMga+D9O7P/h+L+TmV/FFptZIAR+OiZUGh5gqApMFKFf6pAjX0o60rVIBq/rBTDhCyJmPeqiVsNGGLmcbMldgpU2RRPC9pR7zWUEhp+LlB2lqzaDdFCbxzlihIZZzniC7OoLgt5rf5hrkBybu/m6ohUT9ry6oGAcDROk8KPw4LA/ZEuISaeWyieK3f3gcILTl0KnE7jjtM+8VL9nli3Try8XWyW1xLnlZUZahhf4Q4j7n2H6qGn9ou128nxiFUMI3P0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjmlKN2Sm70ZXRnj9Z6mJEcA95MzAvfI5Klv2faBh9g=;
 b=OVcDuSnNmbV0fHEjwAvMpY1JuxyTEW1JeglXhkd8Iuq9kswJam8CXWS/Ob2iKgekNGt+5TQT2cCP/HjaSUbcgkdIAoT2ZVjPH7iJczgcSj61cNw4XGyUrMUzmtmitSEBCDkBzalcghvFHHUMB2qmkQWgpe0s7uflkOkhbZ9/wrUfXSJu8xoF/HODwaMvP7hWzhV8sdMNIWPLFvwY/CYxtiFdbzoXtIpumzvFK3F7sQSy+XbJIKT/MrWf++DVMd570Fk23NsFXAQ53RO9Isv8ChWdq3KfFXqkZqa6Abq+vPo8V/Gg2OleEuhcHkVhRog9uOTwH6EgZAi2tIjvxhGt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3032.namprd12.prod.outlook.com (20.178.54.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 17:39:07 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::c082:7b69:4a5d:4850]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::c082:7b69:4a5d:4850%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 17:39:07 +0000
From: Mikita Lipski <mlipski@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix build when
 CONFIG_DRM_AMD_DC_DSC_SUPPORT=n
Thread-Topic: [PATCH] drm/amdgpu/display: fix build when
 CONFIG_DRM_AMD_DC_DSC_SUPPORT=n
Thread-Index: AQHVhDy81DLig9m2V02KLez6kGUJkKddiLWA
Date: Wed, 16 Oct 2019 17:39:07 +0000
Message-ID: <f97ea24b-9d65-9b61-5144-f417e19391e9@amd.com>
References: <20191016161343.698656-1-alexander.deucher@amd.com>
In-Reply-To: <20191016161343.698656-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
x-originating-ip: [165.204.55.250]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c10507a-4bde-4376-b3e1-08d7525fbecf
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30326952855420110AAA7711E4920@BYAPR12MB3032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(189003)(199004)(256004)(6486002)(4326008)(99286004)(31696002)(36756003)(31686004)(102836004)(76176011)(6436002)(2501003)(2906002)(478600001)(229853002)(7736002)(66066001)(305945005)(25786009)(6512007)(52116002)(6116002)(71190400001)(14454004)(6246003)(5660300002)(446003)(486006)(386003)(11346002)(71200400001)(476003)(2616005)(3846002)(66476007)(64756008)(316002)(66946007)(8676002)(8936002)(66556008)(66446008)(6506007)(81166006)(81156014)(53546011)(26005)(110136005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3032;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C5tQeOmBkyQ+T7KeIO67eqWNVPJREjXnnRWuxEgYBrKuJPipNvGrk9c0OU3wUPgokEU+NEFImnQarF+8r3kHw5Y/jO+LsKRn6q7qXQWzCTIaeRBIRVzWnAJj1PZkv8w7zNa5Aap6oY0aUw24UXyIiu3P07qn+2MtAEfkBx69bJbv659NkNNu4FJw+k56YWTk2pmboh9zhm2jkPxn/UHLg6XXjmmIO6ZQQAa96BGalr8gLIOFzBy0688D6QJfhlEwwpGCcjFQI53bPXIKjNhs1VLCSfZYKGqRShEVwsKAfWlf70dKJpamiZ94e/CFyEjdeOhrYyBbDvTb2fKiT9wfs13bV0RCVSXP+Wx8G4ObvDguZDS1lGGpMR5abCN34E6uGtVybFjDvhGT0zzy0NmoeG6L37Rrf7hkaBhMCEE2wms=
Content-ID: <86152FEED9B42B43B82D815737183EDE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c10507a-4bde-4376-b3e1-08d7525fbecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 17:39:07.5566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7s324mup7i7EGtwbnLu8hprrU9AkwS0BKhwmWSNwR/Hw5O0rwpol/0ksslUEV5sL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3032
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjmlKN2Sm70ZXRnj9Z6mJEcA95MzAvfI5Klv2faBh9g=;
 b=ctfNTDv928f29Do9vGBXFA28ouI918VqI+QIz18yAep78rb/ROYkxH69YMxezPRlY8lMJzhnzIFUVO0Y3jQ/vO1ZYfKGPCyXxbPSbwGVHNrICiRacm9XH9cggxnNooFSWIW8riVLxadPdjIarRQ9LGkPTn5l7PbzxXLXBEBHeUE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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

UmV2aWV3ZWQtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4NCg0KT24g
MTYuMTAuMjAxOSAxMjoxMywgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBBZGQgcHJvcGVyIGNvbmZp
ZyBjaGVjay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMNCj4gaW5kZXggOTE0ZTM3OGJjZGE0Li40ZjAzMzE4
MTA2OTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jDQo+IEBAIC0xOTEwLDggKzE5MTAsMTAgQEAgaW50IGRj
bjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQoDQo+ICAgCQkJcGlwZXNbcGlwZV9j
bnRdLmRvdXQub3V0cHV0X2JwcCA9IG91dHB1dF9icGMgKiAzOw0KPiAgIAkJfQ0KPiAgIA0KPiAr
I2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ICAgCQlpZiAocmVzX2N0eC0+
cGlwZV9jdHhbaV0uc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDKQ0KPiAgIAkJCXBpcGVzW3BpcGVf
Y250XS5kb3V0Lm91dHB1dF9icHAgPSByZXNfY3R4LT5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWlu
Zy5kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsIC8gMTYuMDsNCj4gKyNlbmRpZg0KPiAgIA0KPiAgIAkJ
LyogdG9kbzogZGVmYXVsdCBtYXggZm9yIG5vdywgdW50aWwgdGhlcmUgaXMgbG9naWMgcmVmbGVj
dGluZyB0aGlzIGluIGRjKi8NCj4gICAJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icGMg
PSAxMjsNCj4gDQoNCi0tIA0KVGhhbmtzLA0KTWlraXRhIExpcHNraQ0KU29mdHdhcmUgRW5naW5l
ZXIsIEFNRA0KbWlraXRhLmxpcHNraUBhbWQuY29tDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
