Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256844346B
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 10:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE389728;
	Thu, 13 Jun 2019 08:54:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027289728
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 08:54:15 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1354.namprd12.prod.outlook.com (10.168.240.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 08:54:10 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 08:54:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYZ8eAgAAdTACAAMOkAA==
Date: Thu, 13 Jun 2019 08:54:10 +0000
Message-ID: <21c5935a-513f-be45-8513-de45fa0fed4d@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
 <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
In-Reply-To: <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:101:16::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82d8c25d-571c-404b-bd68-08d6efdcb36f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1354; 
x-ms-traffictypediagnostic: DM5PR12MB1354:
x-microsoft-antispam-prvs: <DM5PR12MB135416F179E63CFF45B7374883EF0@DM5PR12MB1354.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(366004)(39860400002)(346002)(189003)(199004)(476003)(81156014)(31696002)(81166006)(2616005)(14444005)(8936002)(256004)(486006)(446003)(11346002)(65826007)(6116002)(46003)(186003)(86362001)(7736002)(66946007)(66556008)(73956011)(99286004)(64756008)(66476007)(305945005)(71200400001)(66446008)(58126008)(316002)(71190400001)(110136005)(72206003)(25786009)(6436002)(478600001)(6246003)(386003)(6506007)(53546011)(76176011)(66574012)(64126003)(229853002)(2906002)(36756003)(6512007)(52116002)(2501003)(5660300002)(6486002)(68736007)(8676002)(65806001)(102836004)(53936002)(65956001)(14454004)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1354;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VOuyCn85JSmXdL1h028wXNkFvcxzpq6CttBT/p78/rvPdsiSt/Sw6o87NAL7Jy8EOQZys6QvX48g7joUS6oHrGz2K3OJiMWPoaAa18HRoskMeEacaOw1FR8x9k54fLovgvcRHJcUfeAhE+yAv9AD/V42+hDSVOSxFBZSGmsmvg6/X0IjL4lr7Fh4DzKUPHqDi4ioIOEd7jRSigoknjIjjSJDmC5IkPxkT+ibBdrR0rV/vwzWKG0jMGIdWiSqpqDNt/AL44Lp1GeR7KZNnNYNyYOHUa00bthV5Q7Ro7pjS+dWD2WT+HlI+pb+KthgA/XiJD8pTWrgnoaARcL3Ngrz8CMXQIMTU2CKESy7/Pr/eBYvkEkIQ7YNjO7KHlfztbF0IEHAqy77+yc2ezTAxhPR9qalq0xaIMGp++zgYrApnMA=
Content-ID: <28343A45300AD147866B16F995D7780A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d8c25d-571c-404b-bd68-08d6efdcb36f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 08:54:10.4624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjnBD2wnN3KsdRioPvipYVq5AUylhKxoQvv6Qswf7XM=;
 b=ygd23/pWK1VgLtaC0fw+2bUUGZd8zyspnuVatBdvfklrYNftOykZPCoFKxFutrs85GG6KB9Mhx+5P5uOcQ97lv314XMTvGxKmXMHcAGf/aTdCJPRKwnQNyK0bxluyKpPOED3DqA8FsOTcnFyNdEHxeXqgCO37uC8EG54Cq2X8/I=
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

QW0gMTIuMDYuMTkgdW0gMjM6MTMgc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+IE9uIDIwMTktMDYt
MTIgMzoyOCBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gQW0gMTIuMDYuMTkgdW0g
MTc6MTMgc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+Pj4gVFRNIGNyZWF0ZSB0d28gem9uZXMsIGtl
cm5lbCB6b25lIGFuZCBkbWEzMiB6b25lIGZvciBzeXN0ZW0gbWVtb3J5LiBJZg0KPj4+IHN5c3Rl
bSBtZW1vcnkgYWRkcmVzcyBhbGxvY2F0ZWQgaXMgYmVsb3cgNEdCLCB0aGlzIGFjY291bnQgdG8g
ZG1hMzIgem9uZQ0KPj4+IGFuZCB3aWxsIGV4aGF1c3QgZG1hMzIgem9uZSBhbmQgdHJpZ2dlciB1
bm5lc3NzYXJ5IFRUTSBldmljdGlvbi4NCj4+Pg0KPj4+IFBhdGNoICJkcm0vdHRtOiBBY2NvdW50
IGZvciBrZXJuZWwgYWxsb2NhdGlvbnMgaW4ga2VybmVsIHpvbmUgb25seSIgb25seQ0KPj4+IGhh
bmRsZSB0aGUgYWxsb2NhdGlvbiBmb3IgYWNjX3NpemUsIHRoZSBzeXN0ZW0gbWVtb3J5IHBhZ2Ug
YWxsb2NhdGlvbiBpcw0KPj4+IHRocm91Z2ggdHRtX21lbV9nbG9iYWxfYWxsb2NfcGFnZSB3aGlj
aCBzdGlsbCBhY2NvdW50IHRvIGRtYTMyIHpvbmUgaWYNCj4+PiBwYWdlIGlzIGJlbG93IDRHQi4N
Cj4+IE5BSywgYXMgdGhlIG5hbWUgc2F5cyB0aGUgbWVtX2dsb2IgaXMgZ2xvYmFsIGZvciBhbGwg
ZGV2aWNlcyBpbiB0aGUgc3lzdGVtLg0KPj4NCj4+IFNvIHRoaXMgd2lsbCBicmVhayBpZiB5b3Ug
bWl4IERNQTMyIGFuZCBub24gRE1BMzIgaW4gdGhlIHNhbWUgc3lzdGVtDQo+PiB3aGljaCBpcyBl
eGFjdGx5IHRoZSBjb25maWd1cmF0aW9uIG15IGxhcHRvcCBoZXJlIGhhcyA6KA0KPj4NCj4gSSBk
aWRuJ3QgZmluZCBwYXRoIHVzZSBkbWEzMiB6b25lLCBidXQgSSBtYXkgbWlzc2VkIHNvbWV0aGlu
Zy4NCg0KV2VsbCB0aGUgcG9pbnQgaXMgdGhlcmUgaXMgbm9uIGluIG91ciBkcml2ZXIsIGJ1dCBt
YW55IGRyaXZlcnMgaW4gdGhlIA0Kc3lzdGVtIHN0aWxsIG5lZWQgRE1BMzIgbWVtb3J5Lg0KDQo+
IFRoZXJlIGlzDQo+IGFuIGlzc3VlIGZvdW5kIGJ5IEtGRFRlc3QuQmlnQnVmU3RyZXNzVGVzdCwg
aXQgYWxsb2NhdGVzIGJ1ZmZlcnMgdXAgdG8NCj4gMy84IG9mIHRvdGFsIDI1NkdCIHN5c3RlbSBt
ZW1vcnksIGVhY2ggYnVmZmVyIHNpemUgaXMgMTI4TUIsIHRoZW4gdXNlDQo+IHF1ZXVlIHRvIHdy
aXRlIHRvIHRoZSBidWZmZXJzLiBJZiB0dG1fbWVtX2dsb2JhbF9hbGxvY19wYWdlIGdldCBwYWdl
IHBmbg0KPiBpcyBiZWxvdyA0R0IsIGl0IGFjY291bnQgdG8gZG1hMzIgem9uZSBhbmQgd2lsbCBl
eGhhdXN0IDJHQiBsaW1pdCwgdGhlbg0KPiB0dG1fY2hlY2tfc3dhcHBpbmcgd2lsbCBzY2hlZHVs
ZSB0dG1fc2hyaW5rX3dvcmsgdG8gc3RhcnQgZXZpY3Rpb24uIEl0DQo+IHRha2VzIG1pbnV0ZXMg
dG8gZmluaXNoIHJlc3RvcmUgKHJldHJ5IG1hbnkgdGltZXMgaWYgYnVzeSksIHRoZSB0ZXN0DQo+
IGZhaWxlZCBiZWNhdXNlIHF1ZXVlIHRpbWVvdXQuIFRoaXMgZXZpY3Rpb24gaXMgdW5uZWNlc3Nh
cnkgYmVjYXVzZSB3ZQ0KPiBzdGlsbCBoYXZlIGVub3VnaCBmcmVlIHN5c3RlbSBtZW1vcnkuDQoN
Ck5vIHRoYXQgaXMgZGVmaW5pdGVseSBuZWNlc3NhcnkuIEZvciBleGFtcGxlIG9uIG15IExhcHRv
cCBpdCdzIHRoZSBzb3VuZCANCnN5c3RlbSB3aGljaCBuZWVkcyBETUEzMi4NCg0KV2l0aG91dCB0
aGlzIHdoZW4gYW4gYXBwbGljYXRpb24gdXNlcyBhIGxvdCBvZiBtZW1vcnkgd2UgcnVuIGludG8g
dGhlIA0KT09NIGtpbGxlciBhcyBzb29uIGFzIHNvbWUgYXVkaW8gc3RhcnRzIHBsYXlpbmcuDQoN
Cj4gSXQncyByYW5kb20gY2FzZSwgaGFwcGVucyBhYm91dCAxLzUuIEkgY2FuIGNoYW5nZSB0ZXN0
IHRvIGluY3JlYXNlIHRoZQ0KPiB0aW1lb3V0IHZhbHVlIHRvIHdvcmthcm91bmQgdGhpcywgYnV0
IHRoaXMgc2VlbXMgVFRNIGJ1Zy4gVGhpcyB3aWxsIHNsb3cNCj4gYXBwbGljYXRpb24gcGVyZm9y
bWFuY2UgYSBsb3QgaWYgdGhpcyByYW5kb20gaXNzdWUgaGFwcGVucy4NCg0KT25lIHRoaW5nIHdl
IGNvdWxkIHRyeSBpcyB0byBkaWcgaW50byB3aHkgdGhlIGtlcm5lbCBnaXZlcyB1cyBETUEzMiAN
CnBhZ2VzIHdoZW4gdGhlcmUgYXJlIHN0aWxsIG90aGVyIHBhZ2VzIGF2YWlsYWJsZS4gUGxlYXNl
IHRha2UgYSBsb29rIGF0IA0KL3Byb2MvYnVkZHlpbmZvIG9uIHRoYXQgYm94IGZvciB0aGlzLg0K
DQpUaGUgbmV4dCB0aGluZyBjb21pbmcgdG8gbWluZCBpcyB0aGF0IHdlIGNhbiBtb3N0IGxpa2Vs
eSBjb21wbGV0ZWx5IHNraXAgDQp0aGlzIGlmIElPTU1VIGlzIGFjdGl2ZS4NCg0KVGhlIGxhc3Qg
dGhpbmcgb2YgaGFuZCBjb21pbmcgdG8gbXkgbWluZCBpcyB0byBpbXByb3ZlIFRUTSB0byBhY3R1
YWxseSANCm9ubHkgZXZpY3QgQk9zIHdoaWNoIHVzZSBETUEzMiBtZW1vcnksIGNhdXNlIGN1cnJl
bnRseSB3ZSBqdXN0IGV2aWN0IA0Kc3R1ZmYgcmFuZG9tbHkgYW5kIG5vdCBjaGVjayBpZiBpdHMg
RE1BMzIgb3Igb3RoZXIgbWVtb3J5Lg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRo
YW5rcywNCj4gUGhpbGlwDQo+DQo+DQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IENoYW5nZS1JZDog
STI4OWI4NWQ4OTFiOGY2NGExNDIyYzQyYjFlYWIzOTgwOThhYjdlZjcNCj4+PiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNCArKysrDQo+Pj4gIMKg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4+IGluZGV4IDI3NzhmZjYzZDk3ZC4uNzli
YjlkZmU2MTdiIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYw0KPj4+IEBAIC0xNjg2LDYgKzE2ODYsMTAgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+PiAgwqDCoMKgwqDCoCB9DQo+Pj4gIMKgwqDCoMKg
wqAgYWRldi0+bW1hbi5pbml0aWFsaXplZCA9IHRydWU7DQo+Pj4gK8KgwqDCoCAvKiBPbmx5IGtl
cm5lbCB6b25lIChubyBkbWEzMiB6b25lKSBpZiBkZXZpY2UgZG9lcyBub3QgcmVxdWlyZQ0KPj4+
IGRtYTMyICovDQo+Pj4gK8KgwqDCoCBpZiAoIWFkZXYtPm5lZWRfZG1hMzIpDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGFkZXYtPm1tYW4uYmRldi5nbG9iLT5tZW1fZ2xvYi0+bnVtX3pvbmVzID0gMTsN
Cj4+PiArDQo+Pj4gIMKgwqDCoMKgwqAgLyogV2Ugb3B0IHRvIGF2b2lkIE9PTSBvbiBzeXN0ZW0g
cGFnZXMgYWxsb2NhdGlvbnMgKi8NCj4+PiAgwqDCoMKgwqDCoCBhZGV2LT5tbWFuLmJkZXYubm9f
cmV0cnkgPSB0cnVlOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
