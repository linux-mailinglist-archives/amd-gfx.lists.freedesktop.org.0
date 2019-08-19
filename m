Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80091B69
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 05:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D286E087;
	Mon, 19 Aug 2019 03:16:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6096E087
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 03:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkfQQWQMklvKiw067rDuv69raV0XpxvSeuqY20dG2HVgoPhec2b+qytEvKGqBAdTWpC5Jn+rFcJe0WlvG8sJtFFZ9qIv21Fyr910S+pT2ZZ7hzO5j0zH5xZHuc3Zm0hfYv4EWOZEjhC5H7oL7rAITjuBP50YRRxUMXM0KGqwEvrBSfkY4xNteQUp+GfszAHovEUA/V0RsmPOPBBzpfkaXyGezPLuIkU++lQM5FbGslY0IFnNkpIff+oNGQDQLRP1St5emVbolSaBhgg/W5I3y53mNJLjN2FD+RU7ojM4FwFfppCeMWKFFxBTFy630AUXLT8rxmTF2DSQc5wGZfUWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvCWrg7aMbSDLjg5PTQUsrsd37eOfSkP5XE/UcjqaEY=;
 b=FfguPX7Vo8F/XmexmCxpeOAQCLFzBJ/VoBiBMTKOMloJyc69TxAw0sOvluG6di6UgkwAT2dM/ZexzKRSsCj5ITJQM31N/tsEPuixe17wb+xyg+88Y5L57sjpgZdTwO9K7xKS0feCV1fmJbnAVotAfwMklpKcvQkvir4SJZOyKNxQTqQjST2pcoMwtPL6couWXfwzrnESVRBoCjqNbGfZwvGfNcVnfOhhBR1zvehGPEuzYVqT4sqd6Ps8ET9W4xqGFR0O2oSZetmoh4G+ZSLyiFTYftSanzkB/8fduCwLMf+L+X/Wadk9a+7+4S+MrQJqbGWe4vQNbn/RUmZ45X1jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) by
 BYAPR12MB3317.namprd12.prod.outlook.com (20.178.55.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Mon, 19 Aug 2019 03:16:15 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::3d45:d2bc:5fa6:6ab5%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 03:16:15 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Topic: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Index: AQHVVCJkTXF7fKGGD0y9yrf7bEc/4Kb9np0AgAQvmsA=
Date: Mon, 19 Aug 2019 03:16:15 +0000
Message-ID: <BYAPR12MB280662C3A47CA31DC1790A3AF1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190816110401.11069-1-guchun.chen@amd.com>
 <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
In-Reply-To: <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd601d8e-605e-4c9f-f8c2-08d724539878
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3317; 
x-ms-traffictypediagnostic: BYAPR12MB3317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3317E2D595F992D785F94353F1A80@BYAPR12MB3317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(199004)(189003)(13464003)(66066001)(305945005)(110136005)(316002)(66446008)(55016002)(66476007)(86362001)(8676002)(9686003)(26005)(4326008)(8936002)(102836004)(76116006)(66556008)(6436002)(71190400001)(71200400001)(81156014)(14454004)(81166006)(256004)(25786009)(99286004)(53936002)(2501003)(3846002)(33656002)(64756008)(6246003)(52536014)(5660300002)(6506007)(486006)(74316002)(229853002)(53546011)(7696005)(478600001)(446003)(76176011)(2906002)(11346002)(7736002)(186003)(476003)(6636002)(6116002)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3317;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UPf+87dz2MEGyjsrH0de8Fb439yx8gPoeqGwNsGz0RTX8GM2gZY7e0GKxtetflzpNZmrgJWpL9FfWMgPhFMR1PPcToQLywiqO3VjmoIccnkwNE/6rAIY2tkn5NC+qp84TOaB7PWNivMAPE7PXObAkdJ8AnRqLJVE/iRjTh0rAB7CX28YFEQ8LyrSaMWAABHzu+lXJPsWPgkmorSKwATba8FoX90va2BUpj5WiQ0SRzsKwrppfFKtsfotWzOzK+25h/pRKICXmYtItLni4ygqehc8KVEWWm/uzDoYwIcdNzXV/LdRWxuY9CCu8fRJ+xwC0RyBtAREY33GKkeisAhEhJB3AQ6MvcERpSoKoY/NXwLdyYA1uReJ7U1Jc7NFNlXghShHZgA1XHiA+4KX3/eQIknglAaWhMoOZYAo07bhW/0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd601d8e-605e-4c9f-f8c2-08d724539878
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 03:16:15.3585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlyltOdmP23z2OvFQ3F/KJTGRD1FG4jUj/ADa6j2WW4JYsYTgdBnwagpBz4Q8MsBfwlNqq3N86ZzSZ1APncjNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3317
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvCWrg7aMbSDLjg5PTQUsrsd37eOfSkP5XE/UcjqaEY=;
 b=lB923D3W0spF0z4r8cxZCVe8+CYBVPCwsj6IiDfYVbN5a03c7kO3RgLzvxBMz8yEnM8nMfe8PhkAUKo+nmftoVTdA+bhEnineZqbn82fYfeTglxrjdB3fl8Cc+Fcd7N9DO5zeIbNPSal9ryg5s/PVoixY4v9lmGuSg4WAvqjUF4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KDQpZZXMsIHdlIGFkZGVkIG9uZSBjb25maWd1cmF0aW9uIGZpbGUgbmFt
ZWQgImFtZGdwdV9yYXMuanNvbiIgZm9yIFJBUyBpbmplY3QgdW5pdCB0ZXN0IHRvIGRybSBtYXN0
ZXIgYnJhbmNoLg0KVGhpcyB1bml0IHRlc3Qgd2lsbCBiZSBtYWludGFpbmVkIHRvIGlsbHVzdHJh
dGUgYWxsIHRoZSBSQVMgdGVzdHMgd2UgYWJzb2x1dGVseSBzdXBwb3J0IGluIElQIG1vZHVsZXMv
c3VibW9kdWxlcy4NCg0KUmVnYXJkcywNCkd1Y2h1bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFp
bC5jb20+IA0KU2VudDogRnJpZGF5LCBBdWd1c3QgMTYsIDIwMTkgNzoxMiBQTQ0KVG86IENoZW4s
IEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgTGksIERlbm5pcyA8
RGVubmlzLkxpQGFtZC5jb20+OyBDdWksIEZsb3JhIDxGbG9yYS5DdWlAYW1kLmNvbT47IFpob3Ux
LCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxpQGFt
ZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGxpYmRybV0gYW1kZ3B1OiBhZGQgbW1odWIgcmFz
IGluamVjdCB1bml0IHRlc3QNCg0KV2VsbCB0aGlzIGRvZXNuJ3QgbG9vayBsaWtlIEMgdG8gbWUu
IERpZCB3ZSBhZGRlZCBhIGNvbmZpZ3VyYXRpb24gZmlsZSBmb3IgdGhlIHJhcyB1bml0IHRlc3Rz
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/DQoNCkNocmlzdGlhbi4NCg0KQW0gMTYuMDguMTkgdW0g
MTM6MDQgc2NocmllYiBHdWNodW4gQ2hlbjoNCj4gQ2hhbmdlLUlkOiBJYTc2Yjk1MTYyZjVmNmY0
MTlmNzBiNTNlZjQ0M2JjZWFmMmUwOTJlMA0KPiBTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8
Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZGF0YS9hbWRncHVfcmFzLmpzb24gfCAx
MCArKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RhdGEvYW1kZ3B1X3Jhcy5qc29uIGIvZGF0YS9hbWRncHVfcmFzLmpzb24g
aW5kZXggDQo+IDI2ZmQ5NDY1Li40ODRmMTJmMiAxMDA2NDQNCj4gLS0tIGEvZGF0YS9hbWRncHVf
cmFzLmpzb24NCj4gKysrIGIvZGF0YS9hbWRncHVfcmFzLmpzb24NCj4gQEAgLTEyMSw2ICsxMjEs
OSBAQA0KPiAgICAgICAgICAgICAgICAgICAidXRjX2F0Y2wyX2NhY2hlXzRrX2JhbmsiOiAxMTEN
Cj4gICAgICAgICAgICAgICB9DQo+ICAgICAgICAgICB9LA0KPiArICAgICAgICAibW1odWIiOiB7
DQo+ICsgICAgICAgICAgICAiaW5kZXgiOiAzDQo+ICsgICAgICAgIH0sDQo+ICAgICAgIH0sDQo+
ICAgICAgICJ0eXBlIjogew0KPiAgICAgICAgICAgInBhcml0eSI6IDEsDQo+IEBAIC0yNjMsNSAr
MjY2LDEyIEBADQo+ICAgICAgICAgICAgICAgImFkZHJlc3MiOiAwLA0KPiAgICAgICAgICAgICAg
ICJ2YWx1ZSI6IDANCj4gICAgICAgICAgIH0sDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAg
ICJuYW1lIjogInJhc19tbWh1Yi4xLjAiLA0KPiArICAgICAgICAgICAgImJsb2NrIjogIm1taHVi
IiwNCj4gKyAgICAgICAgICAgICJ0eXBlIjogInNpbmdsZV9jb3JyZWN0YWJsZSIsDQo+ICsgICAg
ICAgICAgICAiYWRkcmVzcyI6IDAsDQo+ICsgICAgICAgICAgICAidmFsdWUiOiAwDQo+ICsgICAg
ICAgIH0sDQo+ICAgICAgIF0NCj4gICB9DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
