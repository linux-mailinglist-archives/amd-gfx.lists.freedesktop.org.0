Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7074DECA9
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 14:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2446E086;
	Mon, 21 Oct 2019 12:45:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690085.outbound.protection.outlook.com [40.107.69.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD366E08E
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 12:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADiskhjkxbWYg4RzZPfDwwMjkdX48TPdK18TpHa4mw8rPUqgadAhI0Dr1gXWl5u2bIkwf63OpnlrgtUTDTofMiTn1vxmNiREG3084rquO+A7O3t7tGnCuBgQELlQcTHZVCnHGCG+dARZLRfyo14B+kqBQ7eCW5PqpSIF6n3piIKIHuHT0R0T/Z9IvoyXSp9EhUh9KlnBvlSpgp2QdVe9edUcNDmXLgMN+QRnX9OLxRFDmHZElOOZBMUsfgJp9L/l83iaNS4PqnBWZOE5HSuKW+K2+DhjJV4OCr8S86l9lOymWEhXgaItx/4/VmumThHLfB4TeZ+cOS9L2Wr/fPSWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCxPauVok3bk5gG5OwdJ5ozOGovzOozWK9kJYx7EVXA=;
 b=AYmKJvnfWDlgeNJm1qhGfJlr6ZIzTmnOEcyGyFVFiKz7Jlhpw+QHo6kRNI9G8F1ObMFtQFKffqnQJFOj+u2uMPPeqA2iAy7SZZCvJf9B8LUHBwQXDU+uJyV1refnj9lXlApzhgZmySQIV27L1iHQ1yNgIDCaKlnuWSQ2LOc+kNNpRy0IOg9OiZMLvwr+4dGyCnsGroxRm6MYvSyncY2qzCwCgyru1T/tnj+2hl1YWgnJxJ0cEBMeejCTlpMlZ8/+OU51UxONN4r1WtEOkzQFudaT8l7TNT+8B/4pTdpCMlZDhVDDKtNqeSiUIxvd+f2Nsh45A8M3kTcRw8XByiNQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3335.namprd12.prod.outlook.com (20.178.55.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Mon, 21 Oct 2019 12:45:18 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 12:45:18 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Ching-shih (Louis)" <Ching-shih.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] UPSTREAM: drm/amd/display: Fix Apple dongle cannot be
 successfully detected
Thread-Topic: [PATCH] UPSTREAM: drm/amd/display: Fix Apple dongle cannot be
 successfully detected
Thread-Index: AQHVh+SfyzamNb+0P02KgBTWMJD7cqdlCvWA
Date: Mon, 21 Oct 2019 12:45:18 +0000
Message-ID: <c125018e-ef0f-9c90-0d8b-81bee96faa71@amd.com>
References: <20191021075439.1066-1-Ching-shih.Li@amd.com>
In-Reply-To: <20191021075439.1066-1-Ching-shih.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cb3422d-e421-42ed-72b0-08d756248712
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3335:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB33357AAAE33072BDC648D739EC690@BYAPR12MB3335.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(47660400002)(189003)(199004)(5660300002)(6506007)(102836004)(186003)(26005)(71190400001)(66476007)(66556008)(476003)(66446008)(64756008)(99286004)(52116002)(486006)(2906002)(71200400001)(66946007)(3846002)(6116002)(11346002)(14444005)(256004)(446003)(76176011)(2616005)(386003)(53546011)(8936002)(478600001)(7736002)(316002)(305945005)(4001150100001)(229853002)(14454004)(110136005)(81166006)(8676002)(81156014)(6246003)(86362001)(31696002)(36756003)(4326008)(66066001)(6436002)(6486002)(31686004)(2501003)(25786009)(6512007)(46800400005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3335;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z+0f5/Bvn4FLdph1Mn1JlzEvTxN2irOHXAgaMMfzWdag5TKMwWm9sX9qgHlsPD0fV1KZ2z/lF9YxC4vnOndrf0w917Kq5wFucO1ynU4jR3CLhjPeheu5zvZcg4rUcfrfcntX+HTHMRDCS/PFwDN7gT9gng1cDD8xp95Z1jwUmtosa8dXxErf93D3vud5Y9haavAbI0zqY12Q91f8371QCVmlYhbKI2FTuuR/s2UR2w858xbmtYuUE5FYRF4RySrtMRS3IR4Xy6ux73SdXWzspuTMN7V1qcCt7ZdcDHdN58dfCR7Kv6GLm4DMvKtDqupkwQt0xTOTPYNsE/bCt7FXYU+nzIWWsq6Bf0Pik+hgjNsDHGU9px8MtCl2Foj6omndpWkpSIsBUesdKdbjiLHRyM0QOYuMtleRDWbg8TIMAhiIyYVS5n3WdgAufpV4iLY4
Content-ID: <0ABA6E9A0DA801489EDD9CB70B06C4E4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb3422d-e421-42ed-72b0-08d756248712
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 12:45:18.3587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+H075M3sGW9QIhaw9aeNAYypwzdpQW4SNhhJdMyMfIzTcp20jlRezMLAFshCju0LKBxE04lPJVsbzrBKuiDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3335
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCxPauVok3bk5gG5OwdJ5ozOGovzOozWK9kJYx7EVXA=;
 b=UkH36ZMXoOYu0Wi449X2NKjK0nP1Uzs2+TblJiL+zM29WU2WEoE2vN048bggpDRXCBDwHUKKbR91pGOtIxKzWYc53mmTtCTnKT94ypEZLtJa5Sw2RxXCITpPytqT08ajQCRhOC4+v6Gl/kI2KAaL8og54cEO7ccry3Uur746KGY=
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMSAzOjU0IGEubS4sIExvdWlzIExpIHdyb3RlOg0KPiBbV2h5XQ0KPiBFeHRl
cm5hbCBtb25pdG9yIGNhbm5vdCBiZSBkaXNwbGF5ZWQgY29uc2lzdGVudGx5LCBpZiBjb25uZWN0
aW5nDQo+IHZpYSB0aGlzIEFwcGxlIGRvbmdsZSAoQTE2MjEsIFVTQiBUeXBlLUMgdG8gSERNSSku
DQo+IEJ5IGV4cGVyaW1lbnRzLCBpdCBpcyBjb25maXJtZWQgdGhhdCB0aGUgZG9uZ2xlIG5lZWRz
IDIwMG1zIGF0IGxlYXN0DQo+IHRvIGJlIHJlYWR5IGZvciBjb21tdW5pY2F0aW9uLCBhZnRlciBp
dCBzZXRzIEhQRCBzaWduYWwgaGlnaC4NCj4gDQo+IFtIb3ddDQo+IFdoZW4gcmVjZWl2aW5nIEhQ
RCBJUlEsIGRlbGF5IDUwMG1zIGF0IHRoZSBiZWdpbm5pbmcgb2YgaGFuZGxlX2hwZF9pcnEoKS4N
Cj4gVGhlbiBydW4gdGhlIG9yaWdpbmFsIHByb2NlZHVyZS4NCj4gV2l0aCB0aGlzIHBhdGNoIGFw
cGxpZWQsIHRoZSBwcm9ibGVtIGNhbm5vdCBiZSByZXByb2R1Y2VkLg0KPiBXaXRoIG90aGVyIGRv
bmdsZXMsIHRlc3QgcmVzdWx0cyBhcmUgUEFTUy4NCj4gVGVzdCByZXN1bHQgaXMgUEFTUyBhZnRl
ciBzeXN0ZW0gcmVzdW1lcyBmcm9tIHN1c3BlbmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMb3Vp
cyBMaSA8Q2hpbmctc2hpaC5MaUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBpbmRleCAwYWVmOTJiN2MwMzcuLjA0
M2RkYWM3Mzg2MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IEBAIC0xMDI1LDYgKzEwMjUsMTEgQEAgc3RhdGljIHZv
aWQgaGFuZGxlX2hwZF9pcnEodm9pZCAqcGFyYW0pDQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSBjb25uZWN0b3ItPmRldjsNCj4gICAJZW51bSBkY19jb25uZWN0aW9uX3R5cGUgbmV3X2Nv
bm5lY3Rpb25fdHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsNCj4gICANCj4gKyAgICAvKiBTb21l
IG1vbml0b3JzL2RvbmdsZXMgbmVlZCBhcm91bmQgMjAwbXMgdG8gYmUgcmVhZHkgZm9yIGNvbW11
bmljYXRpb24NCj4gKyAgICAgKiBhZnRlciB0aGV5IGRyaXZlIEhQRCBzaWduYWwgaGlnaC4NCj4g
KyAgICAgKi8NCj4gKyAgICBtZGVsYXkoNTAwKTsNCj4gKw0KVGhpcyBzb3VuZHMgbW9yZSBsaWtl
IGEgcXVpcmsgdGhhbiBiZWhhdmlvciB3ZSB3YW50IGZvciBhbGwgbW9uaXRvcnMsIA0KYnV0IHJl
Z2FyZGxlc3MgdGhpcyBzbGVlcCBpc24ndCB0aGUgY29ycmVjdCBwbGFjZSBmb3IgdGhpcyAtIHNp
bmNlIHRoaXMgDQppcyBhbiBoaWdoIHByaW9yaXR5IGludGVycnVwdCBoYW5kbGVyIHRoaXMgaXMg
cmVhbGx5IGp1c3QgYmxvY2tpbmcgDQpldmVyeXRoaW5nIGZvciBoYWxmIGEgc2Vjb25kLg0KDQpJ
IHRoaW5rIGl0J2QgbWFrZSBtb3JlIHNlbnNlIHRvIHF1ZXVlIG9mZiB0aGUgd29yayB0byBvY2N1
ciBoYWxmIGEgDQpzZWNvbmQgbGF0ZXIuDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAgIAkv
KiBJbiBjYXNlIG9mIGZhaWx1cmUgb3IgTVNUIG5vIG5lZWQgdG8gdXBkYXRlIGNvbm5lY3RvciBz
dGF0dXMgb3Igbm90aWZ5IHRoZSBPUw0KPiAgIAkgKiBzaW5jZSAoZm9yIE1TVCBjYXNlKSBNU1Qg
ZG9lcyB0aGlzIGluIGl0J3Mgb3duIGNvbnRleHQuDQo+ICAgCSAqLw0KPiANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
