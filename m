Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE2E73252
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEBC6E5C5;
	Wed, 24 Jul 2019 14:56:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710047.outbound.protection.outlook.com [40.107.71.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC986E5C5
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrXWUYOzY+dOtE2rmH3hvGYGInYCltCNVR/KOmEK5MKVHdRsqUf7KzrSnh0OIfmq4SMNZ0950bjCpKKrK9wL/M1lf2wHzMLxMapJAoiUbM4IxXiGabUXQNHsisr9Kb2cB9f7c3Vaiu6litPmiBxgyEUdiKAXK+rtdSSsT0uNJnCfZofAf5C6xUbeubPvKIhCAbkx5J1qu0qsJmZhvAFTdWEsz4vIamlQq/VGrbcqX6XuEChergje4cVnZRLj1k1BzSfIlhST5JXG6vTMYO7CvPrqhbR2T6dKKddk8v8EHpLSv/avWQ0DOsYHRGA70EV8w2XfRttZ8x+J2zYWXTFCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgodObBhKkY0WwXzwDD+3fODGURwHP8Oai3/WMYTOpg=;
 b=ZAKwy2R3q5/jPN7LkNNhV0pOQZ+mId+6YFInM3dBBHzjWLNbnQxNJZVX3C5sNrCEdikYLROHxoyJl9qozUMwCWpm+QnvLQLXRYxAMueCLtVGupCEwQLVT1Sl5+e2FmydqjC38CvGFB7N7Fh7p6qeP3Z3Hc5LcevG8ycXv0LYakEusyXOTrtJx+patDEOsB2+oNcnqhw087T5atdRXU8QI6BEv8shLHAfwCGZ45sAz9d3oiSsC5x50RReeK3P4jTirowP5o7LYu/axISPR2wDO4mteNOqOli7I81TBxtKOpvNTSTnTRulbrcWYTKZlP8VXdHh9rQMVtxpb7UrOsWptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1931.namprd12.prod.outlook.com (10.175.86.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 14:56:33 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Wed, 24 Jul
 2019 14:56:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQinFl8obpZfKfUm+Yt/IH6AjmabZ0skAgAACJoCAAAJigIAAAoiAgAAAy4CAAAD4gA==
Date: Wed, 24 Jul 2019 14:56:33 +0000
Message-ID: <82c41cbf-4bfd-f9aa-30e5-02773912a4ee@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
 <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
 <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
 <3d0c5357-52b9-80fb-61ff-363e13086aa8@daenzer.net>
 <5b2a81a4-8be1-0846-7f5b-ef9cfa934780@amd.com>
In-Reply-To: <5b2a81a4-8be1-0846-7f5b-ef9cfa934780@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::30) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbe2b4a3-92de-4f10-8306-08d710471e65
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1931; 
x-ms-traffictypediagnostic: DM5PR12MB1931:
x-microsoft-antispam-prvs: <DM5PR12MB1931FD7A444EDC9507A24A5183C60@DM5PR12MB1931.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(66476007)(54906003)(316002)(66446008)(6512007)(66574012)(66946007)(64756008)(66556008)(31686004)(229853002)(2906002)(71200400001)(53936002)(6246003)(65956001)(71190400001)(65806001)(6436002)(6486002)(25786009)(2616005)(99286004)(86362001)(36756003)(81166006)(2501003)(31696002)(7736002)(53546011)(256004)(386003)(6506007)(14454004)(102836004)(486006)(8936002)(65826007)(305945005)(58126008)(76176011)(8676002)(476003)(5660300002)(4326008)(11346002)(186003)(446003)(14444005)(110136005)(6116002)(46003)(478600001)(68736007)(81156014)(64126003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1931;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /iOZZTR+Eh+KmbuCrtRtazG8JcaNnRtpSBQLsLBXaSwJXTWTbnL4s1St+uIV+I+PLPovzWl02LLS0Ciln19z/dM0vOtBxly6DqC9PagxFnNGyZulHpr1OEoXvFVOuiCbGq5w5ZtzXufhFgyPKqvRLvtB7t4gUljv5TE1g+bXEGSzs5Ji1dyr+H9/xdX3IUZ23hhjzuPqUaDiEtmWD5ZIUpTUOn5lk6WO5e4lm+qzBIk5iQNUzm2UBNuXZVB4iPYsv50Qo1qxFrQKMhakWCxEjek+aknslaOafYd5h2nv2IPESmnEHOaBUf2spc0NK/8BI2AsNkynnubAlsYMNACz8hjHUbrQHA9amrxHGm935lupwXmiwtpObNyF5/C4uvABP4lo+N/NMzy62hhUcloBF6ZshZX2yoEyWCgjJPX1hkY=
Content-ID: <D85E896F67EB4B418BE7C92868A63BC7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe2b4a3-92de-4f10-8306-08d710471e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:56:33.6147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1931
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgodObBhKkY0WwXzwDD+3fODGURwHP8Oai3/WMYTOpg=;
 b=t63ZK6vexvbyNP7g0OTIf/FfQ+Q0JEAPM/EGFC54YE4pQNrRfKp2mJnJCoKbXmCzimP8B4P0U2pgibzgsfPqL+WO/h+PoVjKBX1o5hwgdQX8aeNlwNexujAe2F0PwCtaOfSqk6hSx5odZjeyY26RgW0G4CuDi/EJWhyqisbUA8c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDcuMTkgdW0gMTY6NTIgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+IE9uIDcv
MjQvMTkgMTA6NTAgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPj4gT24gMjAxOS0wNy0yNCA0
OjQxIHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+IEFtIDI0LjA3LjE5IHVtIDE2
OjMyIHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0KPj4+PiBPbiA3LzI0LzE5IDEwOjI1IEFN
LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4+IEFtIDI0LjA3LjE5IHVtIDE2OjEwIHNj
aHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6DQo+Pj4+Pj4gRnJvbTogU2hpcmlzaCBTIDxzaGlyaXNo
LnNAYW1kLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IGVuYWJsZXMgZ3B1X3ZtX3N1cHBvcnQgaW4gZG0g
YW5kIGFkZHMNCj4+Pj4+PiBBTURHUFVfR0VNX0RPTUFJTl9HVFQgYXMgc3VwcG9ydGVkIGRvbWFp
bg0KPj4+Pj4+DQo+Pj4+Pj4gdjI6DQo+Pj4+Pj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50
byBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucw0KPj4+Pj4+DQo+Pj4+Pj4gdjM6DQo+
Pj4+Pj4gVXNlIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIGluIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zLg0KPj4+Pj4+DQo+Pj4+Pj4gQ2hhbmdlLUlkOiBJZjM0MzAwYmVhYTYwYmUy
ZDM2MTcwYjdiNWIwOTZlYzY0NDUwMmIyMA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2gg
UyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4+PiBBY3R1YWxseSB0aGF0IGRv
ZXNuJ3QgbG9vayBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLg0KPj4+Pj4NCj4+Pj4+IEl0IGlzIHN0
aWxsIHBlcmZlY3RseSBwb3NzaWJsZSAoYW5kIHdhbnRlZCEpIHRoYXQgdGhlIFVTV0MgZmxhZyB3
YXMgbm90DQo+Pj4+PiBzZXQgaW4gdGhlIGZpcnN0IHBsYWNlIGJ5IHVzZXJzcGFjZS4NCj4+Pj4+
DQo+Pj4+PiBJcyB0aGF0IHN0aWxsIGNoZWNrZWQgc29tZXdoZXJlPw0KPj4+Pj4NCj4+Pj4+IFJl
Z2FyZHMsDQo+Pj4+PiBDaHJpc3RpYW4uDQo+Pj4+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCBoZXJl
LCBjYW4geW91IGVsYWJvcmF0ZSA/DQo+Pj4gSXQncyBzdGlsbCBwb3NzaWJsZSB0aGF0IHVzZXJz
cGFjZSBkb2Vzbid0IHNldCB0aGUgVVNXQyBmbGFnIGFuZCB0aGVyZQ0KPj4+IGFjdHVhbGx5IG1p
Z2h0IGJlIGdvb2QgcmVhc29ucyBmb3IgdGhhdC4NCj4+Pg0KPj4+IERvIHdlIHN0aWxsIGhhdmUg
YSBjaGVjayBmb3IgdGhpcyBjYXNlIHNvbWV3aGVyZT8NCj4+IEl0IHNvdW5kcyBsaWtlIHlvdSdy
ZSBtaXN1bmRlcnN0YW5kaW5nIHdoYXQgdGhpcyBwYXRjaCBkb2VzLCBwcm9iYWJseQ0KPj4gZHVl
IHRvIHRoZSB3ZWlyZCBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBBUEkuDQo+PiBhbWRncHVfZGlz
cGxheV9zdXBwb3J0ZWRfZG9tYWlucyBkb2Vzbid0IHNldCB0aGUgZmxhZyBmb3IgdGhlIEJPIGl0
c2VsZi4NCj4+IENoYW5naW5nIHRoZSBoZWxwZXIgQVBJIHRvIHdoYXQgd2Ugc3VnZ2VzdGVkIHNo
b3VsZCBjbGVhciB0aGlzIHVwLg0KDQpZZWFoIHRoYXQgaXMgY2VydGFpbmx5IHBvc3NpYmxlLg0K
DQo+Pg0KPj4gKE1heWJlIHRoZSBuZXcgaGVscGVyIGZ1bmN0aW9uIHNob3VsZCBiZSB1c2VkIGlu
DQo+PiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyBpbiBwYXRjaCAyIGFscmVhZHks
IG9yIGluIHlldCBhbm90aGVyDQo+PiBzZXBhcmF0ZSBwYXRjaD8pDQo+DQo+IFllYSwgYWdyZWUs
IGxldCBtZSBzZW5kIHRoZSBWNCB3aXRoIGJvb2wgQVBJIHRvIG1ha2UgdGhpbmdzIGNsZWFyZXIg
YW5kDQo+IEkgd2lsbCBpbmRlZWQgc2VwYXJhdGUgdGhpcyBjaGFuZ2UgZnJvbSBTL0cgZW5hYmxp
bmcuDQoNClNvdW5kcyBnb29kIHRvIG1lLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IEFuZHJleQ0KPg0K
Pj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
