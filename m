Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E520D39197
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 18:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B26F89CE1;
	Fri,  7 Jun 2019 16:06:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66C89CE1
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 16:06:30 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3109.namprd12.prod.outlook.com (20.178.54.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Fri, 7 Jun 2019 16:06:28 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1943.023; Fri, 7 Jun 2019
 16:06:28 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 10/24] drm/amd/display: Rework CRTC color management
Thread-Topic: [PATCH 10/24] drm/amd/display: Rework CRTC color management
Thread-Index: AQHVHKoryWYuyhFROUaW7aLp+KrRDqaP1EaAgAAHtICAAHxmAIAABDYA
Date: Fri, 7 Jun 2019 16:06:28 +0000
Message-ID: <a1ffad75-d51a-5086-a0ee-9533bde8a921@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-11-Bhawanpreet.Lakha@amd.com>
 <a9b95680-66f6-6f1e-5741-0786c6eb6240@daenzer.net>
 <9c82a91b-971f-9531-0d12-77fcf6dbf46b@amd.com>
 <3e5b0c1b-0958-8c39-0030-56c5cdf53574@daenzer.net>
In-Reply-To: <3e5b0c1b-0958-8c39-0030-56c5cdf53574@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cc5e621-eb09-430a-748b-08d6eb62193d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3109; 
x-ms-traffictypediagnostic: BYAPR12MB3109:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3109978E2C7E205E28990062EC100@BYAPR12MB3109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(5660300002)(6116002)(99286004)(6246003)(68736007)(3846002)(76176011)(25786009)(316002)(2906002)(6506007)(31696002)(53546011)(386003)(86362001)(256004)(52116002)(66066001)(53936002)(11346002)(6512007)(102836004)(31686004)(8676002)(966005)(229853002)(26005)(14454004)(2616005)(36756003)(186003)(476003)(305945005)(486006)(6436002)(7736002)(81156014)(81166006)(54906003)(4326008)(71200400001)(71190400001)(6916009)(64756008)(8936002)(6306002)(66446008)(72206003)(478600001)(66556008)(66476007)(6486002)(73956011)(446003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3109;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UQXxyJnKSesD93R9BQQjv69mOU8An14opsobkcd9U7lTKho7n5lDNzMgoq4kWh/S2hIQ5eAOGgS1SjSyutOm4K/DvHAiqY99L39fXQbx7b58OuBSbGa8nxSS3+ieCAQLFWtgQDG63QGzJBepBakaQk4aKG8FX1Rp6dOVLAcfbT/nNesUnkpEM/LzoU1mmVHHCtAfLMptnajo48JtEjAY+BJOYA45y2XJZgtTXD55Sr6VSfkkogQXQ+rTYFwgUyVMUySqoSh4TAe7zR3UKkFmGAmTKbREjFS01/zD4rNzMlm9gxBLJgXaOzU9suZrUoKV+vuh2FMozphD27zZAtrev6xXPC2MUxryQFZf8Zafy6KblhjZeyDjVWuvD3QWdxYHepyPFyGCmfNkXHW+82Y0Xb3uQuGvOnnof0e9K+mXN2M=
Content-ID: <A5228649D6163E4DAE8DA3B4F658B500@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc5e621-eb09-430a-748b-08d6eb62193d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 16:06:28.6721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqWS4jIeAuybXE3XFci9gT7JZ47CvD+RlvnLgedL+zM=;
 b=JfEdQ93eA3vmO1GdT8DCidj61hvw3x9mEqsyvEGxxRVu9WZt3oEFzxlJlDoVdSebpr3R1sbVYh2oYQP1Bws5+0ZtklswtZ6k+Vn7Ki50S4wIga1tF6xiNfwOUFUVWdLCOUufNw6zdM/qffDy18sMdGlL9xCeGPTFhU7a27i0DcY=
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
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNi83LzE5IDExOjUxIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0wNi0w
NyAyOjI2IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOg0KPj4gT24gNi83LzE5IDM6
NTggQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPj4+IE9uIDIwMTktMDYtMDYgMTA6NTQgcC5t
LiwgQmhhd2FucHJlZXQgTGFraGEgd3JvdGU6DQo+Pj4+IEZyb206IE5pY2hvbGFzIEthemxhdXNr
YXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4+Pj4NCj4+Pj4gW1doeV0NCj4+Pj4g
VG8gcHJlcGFyZSBmb3IgdGhlIHVwY29taW5nIERSTSBwbGFuZSBjb2xvciBtYW5hZ2VtZW50IHBy
b3BlcnRpZXMNCj4+Pj4gd2UgbmVlZCB0byBjb3JyZWN0IGEgbG90IG9mIHdyb25nIGJlaGF2aW9y
IGFuZCBhc3N1bXB0aW9ucyBtYWRlIGZvcg0KPj4+PiBDUlRDIGNvbG9yIG1hbmFnZW1lbnQuDQo+
Pj4+DQo+Pj4+IFRoZSBkb2N1bWVudGF0aW9uIGFkZGVkIGJ5IHRoaXMgY29tbWl0IGluIGFtZGdw
dV9kbV9jb2xvciBleHBsYWlucw0KPj4+PiBob3cgdGhlIEhXIGNvbG9yIHBpcGVsaW5lIHdvcmtz
IGFuZCBpdHMgbGltaXRhdGlvbnMgd2l0aCB0aGUgRFJNDQo+Pj4+IGludGVyZmFjZS4NCj4+Pj4N
Cj4+Pj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyB0aGUgZm9sbG93aW5nIHdyb25n
Og0KPj4+PiAtIEltcGxpY2l0IHNSR0IgREdNIHdoZW4gbm8gQ1JUQyBER00gaXMgc2V0DQo+Pj4+
IC0gSW1wbGljaXQgc1JHQiBSR00gd2hlbiBubyBDUlRDIFJHTSBpcyBzZXQNCj4+Pj4gLSBObyB3
YXkgdG8gc3BlY2lmeSBhIG5vbi1saW5lYXIgREdNIG1hdHJpeCB0aGF0IHByb2R1Y2VzIGNvcnJl
Y3Qgb3V0cHV0DQo+Pj4+IC0gTm8gd2F5IHRvIHNwZWNpZnkgYSBjb3JyZWN0IFJHTSB3aGVuIGEg
bGluZWFyIERHTSBpcyB1c2VkDQo+Pj4+DQo+Pj4+IFdlIGhhZCB3b3JrYXJvdW5kcyBmb3IgcGFz
c2luZyBrbXNfY29sb3IgdGVzdHMgYnV0IG5vdCBhbGwgb2YgdGhlDQo+Pj4+IGJlaGF2aW9yIHdl
IGhhZCB3cm9uZyB3YXMgY292ZXJlZCBieSB0aGVzZSB0ZXN0cyAoZXNwZWNpYWxseSB3aGVuDQo+
Pj4+IGl0IGNvbWVzIHRvIG5vbi1saW5lYXIgREdNKS4gVGVzdGluZyBib3RoIERHTSBhbmQgUkdN
IGF0IHRoZSBzYW1lIHRpbWUNCj4+Pj4gaXNuJ3Qgc29tZXRoaW5nIGttc19jb2xvciB0ZXN0cyB3
ZWxsIGVpdGhlci4NCj4+Pj4NCj4+Pj4gW0hvd10NCj4+Pj4gVGhlIHNwZWNpZmljcyBmb3IgaG93
IGNvbG9yIG1hbmFnZW1lbnQgd29ya3MgaW4gQU1ER1BVIGFuZCB0aGUgbmV3DQo+Pj4+IGJlaGF2
aW9yIGNhbiBiZSBmb3VuZCBieSByZWFkaW5nIHRoZSBkb2N1bWVudGF0aW9uIGFkZGVkIHRvDQo+
Pj4+IGFtZGdwdV9kbV9jb2xvci5jIGZyb20gdGhpcyBwYXRjaC4NCj4+Pj4NCj4+Pj4gQWxsIG9m
IHRoZSBpbmNvcnJlY3QgY2FzZXMgZnJvbSB0aGUgb2xkIGltcGxlbWVudGF0aW9uIGhhdmUgYmVl
bg0KPj4+PiBhZGRyZXNzZWQgZm9yIHRoZSBhdG9taWMgaW50ZXJmYWNlLCBidXQgdGhlcmUgc3Rp
bGwgYSBmZXcgVE9ET3MgZm9yDQo+Pj4+IHRoZSBsZWdhY3kgb25lLg0KPj4+Pg0KPj4+PiBOb3Rl
OiB0aGlzIGRvZXMgY2F1c2UgcmVncmVzc2lvbnMgZm9yIGttc19jb2xvckBwaXBlLWEtY3RtLSog
b3ZlciBIRE1JLg0KPj4+Pg0KPj4+PiBUaGUgcmVzdWx0IGxvb2tzIGNvcnJlY3QgZnJvbSB2aXN1
YWwgaW5zcGVjdGlvbiBidXQgdGhlIENSQyBubyBsb25nZXINCj4+Pj4gbWF0Y2hlcy4gRm9yIHJl
ZmVyZW5jZSwgdGhlIHRlc3Qgd2FzIHByZXZpb3VzbHkgZG9pbmcgdGhlIGZvbGxvd2luZzoNCj4+
Pj4NCj4+Pj4gbGluZWFyIGRlZ2FtbWEgLT4gQ1RNIC0+IHNSR0IgcmVnYW1tYSAtPiBSR0IgdG8g
WVVWICg3MDkpIC0+IC4uLg0KPj4+Pg0KPj4+PiBOb3cgdGhlIHRlc3QgaXMgZG9pbmc6DQo+Pj4+
DQo+Pj4+IGxpbmVhciBkZWdhbW1hIC0+IENUTSAtPiBsaW5lYXIgcmVnYW1tYSAtPiBSR0IgdG8g
WVVWICg3MDkpIC0+IC4uLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXps
YXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBT
dW4gcGVuZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPg0KPj4+PiBBY2tlZC1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+DQo+Pj4NCj4+PiBEb2VzIHRoaXMg
YWRkcmVzcyBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnLzExMDY3NyA/IElmIHNvLCBjYW4g
eW91DQo+Pj4gYWRkIGEgcmVmZXJlbmNlIHRvIHRoZSBjb21taXQgbG9nPw0KPj4NCj4+IEl0IHVu
Zm9ydHVuYXRlbHkgZG9lcyBub3QuIFRoZXJlIGFyZSBzdGlsbCBzb21lIHJlbWFpbmluZyBpc3N1
ZXMgd2l0aA0KPj4gbGVnYWN5IGdhbW1hIHN1cHBvcnQgdGhhdCBJIGludGVuZCB0byBhZGRyZXNz
IGF0IHNvbWUgcG9pbnQgLSB3aGljaCBJDQo+PiBsZWZ0IGluIHRoaXMgcGF0Y2ggYXMgVE9ET3Mu
DQo+IA0KPiBOb3RlIHRoYXQgdGhlIGJ1ZyByZXBvcnRlciBpcyB1c2luZyB4Zjg2LXZpZGVvLWFt
ZGdwdSwgd2hpY2ggbm8gbG9uZ2VyDQo+IHVzZXMgbGVnYWN5IGdhbW1hIHdpdGggREMsIHVubGVz
cyBJIG1pc3VuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBieSB0aGF0Lg0KPiANCj4gDQoNCldoaWxl
IGl0IGNhbiB1c2UgdGhlIGZ1bGwgTFVULCBteSBndWVzcyBpcyB0aGF0IHdlIHdlcmUgc3RpbGwg
Z2V0dGluZyANCjI1NiBlbnRyaWVzIGluIERNL0RDLCB3aGljaCB3ZSBpbnRlcnByZXQgYXMgbGVn
YWN5IGF0IHRoZSBtb21lbnQuDQoNCkZXSVcgSSBkaWQgYWN0dWFsbHkgdHJpZWQgcmVwcm9kdWNp
bmcgdGhlIGlzc3VlIGFmdGVyIGFwcGx5aW5nIHRoZSBwYXRjaCANCmR1cmluZyBkZXZlbG9wbWVu
dCBhbmQgaXQgZ2F2ZSBtZSB0aGUgc2FtZSByZXN1bHRzIGJlZm9yZSBhbmQgYWZ0ZXIgZm9yIA0K
dGhhdCBzcGVjaWZpYyBpc3N1ZS4NCg0KTmljaG9sYXMgS2F6bGF1c2thcw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
