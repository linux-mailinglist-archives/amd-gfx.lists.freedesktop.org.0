Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F42122C07E
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84E89BF4;
	Tue, 28 May 2019 07:43:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C18289AF3
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:43:29 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1145.namprd12.prod.outlook.com (10.168.238.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.22; Tue, 28 May 2019 07:43:27 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:43:27 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVFGgBi9fHbs1R+UCq4weXpQUTlqZ+zoCAgAD1l1CAAFoCAIAACaoAgAABdwA=
Date: Tue, 28 May 2019 07:43:27 +0000
Message-ID: <daf490f4-49fd-3688-84ff-5dc47eaa535c@amd.com>
References: <1558946487-18034-1-git-send-email-Emily.Deng@amd.com>
 <e15ac75c-fb1a-2a05-b857-d3761f5c905e@gmail.com>
 <MN2PR12MB3344714A52B709FCE058F48DE41E0@MN2PR12MB3344.namprd12.prod.outlook.com>
 <82dfcb34-109c-b7d6-c511-404008589869@amd.com>
 <MWHPR12MB132646027A5B99282AB6557A8F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB132646027A5B99282AB6557A8F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P194CA0107.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::48) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d196c531-4bfa-4f46-3b63-08d6e3402bb5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1145; 
x-ms-traffictypediagnostic: DM5PR12MB1145:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB1145B32F8A7253A0C0B3051C831E0@DM5PR12MB1145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(39860400002)(366004)(396003)(13464003)(189003)(199004)(386003)(64126003)(102836004)(53546011)(6506007)(66946007)(6486002)(6116002)(66476007)(229853002)(6306002)(6512007)(31696002)(86362001)(76176011)(73956011)(6436002)(52116002)(66446008)(64756008)(316002)(36756003)(68736007)(99286004)(71200400001)(71190400001)(66556008)(6246003)(966005)(446003)(256004)(14444005)(110136005)(65806001)(65956001)(8936002)(14454004)(81156014)(81166006)(31686004)(478600001)(72206003)(7736002)(305945005)(8676002)(53936002)(25786009)(476003)(2616005)(2906002)(2501003)(486006)(11346002)(186003)(46003)(5660300002)(58126008)(65826007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1145;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tm5bMmmxALaVdOdLW7fE9orNKBWkEMaMDJtcqNuqFArib86ZNnpnJ5reZlAPkJPSuFfzBprWk7z0s385VQiZ+EXD0Tk7lje9FfXnVm5YQ4q0dTjBMY6rsS71l30D5Ww/Wk9Ne4d9oqlFJbc5xgTNzOa+f/ROfY3tORMWBwb7xOZnS0yV7kXF3CB2jx4/5QGmIcfPtAUNdksylFd3h5DyR5rVFEppIPEhLx7HGCeo4R5MzW4TvcHuZTyUjZ1CBMjj0BpakLKtMIgQtKs1Eqxhegoctih0xIgcEzFzqAJ7khIP7GSazSXeUUQhYd0RsSkzplW+dUrxfyKEQsgakuwwgQTuktZQ6jhk2jww6ofeTCxxyennzi1+RonYd4bsF5TGCX3lh4m2eZKkJfrz6LeO6d7IJHsjVLfdjzyOuNhdluE=
Content-ID: <E7AF3AAD965EA74880E1D7A233F24223@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d196c531-4bfa-4f46-3b63-08d6e3402bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:43:27.4927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfx9xmXC+klrpRhhPwyz3sIaqkcRZM7deUAzts4xwMk=;
 b=dBeHMhdLGmEYaEZuRh/galZ4IqQTWqomMyDLT0n1DJXuay7rfLMPsCCx9AJ/zkJB0bJ7XVWzhuNWGG7BcXv0b3LMsAC4mH8uICQPXlwnkVBfaKbwKGx9Z8StBg+5J8CT63o/HyRodGLVNAO+hLJZPHaVMZnWweOKYymY5FhQy6k=
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

QW0gMjguMDUuMTkgdW0gMDk6Mzggc2NocmllYiBEZW5nLCBFbWlseToNCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPg0KPj4gU2VudDogVHVlc2RheSwgTWF5IDI4LCAyMDE5IDM6MDQgUE0NCj4+
IFRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IERlbmcsIEVtaWx5DQo+PiA8RW1p
bHkuRGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IERvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbV91
bnBpbg0KPj4NCj4+IE9rIGluIHRoaXMgY2FzZSB0aGUgcGF0Y2ggaXMgYSBOQUsuDQo+Pg0KPj4g
VGhlIGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gc3RvcCB1c2luZyBhbWRncHVfYm9fZnJlZV9rZXJu
ZWwgaW4NCj4+IGdmeF92OV8wX3N3X2ZpbmkuDQo+IFNvIHdlIGp1c3QgbGVhZCB0aGUgbWVtb3J5
IGxlYWsgaGVyZSBhbmQgbm90IGRlc3Ryb3kgdGhlIGJvPyBJIGRvbid0IHRoaW5rIGl0IGlzIGNv
cnJlY3QuDQoNCk9oLCBuby4gVGhhdCdzIG5vdCB3aGF0IEkgbWVhbnQuDQoNCldlIHNob3VsZCBz
dG9wIHVzaW5nIGFtZGdwdV9ib19mcmVlX2tlcm5lbCBhbmQgaW5zdGVhZCB1c2UgYW1kZ3B1X2Jv
X2ZyZWUhDQoNClNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIgaGVyZSwNCkNocmlzdGlhbi4NCg0K
Pj4gQlRXOiBBcmUgd2UgdXNpbmcgdGhlIGtlcm5lbCBwb2ludGVyIHNvbWV3aGVyZT8gQ2F1c2Ug
dGhhdCBvbmUgYmVjYW1lDQo+PiBjb21wbGV0ZWx5IGludmFsaWQgYmVjYXVzZSBvZiBwYXRjaCAi
ZHJtL2FtZGdwdTogcGluIHRoZSBjc2IgYnVmZmVyIG9uIGh3DQo+PiBpbml0Ii4NCj4+DQo+PiBD
aHJpc3RpYW4uDQo+Pg0KPj4gQW0gMjguMDUuMTkgdW0gMDM6NDIgc2NocmllYiBRdWFuLCBFdmFu
Og0KPj4+IFRoZSBvcmlnaW5hbCB1bnBpbiBpbiBod19maW5pIHdhcyBpbnRyb2R1Y2VkIGJ5DQo+
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvYW1kLWdmeC8yMDE4LUp1
bHkvMDIzNjgxLmh0bWwNCj4+Pg0KPj4+IEV2YW4NCj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+Pj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4+IENocmlzdGlhbiBLP25pZw0KPj4+PiBTZW50OiBN
b25kYXksIE1heSAyNywgMjAxOSA3OjAyIFBNDQo+Pj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHku
RGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFtX3Vu
cGluDQo+Pj4+DQo+Pj4+IEFtIDI3LjA1LjE5IHVtIDEwOjQxIHNjaHJpZWIgRW1pbHkgRGVuZzoN
Cj4+Pj4+IEFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9zdGF0ZV9vYmosIGFuZCBhbHNvIHdpbGwg
dW5waW4gaXQgaW4gdGhlDQo+Pj4+PiBnZnhfdjlfMF9zd19maW5pLCBzbyBkb24ndCBuZWVkIHRv
IGNhbGwgY3NiX3ZyYW0gdW5waW4gaW4NCj4+Pj4+IGdmeF92OV8wX2h3X2ZpbmksIG9yIGl0IHdp
bGwgaGF2ZSB1bnBpbiB3YXJuaW5nLg0KPj4+Pj4NCj4+Pj4+IHYyOiBGb3Igc3VzcGVuZCwgc3Rp
bGwgbmVlZCB0byBkbyB1bnBpbg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVtaWx5IERl
bmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAzICsrLQ0KPj4+Pj4gICAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4+PiBpbmRleCA1ZWI3MGU4Li41
YjFmZjQ4IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
Yw0KPj4+Pj4gQEAgLTMzOTUsNyArMzM5NSw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfaHdfZmlu
aSh2b2lkICpoYW5kbGUpDQo+Pj4+PiAgICAgCWdmeF92OV8wX2NwX2VuYWJsZShhZGV2LCBmYWxz
ZSk7DQo+Pj4+PiAgICAgCWFkZXYtPmdmeC5ybGMuZnVuY3MtPnN0b3AoYWRldik7DQo+Pj4+Pg0K
Pj4+Pj4gLQlnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsNCj4+Pj4+ICsJaWYgKGFkZXYt
PmluX3N1c3BlbmQpDQo+Pj4+PiArCQlnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsNCj4+
Pj4gVGhhdCBkb2Vzbid0IGxvb2tzIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUuDQo+Pj4+DQo+Pj4+
IFdoeSBkbyB3ZSBoYXZlIHVucGluIGJvdGggaW4gdGhlIHN3X2ZpbmkgYXMgd2VsbCBhcyB0aGUg
aHdfZmluaSBjb2RlDQo+PiBwYXRocz8NCj4+Pj4gUmVnYXJkcywNCj4+Pj4gQ2hyaXN0aWFuLg0K
Pj4+Pg0KPj4+Pj4gICAgIAlyZXR1cm4gMDsNCj4+Pj4+ICAgICB9DQo+Pj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
