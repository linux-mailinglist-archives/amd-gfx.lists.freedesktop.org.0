Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA9E03F2
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 14:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099DD6E785;
	Tue, 22 Oct 2019 12:36:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E26B6E785
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 12:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ3XFWiuonJe7FjOfvkr3eLoal4qg9cdEBmMJ3cYV1jrcSDyqwMiZJKgfmFKpfbaXqNj1z3G09Gn/NaJ9ZwXfdBYNoSo/Zxm0e2VX+68qC61gaqrwBbicMPiNgVZ6eQ8JrG9322Gm78izY4wbrnjaJBqQJ71ZHNZqBSRBPRgki+pCWxFVRkO2NPGMTQaOlPKTeJUR8cAHkF6LOOJBjfXWQ5bBVok+51dLHIK5JHS/BSrSEGTR+r0R1Qv7B9+EI+5ZHivBKRbm+hLVMHhh8KxaoFVqLXqHpXIsnYohKOGKk+WAvM8cD5g3yfZ0S1htGPbcZLEgqO2hhotMW/V8eyw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be/TVFYoQyaVO0kKJP17UJhLQxSf1ukMawoomYD2fgI=;
 b=aoBGGAOdRpAyMUhDDJ4QY4sasj3acyTeF7YtS0PaAFM0F+Tt9Ift5BGB/ku0pr3FzZAwh/97fkUiYQ5gog2Xgf8eRAFSvk9wdNKJFWuassloOwjaR484WD6EPQlg/onZqHwceTjq+fFwI7UKiYJ9pej4nzanOghI8+Er9azBRVV1/p9ltG1TQiN4avKajQNtrXnQcJzDoJ4WyMpIAGskbhKqn8JXtRZYRx1/Sy4PgvFJlOTlwp7jKb50hmBO1j2WnFE8BLfg8LbH079pANuAGhFBFMsYJbzSGCc6c5TcZ/MqRqOQvPXyUNtuotP4yRkTIZiQyK/UbsOju9ny4uV5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2936.namprd12.prod.outlook.com (20.179.91.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 12:36:20 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 12:36:20 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Liu, Zhan" <Zhan.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Wu, Hersen" <hersenxs.wu@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>
Subject: Re: [PATCH] drm/amd/display: Change Navi14's DWB flag to 1
Thread-Topic: [PATCH] drm/amd/display: Change Navi14's DWB flag to 1
Thread-Index: AQHViEa82Cgl8MseMUW0cN63V7ojoKdmmguA
Date: Tue, 22 Oct 2019 12:36:20 +0000
Message-ID: <681c8a0e-e23d-228c-e77f-cdb8a76c6137@amd.com>
References: <DM6PR12MB346608E72303400E56A5C8AE9E690@DM6PR12MB3466.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB346608E72303400E56A5C8AE9E690@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e3ec22f-ae19-4e97-db02-08d756ec70c3
x-ms-traffictypediagnostic: BYAPR12MB2936:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2936854336C275FA6C0618D8EC680@BYAPR12MB2936.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(6116002)(305945005)(7736002)(6246003)(3846002)(52116002)(76176011)(71190400001)(6486002)(4001150100001)(99286004)(110136005)(71200400001)(316002)(6306002)(36756003)(6512007)(6436002)(229853002)(2906002)(81156014)(31696002)(6636002)(8936002)(81166006)(8676002)(25786009)(966005)(14454004)(11346002)(2616005)(478600001)(86362001)(446003)(31686004)(5660300002)(386003)(6506007)(53546011)(102836004)(26005)(476003)(14444005)(256004)(486006)(66066001)(66476007)(64756008)(66946007)(66446008)(2501003)(66556008)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2936;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +40M5NAFNXXQBCwvtQ3IBaLctN8Ve7Y1O9Y7C9eaVNEJLesmisjkXYjZIgcNP3/HumYbv0U3UvlPcJSd9hJhib8p1yT9C9l6gN4WXvOINd/cL5ETxo6Jd8THysivBPR3yv+7s1bR1zqZ8kcwtQ5XH7/HMAQb3hK+6lSS1/Vg9D0LLeNryHacZppx7/jKddtr5X42kL3kRwcC+CUZceC47AHmphbCfaBntyQ9a7c+hFtU5xNf/PUfMm9Os+T4TEQjZMUDFtAmuH08BT8+yEuVAT9cxQsBodLsCmvN3adDCEqfzEW4CFM2slCWruhz7LmJ5nfwrStdmHZSPYn2e399rACWkIw1gkhyLgmMQ4pxX8BxzWHcRTyjJjY7f1u0EypHhCUuRUabefs7v5J5bEDitPJZ3oDPVEbPyu6zrp4TFxcfa/IS4dBekFXBivMyxAJPtk+Hlua/Ey4isTSj6PM3mr6z/nYCpP89dS526xbLAak=
Content-ID: <88A767A2D69976469D5D5A8BB3B4B2E5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3ec22f-ae19-4e97-db02-08d756ec70c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 12:36:20.2547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2uUh1dq6kJC7z8aOiGQ/Qslj1mlBD/mZYxOiw8rvH069Tk4o0MrDRHiJqjtl0isFTcJCrFTLvlQxCqww3r1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be/TVFYoQyaVO0kKJP17UJhLQxSf1ukMawoomYD2fgI=;
 b=WGImZs3nPML1ASHS0dQkCZfBg2lhT0npMeP8j+pYyEtSP9mNE26zfEHJ1fwCA82moy0hR4qMSPu/KIAQoRIVI+rvT4VG71lMwOBChAV0VtjA0oO9Oo/3EjJlGYEbh5aNwUAvrq3pHzlu0dpuCYIl5gEh/Xh/AJWyieiJVW+xL6M=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMSAzOjM2IHAubS4sIExpdSwgWmhhbiB3cm90ZToNCj4gW1BBVENIXSBkcm0v
YW1kL2Rpc3BsYXk6IENoYW5nZSBOYXZpMTQncyBEV0IgZmxhZyB0byAxDQo+IA0KPiBbV2h5XQ0K
PiBEV0IgKERpc3BsYXkgV3JpdGViYWNrKSBmbGFnIG5lZWRzIHRvIGJlIGVuYWJsZWQgYXMgMSwg
b3Igc3lzdGVtDQo+IHdpbGwgdGhyb3cgb3V0IGEgZmV3IHdhcm5pbmdzIHdoZW4gY3JlYXRpbmcg
ZGNuMjAgcmVzb3VyY2UgcG9vbC4NCj4gQWxzbywgTmF2aTE0J3MgZHdiIHNldHRpbmcgbmVlZHMg
dG8gbWF0Y2ggTmF2aTEwJ3MsDQo+IHdoaWNoIGhhcyBhbHJlYWR5IGJlZW4gc2V0IHRvIDEuDQo+
IA0KPiBbSG93XQ0KPiBDaGFuZ2UgdmFsdWUgb2YgbnVtX2R3YiBmcm9tIDAgdG8gMS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQuY29tPg0KDQpSZXZpZXdlZC1i
eTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMNCj4gaW5kZXggOTE0ZTM3OGJjZGE0Li5kNDkzN2M0NzVl
N2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jDQo+IEBAIC04MTYsNyArODE2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCByZXNvdXJjZV9jYXBzIHJlc19jYXBfbnYxNCA9IHsNCj4gICAgICAgICAgICAgICAg
ICAubnVtX2F1ZGlvID0gNiwNCj4gICAgICAgICAgICAgICAgICAubnVtX3N0cmVhbV9lbmNvZGVy
ID0gNSwNCj4gICAgICAgICAgICAgICAgICAubnVtX3BsbCA9IDUsDQo+IC0gICAgICAgICAgICAg
ICAubnVtX2R3YiA9IDAsDQo+ICsgICAgICAgICAgICAgICAubnVtX2R3YiA9IDEsDQo+ICAgICAg
ICAgICAgICAgICAgLm51bV9kZGMgPSA1LA0KPiAgIH07DQo+IA0KPiAtLQ0KPiAyLjIxLjANCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPiAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
