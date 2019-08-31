Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650BA414B
	for <lists+amd-gfx@lfdr.de>; Sat, 31 Aug 2019 02:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEAB6E06B;
	Sat, 31 Aug 2019 00:21:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790083.outbound.protection.outlook.com [40.107.79.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09A6E06B
 for <amd-gfx@lists.freedesktop.org>; Sat, 31 Aug 2019 00:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z47BRRIXuM9vMN1EWm8dWMqU4a0KS+Uj4RiVfA+dW9tliXf1jXUzI3dVAFujsp96yf9VrRFA4/vfymM6nGnV0SBsp3GKALn7oeC3vDn5S2rXT1f+ma4ydLWRKqAdkCksxnKGPlcBkFv6QU8qSjmUcflvB50wFA1DYQWIU+X792azJj4txq0KA3s7m+E6bsUg4q4S2HdZFAyUbGQdzr+lBixp/Dwi6ptQGTyvX6HRValwAEqX3UhQADGB5DWT8PT/e/jbkSwR4beAscaRwksBScXifxcsUsCIzSeI8hHGYc+Fwqzp71yCIVMAzth6tFgEbk86KYPT7JsNZMXWratzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao9kJ9IMSGhlg08IEgsASmSwfqbuSLkvh0ewGUXulDE=;
 b=SbRgbYpq2l1krGSWN/DcGEEJ4WzgQLQ30eS2xv+z7BZw+8l7Qy36CJdR6n/Ofn5HXjujgHGZeLwsHFi1LhoZwEvX8zonqARHH49TK5YZ4M07WXgIJ7VTlczNJbBBe9O3TzfUGlH9B38eE3yphSO9jFjtPzLBQf2iPV7PxpE+/pRD7+QyHWxtyctd1V+OF7a6vYk2mppxbEuY4AC1zKSSVMKsmfLEeEV0xnVyliozoyS9+XSF6osW8tOoKeqTXMmqf2EEu7jV2W4bEBxyjdhmlJ460CIFiNlyy523Esv8Kovue7xB2ghWWopSoNONPprE2EJUYm0eVTlgMtkNZrzhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1599.namprd12.prod.outlook.com (10.172.56.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Sat, 31 Aug 2019 00:21:43 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Sat, 31 Aug 2019
 00:21:43 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v3 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Thread-Topic: [PATCH v3 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Thread-Index: AQHVX1GFipWYbIqBtEG1+18SSet5J6cUGv2AgABKGfA=
Date: Sat, 31 Aug 2019 00:21:43 +0000
Message-ID: <MWHPR12MB14530CA84252B13E5150743BEABC0@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
 <1567183153-11014-3-git-send-email-andrey.grodzovsky@amd.com>,
 <CADnq5_MOXSh6j7nmxUFzgf=KuZgUt9xFLuFkczRmnoG8vnaZ=w@mail.gmail.com>
In-Reply-To: <CADnq5_MOXSh6j7nmxUFzgf=KuZgUt9xFLuFkczRmnoG8vnaZ=w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.194.190.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2fb0dc9-eb7e-4d04-169f-08d72da933dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1599; 
x-ms-traffictypediagnostic: MWHPR12MB1599:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1599B389D17A62DF18A0A09AEABC0@MWHPR12MB1599.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(9686003)(64756008)(54906003)(66946007)(6246003)(66476007)(55016002)(66446008)(76116006)(6116002)(71200400001)(446003)(4326008)(26005)(11346002)(3846002)(486006)(6916009)(316002)(102836004)(6436002)(66066001)(66556008)(6506007)(229853002)(476003)(53546011)(71190400001)(74316002)(1411001)(256004)(5660300002)(14454004)(8676002)(81166006)(81156014)(52536014)(14444005)(76176011)(8936002)(25786009)(7696005)(53936002)(305945005)(2906002)(7736002)(186003)(478600001)(99286004)(33656002)(86362001)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1599;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J5jsCRYcc4F25p3Q0yMoZKjjJOFxy0Nvw61ceR8sEcRdPmbgX46ltiev9Q4Wk/i1Tbu551E2y8n+mEhQMGNQ5cwVxfRT0VUpvHaDMGqncjnE6eMid9QJkBPwJuHwgOvQXSL3cTpRH3+xFBMUL+sAN4QXftF0xBw/sFu1T5+B3ZVM6w8vPtjDhbg7nwfXwWHIAtpMF0I8QaAkEsknZdRBGd3cDm7kvof2FSq1+RW4I3YxlVycFjJOKX7kdv5QFlB8ngqIMP1zgJQYa9v0jbIY+cJ8GTJobBW3O7GEVEytj/96oSgsEcHTz9H/WHzQpjd8eKn06dtimsgIXY9C0rYOg4914LUNkYPtLuntjm6srqMcsVACDIcqx/DkEWRqxu4mH5JnkFFMHCmap+QvZ5XvlbAeF/ZmF7Q410Y09v1turk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fb0dc9-eb7e-4d04-169f-08d72da933dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 00:21:43.7389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c74ye95JJQ4jpTUUcDPLWgJlvbNSP8//aD6WCFo4qrnyhc2yrvUQYnQ/53NSit5vrYi49R8tFFlpbTACZbA8sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao9kJ9IMSGhlg08IEgsASmSwfqbuSLkvh0ewGUXulDE=;
 b=Ql7Veh1jF+pth7ijfzyrQ2PHWS7kpr1FqCMQ74XcHSf4U28i4sF+HK46Q1MJSmiqpMVd6zCLOcDLy84dQbG6lvmJ2+p2xucwxupSi3vFJwgtBFi7AGMI1yPaxmifJb5a5LdtiNvziUBkKWt+Y3uh1BDU0SGeL3PhnWDw61NKsYg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QnV0IEkgYW0gbm90IHRoZSBvbmUgY2hlcnJ5LXBpY2tpbmcgdG8gREtNUywgc2hvdWxkIEkganVz
dCBsZXQgdGhpcyBwZXJzb24ga25vdyB0aGlzIGlzIHRoZSBES01TIGNvZGUgaGUgc2hvdWxkIHVz
ZSBmb3Igd2hlbiBhcHByb3ByaWF0ZSBBUEkgZG9lc24ndCBleGlzdCA/CgpBbmRyZXkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogQWxleCBEZXVjaGVyIDxh
bGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IDMwIEF1Z3VzdCAyMDE5IDE1OjU1OjAzClRvOiBH
cm9kem92c2t5LCBBbmRyZXkKQ2M6IGFtZC1nZnggbGlzdDsgWmhhbmcsIEhhd2tpbmc7IENocmlz
dGlhbiBLw7ZuaWc7IFpob3UxLCBUYW87IEt1ZWhsaW5nLCBGZWxpeApTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDMvM10gZG1yL2FtZGdwdTogQWRkIHN5c3RlbSBhdXRvIHJlYm9vdCB0byBSQVMuCgpP
biBGcmksIEF1ZyAzMCwgMjAxOSBhdCAxMjozOSBQTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBJbiBjYXNlIG9mIFJBUyBlcnJvciBhbGxv
dyB1c2VyIGNvbmZpZ3VyZSBhdXRvIHN5c3RlbQo+IHJlYm9vdCB0aHJvdWdoIHJhc19jdHJsLgo+
IFRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSB0ZW1wcm9yYXkgd29yayBhcm91bmQgZm9yIHRoZSBS
QVMKPiBoYW5nIHByb2JsZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8
YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClR5cG8gaW4gdGl0bGU6IGRtciAtPiBkcm0KCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDE4ICsr
KysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgICAgfCAxMCArKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaCAgICB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCj4gaW5kZXggYzk4MjVhZS4uZTI2ZjJlOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBAQCAtMzc2MCw2ICszNzYwLDI0IEBAIGludCBhbWRn
cHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAg
ICAgaW50IGksIHIgPSAwOwo+ICAgICAgICAgYm9vbCBpbl9yYXNfaW50ciA9IGFtZGdwdV9yYXNf
aW50cl90cmlnZ2VyZWQoKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEZsdXNoIFJBTSB0
byBkaXNrIHNvIHRoYXQgYWZ0ZXIgcmVib290Cj4gKyAgICAgICAgKiB0aGUgdXNlciBjYW4gcmVh
ZCBsb2cgYW5kIHNlZSB3aHkgdGhlIHN5c3RlbSByZWJvb3RlZC4KPiArICAgICAgICAqCj4gKyAg
ICAgICAgKiBVc2luZyB1c2VyIG1vZGUgYXBwIGNhbGwgaW5zdGVhZCBvZiBrZXJuZWwgQVBJcyBz
dWNoIGFzCj4gKyAgICAgICAgKiBrc3lzX3N5bmNfaGVscGVyIGZvciBiYWNrd2FyZCBjb21wYXJh
YmlsaXR5IHdpdGggZWFybGllcgo+ICsgICAgICAgICoga2VybmVscyBpbnRvIHdoaWNoIHRoaXMg
aXMgYWxzbyBpbnRlbmRlZC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGluX3Jhc19pbnRy
ICYmIGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCkgewo+ICsgICAgICAgICAg
ICAgICBjaGFyICplbnZwW10gPSB7ICJIT01FPS8iLCBOVUxMIH07Cj4gKyAgICAgICAgICAgICAg
IGNoYXIgKmFyZ3ZbXSA9IHsgIi9iaW4vc3luYyIsIE5VTEwgfTsKPiArCj4gKyAgICAgICAgICAg
ICAgIERSTV9XQVJOKCJFbWVyZ2VuY3kgcmVib290LiIpOwo+ICsKPiArICAgICAgICAgICAgICAg
Y2FsbF91c2VybW9kZWhlbHBlcihhcmd2WzBdLCBhcmd2LCBlbnZwLCBVTUhfV0FJVF9QUk9DKTsK
PiArICAgICAgICAgICAgICAgZW1lcmdlbmN5X3Jlc3RhcnQoKTsKPiArICAgICAgIH0KPiArCgpU
aGlzIGlzIGZpbmUgZm9yIGRrbXMsIGJ1dCBmb3IgdXBzdHJlYW0vYW1kLXN0YWdpbmcsIHdlIHBy
b2JhYmx5IHdhbnQKdG8gY2FsbCB0aGUgYXBwcm9wcmlhdGUgQVBJcyBkaXJlY3RseS4KCj4gICAg
ICAgICBuZWVkX2Z1bGxfcmVzZXQgPSBqb2Jfc2lnbmFsZWQgPSBmYWxzZTsKPiAgICAgICAgIElO
SVRfTElTVF9IRUFEKCZkZXZpY2VfbGlzdCk7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCj4gaW5kZXggMWNjMzRkZS4uYmJjZmI0ZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtMzAsNiArMzAsNyBAQAo+ICAjaW5jbHVk
ZSAiYW1kZ3B1X3Jhcy5oIgo+ICAjaW5jbHVkZSAiYW1kZ3B1X2F0b21maXJtd2FyZS5oIgo+ICAj
aW5jbHVkZSAiaXZzcmNpZC9uYmlvL2lycXNyY3NfbmJpZl83XzQuaCIKPiArI2luY2x1ZGUgPGxp
bnV4L2ttb2QuaD4KPgo+ICBjb25zdCBjaGFyICpyYXNfZXJyb3Jfc3RyaW5nW10gPSB7Cj4gICAg
ICAgICAibm9uZSIsCj4gQEAgLTE1NCw2ICsxNTUsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNf
ZGVidWdmc19jdHJsX3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsCj4gICAgICAgICAgICAgICAg
IG9wID0gMTsKPiAgICAgICAgIGVsc2UgaWYgKHNzY2FuZihzdHIsICJpbmplY3QgJTMycyAlOHMi
LCBibG9ja19uYW1lLCBlcnIpID09IDIpCj4gICAgICAgICAgICAgICAgIG9wID0gMjsKPiArICAg
ICAgIGVsc2UgaWYgKHNzY2FuZihzdHIsICJyZWJvb3QgJTMycyIsIGJsb2NrX25hbWUpID09IDEp
Cj4gKyAgICAgICAgICAgICAgIG9wID0gMzsKPiAgICAgICAgIGVsc2UgaWYgKHN0clswXSAmJiBz
dHJbMV0gJiYgc3RyWzJdICYmIHN0clszXSkKPiAgICAgICAgICAgICAgICAgLyogYXNjaWkgc3Ry
aW5nLCBidXQgY29tbWFuZHMgYXJlIG5vdCBtYXRjaGVkLiAqLwo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiBAQCAtMjg3LDYgKzI5MCw5IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdw
dV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNl
ciAqCj4gICAgICAgICAgICAgICAgIC8qIGRhdGEuaW5qZWN0LmFkZHJlc3MgaXMgb2Zmc2V0IGlu
c3RlYWQgb2YgYWJzb2x1dGUgZ3B1IGFkZHJlc3MgKi8KPiAgICAgICAgICAgICAgICAgcmV0ID0g
YW1kZ3B1X3Jhc19lcnJvcl9pbmplY3QoYWRldiwgJmRhdGEuaW5qZWN0KTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIDM6Cj4gKyAgICAgICAgICAgICAgIGFtZGdwdV9y
YXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsK
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gQEAgLTE3MzMsNiArMTczOSw4IEBAIGludCBhbWRn
cHVfcmFzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIHZvaWQgYW1kZ3B1X3Jh
c19nbG9iYWxfcmFzX2lzcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgewo+ICAgICAg
ICAgaWYgKGF0b21pY19jbXB4Y2hnKCZhbWRncHVfcmFzX2luX2ludHIsIDAsIDEpID09IDApIHsK
PiAtICAgICAgICAgICAgICAgRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBlIEVSUkVWRU5UX0FU
SFVCX0lOVEVSUlVQVCBkZXRlY3RlZCEgU3RvcHBpbmcgYWxsIEdQVSBqb2JzLlxuIik7Cj4gKyAg
ICAgICAgICAgICAgIERSTV9XQVJOKCJSQVMgZXZlbnQgb2YgdHlwZSBFUlJFVkVOVF9BVEhVQl9J
TlRFUlJVUFQgZGV0ZWN0ZWQhXG4iKTsKPiArCj4gKyAgICAgICAgICAgICAgIGFtZGdwdV9yYXNf
cmVzZXRfZ3B1KGFkZXYsIGZhbHNlKTsKPiAgICAgICAgIH0KPiAgfQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKPiBpbmRleCAzZWMyYTg3Li5hODNlYzk5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+IEBAIC0zMzMsNiArMzMzLDcg
QEAgc3RydWN0IGFtZGdwdV9yYXMgewo+ICAgICAgICAgc3RydWN0IG11dGV4IHJlY292ZXJ5X2xv
Y2s7Cj4KPiAgICAgICAgIHVpbnQzMl90IGZsYWdzOwo+ICsgICAgICAgYm9vbCByZWJvb3Q7Cj4g
IH07Cj4KPiAgc3RydWN0IHJhc19mc19kYXRhIHsKPiAtLQo+IDIuNy40Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
