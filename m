Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B4DED69
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 15:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C63E6E0B6;
	Mon, 21 Oct 2019 13:21:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE826E0B6
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 13:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc8p7KqQibu4unef32Yj8tosjwDvz0rMtqr6bSQT3KTB33KlFPp48ycQ1QU4HuC7H1vPNK7QcHeUrMtbINgRzb1mClztg2Qm+jQj71I34Y6U/vsyM1rVUiuE913utf1LABq47weDBE97kvCd2OxREfjdM5vSGwnui6esDBVy+xvhdf7QkAzDEPtwCkQmn/Ad0DTOgX9MshqFp/t1mHq1LY98HLS6betqeRIcCXhupwAfOSKxKwiGODs8St9+4bnxBhqC272ckI2wbicJYaQM5t+mPUO5Nti+XxnkrqkY77JahlmvVdyPgLkhnr0bJJKT4lhsMWFixIl30LFvm6PRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQYU7rHknJN6PvP4BwICm3w3CIyECmV1f6Ch6OZyWas=;
 b=H9nzPrzB0iUU0jlX9bE+S1Wz4ZqTYql6e4W88OL824PFXD4AfkQMUBJncCL8rquWEPtqh/ftslU8IzMntlXJZKyOJ4im9mulbDjAK/NjHK59QGMkSg+Qjb8Iv7UVxCkHvn0rbSkOH3IdMKtnOMc4tkmCPXp+zFOV/9GE3pDwwAHBC5Fv4I8zQ/pdJk168n3taHQUvTVu/BMChkiDC/VVD5KxLsC5gCkgQAg8JWG/QO2VymKozp+be1TppkeK6+Xd8jaYPiL+GCK44lz2EKbBslh5if1GLyJfstH98XJK9/+LoMydbTOx4eca9TeclQqfzFMVjfpw3SdaU8Gkj9RpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1410.namprd12.prod.outlook.com (10.168.225.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 13:21:49 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Mon, 21 Oct
 2019 13:21:49 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/amd/powerplay: Add interface for I2C transactions
 to SMU.
Thread-Topic: [PATCH 1/4] drm/amd/powerplay: Add interface for I2C
 transactions to SMU.
Thread-Index: AQHVhfWVXVPRSO41ckaIp//EGr7GwKdlGOOA
Date: Mon, 21 Oct 2019 13:21:49 +0000
Message-ID: <BN6PR12MB18097ED6A44A6D95A090BCC5F7690@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe748bcd-ef3e-4995-10b0-08d75629a152
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1410:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1410B88FF495FEA465FAD259F7690@BN6PR12MB1410.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(13464003)(305945005)(7736002)(6116002)(3846002)(74316002)(6246003)(4326008)(7696005)(99286004)(71200400001)(76176011)(71190400001)(110136005)(54906003)(316002)(6436002)(9686003)(229853002)(55016002)(2906002)(25786009)(478600001)(81156014)(81166006)(8676002)(8936002)(86362001)(446003)(14454004)(33656002)(52536014)(5660300002)(6506007)(53546011)(102836004)(26005)(14444005)(256004)(2501003)(66066001)(486006)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(11346002)(476003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1410;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v2zIfgw87idP0K02a7hQEJyAuhpEmLw/QPC0kZ7msZhyaOzFucx4m+rv1qLif9WGHus5pzlEokMUJTCopKbQCsCtwhBsdpDu1i7kC8qyJsMQi/KIh3KQsQBNmVM7x/rATCVULYW0juZaqwWxHcD67oB3vZeg3nnt0B1dIPUQOQocwTc4mNExtGOCQUzgbcvveI/0y3PbyGEPGHCPb64kh8sI/5OIckCZ3dEjfWcwC61Ubxgqjwj5E8FKikSHI5XU6mYfu4JJCVvRW6zPMktEPgGdBqNEsDmTcPo4qkT9RfVohmkU6fOlXds3IdwW6s8YUGF34SXkWiFJNJt26hkLQKL/E4XEWJ5+yEeiJhp/rlp6yxpXmO8DFbF/dh3hSD2e2knL+gLQGcs3fZX/Egkie1yTgYym4u9mq7ztKB/Rp2+3uFNzk8dGGmD1CFLkB4Uy
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe748bcd-ef3e-4995-10b0-08d75629a152
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:21:49.5282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5Xhkg4k1tSBSt0YuB2QH7w807qqwmVQrZNYPaIi7Ewby/QkvGuo2wI5rVqTbbn6CQTsQB8/4ke1+cVWmqb1WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQYU7rHknJN6PvP4BwICm3w3CIyECmV1f6Ch6OZyWas=;
 b=uLfhnyvnn/N5K1BXo6dAYB5gLU9gengjB0Ie+FFFumn443tbxqSd/y+NTnUZmwRRZXHlakCAaNw9TG9zQdc+xLEkHLyN8rQ/gxGxoa/VFU/O97DrGCPKeBeEFjYfT0w1UtAFQxGrN0rXwKQcBT3KerVidBC4OqzsxXFEtQHPsyU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxOCwgMjAx
OSA0OjQ4IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENoZW4s
IEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8KPiA8VGFvLlpob3UxQGFt
ZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IG5vcmVwbHktY29uZmx1ZW5jZUBhbWQuY29tOyBRdWFuLAo+IEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPjsgR3JvZHpvdnNreSwgQW5kcmV5Cj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Cj4g
U3ViamVjdDogW1BBVENIIDEvNF0gZHJtL2FtZC9wb3dlcnBsYXk6IEFkZCBpbnRlcmZhY2UgZm9y
IEkyQyB0cmFuc2FjdGlvbnMKPiB0byBTTVUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdy
b2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpQbGVhc2UgYWRkIGEgcGF0Y2gg
ZGVzY3JpcHRpb24uICBXaXRoIHRoYXQgZml4ZWQ6ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+IGluZGV4IGJmMTNiZjMuLjI0MjQ0ZWIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBAQCAt
Mzk0LDYgKzM5NCw4IEBAIHN0cnVjdCBzbXVfY29udGV4dAo+IAo+ICB9Owo+IAo+ICtzdHJ1Y3Qg
aTJjX2FkYXB0ZXI7Cj4gKwo+ICBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7Cj4gIAlpbnQgKCphbGxv
Y19kcG1fY29udGV4dCkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwo+ICAJaW50ICgqc3RvcmVf
cG93ZXJwbGF5X3RhYmxlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7IEBAIC00NzAsNgo+ICs0
NzIsOCBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7Cj4gIAkJCQkgICB1aW50MzJfdCBkcG1fbGV2
ZWwsIHVpbnQzMl90ICpmcmVxKTsKPiAgCWludCAoKnNldF9kZl9jc3RhdGUpKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBlbnVtIHBwX2RmX2NzdGF0ZQo+IHN0YXRlKTsKPiAgCWludCAoKnVwZGF0
ZV9wY2llX3BhcmFtZXRlcnMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdAo+IHBj
aWVfZ2VuX2NhcCwgdWludDMyX3QgcGNpZV93aWR0aF9jYXApOwo+ICsJaW50ICgqaTJjX2VlcHJv
bV9pbml0KShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmNvbnRyb2wpOwo+ICsJdm9pZCAoKmkyY19lZXBy
b21fZmluaSkoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sKTsKPiAgCWludCAoKmdldF9kcG1f
Y2xvY2tfdGFibGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3QKPiBkcG1fY2xvY2tz
ICpjbG9ja190YWJsZSk7ICB9Owo+IAo+IEBAIC03ODIsNiArNzg2LDExIEBAIHN0cnVjdCBzbXVf
ZnVuY3MKPiAgI2RlZmluZSBzbXVfb3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKHNtdSkgXAo+ICAJ
CSgoc211KS0+ZnVuY3MtPm92ZXJyaWRlX3BjaWVfcGFyYW1ldGVycyA/IChzbXUpLT5mdW5jcy0K
PiA+b3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKChzbXUpKSA6IDApCj4gCj4gKyNkZWZpbmUgc211
X2kyY19lZXByb21faW5pdChzbXUsIGNvbnRyb2wpIFwKPiArCQkoKHNtdSktPnBwdF9mdW5jcy0+
aTJjX2VlcHJvbV9pbml0ID8KPiArKHNtdSktPnBwdF9mdW5jcy0+aTJjX2VlcHJvbV9pbml0KChj
b250cm9sKSkgOiAtRUlOVkFMKSAjZGVmaW5lCj4gc211X2kyY19lZXByb21fZmluaShzbXUsIGNv
bnRyb2wpIFwKPiArCQkoKHNtdSktPnBwdF9mdW5jcy0+aTJjX2VlcHJvbV9maW5pID8KPiArKHNt
dSktPnBwdF9mdW5jcy0+aTJjX2VlcHJvbV9maW5pKChjb250cm9sKSkgOiAtRUlOVkFMKQo+ICsK
PiAgI2RlZmluZSBzbXVfdXBkYXRlX3BjaWVfcGFyYW1ldGVycyhzbXUsIHBjaWVfZ2VuX2NhcCwK
PiBwY2llX3dpZHRoX2NhcCkgXAo+ICAJCSgoc211KS0+cHB0X2Z1bmNzLT51cGRhdGVfcGNpZV9w
YXJhbWV0ZXJzID8gKHNtdSktCj4gPnBwdF9mdW5jcy0+dXBkYXRlX3BjaWVfcGFyYW1ldGVycygo
c211KSwgKHBjaWVfZ2VuX2NhcCksCj4gKHBjaWVfd2lkdGhfY2FwKSkgOiAwKQo+IAo+IC0tCj4g
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
