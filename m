Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BF1857C
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 08:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A428979D;
	Thu,  9 May 2019 06:41:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD58979D
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 06:41:38 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1707.namprd12.prod.outlook.com (10.175.86.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 06:41:35 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 06:41:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "Messinger, Ori"
 <Ori.Messinger@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Report firmware versions with sysfs
Thread-Topic: [PATCH] drm/amdgpu: Report firmware versions with sysfs
Thread-Index: AQHVBPqJxZT2hORBSkSS9KBKXJTlDaZf7HMAgAAEr6CAAYbHoIAA4pGA
Date: Thu, 9 May 2019 06:41:35 +0000
Message-ID: <7dd12671-02c3-2ada-bedd-7e198f921e55@amd.com>
References: <20190507173003.20565-1-Ori.Messinger@amd.com>
 <5c91589d-3515-6b96-d4fd-fc24e2dd40ae@gmail.com>
 <BN6PR12MB161893A9521D2797F54021DF85310@BN6PR12MB1618.namprd12.prod.outlook.com>
 <BN6PR12MB1618168C8A50146B69C9A19F85320@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1618168C8A50146B69C9A19F85320@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0021.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fa93b9d-8623-4a9f-e268-08d6d4496164
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1707; 
x-ms-traffictypediagnostic: DM5PR12MB1707:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1707451820106AF902EAE95D83330@DM5PR12MB1707.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(13464003)(36756003)(46003)(86362001)(65956001)(2501003)(65806001)(31686004)(256004)(476003)(2616005)(11346002)(31696002)(486006)(446003)(6246003)(71190400001)(71200400001)(25786009)(6486002)(316002)(6116002)(478600001)(110136005)(6306002)(6512007)(64756008)(58126008)(66946007)(73956011)(6436002)(66446008)(53936002)(66476007)(65826007)(66556008)(5660300002)(229853002)(2906002)(64126003)(305945005)(81166006)(81156014)(8676002)(14454004)(8936002)(72206003)(966005)(186003)(68736007)(52116002)(7736002)(76176011)(99286004)(102836004)(386003)(53546011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1707;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p3K6WUrsYyyR4MBCpGfLpFMYOEjcJkU5Yc1OHNvxt3WEztWEQEvqjkBFVv1kefXSyScpaJCqtAKsz0iD2A4bUOG5hp0sy2ujj/HS3vjMa/UwFNr4wSqaidw9z/RXqRXcALu7f17/PcxDvPVj6+k9MzpFAtIOal4MVnFuleG/4SFHGy53a7s7iMGr8aF9AJHH1r3OKqIrpm3t6yOx59WXT7ErQxBYLiVa26f4HpgfFN3Yu54esTaeJz52vpi+Yvrg86AiCiFOIgBRMVcVnY+zZDoCSKTi72ECOcwlfSzqvx/wa4AsECll+AY2sXR7ibFWDB7LfBzB3rdaEntTVgULgQvmJrYYxnu1Ln+kpkc1CIsfFSgFWFJBFr7XQXdiJYHYkTW4yF0gVgGkV3sZa+UaFeoXRT+RbEp73pjRpuqyd/A=
Content-ID: <F11715E23F084B4192E861E8ABF25641@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa93b9d-8623-4a9f-e268-08d6d4496164
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 06:41:35.6600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8EWsUuwbJpkzorjKcZ1e/b1xaHVE/a537D1zRKW7Is=;
 b=L32eHtdD8ExLGeWP6GF1wtxp/HMBEydoJSU6s1X6MPGZP9tjqV++E89GerTDdMN3BBdb9o73CuWdJ/+1tcZhnYRXZaPbRkLVMPmQBhayRjkXwCP6AuuGrUjRnTG4EGCkahcPjr0Lge0vmshe9YVFyCcmb/VUy8XOOggqQJlZppA=
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

SGkgS2VudCwNCg0Kbm90IHN0cm9uZyBvcGluaW9uIG9uIHRoYXQgYW5kIEkgYWdyZWUgdGhhdCBm
cm9tIGEgaG91c2VrZWVwaW5nIHBvaW50IG9mIA0KdmlldyB3ZSBzaG91bGQgcHJvYmFibHkgY3Jl
YXRlIGFuIG93biBkaXJlY3RvcnkgZm9yIHRoZSBmaWxlcy4NCg0KQ2hyaXN0aWFuLg0KDQpBbSAw
OC4wNS4xOSB1bSAxOToxMSBzY2hyaWViIFJ1c3NlbGwsIEtlbnQ6DQo+IEhpIENocmlzdGlhbiwN
Cj4NCj4gQXJlIHlvdSB3b3JyaWVkIGFib3V0IGhpbSBwdXR0aW5nIHRoZW0gaW4gYSBmd192ZXJz
aW9uIHN1YmZvbGRlciBsaWtlIHRoZSByYXMqIGZpbGVzIGFyZSwgb3IgYXJlIHRoZXkgZmluZSBp
biB0aGUgcmVndWxhciBzeXNmcyBwb29sPw0KPg0KPiAgIEtlbnQNCj4NCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFJ1c3NlbGwsIEtlbnQNCj4gU2VudDogVHVlc2Rh
eSwgTWF5IDcsIDIwMTkgMTo1MyBQTQ0KPiBUbzogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT47IE1lc3NpbmdlciwgT3JpIDxPcmkuTWVzc2luZ2VyQGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBk
cm0vYW1kZ3B1OiBSZXBvcnQgZmlybXdhcmUgdmVyc2lvbnMgd2l0aCBzeXNmcw0KPg0KPiBbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IFRoZSBkZWJ1Z2ZzIHdvbid0IGhhdmUgYW55dGhp
bmcgaW4gaXQgdGhhdCB0aGlzIGludGVyZmFjZSB3b24ndCBwcm92aWRlLiBJdCBkb2VzIEZXK1ZC
SU9TLCBhbmQgdGhlcmUgd2lsbCBiZSBzZXBhcmF0ZSBmaWxlcyBmb3IgZWFjaCBvZiB0aG9zZSBj
b21wb25lbnRzLg0KPg0KPiAgRnJvbSBhIGhvdXNla2VlcGluZyBzdGFuZHBvaW50LCBzaG91bGQg
d2UgbWFrZSBhIHN1YmZvbGRlciBjYWxsZWQgZndfdmVyc2lvbiB0byBkdW1wIHRoZSBmaWxlcyBp
bnRvLCBvciBhcmUgdGhleSBmaW5lIGluIHRoZSBiYXNlIHN5c2ZzIHRyZWU/DQo+DQo+ICAgS2Vu
dA0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFu
IEvDtm5pZw0KPiBTZW50OiBUdWVzZGF5LCBNYXkgNywgMjAxOSAxOjM1IFBNDQo+IFRvOiBNZXNz
aW5nZXIsIE9yaSA8T3JpLk1lc3NpbmdlckBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogUmVwb3J0IGZpcm13
YXJlIHZlcnNpb25zIHdpdGggc3lzZnMNCj4NCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0K
Pg0KPiBBbSAwNy4wNS4xOSB1bSAxOTozMCBzY2hyaWViIE1lc3NpbmdlciwgT3JpOg0KPj4gRmly
bXdhcmUgdmVyc2lvbnMgY2FuIGJlIGZvdW5kIGFzIHNlcGFyYXRlIHN5c2ZzIGZpbGVzIGF0Og0K
Pj4gL3N5cy9jbGFzcy9kcm0vY2FyZFgvZGV2aWNlLyAod2hlcmUgWCBpcyB0aGUgY2FyZCBudW1i
ZXIpIFRoZSBmaXJtd2FyZQ0KPj4gdmVyc2lvbnMgYXJlIGRpc3BsYXllZCBpbiBoZXhhZGVjaW1h
bC4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEkxMGNhZTRjMGNhNmYxYjZhOWNlZDA3ZGExNDM0MjZlMWQw
MTFlMjAzDQo+PiBTaWduZWQtb2ZmLWJ5OiBPcmkgTWVzc2luZ2VyIDxvcmkubWVzc2luZ2VyQGFt
ZC5jb20+DQo+IFdlbGwgdGhhdCBsb29rcyBsaWtlIGEgcmVhbGx5IG5pY2Ugb25lLCBwYXRjaCBp
cyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPg0KPiBDb3VsZCB3ZSByZW1vdmUgdGhlIGRlYnVnZnMgaW50ZXJmYWNlIG5vdyBvciBzaG91
bGQgd2Uga2VlcCBpdD8NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgNSArKw0KPj4gICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMgIHwgNzEgKysrKysrKysrKysrKysr
KysrKysrKw0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgg
IHwgIDIgKw0KPj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0K
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGluZGV4
IDNmMWM2YjJkM2Q4Ny4uNmJmZWU4ZDFmMWMzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IEBAIC0yNzAxLDYgKzI3MDEsMTAgQEAgaW50
IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+ICAgICAg
ICBpZiAocikNCj4+ICAgICAgICAgICAgICAgIERSTV9FUlJPUigicmVnaXN0ZXJpbmcgcG0gZGVi
dWdmcyBmYWlsZWQgKCVkKS5cbiIsIHIpOw0KPj4NCj4+ICsgICAgIHIgPSBhbWRncHVfdWNvZGVf
c3lzZnNfaW5pdChhZGV2KTsNCj4+ICsgICAgIGlmIChyKQ0KPj4gKyAgICAgICAgICAgICBEUk1f
RVJST1IoIkNyZWF0aW5nIGZpcm13YXJlIHN5c2ZzIGZhaWxlZCAoJWQpLlxuIiwgcik7DQo+PiAr
DQo+PiAgICAgICAgciA9IGFtZGdwdV9kZWJ1Z2ZzX2dlbV9pbml0KGFkZXYpOw0KPj4gICAgICAg
IGlmIChyKQ0KPj4gICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJyZWdpc3RlcmluZyBnZW0gZGVi
dWdmcyBmYWlsZWQgKCVkKS5cbiIsIHIpOw0KPj4gQEAgLTI4MTMsNiArMjgxNyw3IEBAIHZvaWQg
YW1kZ3B1X2RldmljZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAgICAg
IGFtZGdwdV9kZXZpY2VfZG9vcmJlbGxfZmluaShhZGV2KTsNCj4+ICAgICAgICBhbWRncHVfZGVi
dWdmc19yZWdzX2NsZWFudXAoYWRldik7DQo+PiAgICAgICAgZGV2aWNlX3JlbW92ZV9maWxlKGFk
ZXYtPmRldiwgJmRldl9hdHRyX3BjaWVfcmVwbGF5X2NvdW50KTsNCj4+ICsgICAgIGFtZGdwdV91
Y29kZV9zeXNmc19maW5pKGFkZXYpOw0KPj4gICAgfQ0KPj4NCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMNCj4+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMNCj4+IGluZGV4IDdiMzM4NjcwMzZlNy4u
M2FhNzUwZTZiYmY2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Vjb2RlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91Y29kZS5jDQo+PiBAQCAtMzEzLDYgKzMxMyw3NyBAQCBhbWRncHVfdWNvZGVfZ2V0X2xvYWRf
dHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxvYWRfdHlwZSkNCj4+ICAgICAg
ICByZXR1cm4gQU1ER1BVX0ZXX0xPQURfRElSRUNUOw0KPj4gICAgfQ0KPj4NCj4+ICsjZGVmaW5l
IEZXX1ZFUlNJT05fQVRUUihuYW1lLCBtb2RlLCBmaWVsZCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+PiArc3RhdGljIHNzaXplX3Qgc2hvd18jI25hbWUoc3RydWN0IGRldmljZSAqZGV2
LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgICAgICAgICAgICAgICAgXA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqYnVmKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4+ICt7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgICBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOyAgICAgICAgICAgICAgICAgXA0KPj4g
KyAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsgICAg
ICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgICByZXR1cm4gc25wcmlu
dGYoYnVmLCBQQUdFX1NJWkUsICIweCUwOHhcbiIsIGFkZXYtPmZpZWxkKTsgICAgICAgXA0KPj4g
K30gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4+ICtzdGF0aWMgREVWSUNFX0FUVFIobmFtZSwgbW9kZSwgc2hvd18j
I25hbWUsIE5VTEwpDQo+PiArDQo+PiArRldfVkVSU0lPTl9BVFRSKHZjZV9md192ZXJzaW9uLCAw
NDQ0LCB2Y2UuZndfdmVyc2lvbik7DQo+PiArRldfVkVSU0lPTl9BVFRSKHV2ZF9md192ZXJzaW9u
LCAwNDQ0LCB1dmQuZndfdmVyc2lvbik7DQo+PiArRldfVkVSU0lPTl9BVFRSKG1jX2Z3X3ZlcnNp
b24sIDA0NDQsIGdtYy5md192ZXJzaW9uKTsNCj4+ICtGV19WRVJTSU9OX0FUVFIobWVfZndfdmVy
c2lvbiwgMDQ0NCwgZ2Z4Lm1lX2Z3X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJT05fQVRUUihwZnBf
ZndfdmVyc2lvbiwgMDQ0NCwgZ2Z4LnBmcF9md192ZXJzaW9uKTsNCj4+ICtGV19WRVJTSU9OX0FU
VFIoY2VfZndfdmVyc2lvbiwgMDQ0NCwgZ2Z4LmNlX2Z3X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJ
T05fQVRUUihybGNfZndfdmVyc2lvbiwgMDQ0NCwgZ2Z4LnJsY19md192ZXJzaW9uKTsNCj4+ICtG
V19WRVJTSU9OX0FUVFIocmxjX3NybGNfZndfdmVyc2lvbiwgMDQ0NCwgZ2Z4LnJsY19zcmxjX2Z3
X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJT05fQVRUUihybGNfc3JsZ19md192ZXJzaW9uLCAwNDQ0
LCBnZngucmxjX3NybGdfZndfdmVyc2lvbik7DQo+PiArRldfVkVSU0lPTl9BVFRSKHJsY19zcmxz
X2Z3X3ZlcnNpb24sIDA0NDQsIGdmeC5ybGNfc3Jsc19md192ZXJzaW9uKTsNCj4+ICtGV19WRVJT
SU9OX0FUVFIobWVjX2Z3X3ZlcnNpb24sIDA0NDQsIGdmeC5tZWNfZndfdmVyc2lvbik7DQo+PiAr
RldfVkVSU0lPTl9BVFRSKG1lYzJfZndfdmVyc2lvbiwgMDQ0NCwgZ2Z4Lm1lYzJfZndfdmVyc2lv
bik7DQo+PiArRldfVkVSU0lPTl9BVFRSKHNvc19md192ZXJzaW9uLCAwNDQ0LCBwc3Auc29zX2Z3
X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJT05fQVRUUihhc2RfZndfdmVyc2lvbiwgMDQ0NCwgcHNw
LmFzZF9md192ZXJzaW9uKTsNCj4+ICtGV19WRVJTSU9OX0FUVFIodGFfcmFzX2Z3X3ZlcnNpb24s
IDA0NDQsIHBzcC50YV9md192ZXJzaW9uKTsNCj4+ICtGV19WRVJTSU9OX0FUVFIodGFfeGdtaV9m
d192ZXJzaW9uLCAwNDQ0LCBwc3AudGFfZndfdmVyc2lvbik7DQo+PiArRldfVkVSU0lPTl9BVFRS
KHNtY19md192ZXJzaW9uLCAwNDQ0LCBwbS5md192ZXJzaW9uKTsNCj4+ICtGV19WRVJTSU9OX0FU
VFIoc2RtYV9md192ZXJzaW9uLCAwNDQ0LCBzZG1hLmluc3RhbmNlWzBdLmZ3X3ZlcnNpb24pOw0K
Pj4gK0ZXX1ZFUlNJT05fQVRUUihzZG1hMl9md192ZXJzaW9uLCAwNDQ0LCBzZG1hLmluc3RhbmNl
WzFdLmZ3X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJT05fQVRUUih2Y25fZndfdmVyc2lvbiwgMDQ0
NCwgdmNuLmZ3X3ZlcnNpb24pOw0KPj4gK0ZXX1ZFUlNJT05fQVRUUihkbWN1X2Z3X3ZlcnNpb24s
IDA0NDQsIGRtLmRtY3VfZndfdmVyc2lvbik7DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBkZXZp
Y2VfYXR0cmlidXRlICpkZXZfZndfYXR0cltdID0gew0KPj4gKyAgICAgJmRldl9hdHRyX3ZjZV9m
d192ZXJzaW9uLCAmZGV2X2F0dHJfdXZkX2Z3X3ZlcnNpb24sDQo+PiArICAgICAmZGV2X2F0dHJf
bWNfZndfdmVyc2lvbiwgJmRldl9hdHRyX21lX2Z3X3ZlcnNpb24sDQo+PiArICAgICAmZGV2X2F0
dHJfcGZwX2Z3X3ZlcnNpb24sICZkZXZfYXR0cl9jZV9md192ZXJzaW9uLA0KPj4gKyAgICAgJmRl
dl9hdHRyX3JsY19md192ZXJzaW9uLCAmZGV2X2F0dHJfcmxjX3NybGNfZndfdmVyc2lvbiwNCj4+
ICsgICAgICZkZXZfYXR0cl9ybGNfc3JsZ19md192ZXJzaW9uLCAmZGV2X2F0dHJfcmxjX3NybHNf
ZndfdmVyc2lvbiwNCj4+ICsgICAgICZkZXZfYXR0cl9tZWNfZndfdmVyc2lvbiwgJmRldl9hdHRy
X21lYzJfZndfdmVyc2lvbiwNCj4+ICsgICAgICZkZXZfYXR0cl9zb3NfZndfdmVyc2lvbiwgJmRl
dl9hdHRyX2FzZF9md192ZXJzaW9uLA0KPj4gKyAgICAgJmRldl9hdHRyX3RhX3Jhc19md192ZXJz
aW9uLCAmZGV2X2F0dHJfdGFfeGdtaV9md192ZXJzaW9uLA0KPj4gKyAgICAgJmRldl9hdHRyX3Nt
Y19md192ZXJzaW9uLCAmZGV2X2F0dHJfc2RtYV9md192ZXJzaW9uLA0KPj4gKyAgICAgJmRldl9h
dHRyX3NkbWEyX2Z3X3ZlcnNpb24sICZkZXZfYXR0cl92Y25fZndfdmVyc2lvbiwNCj4+ICsgICAg
ICZkZXZfYXR0cl9kbWN1X2Z3X3ZlcnNpb24NCj4+ICt9Ow0KPj4gKw0KPj4gK3ZvaWQgYW1kZ3B1
X3Vjb2RlX3N5c2ZzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4+ICsgICAg
IGludCBpOw0KPj4gKw0KPj4gKyAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGV2X2Z3
X2F0dHIpOyBpKyspDQo+PiArICAgICAgICAgICAgIGRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5k
ZXYsIGRldl9md19hdHRyW2ldKTsgfQ0KPj4gKw0KPj4gK2ludCBhbWRncHVfdWNvZGVfc3lzZnNf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPj4gKyAgICAgaW50IGksIHJldDsN
Cj4+ICsNCj4+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRldl9md19hdHRyKTsg
aSsrKSB7DQo+PiArICAgICAgICAgICAgIHJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5k
ZXYsIGRldl9md19hdHRyW2ldKTsNCj4+ICsgICAgICAgICAgICAgaWYgKHJldCkgew0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSAlc1xuIiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Z3X2F0dHJbaV0tPmF0dHIubmFt
ZSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgICAgICAg
ICAgfQ0KPj4gKyAgICAgfQ0KPj4gKyAgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gICAg
c3RhdGljIGludCBhbWRncHVfdWNvZGVfaW5pdF9zaW5nbGVfZncoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBhbWRncHVfZmlybXdhcmVfaW5mbyAqdWNvZGUsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ2NF90IG1jX2FkZHIsIHZvaWQgKmtwdHIpDQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgNCj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgNCj4+IGluZGV4IDdhYzI1YTFj
Nzg1My4uZWM0YzJlYTFmMDVhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Vjb2RlLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91Y29kZS5oDQo+PiBAQCAtMjkxLDcgKzI5MSw5IEBAIGJvb2wgYW1kZ3B1X3Vjb2Rl
X2hkcl92ZXJzaW9uKHVuaW9uDQo+PiBhbWRncHVfZmlybXdhcmVfaGVhZGVyICpoZHIsDQo+Pg0K
Pj4gICAgaW50IGFtZGdwdV91Y29kZV9pbml0X2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsNCj4+ICAgIGludCBhbWRncHVfdWNvZGVfY3JlYXRlX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsNCj4+ICtpbnQgYW1kZ3B1X3Vjb2RlX3N5c2ZzX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOw0KPj4gICAgdm9pZCBhbWRncHVfdWNvZGVfZnJlZV9ibyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7DQo+PiArdm9pZCBhbWRncHVfdWNvZGVfc3lzZnNfZmluaShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+Pg0KPj4gICAgZW51bSBhbWRncHVfZmlybXdhcmVf
bG9hZF90eXBlDQo+PiAgICBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgaW50DQo+PiBsb2FkX3R5cGUpOw0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
