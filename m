Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525BF2BFDB
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5689BAB;
	Tue, 28 May 2019 07:03:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B8689BAB
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:03:39 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1436.namprd12.prod.outlook.com (10.168.239.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Tue, 28 May 2019 07:03:36 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:03:36 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGgBi9fHbs1R+UCq4weXpQUTlqZ+zoCAgAD1l1CAAFoCAA==
Date: Tue, 28 May 2019 07:03:36 +0000
Message-ID: <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
 <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:209:15::19) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43e25409-673d-4b0a-d468-08d6e33a9a9e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1436; 
x-ms-traffictypediagnostic: DM5PR12MB1436:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB14366B0583F3D073E6C54CF7831E0@DM5PR12MB1436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(366004)(376002)(189003)(199004)(13464003)(53936002)(73956011)(6246003)(305945005)(5660300002)(64126003)(71200400001)(966005)(65826007)(229853002)(65956001)(66556008)(66946007)(86362001)(6512007)(66476007)(6306002)(66446008)(65806001)(76176011)(64756008)(31696002)(68736007)(81156014)(6436002)(8676002)(7736002)(6486002)(81166006)(25786009)(2906002)(8936002)(478600001)(6116002)(110136005)(52116002)(14454004)(102836004)(99286004)(446003)(11346002)(72206003)(2616005)(476003)(486006)(186003)(14444005)(256004)(71190400001)(31686004)(46003)(386003)(6506007)(53546011)(36756003)(316002)(58126008)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1436;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 98joeK8cOEyIC29DZxbRY8zqZrbHGXrGbifAD42b6OIwbpBSGhhTF1E7q9h/y0uCSYRcRbxENDrLniUUp9HNrXVpZajF74TGT8/sXJCaPpQFk7TDrS9NV9G3eS6IT8StAtNy6YR8f5Hpu7IiK3M1w77ncaq2DMXGosUiI0Z3IlBM8amNjY+J6O7xzBzKPe6kdkpWqrmCouddI5syxs7D6vaTELNTxhOJP+jfKodZvhDBrfATHy+0ogWtXmdQMBmJdoa4JVB9EQb4RvJBqP+gjRh+grC9P9RYw6gOD6WQu85lc7P0yu0t9QfspoLqwhofSBESGTqZRzd/m+ddoQDfCkyEe1xDN7ANBCFmTcXHKRb2Vx4NHkAZHOOXJTODpq0Q81KAAg7AoFcY7WjcHNr+/wPXrbXZwcjhon15teD1n58=
Content-ID: <8206F439B877154B946F884D02C62AAB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e25409-673d-4b0a-d468-08d6e33a9a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:03:36.4275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw/FLE68wSjUTqOyPhuqgZcRqEvc6bucQzQ5cmW8rTY=;
 b=MUQSGLAtgdza45XrES88+w4RvW+XK+3MBC654RUVZD9VliC2FCAjnIFmlLmB+w4mQ06wIacl08qn4bH11ZL9MB2P5GlGRJZ5l5v63YleR7Vmn1bU/K+HXciCSXf9YBNIBCyMjBNT/jx/0iskXzjutvCzg7GHqqqmJ49xeU0SIiA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T2sgaW4gdGhpcyBjYXNlIHRoZSBwYXRjaCBpcyBhIE5BSy4NCg0KVGhlIGNvcnJlY3Qgc29sdXRp
b24gaXMgdG8gc3RvcCB1c2luZyBhbWRncHVfYm9fZnJlZV9rZXJuZWwgaW4gDQpnZnhfdjlfMF9z
d19maW5pLg0KDQpCVFc6IEFyZSB3ZSB1c2luZyB0aGUga2VybmVsIHBvaW50ZXIgc29tZXdoZXJl
PyBDYXVzZSB0aGF0IG9uZSBiZWNhbWUgDQpjb21wbGV0ZWx5IGludmFsaWQgYmVjYXVzZSBvZiBw
YXRjaCAiZHJtL2FtZGdwdTogcGluIHRoZSBjc2IgYnVmZmVyIG9uIA0KaHcgaW5pdCIuDQoNCkNo
cmlzdGlhbi4NCg0KQW0gMjguMDUuMTkgdW0gMDM6NDIgc2NocmllYiBRdWFuLCBFdmFuOg0KPiBU
aGUgb3JpZ2luYWwgdW5waW4gaW4gaHdfZmluaSB3YXMgaW50cm9kdWNlZCBieQ0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9hbWQtZ2Z4LzIwMTgtSnVseS8wMjM2ODEu
aHRtbA0KPg0KPiBFdmFuDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTog
YW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mDQo+PiBDaHJpc3RpYW4gSz9uaWcNCj4+IFNlbnQ6IE1vbmRheSwgTWF5IDI3LCAyMDE5IDc6
MDIgUE0NCj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6
IERvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbV91bnBpbg0KPj4NCj4+IEFtIDI3LjA1LjE5IHVt
IDEwOjQxIHNjaHJpZWIgRW1pbHkgRGVuZzoNCj4+PiBBcyBpdCB3aWxsIGRlc3Ryb3kgY2xlYXJf
c3RhdGVfb2JqLCBhbmQgYWxzbyB3aWxsIHVucGluIGl0IGluIHRoZQ0KPj4+IGdmeF92OV8wX3N3
X2ZpbmksIHNvIGRvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbSB1bnBpbiBpbg0KPj4+IGdmeF92
OV8wX2h3X2ZpbmksIG9yIGl0IHdpbGwgaGF2ZSB1bnBpbiB3YXJuaW5nLg0KPj4+DQo+Pj4gdjI6
IEZvciBzdXNwZW5kLCBzdGlsbCBuZWVkIHRvIGRvIHVucGluDQo+Pj4NCj4+PiBTaWduZWQtb2Zm
LWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMgKystDQo+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+PiBpbmRleCA1ZWI3MGU4Li41YjFm
ZjQ4IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4g
QEAgLTMzOTUsNyArMzM5NSw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfaHdfZmluaSh2b2lkICpo
YW5kbGUpDQo+Pj4gICAgCWdmeF92OV8wX2NwX2VuYWJsZShhZGV2LCBmYWxzZSk7DQo+Pj4gICAg
CWFkZXYtPmdmeC5ybGMuZnVuY3MtPnN0b3AoYWRldik7DQo+Pj4NCj4+PiAtCWdmeF92OV8wX2Nz
Yl92cmFtX3VucGluKGFkZXYpOw0KPj4+ICsJaWYgKGFkZXYtPmluX3N1c3BlbmQpDQo+Pj4gKwkJ
Z2Z4X3Y5XzBfY3NiX3ZyYW1fdW5waW4oYWRldik7DQo+PiBUaGF0IGRvZXNuJ3QgbG9va3MgbGlr
ZSBhIGdvb2QgaWRlYSB0byBtZS4NCj4+DQo+PiBXaHkgZG8gd2UgaGF2ZSB1bnBpbiBib3RoIGlu
IHRoZSBzd19maW5pIGFzIHdlbGwgYXMgdGhlIGh3X2ZpbmkgY29kZSBwYXRocz8NCj4+DQo+PiBS
ZWdhcmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiAgICAJcmV0dXJuIDA7DQo+Pj4gICAgfQ0K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
