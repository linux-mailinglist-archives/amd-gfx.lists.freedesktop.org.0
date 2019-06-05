Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119D35AFA
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 13:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D619E8979D;
	Wed,  5 Jun 2019 11:16:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690071.outbound.protection.outlook.com [40.107.69.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0BE8979D
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 11:16:36 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1260.namprd12.prod.outlook.com (10.168.239.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 11:16:34 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 11:16:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Topic: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Index: AQHVGu+OrT/8P8EeokmFRVCBZI4FaqaLqvYAgACddICAAKHwgA==
Date: Wed, 5 Jun 2019 11:16:33 +0000
Message-ID: <9bc59436-8a5d-be74-9f53-97ef17955599@amd.com>
References: <1559664412-5512-1-git-send-email-shirish.s@amd.com>
 <CADnq5_O2aB+5-tGSxo_ObqEGnCdgDEXyd99nnop6sDO2sKVVrw@mail.gmail.com>
 <1f3e3699-31ff-1806-97ea-cc8273d0380c@amd.com>
In-Reply-To: <1f3e3699-31ff-1806-97ea-cc8273d0380c@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0042.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::19) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4089ef9-2d0e-4aaa-0a47-08d6e9a7445d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1260; 
x-ms-traffictypediagnostic: DM5PR12MB1260:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB12604C9F9DC0ED5D05FD70D883160@DM5PR12MB1260.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(71200400001)(386003)(31686004)(71190400001)(6506007)(5660300002)(11346002)(46003)(99286004)(81156014)(65806001)(478600001)(8936002)(53546011)(36756003)(316002)(65956001)(229853002)(31696002)(81166006)(102836004)(86362001)(76176011)(256004)(6486002)(52116002)(14454004)(7736002)(6306002)(2906002)(2616005)(68736007)(73956011)(486006)(65826007)(186003)(72206003)(66946007)(6246003)(8676002)(64756008)(66446008)(66476007)(58126008)(305945005)(6116002)(66556008)(110136005)(53936002)(6436002)(6512007)(25786009)(966005)(4326008)(64126003)(54906003)(446003)(476003)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1260;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wTH1EXuVeiOk6mNl0oCvCKY5vIzUFPPqAhhqiReFMryJO18rO0YDTGpDnGfqOqjm58VFd+CHSggx92wFfMYrXYKFwZxyNtetp4kf0qe7EAv0iTp49iM/R739SSUxyONsteWnJtvLVvNVI3Cno97AiDukmk3BbntnPbdSLT0OtN9j4fG4duQtGnUOIiGxM/JFvg+TVFBoSyI7uSYtRFxfCJWXWLRl/mlJ1gBR95xDHdJliPr8kX7yuO0LLEhMTJ5UXCM7GdYrvtJbuK84bIX2jcZDgBVoLb0dibjs8+FP/9ixP0M9C/Jr9JZfimbKsrDV4eUHFfx1vRjwDB02QynHnaBjEDnfAKxUZj/+/XHhg6/7LwKkqShxvuxiMvYgF6P0qf8lujWy1LUOJUcjZKK/0ROnPBNwWY7r16zItoxJQDQ=
Content-ID: <0E6C20DBC2486B4C944CDA219EE980FD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4089ef9-2d0e-4aaa-0a47-08d6e9a7445d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 11:16:33.8935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUuHvGTuG0sAjYbU/5D2z/nT8q1K6tzNrSlaHle50NU=;
 b=mzZIs9j1aETKcq0BHMragfvxQCMjBWB0OCxfyJ6WRLV+4BIQPtiX6wbDvWJRd9/FW9e5v7fh1iwNEXMNahZclqP9+wyMqA7PODM2fedMIjjgkwlhwAzs/MP27OEHSBfrxLP7pLvC0FsAAELGppVVUBdgi8q7ol7l51qiFIwbKUc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Deng,
 Emily" <Emily.Deng@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDUuMDYuMTkgdW0gMDM6MzUgc2NocmllYiBTLCBTaGlyaXNoOg0KPiBIaSBBbGV4LA0KPg0K
PiBPbiA2LzQvMjAxOSA5OjQzIFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+PiBPbiBUdWUsIEp1
biA0LCAyMDE5IGF0IDEyOjA3IFBNIFMsIFNoaXJpc2ggPFNoaXJpc2guU0BhbWQuY29tPiB3cm90
ZToNCj4+PiBbV2hhdF0NCj4+PiByZWFkcHRyIHJlYWQgYWx3YXlzIHJldHVybnMgemVybywgc2lu
Y2UgbW9zdCBsaWtlbHkNCj4+PiBVVkQgYmxvY2sgaXMgZWl0aGVyIHBvd2VyIG9yIGNsb2NrIGdh
dGVkLg0KPj4+DQo+Pj4gW0hvd10NCj4+PiBmZXRjaCBycHRyIGFmdGVyIGFtZGdwdV9yaW5nX2Fs
bG9jKCkgd2hpY2ggaW5mb3Jtcw0KPj4+IHRoZSBwb3dlciBtYW5hZ2VtZW50IGNvZGUgdGhhdCB0
aGUgYmxvY2sgaXMgYWJvdXQgdG8gYmUNCj4+PiB1c2VkIGFuZCBoZW5jZSB0aGUgZ2F0aW5nIGlz
IHR1cm5lZCBvZmYuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBMaSA8Q2hpbmctc2hp
aC5MaUBhbWQuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFt
ZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Zjbi5jIHwgNCArKystDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2
XzAuYyAgIHwgNSArKysrLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92
N18wLmMgICB8IDUgKysrKy0NCj4+IFdoYXQgYWJvdXQgdXZkIDQuMiwgNS4wIGFuZCBWQ0UgMi4w
LCAzLjAsIDQuMD8NCj4gYW1kZ3B1X3ZjZV9yaW5nX3Rlc3RfcmluZygpIGlzIHRoZSBjb21tb24g
ZnVuY3Rpb24gZm9yIFZDRSAyLjAsIDMuMCAmIDQuMA0KPiBhbmQgcGF0Y2ggdGhhdCBmaXhlcyBp
dCwgaXMgYWxyZWFkeSByZXZpZXdlZC4NCj4NCj4gVVZEIDQuMiAmIDUuMMKgIHVzZSBtbVVWRF9D
T05URVhUX0lEIGluc3RlYWQgb2YgcmVhZHB0ciwNCj4gc28gaSBiZWxlaXZlIHRoaXMgZml4IGlz
IG5vdCBhcHBsaWNhYmxlIGZvciB0aGVtLg0KDQpZZWFoLCBhZ3JlZSB0aGF0IHNob3VsZCBhY3R1
YWxseSB3b3JrIGZpbmUgZm9yIHRob3NlLg0KDQpUaGlzIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClJlZ2FyZHMsDQpD
aHJpc3RpYW4uDQoNCj4gUmVnYXJkcywNCj4gU2hpcmlzaCBTDQo+PiBBbGV4DQo+Pg0KPj4+ICAg
IDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4+PiBpbmRleCAxMTg0
NTFmLi5kNzg2MDk4IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y24uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uYw0KPj4+IEBAIC00NjgsNyArNDY4LDcgQEAgaW50IGFtZGdwdV92Y25fZGVjX3Jpbmdf
dGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkNCj4+PiAgICBp
bnQgYW1kZ3B1X3Zjbl9lbmNfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
KQ0KPj4+ICAgIHsNCj4+PiAgICAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBy
aW5nLT5hZGV2Ow0KPj4+IC0gICAgICAgdWludDMyX3QgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9y
cHRyKHJpbmcpOw0KPj4+ICsgICAgICAgdWludDMyX3QgcnB0cjsNCj4+PiAgICAgICAgICAgdW5z
aWduZWQgaTsNCj4+PiAgICAgICAgICAgaW50IHI7DQo+Pj4NCj4+PiBAQCAtNDc2LDYgKzQ3Niw4
IEBAIGludCBhbWRncHVfdmNuX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcpDQo+Pj4gICAgICAgICAgIGlmIChyKQ0KPj4+ICAgICAgICAgICAgICAgICAgIHJldHVy
biByOw0KPj4+DQo+Pj4gKyAgICAgICBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7
DQo+Pj4gKw0KPj4+ICAgICAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fRU5DX0NN
RF9FTkQpOw0KPj4+ICAgICAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7DQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4+PiBpbmRleCBjNjFhMzE0Li4x
NjY4MmI3IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92
Nl8wLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jDQo+
Pj4gQEAgLTE3MCwxMyArMTcwLDE2IEBAIHN0YXRpYyB2b2lkIHV2ZF92Nl8wX2VuY19yaW5nX3Nl
dF93cHRyKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4+PiAgICBzdGF0aWMgaW50IHV2ZF92
Nl8wX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+Pj4gICAg
ew0KPj4+ICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7
DQo+Pj4gLSAgICAgICB1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7
DQo+Pj4gKyAgICAgICB1aW50MzJfdCBycHRyOw0KPj4+ICAgICAgICAgICB1bnNpZ25lZCBpOw0K
Pj4+ICAgICAgICAgICBpbnQgcjsNCj4+Pg0KPj4+ICAgICAgICAgICByID0gYW1kZ3B1X3Jpbmdf
YWxsb2MocmluZywgMTYpOw0KPj4+ICAgICAgICAgICBpZiAocikNCj4+PiAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcjsNCj4+PiArDQo+Pj4gKyAgICAgICBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0
X3JwdHIocmluZyk7DQo+Pj4gKw0KPj4+ICAgICAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5n
LCBIRVZDX0VOQ19DTURfRU5EKTsNCj4+PiAgICAgICAgICAgYW1kZ3B1X3JpbmdfY29tbWl0KHJp
bmcpOw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2
ZF92N18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jDQo+Pj4gaW5k
ZXggY2RiOTZkNC4uNzQ4MTFiMiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjdfMC5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dXZkX3Y3XzAuYw0KPj4+IEBAIC0xNzUsNyArMTc1LDcgQEAgc3RhdGljIHZvaWQgdXZkX3Y3XzBf
ZW5jX3Jpbmdfc2V0X3dwdHIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPj4+ICAgIHN0YXRp
YyBpbnQgdXZkX3Y3XzBfZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZykNCj4+PiAgICB7DQo+Pj4gICAgICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
cmluZy0+YWRldjsNCj4+PiAtICAgICAgIHVpbnQzMl90IHJwdHIgPSBhbWRncHVfcmluZ19nZXRf
cnB0cihyaW5nKTsNCj4+PiArICAgICAgIHVpbnQzMl90IHJwdHI7DQo+Pj4gICAgICAgICAgIHVu
c2lnbmVkIGk7DQo+Pj4gICAgICAgICAgIGludCByOw0KPj4+DQo+Pj4gQEAgLTE4NSw2ICsxODUs
OSBAQCBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcpDQo+Pj4gICAgICAgICAgIHIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAx
Nik7DQo+Pj4gICAgICAgICAgIGlmIChyKQ0KPj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiBy
Ow0KPj4+ICsNCj4+PiArICAgICAgIHJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsN
Cj4+PiArDQo+Pj4gICAgICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIEhFVkNfRU5DX0NN
RF9FTkQpOw0KPj4+ICAgICAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7DQo+Pj4NCj4+
PiAtLQ0KPj4+IDIuNy40DQo+Pj4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+Pj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
