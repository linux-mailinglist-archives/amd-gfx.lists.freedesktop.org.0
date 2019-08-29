Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A4A283E
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 22:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692306E1AA;
	Thu, 29 Aug 2019 20:43:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720041.outbound.protection.outlook.com [40.107.72.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1436E1AA
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 20:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doV4nt5/M2Y2d/Zxivqca0/bv4xz4f08Mcu5Q6WZ5HOhAzqYXCp+NtW5p++FeyRM52dgNI0+qVeCChoLOhgTgkvpWmyZusdgu54XT3hpQJRZAFlFY3GIAX07EI1GjKFF9hmEWuC8u/1A4+cAtzhkzBWOkxlWkMVzCnfarL+iPf3VXvvkxz+TxFOSaIqX6Er1ivjhnrnjIybf23BQyCOA/IETgA0GKAjiWx2GOWwgI1jmr3priTOgYh87RxmLHJldXlBm6LEC6EUfSGxwHCfAzwg8qgpP1KN9yxrBQMBtdhIm3IFbcqDXCJNtfwmiNtRXFLaKHtu0UeVWiIRfhreINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbv6KObFR3nqawnLVf6PjDWqR5njrFl/zBD3u9QGOd0=;
 b=A4ZJIzmXXeB4u3ugxPlbOOE0cTYvCi1CO9XFV6kkHol0MxuoCKaT/4EaoSY8GDqmAcVwGe1N0Bni4MO/Gj4wWTRrKW+Md2YdV1TGTxJKg7NZoljgi0TCNrKotAbj5iXbT/DeD4DFlTAmYERklawk3CmoIUtW35bdYsATmALj8HSg83QVTWJuliyHqkgnlfVVl6LsoedXrq6cWTLkqvUsS/Du36jIHMGZ3/jiZ/F1sey9ZoSEtaH8yk0i1Ev3U3RgtU/zrdkWVsqVeW2Y16ScLNHOQVB+kXi/AYKO4/09kPVlMmYI8S6WbC7ltPA/dNtt20JPLSUUpvFUOaOBjj/3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1344.namprd12.prod.outlook.com (10.169.201.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 20:43:29 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 20:43:29 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernstp@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
Thread-Topic: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
Thread-Index: AQHVXQOrn9fm8u+Ua0mBA0QLJpx17acQQ24AgAJXTgA=
Date: Thu, 29 Aug 2019 20:43:29 +0000
Message-ID: <5fe410b4-591d-4c1e-b89e-89e9c9454844@amd.com>
References: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
 <CAD=4a=XNfU9sAoNBQ8-Ou_nXR19F1jorvd9XpM_f1U9HLS3VTQ@mail.gmail.com>
In-Reply-To: <CAD=4a=XNfU9sAoNBQ8-Ou_nXR19F1jorvd9XpM_f1U9HLS3VTQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::28) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95:e90f:da85:2954:bd2c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6689ba75-59fb-4d8b-6afe-08d72cc18c46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1344; 
x-ms-traffictypediagnostic: MWHPR12MB1344:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1344BCFBDEAC7AC6D13E10DAEAA20@MWHPR12MB1344.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(199004)(189003)(6306002)(478600001)(966005)(86362001)(8676002)(316002)(2616005)(476003)(14454004)(446003)(31686004)(64756008)(11346002)(66946007)(66556008)(5660300002)(46003)(25786009)(66446008)(186003)(99286004)(7736002)(81166006)(305945005)(66476007)(6116002)(8936002)(66574012)(81156014)(4326008)(31696002)(6246003)(6486002)(71190400001)(71200400001)(14444005)(256004)(53936002)(36756003)(486006)(386003)(6506007)(102836004)(6512007)(52116002)(53546011)(76176011)(229853002)(2906002)(6916009)(1411001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1344;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJ5VQnA4ZgiCQuNMqQ1dV4/7dc7g01mcovdODOFFEgBpNu3DiyO7W3f63NsBqo4du7rewx+M2fjigA5JQCJ4m2/KN/zjKBNf+3Se44k50ToMIa4t850bt+6gdiq+nQim0/bqKM1ntWsJXj70zOwYYEyQshvqgEiQV/nLECYYoAFjDu5eAYIw1623e7xvj4yYi1UqBl1TzHOlzVZSM6p4DDYF128PDZa1gxT9XCuLdn4jKPWRbFUFaucwdUEndrRhB2r52P+WcC/j0dQy2NcDoq1CgxOvLflMXt2yExjif0jLhVj2LgFlJwZebeIqY0LLjBJL01qn01x3KHSF5HRgUoo0J90X/0SmHOJWJbFekyntekItYbqmDa25FRHRu8WeWcpegc/nbY3UYNCd0ppeJiZV1ujTuI8GlmRou6Mgqfc=
x-ms-exchange-transport-forked: True
Content-ID: <56CB20E0133C9A4BA49F04D3A4AE57B3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6689ba75-59fb-4d8b-6afe-08d72cc18c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 20:43:29.1729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fu0d7AJaealPqymiMHrlKtKYcZIXcKvUvXj5wy0LZIa5vzJKoVuTQZeCBZhZC8YMOUZAnXFoBMr5Hy7pB5kyqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbv6KObFR3nqawnLVf6PjDWqR5njrFl/zBD3u9QGOd0=;
 b=wJ/PMzwk1FhrOkzbkmnE57BmDYBsE+bgCnS1Pm7azRvaqMYUdEyAYDFFaXWv8dyZbztWNZbpLxo+vUwnQao4er/HmaDIfB7Vrq3ICid/JRRfcxHCqcbQq6XUknN5DuWEQYwS4gb7UUbgYJsO6DTjDtg/0ScxVXlmeeZiTEiHUw0=
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA4LzI4LzE5IDQ6NTggQU0sIEVybnN0IFNqw7ZzdHJhbmQgd3JvdGU6DQo+IERlbiB0aXMg
MjcgYXVnLiAyMDE5IGtsIDIwOjE3IHNrcmV2IEFuZHJleSBHcm9kem92c2t5DQo+IDxhbmRyZXku
Z3JvZHpvdnNreUBhbWQuY29tPjoNCj4+IFRoaXMgc2hvdWxkIGJlIGNoZWNrZWQgYXQgYWxsIHBs
YWNlcyBqb2IgaXMgYWNjZXNzZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKysrLS0tLQ0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGluZGV4IDAyYjNlN2Qu
LjE5MGQ5YTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KPj4gQEAgLTM3OTAsMTQgKzM3OTAsMTQgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1
X3JlY292ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pg0KPj4gICAgICAgICAgaWYg
KGhpdmUgJiYgIW11dGV4X3RyeWxvY2soJmhpdmUtPnJlc2V0X2xvY2spKSB7DQo+PiAgICAgICAg
ICAgICAgICAgIERSTV9JTkZPKCJCYWlsaW5nIG9uIFREUiBmb3Igc19qb2I6JWxseCwgaGl2ZTog
JWxseCBhcyBhbm90aGVyIGFscmVhZHkgaW4gcHJvZ3Jlc3MiLA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgIGpvYi0+YmFzZS5pZCwgaGl2ZS0+aGl2ZV9pZCk7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgIGpvYiA/IGpvYi0+YmFzZS5pZCA6IC0xLCBoaXZlLT5oaXZlX2lkKTsNCj4+
ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgICAgICAgICB9DQo+Pg0KPj4gICAgICAg
ICAgLyogU3RhcnQgd2l0aCBhZGV2IHByZSBhc2ljIHJlc2V0IGZpcnN0IGZvciBzb2Z0IHJlc2V0
IGNoZWNrLiovDQo+PiAgICAgICAgICBpZiAoIWFtZGdwdV9kZXZpY2VfbG9ja19hZGV2KGFkZXYs
ICFoaXZlKSkgew0KPj4gICAgICAgICAgICAgICAgICBEUk1fSU5GTygiQmFpbGluZyBvbiBURFIg
Zm9yIHNfam9iOiVsbHgsIGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIsDQo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGpvYi0+YmFzZS5pZCk7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIGpvYiA/IGpvYi0+YmFzZS5pZCA6IC0xKTsNCj4+ICAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgICAgICAgICB9DQo+Pg0KPj4gQEAgLTM4Mzgs
NyArMzgzOCw3IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghcmluZyB8fCAh
cmluZy0+c2NoZWQudGhyZWFkKQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+Pg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX3NjaGVkX3N0b3Ao
JnJpbmctPnNjaGVkLCAmam9iLT5iYXNlKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRy
bV9zY2hlZF9zdG9wKCZyaW5nLT5zY2hlZCwgam9iID8gJmpvYi0+YmFzZSA6IE5VTEwpOw0KPj4g
ICAgICAgICAgICAgICAgICB9DQo+PiAgICAgICAgICB9DQo+Pg0KPj4gQEAgLTM4NjQsNyArMzg2
NCw3IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LA0KPj4NCj4+ICAgICAgICAgIC8qIEd1aWx0eSBqb2Igd2lsbCBiZSBmcmVlZCBhZnRl
ciB0aGlzKi8NCj4+ICAgICAgICAgIHIgPSBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KGFk
ZXYsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGpvYiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgam9iID8gam9iIDogTlVM
TCwNCj4gVGhpcyBjaGVjayBsb29rcyByZWR1bmRhbnQuDQoNCg0KQWdyZWUuIFdpbGwgcmVtb3Zl
Lg0KDQpBbmRyZXkNCg0KDQo+DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmbmVlZF9mdWxsX3Jlc2V0KTsNCj4+ICAgICAgICAgIGlmIChyKSB7DQo+PiAgICAg
ICAgICAgICAgICAgIC8qVE9ETyBTaG91bGQgd2Ugc3RvcCA/Ki8NCj4+IC0tDQo+PiAyLjcuNA0K
Pj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KPiBSZWdhcmRzDQo+IC8vRXJuc3QNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
