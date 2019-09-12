Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC06CB07C5
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD97F6EC65;
	Thu, 12 Sep 2019 04:13:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3544B6E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 02:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5KD4Xf09+20yv/aprRX19CG5UqHzmLOnZns5nXDZFkczKPaJgRMi9N+XZ1T6xKctMszngifg80M8Tq3X6dh3VQkejZbId/32AFaHvWoquKqozzMVvLk+I5AOy0szmmmJLwIh1cTmmlwxn4o4FMve3sSDQJkxWgL8NQnj8rjZAYXY7gOklhxTu/DjfPC0AwO2yPZHDvwZ68/GjdFJ+M1SeN3eSEnqfr1jt0hoP6EsR06R5A/wUB0Q7th4IoDP+FgYA+ZkNJSu1L0kQ23siPPgqbIALawaCkYK0OEGZbHZQt2IQNDzUnfca2jGgrh8U5NA5i5EnnLsQb4l0KdNAQIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUU4aW/7lPIJAFChLnrmc8rp4raEx3Y0Q0woTV5B+bQ=;
 b=eKosxOENQFz27f6yKxwRqhO4WgAquPCvLLDiC6DqLSwDNtqSHqO3trkfH1xThSL9mXdFJQ4GBdht9/yX6/nPa37PlnF+BldomnONxen+wNRPNQbd4HSEdrWG98rBU8nC5QTtitmUuYiSvEJle4z2rMa6aN80FOtjK1OlFXMtqV/04K2JKkYjGr6cefiuh2eIi8RWLSeUrQQrVlYre8jTBnzwurwnpstYroYpDdceEL60vE4boaXv5jy2cyhfB1i4lhEfPnhF6ttC1DVjeyGzHkH803AMrANTX77n49/DXMXdsMbprjBRbKt5uZEu7GUUafyHAABn1OjW19Ze9/P4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1135.namprd12.prod.outlook.com (10.169.204.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Thu, 12 Sep 2019 02:32:23 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 02:32:23 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/Asx1vpdHBGkKaZL/KBwFVFaclzGCAgAB4KACAAAYxAIAA/seAgAAG9EM=
Date: Thu, 12 Sep 2019 02:32:23 +0000
Message-ID: <MWHPR12MB14533B06E13B86E54520E991EAB00@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
 <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>,
 <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:3edf:fe95:1c36:376:6b4:b767]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce29e598-d762-4ea9-cbbd-08d7372971cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1135; 
x-ms-traffictypediagnostic: MWHPR12MB1135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1135664779E1075E0750A1E5EAB00@MWHPR12MB1135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39840400004)(136003)(396003)(346002)(376002)(366004)(13464003)(52314003)(199004)(189003)(2906002)(9686003)(33656002)(256004)(53546011)(446003)(64756008)(66446008)(46003)(66476007)(66556008)(81166006)(81156014)(66946007)(11346002)(14444005)(476003)(2501003)(8936002)(55016002)(6506007)(486006)(71200400001)(186003)(76116006)(4326008)(71190400001)(8676002)(110136005)(229853002)(6436002)(7696005)(316002)(99286004)(102836004)(478600001)(74316002)(5660300002)(76176011)(305945005)(52536014)(25786009)(53936002)(6246003)(7736002)(14454004)(6116002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1135;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cnmYdfDgZ6/+sG95Tev4HBtg6UZ1hi5LKVR/AdUPovC45Vkx+dCF5E0z9nleo8sceU14gLN9oTIIpwl8kGVCfMEcGllVTGSvtxC8JJHCb57Ozvon0gZd3vC2z3U3ahp9FTXgn3FUIqAJIlzrArxdkZgakfuFlSspmGOuGZV6mRDLIwshEQE8t0VWqZmzH8gx73o81B/ygpvPIyVch9B89HZqZmTV/keaMKn5Bl9w5RtSaWQ5CHfgbSypamL+2lma7Kq8Oi8juvhQKaFhOnrZt5DCOWDWG34oCV1tU5L7jX6l774eSg4XrP4ww1k++QqrRD7WL3HUbKLyMeV5HtuEa/+A5Ntjx54AMgS7TG4rjOd0jL+TyTIQfrBUuxH16E8mYdfiqmGybLmOhBM71wXX3hHndou6IzuLVWK5bG/bIu4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce29e598-d762-4ea9-cbbd-08d7372971cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 02:32:23.7825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmP1zvAhOytajEnteEjAgeHoDpATnfHyREXstOoRXBHbvH0N8+gCZp/sAPuvZZ+2u+cTkDbXjqchXn58sThXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUU4aW/7lPIJAFChLnrmc8rp4raEx3Y0Q0woTV5B+bQ=;
 b=XL7ywzPwkA2IO/+18sve332RpeU2SR2ux0bq3etAxUS88gJ9HMVSOqNYYqDh9cUvCYN9037fv26cFjLJB8f5JEJ4izVHgFB0I2lPgs4IFfjgFc4kz84o3BCBiC8/H3rgFA1+drbIZGqqgaYSjCdzH5liprE866EUTa1/zt+X1xk=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhdCBub3Qgd2hhdCBJIG1lYW50LiBMZXQncyBzYXkgeW91IGhhbmRsZWQgb25lIGJhZCBwYWdl
IGludGVycnVwdCBhbmQgYXMgYSByZXN1bHQgaGF2ZSBvbmUgYmFkIHBhZ2UgcmVzZXJ2ZWQuIE5v
dyB1bnJlbGF0ZWQgZ2Z4IHJpbmcgdGltZW91dCBoYXBwZW5zIHdoaWNoIHRyaWdnZXJzIEdQVSBy
ZXNldCBhbmQgVlJBTSBsb3NzLiBXaGVuIHlvdSBjb21lIGJhY2sgZnJvbSByZXNldCBhbWRncHVf
cmFzX3Jlc2VydmVfYmFkX3BhZ2VzIHdpbGwgYmUgY2FsbGVkIGJ1dCBzaW5jZSBsYXN0X3Jlc2Vy
dmVkID09IGRhdGFfY291bnQgdGhlIGJhZCBwYWdlIHdpbGwgbm90IGJlIHJlc2VydmVkIGFnYWlu
LCBtYXliZSB3ZSBzaG91bGQganVzdCBzZXQgZGF0YS0+bGFzdF9yZXNlcnZlZCB0byAwIGFnYWlu
IGlmIFZSQU0gd2FzIGxvc3QgZHVyaW5nIEFTSUMgcmVzZXQuLi4KCkFuZHJleQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBDaGVuLCBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+ClNlbnQ6IDExIFNlcHRlbWJlciAyMDE5IDIxOjUzOjAzClRvOiBHcm9k
em92c2t5LCBBbmRyZXk7IFpob3UxLCBUYW87IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIKU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTog
Rml4IG11dGV4IGxvY2sgZnJvbSBhdG9taWMgY29udGV4dC4KCkNvbW1lbnQgaW5saW5lLgoKUmVn
YXJkcywKR3VjaHVuCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBHcm9kem92c2t5
LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+ClNlbnQ6IFdlZG5lc2RheSwgU2Vw
dGVtYmVyIDExLCAyMDE5IDEwOjQxIFBNClRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaGVuLCBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFt
ZC5jb20+ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBtdXRleCBsb2NrIGZy
b20gYXRvbWljIGNvbnRleHQuCgpPbiBzZWNvbmQgdGhvdWdoIHRoaXMgd2lsbCBicmVhayAgd2hh
dCBhYm91dCByZXNlcnZpbmcgYmFkIHBhZ2VzIHdoZW4gcmVzZXR0aW5nIEdQVSBmb3Igbm9uIFJB
UyBlcnJvciByZWFzb24gc3VjaCBhcyBtYW51YWwgcmVzZXQgLFMzIG9yIHJpbmcgdGltZW91dCwg
KGFtZGdwdV9yYXNfcmVzdW1lLT5hbWRncHVfcmFzX3Jlc2V0X2dwdSkgc28gaSB3aWxsIGtlZXAg
dGhlIGNvZGUgYXMgaXMuCgpBbm90aGVyIHBvc3NpYmxlIGlzc3VlIGluIGV4aXN0aW5nIGNvZGUg
LSBsb29rcyBsaWtlIG5vIHJlc2VydmF0aW9uIHdpbGwgdGFrZSBwbGFjZSBpbiB0aG9zZSBjYXNl
IGV2ZW4gbm93IGFzIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMKZGF0YS0+bGFzdF9yZXNl
cnZlZCB3aWxsIGJlIGVxdWFsIHRvIGRhdGEtPmNvdW50ICwgbm8gPyBMb29rcyBsaWtlIGZvcgp0
aGlzIGNhc2UgeW91IG5lZWQgdG8gYWRkIGZsYWcgdG8gRk9SQ0UgcmVzZXJ2YXRpb24gZm9yIGFs
bCBwYWdlcyBmcm9tCjAgdG8gZGF0YS0+Y291bm50LgpbR3VjaHVuXVllcywgbGFzdF9yZXNlcnZl
ZCBpcyBub3QgdXBkYXRlZCBhbnkgbW9yZSwgdW5sZXNzIHdlIHVubG9hZCBvdXIgZHJpdmVyLiBT
byBpdCBtYXliZSBhbHdheXMgZXF1YWwgdG8gZGF0YS0+Y291bnQsIHRoZW4gbm8gbmV3IGJhZCBw
YWdlIHdpbGwgYmUgcmVzZXJ2ZWQuCkkgc2VlIHdlIGhhdmUgb25lIGVlcHJvbSByZXNldCBieSB1
c2VyLCBjYW4gd2UgcHV0IHRoaXMgbGFzdF9yZXNlcnZlZCBjbGVhbiBvcGVyYXRpb24gdG8gdXNl
ciBpbiB0aGUgc2FtZSBzdGFjayBhcyB3ZWxsPwoKQW5kcmV5CgpPbiA5LzExLzE5IDEwOjE5IEFN
LCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPiBJIGxpa2UgdGhpcyBtdWNoIG1vcmUsIEkgd2ls
bCByZWxvY2F0ZSB0bwo+IGFtZGdwdV91bWNfcHJvY2Vzc19yYXNfZGF0YV9jYiBhbiBwdXNoLgo+
Cj4gQW5kcmV5Cj4KPiBPbiA5LzEwLzE5IDExOjA4IFBNLCBaaG91MSwgVGFvIHdyb3RlOgo+PiBh
bWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIGlzIG9ubHkgdXNlZCBieSB1bWMgYmxvY2ssIHNv
IGFub3RoZXIKPj4gYXBwcm9hY2ggaXMgdG8gbW92ZSBpdCBpbnRvIGFtZGdwdV91bWNfcHJvY2Vz
c19yYXNfZGF0YV9jYi4KPj4gQW55d2F5LCBlaXRoZXIgd2F5IGlzIE9LIGFuZCB0aGUgcGF0Y2gg
aXM6Cj4+Cj4+IFJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Cj4+Cj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4gRnJvbTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+PiBTZW50OiAyMDE55bm0OeaciDEx5pelIDM6
NDEKPj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gQ2M6IENoZW4sIEd1
Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8KPj4+IDxUYW8uWmhvdTFAYW1k
LmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47Cj4+
PiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Cj4+PiBTdWJq
ZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBtdXRleCBsb2NrIGZyb20gYXRvbWljIGNvbnRl
eHQuCj4+Pgo+Pj4gUHJvYmxlbToKPj4+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2Fz
IG1vdmVkIHRvIGFtZGdwdV9yYXNfcmVzZXRfZ3B1Cj4+PiBiZWNhdXNlIHdyaXRpbmcgdG8gRUVQ
Uk9NIGR1cmluZyBBU0lDIHJlc2V0IHdhcyB1bnN0YWJsZS4KPj4+IEJ1dCBmb3IgRVJSRVZFTlRf
QVRIVUJfSU5URVJSVVBUIGFtZGdwdV9yYXNfcmVzZXRfZ3B1IGlzIGNhbGxlZAo+Pj4gZGlyZWN0
bHkgZnJvbSBJU1IgY29udGV4dCBhbmQgc28gbG9ja2luZyBpcyBub3QgYWxsb3dlZC4gQWxzbyBp
dCdzCj4+PiBpcnJlbGV2YW50IGZvciB0aGlzIHBhcnRpbGN1bGFyIGludGVycnVwdCBhcyB0aGlz
IGlzIGdlbmVyaWMgUkFTCj4+PiBpbnRlcnJ1cHQgYW5kIG5vdCBtZW1vcnkgZXJyb3JzIHNwZWNp
ZmljLgo+Pj4KPj4+IEZpeDoKPj4+IEF2b2lkIGNhbGxpbmcgYW1kZ3B1X3Jhc19yZXNlcnZlX2Jh
ZF9wYWdlcyBpZiBub3QgaW4gdGFzayBjb250ZXh0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4gLS0tCj4+PiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDQgKysrLQo+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKPj4+IGluZGV4IDAxMjAzNGQu
LmRkNWRhM2MgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
aAo+Pj4gQEAgLTUwNCw3ICs1MDQsOSBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRncHVfcmFzX3Jl
c2V0X2dwdShzdHJ1Y3QKPj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+PiAgICAgICAvKiBzYXZl
IGJhZCBwYWdlIHRvIGVlcHJvbSBiZWZvcmUgZ3B1IHJlc2V0LAo+Pj4gICAgICAgICogaTJjIG1h
eSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQKPj4+ICAgICAgICAqLwo+Pj4gLSAgICBhbWRncHVf
cmFzX3Jlc2VydmVfYmFkX3BhZ2VzKGFkZXYpOwo+Pj4gKyAgICBpZiAoaW5fdGFzaygpKQo+Pj4g
KyAgICAgICAgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsKPj4+ICsKPj4+ICAg
ICAgIGlmIChhdG9taWNfY21weGNoZygmcmFzLT5pbl9yZWNvdmVyeSwgMCwgMSkgPT0gMCkKPj4+
ICAgICAgICAgICBzY2hlZHVsZV93b3JrKCZyYXMtPnJlY292ZXJ5X3dvcmspOwo+Pj4gICAgICAg
cmV0dXJuIDA7Cj4+PiAtLQo+Pj4gMi43LjQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
