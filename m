Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5660C69
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 22:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2996E54C;
	Fri,  5 Jul 2019 20:33:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636036E54C
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 20:33:35 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Fri, 5 Jul 2019 20:33:33 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 20:33:33 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Topic: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Index: AQHVM1TZ+bhjJgwx40qiXKklQxbloaa8YOGAgAAXMgCAAAMVAA==
Date: Fri, 5 Jul 2019 20:33:33 +0000
Message-ID: <50c16025-9c22-aa67-59b5-1dc7524b6c2f@amd.com>
References: <20190705171227.21009-1-alexander.deucher@amd.com>
 <f4c1f72f-9dfa-da35-eb1f-5f58dbabdc3f@amd.com>
 <BN6PR12MB161810373183A43F8FE1AB7085F50@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB161810373183A43F8FE1AB7085F50@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef19bc6d-29f8-4021-08c7-08d701880c89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3305; 
x-ms-traffictypediagnostic: DM6PR12MB3305:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3305847CFDDC46EE85EBA1CB92F50@DM6PR12MB3305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(2906002)(6512007)(316002)(68736007)(65826007)(31696002)(6306002)(65956001)(86362001)(58126008)(66476007)(66556008)(64756008)(66446008)(6486002)(66066001)(52116002)(65806001)(6436002)(66946007)(73956011)(229853002)(186003)(305945005)(8936002)(99286004)(71200400001)(2501003)(71190400001)(64126003)(7736002)(53936002)(256004)(476003)(81166006)(81156014)(2616005)(110136005)(5660300002)(486006)(8676002)(6246003)(11346002)(446003)(72206003)(4326008)(76176011)(36756003)(14454004)(25786009)(6506007)(102836004)(3846002)(53546011)(966005)(31686004)(386003)(26005)(6116002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3305;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IWddNvYiFT/2BBjyNtFh5jCyeaTv0ME48/kIhkAkx73whY5mTXY9KEgKk8jK+fP4PDMp138muKSs+e/fV0MMG5bf4yoXGveaL9+BTJp9SrHIAJoDLIuvsuH/TCH8Eu40GFXJPgop9EB3Ji35nXwcDB0IqMFs+L5SA2qt7yuCzxcNUFD2eg4MNYJLNjQR5zmgsoMAFErc4VvHwpqfnw/oQkjduVJltSRabgzHaeGxkDUrSYYy1HuRUoZNSFQjnJdACaj5dI2fcAMGea7iKEQn9ZldruZPx6CkegupQEXiJXYT08U2Q4/8NaZSmYh9z21HM4Ipf0nv4AmpPkat3/2SAbz0pcaPXSae+rvqPvtjtR4GRByABP5x2/PEpcoKRbLY+8o8UqeLPGO8YsDUV1BB939XQhAG3lAR6QCL7Oe3ttw=
Content-ID: <CF9C223569C271478D6356A87DE3FE71@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef19bc6d-29f8-4021-08c7-08d701880c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 20:33:33.5890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+vWcy9bsU2YRK34Vje1vqqFg0sGUtXKpNDEh6e6CVA=;
 b=1N1OErFOZVnpUftEnxBHg8aF3zYZm2hMciSOsjKHeP6OX8bWEyNct34LkM5X5rDQc2eAjPhBQLvxK+m2k3uKKDO1K+3cEZ7us2BO5fpo2sBV7aYC0TX0vv85nqPNAZR9uRoz1/JZGqXjCI9a86Hz4D+67Pj+7zPTjgvg4l7XrLM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNy0wNSA0OjIyIHAubS4sIFJ1c3NlbGwsIEtlbnQgd3JvdGU6DQo+IEhvdyB3b3Vs
ZCB3ZSBoYW5kbGUgdGhhdD8gSGF2aW5nIGEgcmV2ZXJ0IG9uIGFtZC1rZmQtc3RhZ2luZz8gV2Ug
Y2FuIA0KPiBlbnN1cmUgdGhhdCBhbWQtc3RhZ2luZy1ka21zIGRvZXNuJ3QgY2hlcnJ5cGljayBp
dCBpbiwgYnV0IHNpbmNlIEtGRCANCj4gbWVyZ2VzLCBpdCB3b3VsZCBiZSBtb3JlIGNvbXBsaWNh
dGVkLg0KDQoNCllvdSBjb3VsZCBtYW51YWxseSBlZGl0IHRoZSBtZXJnZSBjb21taXQgYmVmb3Jl
IHN1Ym1pdHRpbmcgaXQuIExpa2UgeW91IA0Kd291bGQgZG8gd2hlbiByZXNvbHZpbmcgYSBjb25m
bGljdC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4gS2VudA0KPg0KPiBLRU5UIFJV
U1NFTEwNCj4gU3IuIFNvZnR3YXJlIEVuZ2luZWVyIHwgTGludXggQ29tcHV0ZSBLZXJuZWwNCj4g
MSBDb21tZXJjZSBWYWxsZXkgRHJpdmUgRWFzdA0KPiBNYXJraGFtLCBPTiBMM1QgN1g2DQo+IE8g
KygxKSAyODktNjk1LTIxMjIgfCBFeHQgNzIxMjINCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICpGcm9t
OiogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gb24gYmVo
YWxmIG9mIA0KPiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+ICpT
ZW50OiogRnJpZGF5LCBKdWx5IDUsIDIwMTkgMjo1OTozMSBQTQ0KPiAqVG86KiBBbGV4IERldWNo
ZXI7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICpDYzoqIERldWNoZXIsIEFsZXhh
bmRlcg0KPiAqU3ViamVjdDoqIFJlOiBbUEFUQ0hdIGRybS9hbWRncHUvdHRtOiBtYWtlIHNvbWUg
ZnVuY3Rpb25zIHN0YXRpYw0KPiBPbiAyMDE5LTA3LTA1IDE6MTIgcC5tLiwgQWxleCBEZXVjaGVy
IHdyb3RlOg0KPiA+IE5vdGljZWQgd2hpbGUgcmV2aWV3aW5nIHRoZSBjb2RlLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
PiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+
DQo+IFdlJ2xsIG5lZWQgdG8gYmUgY2FyZWZ1bCBub3QgdG8gbWVyZ2UgdGhpcyBjaGFuZ2Ugb24g
YW1kLWtmZC1zdGFnaW5nIGFuZA0KPiBhbWQtc3RhZ2luZy1ka21zLiBPbiB0aG9zZSBicmFuY2hl
cywgdGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgZnJvbQ0KPiBhbWRncHVfYW1ka2ZkX2dwdXZtLmMu
DQo+DQo+IFJlZ2FyZHMsDQo+IMKgwqAgRmVsaXgNCj4NCj4NCj4gPiAtLS0NCj4gPsKgwqAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTQgKysrKysrKy0tLS0tLS0N
Cj4gPsKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIHzCoCA2IC0t
LS0tLQ0KPiA+wqDCoCAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KPiA+IGluZGV4IGM5ZmFhNjljZDY3Ny4uZDA5MDEwNmVmMjNiIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiA+IEBAIC0yOTksMTIgKzI5OSwx
MiBAQCBzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlIA0KPiAqYW1kZ3B1X2ZpbmRfbW1fbm9kZShz
dHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwNCj4gPsKgwqDCoCAqDQo+ID7CoMKgwqAgKiBAZjogUmV0
dXJucyB0aGUgbGFzdCBmZW5jZSBpZiBtdWx0aXBsZSBqb2JzIGFyZSBzdWJtaXR0ZWQuDQo+ID7C
oMKgwqAgKi8NCj4gPiAtaW50IGFtZGdwdV90dG1fY29weV9tZW1fdG9fbWVtKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqc3JjLA0KPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGFtZGdwdV9jb3B5X21lbSAqZHN0LA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3Qgc2l6ZSwNCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBy
ZXNlcnZhdGlvbl9vYmplY3QgKnJlc3YsDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICoqZikNCj4gPiAr
c3RhdGljIGludCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21lbShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqc3JjLA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2NvcHlfbWVtICpkc3QsDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVpbnQ2NF90IHNpemUsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByZXNlcnZhdGlv
bl9vYmplY3QgKnJlc3YsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmKQ0K
PiA+wqDCoCB7DQo+ID7CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBh
ZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nOw0KPiA+wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRy
bV9tbV9ub2RlICpzcmNfbW0sICpkc3RfbW07DQo+ID4gQEAgLTk0OSw3ICs5NDksNyBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfdHRtX3R0X3VucGluX3VzZXJwdHIoc3RydWN0IA0KPiB0dG1fdHQgKnR0
bSkNCj4gPsKgwqAgI2VuZGlmDQo+ID7CoMKgIH0NCj4gPg0KPiA+IC1pbnQgYW1kZ3B1X3R0bV9n
YXJ0X2JpbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gK3N0YXRpYyBpbnQgYW1k
Z3B1X3R0bV9nYXJ0X2JpbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibywNCj4gPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGZsYWdzKQ0K
PiA+wqDCoCB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uaCANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgN
Cj4gPiBpbmRleCBjMmI3NjY5MDA0YmEuLmRlODljMjE4ZGIyNiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgNCj4gPiBAQCAtODYsMTIgKzg2LDYgQEAg
aW50IGFtZGdwdV9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIA0KPiB1aW50
NjRfdCBzcmNfb2Zmc2V0LA0KPiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwNCj4gPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5j
ZSwgYm9vbCBkaXJlY3Rfc3VibWl0LA0KPiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYm9vbCB2bV9uZWVkc19mbHVzaCk7DQo+ID4gLWludCBhbWRncHVfdHRt
X2NvcHlfbWVtX3RvX21lbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBh
bWRncHVfY29weV9tZW0gKnNyYywNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfY29weV9tZW0gKmRzdCwNCj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVpbnQ2NF90IHNpemUsDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2LA0KPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGRtYV9mZW5jZSAqKmYpOw0KPiA+wqDCoCBpbnQgYW1kZ3B1X2ZpbGxfYnVmZmVyKHN0
cnVjdCBhbWRncHVfYm8gKmJvLA0KPiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1aW50MzJfdCBzcmNfZGF0YSwNCj4gPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVz
diwNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
