Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513478C9A8
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 04:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F10D6E204;
	Wed, 14 Aug 2019 02:41:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98986E204
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 02:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB83WinfNYE8ugKtHbyTLRDflZh3k6y4g0//sr5tMj/4Sro/2jwATKrU/1V8AEdBNSvQFeieStwNH5DR6kfaC+SygfU0C1CtJRonDV+ePRSY66Spfd4WRc40n1PLZH+ICrz3+jlNW/3gVv4KiqdrCckTDKmtHJM+Ca1tbhZKtzMiFE36kykCtXN6IUW44DoTKSunxvF5e5Fqpbd0NgrDEJLqpBcw7haUXYGhw+s3Qn+ppJJEhx/VjejEStpjZgj/t6LoGeyR+Y1XtD4LezUNxEX1RgXmgR82+OpubKv+fSrE9EMTrGbBxBxfrA00H0zTCvSRkJbf6JG85GFcHbyHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ncTAZosTMXK0X7mu4CfqlVfopXtZdD/S29bedHzEzg=;
 b=G0hA4IjE7IKJKa45xY+z+lc6JH3OD6Cb4/cF7v5VlpZkSeGWPKde27/X0EFiGHkuKIUWujz8/yLQKMGhMNXTihTtl6094C+Iq5CNe9oB11ug+1ndriGeW+5CfAmAczRIv0QEz9zMZi6lP1Yg/AHKkvVjjtcs7iuXMzAxx9AaMi5uKtK2n+8FtmaK7GsHXiQ3y191FuTc/wQTDcltVaC4uYX/4vOeGahhQzmDS8jY/+/fnOfu17GSHbv6lJ68fwfe5QS2ck+ouzOvd2DqApkA+liEzXJ+dGgJyv9+afO2bgZgbi3xngvgX3OBfuU1SGecrXIQunUMjwvHnYKBv5TzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1328.namprd12.prod.outlook.com (10.169.203.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 14 Aug 2019 02:41:41 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d%12]) with mapi id 15.20.2157.022; Wed, 14 Aug
 2019 02:41:41 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Topic: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Index: AQHVUf+rfnNsnnzs5USymgzQLGl25ab56qoAgAAEkdI=
Date: Wed, 14 Aug 2019 02:41:40 +0000
Message-ID: <MWHPR12MB1453F67B997561E00180AE67EAAD0@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>,
 <MN2PR12MB30542C37DA293DFADD11EE3EB0AD0@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB30542C37DA293DFADD11EE3EB0AD0@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:3edf:fe95:5811:4a5:7bd3:9531]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d9095a2-211d-4515-9566-08d72060efec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1328; 
x-ms-traffictypediagnostic: MWHPR12MB1328:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1328F161CDED46A093C6DDAEEAAD0@MWHPR12MB1328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(189003)(13464003)(305945005)(966005)(2906002)(7696005)(316002)(53546011)(74316002)(6506007)(6246003)(8676002)(478600001)(7736002)(71190400001)(6116002)(76176011)(71200400001)(99286004)(33656002)(14454004)(256004)(6436002)(110136005)(54906003)(229853002)(66946007)(446003)(186003)(66476007)(4326008)(66556008)(64756008)(66446008)(9686003)(53936002)(81166006)(2501003)(55016002)(76116006)(8936002)(486006)(6306002)(11346002)(5660300002)(86362001)(46003)(52536014)(102836004)(25786009)(81156014)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1328;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iGxosSurPqfA0JwOGccdrC7fBftP99/+HjQ3193AvL83XCBgSHdyvDRrjQT30h8EYzLTq9kKva0EZ+HrjsbK92FqYWisvK264v/8hdpbz6XCzLY8BYg+ADm45oLYDO5ewChe2La52AgdTc4yZTEJUa6Lijuw7FoJQfj/bP2zNDZiukw1IZGDtCTtiEYXzjDkJdx+A93TqmMi3GMX4YTSdqigR7TpNP35Wk53Y4js4ZfOTkLY80dJpkF1hzdMWTzgieGih7CZxrxUC3T8e7S7S4lNcBY5fQS/HCt4uPqun0czOBnAnK8erN8/9otDgfHsVSpi//MZAkYOUsojavGxJv56W5/W2VDy1MR5ZNaRKNgPJJGfYRo8hH4XNr+BbaE2EIC+EpbaxuAFX4C6oPfN9vrfaVqX7hrxsqUEdyGPEMU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9095a2-211d-4515-9566-08d72060efec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 02:41:40.8184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrVGWv+eM4nWN9Ual9G9rJ5HAv9vEXSOFkGu/LNgKmAkd4EUe92XTsKsbLZMoGRuhhIjQc+2E+9yw3YMlQKBMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1328
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ncTAZosTMXK0X7mu4CfqlVfopXtZdD/S29bedHzEzg=;
 b=FBRgzfJ5uWHZkQk+BptOEBnYhoG25t1LnmVnrfk/Fsw76Xc2jwOqcVsDxvJpN258Jh+cx4NFmmnp9CDtvc66NWdGUtoDVOneXGFZ1927xWti3GUZSIjRYLlEeMRhhbwq7JKg+OWEgQYT9aTh6HGPS3RagwxwLxI3VisPcdhIw7E=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXJlIHlvdSByZWZlcnJpbmcgdG8gdGhpcyBwYXRjaCB3aGljaCBmaXhlcyBhIGNyYXNoIG9yIHRv
IHRoZSBzZWNvbmQgcGF0Y2ggaW4gdGhlIHNlcnJpZXMgPwoKQW5kcmV5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPgpTZW50OiAxMyBBdWd1c3QgMjAxOSAyMjoyNDowMApUbzogR3JvZHpvdnNreSwgQW5k
cmV5OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRGV1Y2hlciwgQWxleGFuZGVy
OyBHcm9kem92c2t5LCBBbmRyZXk7IFBhbiwgWGluaHVpOyBaaGFuZywgSGF3a2luZwpTdWJqZWN0
OiBSRTogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogRml4IG51bGwgcHRyIHdoZW4gY2FsbGluZyBx
dWVyeV9yYXNfZXJyb3JfY291bnQKCkhpIEFuZHJleToKCkknbSBhbHNvIHdvcmtpbmcgb24gcmFz
IGVycm9yIGFkZHJlc3Mgc2F2aW5nIGJhc2VkIG9uIHlvdXIgZWVwcm9tIHBhdGNoZXMsIGFuZCB0
aGUgaW1wbGVtZW50YXRpb24gaXMgZGlmZmVyZW50IGZyb20geW91LgpJJ2xsIHNlbmQgb3V0IG15
IHBhdGNoZXMgdGhpcyB3ZWVrIGFuZCB3ZSBjYW4gZGlzY3VzcyBpdC4KClJlZ2FyZHMsClRhbwoK
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZgo+IEFuZHJleSBHcm9kem92
c2t5Cj4gU2VudDogMjAxOeW5tDjmnIgxNOaXpSAxOjUxCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IEdyb2R6b3Zza3ksCj4gQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29t
PjsgUGFuLCBYaW5odWkKPiA8WGluaHVpLlBhbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBG
aXggbnVsbCBwdHIgd2hlbiBjYWxsaW5nCj4gcXVlcnlfcmFzX2Vycm9yX2NvdW50Cj4KPiByYXNf
ZXJyX2RhdGEuZXJyX2FkZHIgd2FzIG5ldmVyIGFsbG9jYXRlZAo+Cj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRleCA1MGMxM2IwLi5kOWZiODYwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC0xMDExLDYgKzEw
MTEsMjEgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QK
PiByYXNfbWFuYWdlciAqb2JqKQo+ICAgICAgIGludCByZXQ7Cj4gICAgICAgc3RydWN0IHJhc19l
cnJfZGF0YSBlcnJfZGF0YSA9IHswLCAwLCAwLCBOVUxMfTsKPgo+ICsgICAgIC8qIEFsbG9jYXRl
IGVub3VnaCB0byBzZXJ2ZSBtYXggIG51bWJlciBvZiByZXF1ZXN0cyovCj4gKyAgICAgaW50IGVy
cl9hZGRyX3NpemUgPSBkYXRhLT5yaW5nX3NpemUgLyBkYXRhLT5hbGlnbmVkX2VsZW1lbnRfc2l6
ZSAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+YWRldi0+dW1jLnVtY19pbnN0X251
bSAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+YWRldi0+dW1jLmNoYW5uZWxfaW5z
dF9udW07Cj4gKwo+ICsgICAgIGVycl9kYXRhLmVycl9hZGRyID0ga2NhbGxvYyhlcnJfYWRkcl9z
aXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKmVycl9kYXRh
LmVycl9hZGRyKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5F
TCk7Cj4gKwo+ICsgICAgIGlmICghZXJyX2RhdGEuZXJyX2FkZHIpIHsKPiArICAgICAgICAgICAg
IERSTV9FUlJPUigiTm90IGVub3VnaCBtZW1vcnkhIik7Cj4gKyAgICAgICAgICAgICByZXR1cm47
Cj4gKyAgICAgfQo+ICsKPiArCj4gICAgICAgd2hpbGUgKGRhdGEtPnJwdHIgIT0gZGF0YS0+d3B0
cikgewo+ICAgICAgICAgICAgICAgcm1iKCk7Cj4gICAgICAgICAgICAgICBtZW1jcHkoJmVudHJ5
LCAmZGF0YS0+cmluZ1tkYXRhLT5ycHRyXSwgQEAgLTEwMzksNgo+ICsxMDU0LDggQEAgc3RhdGlj
IHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QgcmFzX21hbmFnZXIKPiAq
b2JqKQo+ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICB9Cj4gICAgICAg
fQo+ICsKPiArICAgICAga2ZyZWUoZXJyX2RhdGEuZXJyX2FkZHIpOwo+ICB9Cj4KPiAgc3RhdGlj
IHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcHJvY2Vzc19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0
cnVjdAo+ICp3b3JrKQo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
