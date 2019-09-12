Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FDB11F9
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 17:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF486EDA7;
	Thu, 12 Sep 2019 15:19:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5546EDA7
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 15:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQ52ToaIQJVycdQ3gGAI8F70VRO3f6y8a4knIm0FBnbt6Z70i21Jt33hPFPsmnm2+JA+KW51Ccqi4/5nb7s03hmh0lOkvbsMLjkRnZn4oxYVC8jI0hK45EQSrthom9aiC3/1BUbMaq5Ksl/MR99CAEsuKwzU2lYat+gZxmxMizr9JobbK7UN3pw7YfNN6hO8CI/Av2jLvZM3EmerKh2bt/TVqoywVlZY7AFdz7MehGEFft2CaHwdlkRy43BR8DU3sJcdhrUgcqHWaZxY7AIlcAAcYo3NFR+OWIcwd8gmeJLfW0V47FjhfuhO46oE0pfpAgX+v0sIiaVKgVtnNf3Xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXE3zGevQamRHqyjMltaNSSLF9Fmr3UTVMXAxch1giI=;
 b=HEAZEMpXGWH2ABFmQ7X1lPg9fDdTfRDz1eqdWu7SgC3de7Bxe3TqEnU/1blqGc9F+ZbhrWtPYZGqr2CWfym3ZtDz/p0O9xlYT49iRPAmUOrC18c5frQY5sDMST6Y8KUwwuk/KaYrtSZcuGkvfWGGoSNQfG2tUY/mRt20poO1ulCHckyhgUiQ42fSOWCPvLxtiyOdXDSM7LbKjomRDkWjM+2+oV4WdVB7s3Wllnr60ersrQBCQ0luaBYnHoD4pwlbyEJMaq7AnLX3UziGXvplGrF0ltgBveWi7KPzaVpTlJ8sSYK8A6xyjVp9F52VZwjQKTgA+DrvJLobQXq6otgaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1213.namprd12.prod.outlook.com (10.169.204.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 15:19:18 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 15:19:18 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/Asx1vpdHBGkKaZL/KBwFVFaclzGCAgAB4KACAAAYxAIAA/seAgAAG9EOAAJuvgP//6C6AgABVSQCAAAEmgA==
Date: Thu, 12 Sep 2019 15:19:17 +0000
Message-ID: <16d6bcee-cee8-3c93-110f-04d7c74296d7@amd.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
 <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>
 <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
 <MWHPR12MB14533B06E13B86E54520E991EAB00@MWHPR12MB1453.namprd12.prod.outlook.com>
 <MN2PR12MB3054CE8F6F6097847B188457B0B00@MN2PR12MB3054.namprd12.prod.outlook.com>
 <1caeca1e-40e7-9b59-37f9-47704903655f@amd.com>
 <91382817-97b0-9ca5-24c6-e7880c4bdb55@gmail.com>
In-Reply-To: <91382817-97b0-9ca5-24c6-e7880c4bdb55@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ef948ee-5fdc-4d43-6a3b-08d737949423
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1213; 
x-ms-traffictypediagnostic: MWHPR12MB1213:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1213CBEB0A18368603D38159EAB00@MWHPR12MB1213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(13464003)(52314003)(6246003)(229853002)(66556008)(71200400001)(71190400001)(14444005)(256004)(66574012)(36756003)(110136005)(99286004)(11346002)(6306002)(316002)(53936002)(966005)(5660300002)(478600001)(186003)(476003)(52116002)(486006)(2616005)(446003)(76176011)(2906002)(81156014)(8936002)(386003)(6506007)(3846002)(102836004)(53546011)(6116002)(81166006)(8676002)(6436002)(6486002)(305945005)(26005)(31696002)(6512007)(2501003)(86362001)(25786009)(14454004)(4326008)(31686004)(7736002)(66476007)(64756008)(66446008)(66946007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1213;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0WcP7Xf/8rnpjxMKOB24lxMCgZd0pDEZVon6mJR3jZsAUI9lyFeJjhPRneOADTG5cxPpzKYKqd9PeqtiUMkEyRuxwwm0rnedZ7668lkbwxFiw5Fmp1cf8fQYkHECBxGoBfnV6/xAIMrWIKL1XkoVHFnWzoXsnIEl4zUU0I2zY2BhD6kVnfc3u4cTr7PlT+psDu1F3Oy24Lqq0bOdpXLG/iGrFnQjUix/NmlcK0n3ekqO/jw3eXoq2+CdD2Y/8hZq3UUXCnq+jgx208lL9GNgKODO+1VwBUwO02mPG6gtfttA8iVGbPvNmzhhnDXru06eHRuvOiiIZW99BWB2cqA2xskwcfvobbdBk8oFzSa31LSP2tIGis0LuCFm3ZvCqwRnnr9WNGB+JkjdMkqE3290JNDR0aq4HNKX4Yq1yGEBjVo=
Content-ID: <63A4B04CDBEB3A4C80895A62ACD8F30A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef948ee-5fdc-4d43-6a3b-08d737949423
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 15:19:17.9179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMcqQYF6CVhKwGc2yJvHaIXe7EeDBHaQ3iOVwMME/DWQQvOoD2TquHJbzgZ4ejOQyYxmApp5eDL2TwTrod3ivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXE3zGevQamRHqyjMltaNSSLF9Fmr3UTVMXAxch1giI=;
 b=ifUVdG/0Cdvw8KfDQvaaTA//3G2YXnnFaviQCJquKDKTTjpQ7kK0+fhoag0OBQ3ADFCnVAuuVDwqZR3/86zBsKvLZHNMrnYiZOgoNY4E9p7e7yQ/WMpMi6AEHVUTcLAXeL4VqodOn5JmEsqZC0yzK59/IgFVtpqoM1Zu61xqeyM=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UkFTIGVycm9yIHdpbGwgYmUgdHJpZ2dlcmVkIGlmIHRoZSBIVyBpZGVudGlmaWVkIGEgZmF1bHR5
IHBoeXNpY2FsIHBhZ2UsIA0KdGhlIGVycm9yIGNvbWVzIHRocm91Z2ggYW4gaW50ZXJydXB0IHdo
ZXJlIHRoZSBkYXRhIHBheWxvYWQgd2lsbCBoYXZlIA0KaW5mb3JtYXRpb24gdGhhdCBjYW4gYmUg
dHJhbnNsYXRlZCBpbnRvIHRoZSBiYWQgcGFnZSBhZGRyZXNzLCB3ZSB0aGVuIGFzIA0KYSByZWNv
dmVyeSBtZWFzdXJlIHJlc2V0IHRoZSBBU0lDLCByZXNlcnZlIHRoaXMgYmFkIHBhZ2Ugc28gaXQg
Y2Fubm90IGJlIA0KdXNlZCBieSBhbnlvbmUgZWxzZSBhbmQgc3RvcmUgaXQncyBhZGRyZXNzIHRv
IEVFUFJPTSBmb3IgZnV0dXJlIA0KcmVzZXJ2YXRpb24gYWZ0ZXIgYm9vdC4NCg0KQW5kcmV5DQoN
Ck9uIDkvMTIvMTkgMTE6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFdlbGwgSSBz
dGlsbCBob3BlIHRvIGF2b2lkIFZSQU0gbG9zdCBpbiBtb3N0IG9mIHRoZSBjYXNlcywgYnV0IHRo
YXQgaXMgDQo+IHJlYWxseSBub3QgZ3VhcmFudGVlZC4NCj4NCj4gV2hhdCBpcyB0aGUgYmFkIHBh
Z2UgYW5kIHdoeSBkbyB5b3UgbmVlZCB0byByZXNlcnZlIGl0Pw0KPg0KPiBDaHJpc3RpYW4uDQo+
DQo+IEFtIDEyLjA5LjE5IHVtIDE2OjA5IHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0KPj4g
SSBhbSBub3Qgc3VyZSBWUkFNIGxvc3MgaGFwcGVucyBldmVyeSB0aW1lLCBidXQgd2hlbiBpdCBk
b2VzIEkgd291bGQNCj4+IGFzc3VtZSB5b3Ugd291bGQgaGF2ZSB0byByZXNlcnZlIHRoZW0gYWdh
aW4gYXMgdGhlIHBhZ2UgdGFibGVzIGNvbnRlbnQNCj4+IHdhcyBsb3N0LiBPbiB0aGUgb3RoZXIg
aGFuZCBJIGRvIHJlbWVtYmVyIHdlIGtlZXAgc2hhZG93IHN5c3RlbSBtZW1vcnkNCj4+IGNvcGll
cyBvZiBhbGwgcGFnZSB0YWJsZXMgc28gbWF5YmUgdGhhdCBub3QgYW4gaXNzdWUsIHNvIHllcywg
anVzdCB0cnkNCj4+IHRvIGFsbG9jYXRlIHRoZSBiYWQgcGFnZSBhZnRlciByZXNldCBhbmQgaWYg
aXQncyBzdGlsbCByZXNlcnZlZCB5b3Ugd2lsbA0KPj4gZmFpbC4NCj4+DQo+PiBBbmRyZXkNCj4+
DQo+PiBPbiA5LzEyLzE5IDc6MzUgQU0sIFpob3UxLCBUYW8gd3JvdGU6DQo+Pj4gSGkgQW5kcmV5
Og0KPj4+DQo+Pj4gQXJlIHlvdSBzdXJlIG9mIHRoZSBWUkFNIGNvbnRlbnQgbG9zcyBhZnRlciBn
cHUgcmVzZXQ/IEknbSBub3QgdmVyeSANCj4+PiBmYW1pbGlhciB3aXRoIHRoZSBkZXRhaWwgb2Yg
Z3B1IHJlc2V0IGFuZCBJJ2xsIGRvIGV4cGVyaW1lbnQgdG8gDQo+Pj4gY29uZmlybSB0aGUgY2Fz
ZSB5b3UgbWVudGlvbmVkLg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+PiBUYW8NCj4+Pg0KPj4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBHcm9kem92c2t5LCBBbmRyZXkg
PEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+Pj4+IFNlbnQ6IDIwMTnlubQ55pyIMTLml6Ug
MTA6MzINCj4+Pj4gVG86IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3Ux
LCBUYW8NCj4+Pj4gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+Pj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT4NCj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IG11dGV4IGxv
Y2sgZnJvbSBhdG9taWMgY29udGV4dC4NCj4+Pj4NCj4+Pj4gVGhhdCBub3Qgd2hhdCBJIG1lYW50
LiBMZXQncyBzYXkgeW91IGhhbmRsZWQgb25lIGJhZCBwYWdlIGludGVycnVwdCANCj4+Pj4gYW5k
IGFzDQo+Pj4+IGEgcmVzdWx0IGhhdmUgb25lIGJhZCBwYWdlIHJlc2VydmVkLiBOb3cgdW5yZWxh
dGVkIGdmeCByaW5nIHRpbWVvdXQNCj4+Pj4gaGFwcGVucyB3aGljaCB0cmlnZ2VycyBHUFUgcmVz
ZXQgYW5kIFZSQU0gbG9zcy4gV2hlbiB5b3UgY29tZSBiYWNrIA0KPj4+PiBmcm9tDQo+Pj4+IHJl
c2V0IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2lsbCBiZSBjYWxsZWQgYnV0IHNpbmNl
IA0KPj4+PiBsYXN0X3Jlc2VydmVkDQo+Pj4+ID09IGRhdGFfY291bnQgdGhlIGJhZCBwYWdlIHdp
bGwgbm90IGJlIHJlc2VydmVkIGFnYWluLCBtYXliZSB3ZSANCj4+Pj4gc2hvdWxkIGp1c3QNCj4+
Pj4gc2V0IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgdG8gMCBhZ2FpbiBpZiBWUkFNIHdhcyBsb3N0IGR1
cmluZyBBU0lDIA0KPj4+PiByZXNldC4uLg0KPj4+Pg0KPj4+PiBBbmRyZXkNCj4+Pj4NCj4+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+PiBGcm9tOiBDaGVu
LCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQo+Pj4+IFNlbnQ6IDExIFNlcHRlbWJlciAy
MDE5IDIxOjUzOjAzDQo+Pj4+IFRvOiBHcm9kem92c2t5LCBBbmRyZXk7IFpob3UxLCBUYW87IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIN
Cj4+Pj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IG11dGV4IGxvY2sgZnJv
bSBhdG9taWMgY29udGV4dC4NCj4+Pj4NCj4+Pj4gQ29tbWVudCBpbmxpbmUuDQo+Pj4+DQo+Pj4+
IFJlZ2FyZHMsDQo+Pj4+IEd1Y2h1bg0KPj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4+PiBGcm9tOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFt
ZC5jb20+DQo+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDExLCAyMDE5IDEwOjQxIFBN
DQo+Pj4+IFRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IENjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5j
b20+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4+Pj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+
DQo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBtdXRleCBsb2NrIGZy
b20gYXRvbWljIGNvbnRleHQuDQo+Pj4+DQo+Pj4+IE9uIHNlY29uZCB0aG91Z2ggdGhpcyB3aWxs
IGJyZWFrwqAgd2hhdCBhYm91dCByZXNlcnZpbmcgYmFkIHBhZ2VzIHdoZW4NCj4+Pj4gcmVzZXR0
aW5nIEdQVSBmb3Igbm9uIFJBUyBlcnJvciByZWFzb24gc3VjaCBhcyBtYW51YWwgcmVzZXQgLFMz
IG9yIA0KPj4+PiByaW5nDQo+Pj4+IHRpbWVvdXQsIChhbWRncHVfcmFzX3Jlc3VtZS0+YW1kZ3B1
X3Jhc19yZXNldF9ncHUpIHNvIGkgd2lsbCBrZWVwIHRoZQ0KPj4+PiBjb2RlIGFzIGlzLg0KPj4+
Pg0KPj4+PiBBbm90aGVyIHBvc3NpYmxlIGlzc3VlIGluIGV4aXN0aW5nIGNvZGUgLSBsb29rcyBs
aWtlIG5vIHJlc2VydmF0aW9uIA0KPj4+PiB3aWxsIHRha2UNCj4+Pj4gcGxhY2UgaW4gdGhvc2Ug
Y2FzZSBldmVuIG5vdyBhcyBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzDQo+Pj4+IGRhdGEt
Pmxhc3RfcmVzZXJ2ZWQgd2lsbCBiZSBlcXVhbCB0byBkYXRhLT5jb3VudCAsIG5vID8gTG9va3Mg
bGlrZSBmb3INCj4+Pj4gdGhpcyBjYXNlIHlvdSBuZWVkIHRvIGFkZCBmbGFnIHRvIEZPUkNFIHJl
c2VydmF0aW9uIGZvciBhbGwgcGFnZXMgZnJvbQ0KPj4+PiAwIHRvIGRhdGEtPmNvdW5udC4NCj4+
Pj4gW0d1Y2h1bl1ZZXMsIGxhc3RfcmVzZXJ2ZWQgaXMgbm90IHVwZGF0ZWQgYW55IG1vcmUsIHVu
bGVzcyB3ZSANCj4+Pj4gdW5sb2FkIG91cg0KPj4+PiBkcml2ZXIuIFNvIGl0IG1heWJlIGFsd2F5
cyBlcXVhbCB0byBkYXRhLT5jb3VudCwgdGhlbiBubyBuZXcgYmFkIA0KPj4+PiBwYWdlIHdpbGwN
Cj4+Pj4gYmUgcmVzZXJ2ZWQuDQo+Pj4+IEkgc2VlIHdlIGhhdmUgb25lIGVlcHJvbSByZXNldCBi
eSB1c2VyLCBjYW4gd2UgcHV0IHRoaXMgDQo+Pj4+IGxhc3RfcmVzZXJ2ZWQgY2xlYW4NCj4+Pj4g
b3BlcmF0aW9uIHRvIHVzZXIgaW4gdGhlIHNhbWUgc3RhY2sgYXMgd2VsbD8NCj4+Pj4NCj4+Pj4g
QW5kcmV5DQo+Pj4+DQo+Pj4+IE9uIDkvMTEvMTkgMTA6MTkgQU0sIEFuZHJleSBHcm9kem92c2t5
IHdyb3RlOg0KPj4+Pj4gSSBsaWtlIHRoaXMgbXVjaCBtb3JlLCBJIHdpbGwgcmVsb2NhdGUgdG8N
Cj4+Pj4+IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiBhbiBwdXNoLg0KPj4+Pj4NCj4+
Pj4+IEFuZHJleQ0KPj4+Pj4NCj4+Pj4+IE9uIDkvMTAvMTkgMTE6MDggUE0sIFpob3UxLCBUYW8g
d3JvdGU6DQo+Pj4+Pj4gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyBpcyBvbmx5IHVzZWQg
YnkgdW1jIGJsb2NrLCBzbyBhbm90aGVyDQo+Pj4+Pj4gYXBwcm9hY2ggaXMgdG8gbW92ZSBpdCBp
bnRvIGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYi4NCj4+Pj4+PiBBbnl3YXksIGVpdGhl
ciB3YXkgaXMgT0sgYW5kIHRoZSBwYXRjaCBpczoNCj4+Pj4+Pg0KPj4+Pj4+IFJldmlld2VkLWJ5
OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+DQo+Pj4+Pj4NCj4+Pj4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4+Pj4gRnJvbTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4+Pj4+IFNlbnQ6IDIwMTnlubQ55pyIMTHml6UgMzo0
MQ0KPj4+Pj4+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+Pj4gQ2M6
IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8NCj4+Pj4+Pj4g
PFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+Pj4+IDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsNCj4+Pj4+Pj4gR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3Jv
ZHpvdnNreUBhbWQuY29tPg0KPj4+Pj4+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEZp
eCBtdXRleCBsb2NrIGZyb20gYXRvbWljIGNvbnRleHQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFByb2Js
ZW06DQo+Pj4+Pj4+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2FzIG1vdmVkIHRvIGFt
ZGdwdV9yYXNfcmVzZXRfZ3B1DQo+Pj4+Pj4+IGJlY2F1c2Ugd3JpdGluZyB0byBFRVBST00gZHVy
aW5nIEFTSUMgcmVzZXQgd2FzIHVuc3RhYmxlLg0KPj4+Pj4+PiBCdXQgZm9yIEVSUkVWRU5UX0FU
SFVCX0lOVEVSUlVQVCBhbWRncHVfcmFzX3Jlc2V0X2dwdSBpcyBjYWxsZWQNCj4+Pj4+Pj4gZGly
ZWN0bHkgZnJvbSBJU1IgY29udGV4dCBhbmQgc28gbG9ja2luZyBpcyBub3QgYWxsb3dlZC4gQWxz
byBpdCdzDQo+Pj4+Pj4+IGlycmVsZXZhbnQgZm9yIHRoaXMgcGFydGlsY3VsYXIgaW50ZXJydXB0
IGFzIHRoaXMgaXMgZ2VuZXJpYyBSQVMNCj4+Pj4+Pj4gaW50ZXJydXB0IGFuZCBub3QgbWVtb3J5
IGVycm9ycyBzcGVjaWZpYy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gRml4Og0KPj4+Pj4+PiBBdm9pZCBj
YWxsaW5nIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgaWYgbm90IGluIHRhc2sgY29udGV4
dC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFu
ZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiDCoMKgwqAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwgNCArKystDQo+Pj4+Pj4+IMKg
wqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgNCj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmgNCj4+Pj4+Pj4gaW5kZXggMDEyMDM0ZC4uZGQ1ZGEzYyAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+Pj4+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4+Pj4+PiBAQCAtNTA0LDcg
KzUwNCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9yYXNfcmVzZXRfZ3B1KHN0cnVjdA0K
Pj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAvKiBz
YXZlIGJhZCBwYWdlIHRvIGVlcHJvbSBiZWZvcmUgZ3B1IHJlc2V0LA0KPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4+PiAtwqDCoMKgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMoYWRldik7DQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKGluX3Rhc2soKSkNCj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7DQo+Pj4+Pj4+
ICsNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGF0b21pY19jbXB4Y2hnKCZyYXMtPmluX3Jl
Y292ZXJ5LCAwLCAxKSA9PSAwKQ0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVk
dWxlX3dvcmsoJnJhcy0+cmVjb3Zlcnlfd29yayk7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAwOw0KPj4+Pj4+PiAtLSANCj4+Pj4+Pj4gMi43LjQNCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
