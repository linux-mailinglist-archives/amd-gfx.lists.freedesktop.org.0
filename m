Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F269E0811
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 17:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C96E868;
	Tue, 22 Oct 2019 15:57:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6430F6E868
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 15:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8iiJXQj4RJQHUYcNCcmQnZRgVWda6z3aOSDFNNm2lSGKt82yoOznlzyQwuXj+7u1glnBRKg9B2lDAh/1k535avnOMIEKuEha/O6Y2ldcaixCTtqHjz8RDgVbAjpWk3gZiHO49gOhOw+Nl69KUwao3lLOusoMlvo6vPWos0G2hfhC2F3TLOWwyaLlbAksE+SByZpHKMejKg4Xb12K4/EooyvbFQCaXIitas7f0FllqUaAq77w4WmrRmci1+lijyBIMuDdWUyw0j+FCmr8WeuedjfBH8uPMH66uNKgpsL0GL4WoH8mfQrGH0qNO/1Rax01Z/GoH+ej0gAlruIAIslYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92dFmfyPj335WbWPnFofyEalXjgI9jxM+Fh+9j/tyig=;
 b=nJDg0QXSzJyX9TVjgnxMLLZSwgwEMsK+wMwk2FkXAb04Em/vKwRKfSl6XVLL0n6E0soNVrcvcQ/DLFIebLHKqGqqs/jjdBbfYL+Bw6XX7Fz+6lr2ViluJ4arRF7mXQgVzvHMjLmObc7LkXMj/GlTD4M2R8H5FRi1V+Ue2mvD4wrJL4lHtcBPFgoASajgMTSHdXJXQCIylULyFZLVgYqjhyHS6q15MGP54Nbfmn8V0sB0zYdLK94nBs3BgwaM3bmvf8Q+WZucp/3aKMEq3FvWA31S1ILol6S1dvKtpbUUjwqdd83rhKsuhCwww2/njlPLZO1icoET1XfkPFth7rN7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3870.namprd12.prod.outlook.com (10.255.237.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 15:57:53 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 15:57:53 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: don't use dqm lock during device
 reset/suspend/resume
Thread-Topic: [PATCH] drm/amdkfd: don't use dqm lock during device
 reset/suspend/resume
Thread-Index: AQHViFMuq9YMscmH4UyKlVOEPH6sbadl2H0AgAD5toA=
Date: Tue, 22 Oct 2019 15:57:53 +0000
Message-ID: <487a7a91-f2d5-7cb0-afdf-d45360ae0eed@amd.com>
References: <20191021210436.10571-1-Philip.Yang@amd.com>
 <fbdfee2b-e9f9-598c-14f3-719429b9f374@amd.com>
In-Reply-To: <fbdfee2b-e9f9-598c-14f3-719429b9f374@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f078b58-ec9a-4982-55cd-08d7570898df
x-ms-traffictypediagnostic: MN2PR12MB3870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3870EA4C0B25EA583ACC28F7E6680@MN2PR12MB3870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(446003)(476003)(14454004)(11346002)(86362001)(478600001)(15650500001)(31696002)(81156014)(8676002)(8936002)(81166006)(64756008)(66476007)(66066001)(66446008)(66946007)(486006)(25786009)(66556008)(186003)(2501003)(31686004)(5660300002)(256004)(14444005)(2616005)(26005)(102836004)(53546011)(6506007)(386003)(71190400001)(76176011)(52116002)(6246003)(6486002)(6116002)(305945005)(7736002)(110136005)(3846002)(229853002)(6436002)(6512007)(36756003)(2906002)(4001150100001)(316002)(99286004)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3870;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QRDxcN0yejlNl+zGc7dphRBeGfQD91At4AuVvW2ycohLarqWrLbWz6O4GxrXxMYnGlx2nYrca5OnNPY3KEc3QsJ5iCv7CiSOw8uMtt+es7ar8ePnlaTX6GNcfIwS7BkAKTDEH47Mde1lsp/yRU5snbeI9v7MgfIHd1hNYHn4nGhjMIx25juIBu1y59YX6DntoQg30HtTN8nQfBFnpHMeulDKwtiXZzMRAl4W2cRk/mjLh9rL+hQYhySNVM2t9YNsDe3gyhNsVo5X/Fa1jxaADPuKveRw20J+XqoQ72vv5kVyuePbia7OCBi9z/o65IiF6yeNrF3C/L5l482w3FDy/rCGWuTRfGSdbmR9w79+wr0/3sG/YnRN0DkxeJPRH6ajmJHXSK8keiTnGbohXy/jMCGrt1FTGpPWOsY6OrHFKKkYSrGFDCfIfCYdXVFZJMwT
Content-ID: <E2910CEAD5C8814596FFE6E158773D50@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f078b58-ec9a-4982-55cd-08d7570898df
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 15:57:53.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtMeYreGfRMWKsuzvHcGvTFlQJAcX9tm+QwypPp5Z31asGY3LNsISGFf0cSjBCcW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92dFmfyPj335WbWPnFofyEalXjgI9jxM+Fh+9j/tyig=;
 b=nb643JCWinmPhWUkVXQXnymAPcd6Non5j9GB0vpzWE0fG4dxSLF8kHgdhe4wxDdtBkacjfa37JYD1lb7IObmgKW6mRJGf9/IOdRcr7hfsVEy8cGMEQZsWLvbGbY0ieLrlBstkWtCNuGr/bdpj/JcorDgqdMFqTJKLLW95elePq0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQoNCk9uIDIwMTktMTAtMjEgOTowMyBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+IA0K
PiBPbiAyMDE5LTEwLTIxIDU6MDQgcC5tLiwgWWFuZywgUGhpbGlwIHdyb3RlOg0KPj4gSWYgZGV2
aWNlIHJlc2V0L3N1c3BlbmQvcmVzdW1lIGZhaWxlZCBmb3Igc29tZSByZWFzb24sIGRxbSBsb2Nr
IGlzDQo+PiBob2xkIGZvcmV2ZXIgYW5kIHRoaXMgY2F1c2VzIGRlYWRsb2NrLiBCZWxvdyBpcyBh
IGtlcm5lbCBiYWNrdHJhY2Ugd2hlbg0KPj4gYXBwbGljYXRpb24gb3BlbiBrZmQgYWZ0ZXIgc3Vz
cGVuZC9yZXN1bWUgZmFpbGVkLg0KPj4NCj4+IEluc3RlYWQgb2YgaG9sZGluZyBkcW0gbG9jayBp
biBwcmVfcmVzZXQgYW5kIHJlbGVhc2luZyBkcW0gbG9jayBpbg0KPj4gcG9zdF9yZXNldCwgYWRk
IGRxbS0+ZGV2aWNlX3N0b3BwZWQgZmxhZyB3aGljaCBpcyBtb2RpZmllZCBpbg0KPj4gZHFtLT5v
cHMuc3RhcnQgYW5kIGRxbS0+b3BzLnN0b3AuIFRoZSBmbGFnIGRvZXNuJ3QgbmVlZCBsb2NrIHBy
b3RlY3Rpb24NCj4+IGJlY2F1c2Ugd3JpdGUvcmVhZCBhcmUgYWxsIGluc2lkZSBkcW0gbG9jay4N
Cj4+DQo+PiBGb3IgSFdTIGNhc2UsIG1hcF9xdWV1ZXNfY3BzY2ggYW5kIHVubWFwX3F1ZXVlc19j
cHNjaCBjaGVja3MNCj4+IGRldmljZV9zdG9wcGVkIGZsYWcgYmVmb3JlIHNlbmRpbmcgdGhlIHVw
ZGF0ZWQgcnVubGlzdC4NCj4gDQo+IFdoYXQgYWJvdXQgdGhlIG5vbi1IV1MgY2FzZT8NCj4gDQo+
IEluIHRoZW9yeSBpbiBub24tSFdTIGNhc2UgbmV3IHF1ZXVlcyBzaG91bGQgYmUgY3JlYXRlZCBp
biBldmljdGVkIHN0YXRlDQo+IHdoaWxlIHRoZSBkZXZpY2UgKGFuZCBhbGwgcHJvY2Vzc2VzKSBh
cmUgc3VzcGVuZGVkLiBTbyB3ZSBzaG91bGQgbmV2ZXINCj4gdHJ5IHRvIG1hcCBvciB1bm1hcCBx
dWV1ZXMgdG8gSFFEcyBkdXJpbmcgc3VzcGVuZC4gQnV0IEknZCBmZWVsIGJldHRlcg0KPiB3aXRo
IGEgV0FSTl9PTiBhbmQgZXJyb3IgcmV0dXJuIGluIHRoZSByaWdodCBwbGFjZXMgdG8gbWFrZSBz
dXJlIHdlJ3JlDQo+IG5vdCBtaXNzaW5nIGFueXRoaW5nLiBCYXNpY2FsbHksIHdlIGNhbid0IGNh
bGwgYW55IG9mIHRoZQ0KPiBsb2FkL2Rlc3Ryb3lfbXFkIGZ1bmN0aW9ucyB3aGlsZSBzdXNwZW5k
ZWQuDQo+IA0KdjIgcGF0Y2ggYWRkIG5vbi1IV1MgY2FzZS4NCg0KPiBUaGF0IHJlbWluZHMgbWUs
IHdlIGFsc28gaGF2ZSB0byBhZGQgc29tZSBjaGVja3MgaW4gdGhlIGRlYnVnZnMgY29kZSB0bw0K
PiBhdm9pZCBkdW1waW5nIEhRRHMgb2YgYSBEUU0gdGhhdCdzIHN0b3BwZWQuDQo+DQpUaGFua3Ms
IGRvbmUgaW4gdjIgcGF0Y2gNCg0KPiBMYXN0IGNvbW1lbnQ6IGRxbS0+ZGV2aWNlX3N0b3BwZWQg
bXVzdCBiZSBpbml0aWFsaXplZCBhcyB0cnVlLiBJdCB3aWxsDQo+IGdldCBzZXQgdG8gZmFsc2Ug
d2hlbiB0aGUgZGV2aWNlIGlzIGZpcnN0IHN0YXJ0ZWQuIEl0IG1heSBiZSBlYXNpZXIgdG8NCj4g
cmV2ZXJzZSB0aGUgbG9naWMsIHNvbWV0aGluZyBsaWtlIGRxbS0+c2NoZWRfcnVubmluZyB0aGF0
IGdldHMNCj4gaW1wbGljaXRseSBpbml0aWFsaXplZCBhcyBmYWxzZS4NCj4gDQpDaGFuZ2UgdG8g
ZHFtLT5zY2hlZF9ydW5uaW5nIGluIHYyIHBhdGNoLg0KDQpSZWdhcmRzLA0KUGhpbGlwDQoNCj4g
UmVnYXJkcywNCj4gICDCoCBGZWxpeA0KPiANCj4gDQo+Pg0KPj4gQmFja3RyYWNlIG9mIGRxbSBs
b2NrIGRlYWRsb2NrOg0KPj4NCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldIElORk86IHRh
c2sgcm9jbWluZm86MzAyNCBibG9ja2VkIGZvciBtb3JlDQo+PiB0aGFuIDEyMCBzZWNvbmRzLg0K
Pj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gICAgICAgTm90IHRhaW50ZWQNCj4+IDUuMC4w
LXJjMS1rZmQtY29tcHV0ZS1yb2NtLWRrbXMtbm8tbnBpLTExMzEgIzENCj4+IFtUaHUgT2N0IDE3
IDE2OjQzOjM3IDIwMTldICJlY2hvIDAgPg0KPj4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tf
dGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuDQo+PiBbVGh1IE9jdCAxNyAxNjo0
MzozNyAyMDE5XSByb2NtaW5mbyAgICAgICAgRCAgICAwICAzMDI0ICAgMjk0Nw0KPj4gMHg4MDAw
MDAwMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gQ2FsbCBUcmFjZToNCj4+IFtUaHUg
T2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IF9fc2NoZWR1bGUrMHgzZDkvMHg4YTANCj4+IFtUaHUg
T2N0IDE3IDE2OjQzOjM3IDIwMTldICBzY2hlZHVsZSsweDMyLzB4NzANCj4+IFtUaHUgT2N0IDE3
IDE2OjQzOjM3IDIwMTldICBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4YS8weDEwDQo+PiBb
VGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tdXRleF9sb2NrLmlzcmEuOSsweDFlMy8weDRl
MA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gX19jYWxsX3NyY3UrMHgyNjQvMHgz
YjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IHByb2Nlc3NfdGVybWluYXRpb25f
Y3BzY2grMHgyNC8weDJmMA0KPj4gW2FtZGdwdV0NCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIw
MTldICBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKzB4MjQvMHgyZjANCj4+IFthbWRncHVdDQo+
PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XQ0KPj4ga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9t
X2FsbF9kZXZpY2VzKzB4NDIvMHg2MCBbYW1kZ3B1XQ0KPj4gW1RodSBPY3QgMTcgMTY6NDM6Mzcg
MjAxOV0gIGtmZF9wcm9jZXNzX25vdGlmaWVyX3JlbGVhc2UrMHgxYmUvMHgyMjANCj4+IFthbWRn
cHVdDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tbXVfbm90aWZpZXJfcmVsZWFz
ZSsweDNlLzB4YzANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBleGl0X21tYXArMHgx
NjAvMHgxYTANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IF9faGFuZGxlX21tX2Zh
dWx0KzB4YmEzLzB4MTIwMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gZXhpdF9y
b2J1c3RfbGlzdCsweDVhLzB4MTEwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgbW1w
dXQrMHg0YS8weDEyMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGRvX2V4aXQrMHgy
ODQvMHhiMjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IGhhbmRsZV9tbV9mYXVs
dCsweGZhLzB4MjAwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZG9fZ3JvdXBfZXhp
dCsweDNhLzB4YTANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBfX3g2NF9zeXNfZXhp
dF9ncm91cCsweDE0LzB4MjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBkb19zeXNj
YWxsXzY0KzB4NGYvMHgxMDANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5DQo+Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jICAgICAgICAgICAgfCAgNiArKystLS0N
Cj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICAgICAgICAg
ICB8ICA1IC0tLS0tDQo+PiAgICAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jICAgfCAxMyArKysrKysrKysrLS0tDQo+PiAgICAuLi4vZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oICAgfCAgMSArDQo+PiAgICA0IGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPj4gaW5kZXggZDllMzZkYmYxM2Q1
Li40MGQ3NWMzOWYwOGUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfY2hhcmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
Y2hhcmRldi5jDQo+PiBAQCAtMTIwLDEzICsxMjAsMTMgQEAgc3RhdGljIGludCBrZmRfb3Blbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXApDQo+PiAgICAJCXJldHVybiAt
RVBFUk07DQo+PiAgICAJfQ0KPj4gICAgDQo+PiArCWlmIChrZmRfaXNfbG9ja2VkKCkpDQo+PiAr
CQlyZXR1cm4gLUVBR0FJTjsNCj4+ICsNCj4+ICAgIAlwcm9jZXNzID0ga2ZkX2NyZWF0ZV9wcm9j
ZXNzKGZpbGVwKTsNCj4+ICAgIAlpZiAoSVNfRVJSKHByb2Nlc3MpKQ0KPj4gICAgCQlyZXR1cm4g
UFRSX0VSUihwcm9jZXNzKTsNCj4+ICAgIA0KPj4gLQlpZiAoa2ZkX2lzX2xvY2tlZCgpKQ0KPj4g
LQkJcmV0dXJuIC1FQUdBSU47DQo+PiAtDQo+PiAgICAJZGV2X2RiZyhrZmRfZGV2aWNlLCAicHJv
Y2VzcyAlZCBvcGVuZWQsIGNvbXBhdCBtb2RlICgzMiBiaXQpIC0gJWRcbiIsDQo+PiAgICAJCXBy
b2Nlc3MtPnBhc2lkLCBwcm9jZXNzLT5pc18zMmJpdF91c2VyX21vZGUpOw0KPj4gICAgDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+PiBpbmRleCA4ZjRiMjRlODQ5
NjQuLjRmYTg4MzRjZTdjYiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jDQo+PiBAQCAtNzMwLDkgKzczMCw2IEBAIGludCBrZ2Qya2ZkX3ByZV9yZXNldChz
dHJ1Y3Qga2ZkX2RldiAqa2ZkKQ0KPj4gICAgCQlyZXR1cm4gMDsNCj4+ICAgIAlrZ2Qya2ZkX3N1
c3BlbmQoa2ZkKTsNCj4+ICAgIA0KPj4gLQkvKiBob2xkIGRxbS0+bG9jayB0byBwcmV2ZW50IGZ1
cnRoZXIgZXhlY3V0aW9uKi8NCj4+IC0JZHFtX2xvY2soa2ZkLT5kcW0pOw0KPj4gLQ0KPj4gICAg
CWtmZF9zaWduYWxfcmVzZXRfZXZlbnQoa2ZkKTsNCj4+ICAgIAlyZXR1cm4gMDsNCj4+ICAgIH0N
Cj4+IEBAIC03NTAsOCArNzQ3LDYgQEAgaW50IGtnZDJrZmRfcG9zdF9yZXNldChzdHJ1Y3Qga2Zk
X2RldiAqa2ZkKQ0KPj4gICAgCWlmICgha2ZkLT5pbml0X2NvbXBsZXRlKQ0KPj4gICAgCQlyZXR1
cm4gMDsNCj4+ICAgIA0KPj4gLQlkcW1fdW5sb2NrKGtmZC0+ZHFtKTsNCj4+IC0NCj4+ICAgIAly
ZXQgPSBrZmRfcmVzdW1lKGtmZCk7DQo+PiAgICAJaWYgKHJldCkNCj4+ICAgIAkJcmV0dXJuIHJl
dDsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jDQo+PiBpbmRleCA4MWZiNTQ1Y2Y0MmMuLjA0YTQwZmFiZTlkNyAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYw0KPj4gQEAgLTkxNSw3ICs5MTUsOCBAQCBzdGF0aWMgaW50IHN0YXJ0
X25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pDQo+PiAgICAJDQo+PiAg
ICAJaWYgKGRxbS0+ZGV2LT5kZXZpY2VfaW5mby0+YXNpY19mYW1pbHkgPT0gQ0hJUF9IQVdBSUkp
DQo+PiAgICAJCXJldHVybiBwbV9pbml0KCZkcW0tPnBhY2tldHMsIGRxbSk7DQo+PiAtCQ0KPj4g
KwlkcW0tPmRldmljZV9zdG9wcGVkID0gZmFsc2U7DQo+PiArDQo+PiAgICAJcmV0dXJuIDA7DQo+
PiAgICB9DQo+PiAgICANCj4+IEBAIC05MjMsNyArOTI0LDggQEAgc3RhdGljIGludCBzdG9wX25v
Y3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pDQo+PiAgICB7DQo+PiAgICAJ
aWYgKGRxbS0+ZGV2LT5kZXZpY2VfaW5mby0+YXNpY19mYW1pbHkgPT0gQ0hJUF9IQVdBSUkpDQo+
PiAgICAJCXBtX3VuaW5pdCgmZHFtLT5wYWNrZXRzKTsNCj4+IC0JDQo+PiArCWRxbS0+ZGV2aWNl
X3N0b3BwZWQgPSB0cnVlOw0KPj4gKw0KPj4gICAgCXJldHVybiAwOw0KPj4gICAgfQ0KPj4gICAg
DQo+PiBAQCAtMTA3NCw2ICsxMDc2LDcgQEAgc3RhdGljIGludCBzdGFydF9jcHNjaChzdHJ1Y3Qg
ZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4+ICAgIAlkcW1fbG9jayhkcW0pOw0KPj4gICAg
CS8qIGNsZWFyIGhhbmcgc3RhdHVzIHdoZW4gZHJpdmVyIHRyeSB0byBzdGFydCB0aGUgaHcgc2No
ZWR1bGVyICovDQo+PiAgICAJZHFtLT5pc19od3NfaGFuZyA9IGZhbHNlOw0KPj4gKwlkcW0tPmRl
dmljZV9zdG9wcGVkID0gZmFsc2U7DQo+PiAgICAJZXhlY3V0ZV9xdWV1ZXNfY3BzY2goZHFtLCBL
RkRfVU5NQVBfUVVFVUVTX0ZJTFRFUl9EWU5BTUlDX1FVRVVFUywgMCk7DQo+PiAgICAJZHFtX3Vu
bG9jayhkcW0pOw0KPj4gICAgDQo+PiBAQCAtMTA4OSw2ICsxMDkyLDcgQEAgc3RhdGljIGludCBz
dG9wX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KPj4gICAgew0KPj4g
ICAgCWRxbV9sb2NrKGRxbSk7DQo+PiAgICAJdW5tYXBfcXVldWVzX2Nwc2NoKGRxbSwgS0ZEX1VO
TUFQX1FVRVVFU19GSUxURVJfQUxMX1FVRVVFUywgMCk7DQo+PiArCWRxbS0+ZGV2aWNlX3N0b3Bw
ZWQgPSB0cnVlOw0KPj4gICAgCWRxbV91bmxvY2soZHFtKTsNCj4+ICAgIA0KPj4gICAgCWtmZF9n
dHRfc2FfZnJlZShkcW0tPmRldiwgZHFtLT5mZW5jZV9tZW0pOw0KPj4gQEAgLTEyNzUsOSArMTI3
OSwxMCBAQCBzdGF0aWMgaW50IG1hcF9xdWV1ZXNfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0pDQo+PiAgICB7DQo+PiAgICAJaW50IHJldHZhbDsNCj4+ICAgIA0KPj4gKwlp
ZiAoZHFtLT5kZXZpY2Vfc3RvcHBlZCkNCj4+ICsJCXJldHVybiAwOw0KPj4gICAgCWlmIChkcW0t
PnF1ZXVlX2NvdW50IDw9IDAgfHwgZHFtLT5wcm9jZXNzZXNfY291bnQgPD0gMCkNCj4+ICAgIAkJ
cmV0dXJuIDA7DQo+PiAtDQo+PiAgICAJaWYgKGRxbS0+YWN0aXZlX3J1bmxpc3QpDQo+PiAgICAJ
CXJldHVybiAwOw0KPj4gICAgDQo+PiBAQCAtMTI5OSw2ICsxMzA0LDggQEAgc3RhdGljIGludCB1
bm1hcF9xdWV1ZXNfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+PiAg
ICB7DQo+PiAgICAJaW50IHJldHZhbCA9IDA7DQo+PiAgICANCj4+ICsJaWYgKGRxbS0+ZGV2aWNl
X3N0b3BwZWQpDQo+PiArCQlyZXR1cm4gMDsNCj4+ICAgIAlpZiAoZHFtLT5pc19od3NfaGFuZykN
Cj4+ICAgIAkJcmV0dXJuIC1FSU87DQo+PiAgICAJaWYgKCFkcW0tPmFjdGl2ZV9ydW5saXN0KQ0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmgNCj4+IGluZGV4IDJlYWVhNmIwNGNiZS4uNDRlY2RmOTk5Y2E4IDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5oDQo+PiBAQCAtMjAxLDYgKzIwMSw3IEBAIHN0cnVjdCBkZXZpY2VfcXVldWVf
bWFuYWdlciB7DQo+PiAgICAJYm9vbAkJCWlzX2h3c19oYW5nOw0KPj4gICAgCXN0cnVjdCB3b3Jr
X3N0cnVjdAlod19leGNlcHRpb25fd29yazsNCj4+ICAgIAlzdHJ1Y3Qga2ZkX21lbV9vYmoJaGlx
X3NkbWFfbXFkOw0KPj4gKwlib29sCQkJZGV2aWNlX3N0b3BwZWQ7DQo+PiAgICB9Ow0KPj4gICAg
DQo+PiAgICB2b2lkIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfY2lrKA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
