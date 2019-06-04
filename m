Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9483503B
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 21:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224289BAF;
	Tue,  4 Jun 2019 19:26:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444E89BAF
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 19:26:42 +0000 (UTC)
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2614.namprd12.prod.outlook.com (20.176.255.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 19:26:38 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::2da9:6db9:100f:54de%5]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 19:26:38 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Always allocate initial connector state
 state
Thread-Topic: [PATCH] drm/amd/display: Always allocate initial connector state
 state
Thread-Index: AQHVGwq303Yf1ALIKUCkFraq7XGE06aL4MKA
Date: Tue, 4 Jun 2019 19:26:38 +0000
Message-ID: <50b1a2f6-69df-ddc0-0543-d222d71acf7d@amd.com>
References: <20190604192114.20995-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190604192114.20995-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5df0753d-45ae-4a52-8589-08d6e922907d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2614; 
x-ms-traffictypediagnostic: BYAPR12MB2614:
x-microsoft-antispam-prvs: <BYAPR12MB2614CD632BA65797514DB9E282150@BYAPR12MB2614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(346002)(396003)(376002)(199004)(189003)(53546011)(25786009)(6506007)(386003)(81156014)(102836004)(186003)(53936002)(110136005)(8676002)(486006)(316002)(81166006)(66066001)(4326008)(52116002)(26005)(5660300002)(71190400001)(71200400001)(6246003)(36756003)(8936002)(76176011)(476003)(11346002)(2616005)(446003)(6512007)(14444005)(256004)(86362001)(68736007)(31696002)(478600001)(99286004)(6436002)(305945005)(72206003)(2906002)(31686004)(6486002)(54906003)(3846002)(7736002)(6116002)(14454004)(64756008)(66556008)(66476007)(66946007)(73956011)(66446008)(229853002)(5024004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2614;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uL7kVYSRdtUEFf7umldSQn2ShHRiXfM/MJWeqO8pXdsWVr4iGORNdtMKAc82v7VsS1iMKBsPnNK/ztoYlbX5+DZymAlQ9caKf2WtbpsNf6sXSdSNCUZqXifYak1yikVxiY5ncS6uKPOMhg16edGpkVhWkteImNShMR8v4XeLGcnRJczSSS1WmjTprpknRbNShzgJjzOyAyfRthGykwmGR/FeufJ9VdM+h1qgd2nUbW7bRhrQ1YwYRvnYK1IQq4g6rfd/oT8t1kA799FSRd016YG0fnIgaaAcTMqYFtvVIKrZMAjxVWJUYhjjTigyrhtmaICzw+3+f1lNef5Uw0mc4cgnlgKNP8/8UfJusT1RiGBdhoSMgTckx462wnXepKD93PaSi03VEKbpERRjFbml7Im2XzBPmXpHuCY9m1g+P0o=
Content-ID: <2456026ABFCEF64D8B913A5C22A44F47@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df0753d-45ae-4a52-8589-08d6e922907d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 19:26:38.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlQlB5RscqLsetzwo6jcXVXpylFyG0M108D2UbLL7DE=;
 b=e4gSaCAOf3a0bqnPJOnSQhyNmj7lT2mawTnrXcDNSHkWxgnzQt4f62+gCc+2TXq6C3yGPr3IuH+G3gIqxTkIeE6mY2bDHTtZcxUF9oATOwISp3UB7NWSK7o7wVM0aCGgDqWe0YCWTBaU9AVYaIf76X5uKSi7AlNhYqD5q5k0LII=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDYtMDQgMzoyMSBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0K
PiBbV2h5XQ0KPiBVbmxpa2Ugb3VyIHJlZ3VsYXIgY29ubmVjdG9ycywgTVNUIGNvbm5lY3RvcnMg
ZG9uJ3Qgc3RhcnQgb2ZmIHdpdGgNCj4gYW4gaW5pdGlhbCBjb25uZWN0b3Igc3RhdGUuIFRoaXMg
Y2F1c2VzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHRvDQo+IG9jY3VyIHdoZW4gYXR0YWNo
aW5nIHRoZSBicGMgcHJvcGVydHkgc2luY2UgaXQgdHJpZXMgdG8gbW9kaWZ5IHRoZQ0KPiBjb25u
ZWN0b3Igc3RhdGUuDQo+IA0KPiBXZSBuZWVkIGFuIGluaXRpYWwgY29ubmVjdG9yIHN0YXRlIG9u
IHRoZSBjb25uZWN0b3IgdG8gYXZvaWQgdGhlIGNyYXNoLg0KPiANCj4gW0hvd10NCj4gVXNlIG91
ciByZXNldCBoZWxwZXIgdG8gYWxsb2NhdGUgYW4gaW5pdGlhbCBzdGF0ZSBhbmQgcmVzZXQgdGhl
IHZhbHVlcw0KPiB0byB0aGVpciBkZWZhdWx0cy4gV2Ugd2VyZSBhbHJlYWR5IGRvaW5nIHRoaXMg
YmVmb3JlLCBqdXN0IG5vdCBmb3INCj4gTVNUIGNvbm5lY3RvcnMuDQo+IA0KPiBDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IENjOiBSb21hbiBMaSA8cm9tYW4ubGlAYW1kLmNvbT4N
Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+
DQoNCkxHVE0sDQoNClJldmlld2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgMTAgKysrKysrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggYTY5OGM4ZjI3MmVkLi40NTIzYWIxMDBi
YzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYw0KPiBAQCAtNDc0Myw2ICs0NzQzLDEzIEBAIHZvaWQgYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl9pbml0X2hlbHBlcihzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+
ICAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRtLT5kZGV2LT5kZXZfcHJp
dmF0ZTsNCj4gICANCj4gKwkvKg0KPiArCSAqIFNvbWUgb2YgdGhlIHByb3BlcnRpZXMgYmVsb3cg
cmVxdWlyZSBhY2Nlc3MgdG8gc3RhdGUsIGxpa2UgYnBjLg0KPiArCSAqIEFsbG9jYXRlIHNvbWUg
ZGVmYXVsdCBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZSB3aXRoIG91ciByZXNldCBoZWxwZXIuDQo+
ICsJICovDQo+ICsJaWYgKGFjb25uZWN0b3ItPmJhc2UuZnVuY3MtPnJlc2V0KQ0KPiArCQlhY29u
bmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNldCgmYWNvbm5lY3Rvci0+YmFzZSk7DQo+ICsNCj4gICAJ
YWNvbm5lY3Rvci0+Y29ubmVjdG9yX2lkID0gbGlua19pbmRleDsNCj4gICAJYWNvbm5lY3Rvci0+
ZGNfbGluayA9IGxpbms7DQo+ICAgCWFjb25uZWN0b3ItPmJhc2UuaW50ZXJsYWNlX2FsbG93ZWQg
PSBmYWxzZTsNCj4gQEAgLTQ5MzIsOSArNDkzOSw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl9pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwNCj4gICAJCQkm
YWNvbm5lY3Rvci0+YmFzZSwNCj4gICAJCQkmYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVu
Y3MpOw0KPiAgIA0KPiAtCWlmIChhY29ubmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNldCkNCj4gLQkJ
YWNvbm5lY3Rvci0+YmFzZS5mdW5jcy0+cmVzZXQoJmFjb25uZWN0b3ItPmJhc2UpOw0KPiAtDQo+
ICAgCWFtZGdwdV9kbV9jb25uZWN0b3JfaW5pdF9oZWxwZXIoDQo+ICAgCQlkbSwNCj4gICAJCWFj
b25uZWN0b3IsDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
