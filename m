Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1C3BD01
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 21:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4589150;
	Mon, 10 Jun 2019 19:40:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690042.outbound.protection.outlook.com [40.107.69.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB20889150
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 19:40:28 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2562.namprd12.prod.outlook.com (52.132.27.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 19:40:26 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 19:40:26 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Topic: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Index: AQHVHLIBFJGLVzlZGUi5mMfQcpn2SqaPL2sAgAYc+iA=
Date: Mon, 10 Jun 2019 19:40:25 +0000
Message-ID: <BL0PR12MB258042359503FD8AF4F4753980130@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1559857887-7096-1-git-send-email-Oak.Zeng@amd.com>
 <b3a5c8d3-394f-d6a1-dec3-fb42d0b9d077@amd.com>
In-Reply-To: <b3a5c8d3-394f-d6a1-dec3-fb42d0b9d077@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 579304b8-10da-4b30-2d6c-08d6eddb7c65
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2562; 
x-ms-traffictypediagnostic: BL0PR12MB2562:
x-microsoft-antispam-prvs: <BL0PR12MB25625C08C5163A4F10B8B5CE80130@BL0PR12MB2562.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(366004)(136003)(346002)(13464003)(189003)(199004)(71190400001)(71200400001)(186003)(6506007)(52536014)(76176011)(7696005)(99286004)(102836004)(86362001)(256004)(53546011)(26005)(110136005)(316002)(2501003)(5660300002)(8936002)(76116006)(81156014)(74316002)(66476007)(81166006)(64756008)(66446008)(3846002)(73956011)(55016002)(66946007)(66556008)(9686003)(25786009)(53936002)(6116002)(68736007)(8676002)(486006)(305945005)(33656002)(476003)(229853002)(2906002)(14454004)(66066001)(6246003)(7736002)(6436002)(478600001)(72206003)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2562;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oe8sGzjuhRgGx3tBXqeBTteZbOARVASPu3vGyhgcJxyT2/9kj8Y/xXrwOOshPem2+DFy1XrvrvIX/DJ1Ypb7litxrqVxqhs97XN2fZjq2uao3Ms61yKSFKzYXCasZfKUz9oJH5BLr8rnraHDdMEvn4Z4/265S7TwEG1GGddSdx9NbyrBXxR+9cb7T77hofAwSPIfebCtTAuIYV+Tv7XILq+Jk+nq6NS55E3mTr/GkhrTT3iMOsOv3RgFsRBtSycD+C8LAZC90UiN1LRjGU9Apt+RyCfJXKXIIrOcrSYI3rYPElt05Vww3cP0X/GR8VDwNEVzHLSOxooaXrQiS4B0ol1/hMbWOyPeE19l7Fmr7bXPQzI2D9idVpUM0wQ1lJDcuo044f5VgGJxfb8NrXPMwvL530uIo6s14VfzcCWEcs0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579304b8-10da-4b30-2d6c-08d6eddb7c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 19:40:25.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2562
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKAM9hR+FM3gdr8ZpJT2heiV3R9UBhunhu1COiye7LM=;
 b=BomID/dzgjGmlKfQjSUUKjjipCq6qp3poqu83fO36EUV5E5s8M2QSUxvhrud1tErAXmE8eqBrzcgHFoxktRXCeccxGzFMHDp/UV+xURF+7ZFZBbPL3vJmI4dgZHMn+KrhGM5pxYrSHo0TAE5Vr/ECF/1jafrRyrPrtJmCAlAh34=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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

SGkgRmVsaXgsDQoNCktmZF9pb21tdV9kZXZpY2VfaW5pdCBkZXBlbmRzIG9uIGtmZCB0b3BvbG9n
eS4gSSB3aWxsIGRvIGFzIHlvdSBzdWdnZXN0ZWQgYmVsb3cuIEFsc28gSSB3aWxsIG1vdmUgdGhl
IHNldHRpbmcgb2YgSFNBX0NBUF9BVFNfUFJFU0VOVCBmcm9tIGtmZF9pb21tdV9kZXZpY2VfaW5p
dCB0byBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZSwgdG8gYXZvaWQgdGhlIGRlcGVuZGVuY3kuDQoN
ClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEt1ZWhs
aW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgSnVu
ZSA2LCAyMDE5IDY6MDkgUE0NClRvOiBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtm
ZDogSW5pdGlhbGl6ZSBkcW0gZWFybGllcg0KDQpPbiAyMDE5LTA2LTA2IDU6NTEgcC5tLiwgWmVu
ZywgT2FrIHdyb3RlOg0KPiBkcW0gaXMgcmVmZXJlbmNlZCBpbiBmdW5jdGlvbiBrZmRfdG9wbG9n
eV9hZGRfZGV2aWNlLg0KPiBNb3ZlIGRxbSBpbml0aWFsaXphdGlvbiB1cCB0byBhdm9pZCBOVUxM
IHBvaW50ZXIgcmVmZXJlbmNlLg0KDQpUaGlzIGFkZHJlc3NlcyBhIHByZXR0eSB1bmxpa2VseSBy
YWNlIGNvbmRpdGlvbiB3aGVyZSBzb21lb25lIGxvb2tzIGF0IC9zeXMva2VybmVsL2RlYnVnL2tm
ZC9ocWRzIGR1cmluZyB0aGUgZGV2aWNlIGluaXRpYWxpemF0aW9uLg0KDQpXZSBhZGQgZGV2aWNl
cyBkbyB0aGUgdG9wb2xvZ3kgYmVmb3JlIHRoZWlyIGluaXRpYWxpemF0aW9uIGlzIHN1Y2Nlc3Nm
dWxseSBjb21wbGV0ZWQuIElmIGl0IGZhaWxzLCB3ZSByZW1vdmUgdGhlIGRldmljZSBhZ2Fpbi4g
SGF2aW5nIGRldmljZXMgaW4gdGhlIHRvcG9sb2d5IHRoYXQgYXJlIG5vdCBjb21wbGV0ZWx5IGlu
aXRpYWxpemVkIHlldCBzZWVtcyB0byBiZSB0aGUgcmVhbCBpc3N1ZS4gQSBjbGVhbmVyIHNvbHV0
aW9uIHdvdWxkIG1vdmUga2ZkX3RvcG9nbG9neV9hZGRfZGV2aWNlIHRvIHRoZSBlbmQgb2Yga2dk
MmtmZF9kZXZpY2VfaW5pdCwgc28gdGhhdCB3ZSBvbmx5IGFkZCBhIGRldmljZSB0byB0aGUgdG9w
b2xvZ3kgYWZ0ZXIgdGhleSBhcmUgc3VjY2Vzc2Z1bGx5IGFuZCBjb21wbGV0ZWx5IGluaXRpYWxp
emVkLiBOb3Qgc3VyZSBpZiB0aGVyZSBhcmUgYW55IGRlcGVuZGVuY2llcyBpbiB0aGUgaW5pdCBz
ZXF1ZW5jZSB0aGF0IHdvdWxkIGJlIGJyb2tlbiBieSB0aGlzLCB0aG91Z2guDQoNClJlZ2FyZHMs
DQogwqAgRmVsaXgNCg0KDQo+DQo+IENoYW5nZS1JZDogSWQ2Y2IyNTQxYWYxMjk4MjZiNzYyMWNl
YWE4ZTA2ZTYzOGM3YmIxMjINCj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFt
ZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YyB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYw0KPiBpbmRleCA5ZDFiMDI2Li5lN2UyNGZlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IEBAIC02MDMsNiArNjAzLDEyIEBAIGJvb2wg
a2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KPiAgIAlpZiAoa2ZkLT5r
ZmQya2dkLT5nZXRfaGl2ZV9pZCkNCj4gICAJCWtmZC0+aGl2ZV9pZCA9IGtmZC0+a2ZkMmtnZC0+
Z2V0X2hpdmVfaWQoa2ZkLT5rZ2QpOw0KPiAgIA0KPiArCWtmZC0+ZHFtID0gZGV2aWNlX3F1ZXVl
X21hbmFnZXJfaW5pdChrZmQpOw0KPiArCWlmICgha2ZkLT5kcW0pIHsNCj4gKwkJZGV2X2Vycihr
ZmRfZGV2aWNlLCAiRXJyb3IgaW5pdGlhbGl6aW5nIHF1ZXVlIG1hbmFnZXJcbiIpOw0KPiArCQln
b3RvIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2Vycm9yOw0KPiArCX0NCj4gKw0KPiAgIAlpZiAoa2Zk
X3RvcG9sb2d5X2FkZF9kZXZpY2Uoa2ZkKSkgew0KPiAgIAkJZGV2X2VycihrZmRfZGV2aWNlLCAi
RXJyb3IgYWRkaW5nIGRldmljZSB0byB0b3BvbG9neVxuIik7DQo+ICAgCQlnb3RvIGtmZF90b3Bv
bG9neV9hZGRfZGV2aWNlX2Vycm9yOyBAQCAtNjEzLDEyICs2MTksNiBAQCBib29sIA0KPiBrZ2Qy
a2ZkX2RldmljZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQo+ICAgCQlnb3RvIGtmZF9pbnRl
cnJ1cHRfZXJyb3I7DQo+ICAgCX0NCj4gICANCj4gLQlrZmQtPmRxbSA9IGRldmljZV9xdWV1ZV9t
YW5hZ2VyX2luaXQoa2ZkKTsNCj4gLQlpZiAoIWtmZC0+ZHFtKSB7DQo+IC0JCWRldl9lcnIoa2Zk
X2RldmljZSwgIkVycm9yIGluaXRpYWxpemluZyBxdWV1ZSBtYW5hZ2VyXG4iKTsNCj4gLQkJZ290
byBkZXZpY2VfcXVldWVfbWFuYWdlcl9lcnJvcjsNCj4gLQl9DQo+IC0NCj4gICAJaWYgKGtmZF9p
b21tdV9kZXZpY2VfaW5pdChrZmQpKSB7DQo+ICAgCQlkZXZfZXJyKGtmZF9kZXZpY2UsICJFcnJv
ciBpbml0aWFsaXppbmcgaW9tbXV2MlxuIik7DQo+ICAgCQlnb3RvIGRldmljZV9pb21tdV9lcnJv
cjsNCj4gQEAgLTY0MiwxMiArNjQyLDEyIEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1
Y3Qga2ZkX2RldiAqa2ZkLA0KPiAgIA0KPiAgIGtmZF9yZXN1bWVfZXJyb3I6DQo+ICAgZGV2aWNl
X2lvbW11X2Vycm9yOg0KPiAtCWRldmljZV9xdWV1ZV9tYW5hZ2VyX3VuaW5pdChrZmQtPmRxbSk7
DQo+IC1kZXZpY2VfcXVldWVfbWFuYWdlcl9lcnJvcjoNCj4gICAJa2ZkX2ludGVycnVwdF9leGl0
KGtmZCk7DQo+ICAga2ZkX2ludGVycnVwdF9lcnJvcjoNCj4gICAJa2ZkX3RvcG9sb2d5X3JlbW92
ZV9kZXZpY2Uoa2ZkKTsNCj4gICBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZV9lcnJvcjoNCj4gKwlk
ZXZpY2VfcXVldWVfbWFuYWdlcl91bmluaXQoa2ZkLT5kcW0pOw0KPiArZGV2aWNlX3F1ZXVlX21h
bmFnZXJfZXJyb3I6DQo+ICAgCWtmZF9kb29yYmVsbF9maW5pKGtmZCk7DQo+ICAga2ZkX2Rvb3Ji
ZWxsX2Vycm9yOg0KPiAgIAlrZmRfZ3R0X3NhX2Zpbmkoa2ZkKTsNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
