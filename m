Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC4D6343
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 15:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1156E2DA;
	Mon, 14 Oct 2019 13:04:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680081.outbound.protection.outlook.com [40.107.68.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADCF6E2DA
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 13:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdQrbFFQ5AKsAsxcQV2wKutNRInyH9p1Vjf4IXJY5P8ufZO8QZ+inslqYdkMeyxMi0VaHNlsZn926srQqYHI5s1WGsnmXvgvJJMKhBr74qd6m3Dpe4AuLpa79ygaOE14E0COf6wr08xwa9hjmBp0Pdmn6C/0LsugENv2F75qgHVmXISeNkyJTeocxPkk4Fox7v8k02ppGTkXmXL75Bw6akDzyNJ8DI54X+LzqTE5NtQEyL2Kj6rmNEs3VDEiMczuJObZLu8uXTEAEkf+mOt3ehENMeP20rj3jLB6OGA1US/eMF8MJA1y1LjJeNZtWpTBhHzXj/Jrzdn/jfdSOHclwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wUQ8LYxt9lUe/BSKgeNh4s99A0PKDExzNtMwxkmddg=;
 b=mU/pnJ5vZIgH8Nv2+V4h45yM8m+KMU66XUZRG2PNW/ioJGW8CxzLtU9MNN8WmLvcC8moQubsJj6g97s6NuKgSAZyUrSwZhyRxIZsO5HfyAjwBUii+8YsZFCtv7Y7JOLGfmzei1aP04Ia4+sAbiNx3zxGReLAeDLX+hTkEJkN2EJgOcI7GQc2Pxoe1bXBNtPbXJ2YDobQHXwT8+ROjmgbLcisWDKTXXZONP9FdLfA/FhUCAqSmomvdajHdJNe9sTIT+Z9RlVWGH6SkX7UtEnM+MZMIZiQpzN231WjsFlDjSSBSTAHq3t1ixOI8RXsorvwt6E/AxDZ+j51utw02VwsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2357.namprd12.prod.outlook.com (52.132.142.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 14 Oct 2019 13:04:23 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.021; Mon, 14 Oct
 2019 13:04:22 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, 
 James" <James.Zhu@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
Thread-Topic: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
Thread-Index: AQHVgo+MFN1/CvW/006fMitOuybXP6daGqWA
Date: Mon, 14 Oct 2019 13:04:22 +0000
Message-ID: <5f597d92-86f1-d221-abde-d3f7f9597024@amd.com>
References: <20191011205050.21021-1-alexander.deucher@amd.com>
 <990fccc3-f8a1-a1dc-52c6-5299c645c24a@gmail.com>
 <CADnq5_O9ipAScOVXAvaqGTuM-4qMhzJdAK6_yxCg3-E3xzfqOA@mail.gmail.com>
In-Reply-To: <CADnq5_O9ipAScOVXAvaqGTuM-4qMhzJdAK6_yxCg3-E3xzfqOA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0402CA0013.eurprd04.prod.outlook.com
 (2603:10a6:208:15::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55d54726-0726-4c83-89ab-08d750a70863
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2357:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23579D812ABE251E538B2B2C83900@DM5PR12MB2357.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(199004)(189003)(54906003)(305945005)(110136005)(256004)(31686004)(7736002)(58126008)(316002)(36756003)(31696002)(25786009)(86362001)(102836004)(229853002)(8676002)(81156014)(81166006)(6246003)(8936002)(186003)(5660300002)(52116002)(6436002)(6306002)(6636002)(99286004)(6486002)(966005)(386003)(6506007)(65956001)(65806001)(2906002)(71190400001)(71200400001)(76176011)(53546011)(6512007)(486006)(446003)(2616005)(11346002)(478600001)(4326008)(6116002)(14454004)(476003)(66446008)(46003)(66946007)(66476007)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2357;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUyULDvuYOAw19iPsfwNVVHNJveN66NS8fnDlLtwvH3gb+9OFYQ5DvS+9uSi7pzsk9ecE4EWrvNIoBNkLC+L0CFk8X3PCSYM5VAAAMyfUqkZ3kMu2V8k5m9IqcpVlRGZ/ZLSyaummmtQAry/1wbCm71la8hs9JrCsvYl++PUjeXu1s+2nIJmzzWQGJi9JPr0FiPC9IeJnezVSQIRIdCqavqmiMsZHT4T/o85GEiycCk0jtzmJqAJ2W88viAMFlJAAjSKlkjuSK5kSnCNjW+iEN0dqGVkS5S9YrHlTM1ekjCxeGikI1sN0pEApKIXAQXzdEKARJKx3+8neFRw8C5QVU/hld1mSUaPa9lKqtLcQzFfhCqno1qd6WbXytPdM7ffZN1LIRxeddbAAcVeHXOnin4pzaRUnFsvjypbTIDbiUX59M1pTwmvuV4BNDZl2KFUaauIjBlHI4wz29wEpwblWg==
Content-ID: <E00766C8FB079E42B7F15C5731411264@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d54726-0726-4c83-89ab-08d750a70863
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 13:04:22.9055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8grSFR1KFG5OFj3/hauTaDN+xHSNO0f3fF0AT54t7WpxSr6Vn2n9GZkTPFNr0lu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2357
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wUQ8LYxt9lUe/BSKgeNh4s99A0PKDExzNtMwxkmddg=;
 b=JmMO+FBQQHJO7QnwW+A4acAwAY4d8d/EwaISqnTtqDZCAbi/y9boaHr3JySilEJvewP6fSJ8J3RxKax6A/jruHbG1uxq3U9nmknNvL1UQ3WN4Cjz6PSrZVFvbiyruAwcy7few1A/urfe9RseiGOp/WlsTkcEoZP226LIn2gDBzM=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMTAuMTkgdW0gMTU6MDEgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9uIE1vbiwgT2N0
IDE0LCAyMDE5IGF0IDU6MDYgQU0gQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gQW0gMTEuMTAuMTkgdW0gMjI6NTAgc2Nocmll
YiBBbGV4IERldWNoZXI6DQo+Pj4gV2UgbmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBi
dWZmZXIgZm9yIHRoZQ0KPj4+IHNlc3Npb24gaW5mbywgb3RoZXJ3aXNlIHRoZSBJQiB0ZXN0IGNh
biBvdmVyd3JpdGUNCj4+PiBvdGhlciBtZW1vcnkuDQo+Pj4NCj4+PiBCdWc6IGh0dHBzOi8vYnVn
emlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0MjQxDQo+Pj4gU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4gQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJp
ZXMuDQo+ICsgTGVvLCBKYW1lcw0KPg0KPiBTZWVtcyBsaWtlIHdlIHN0aWxsIG92ZXJ3cml0ZSB0
aGUgYnVmZmVyLiAgRG8geW91IGtub3cgaG93IGJpZyB0aGUNCj4gc2Vzc2lvbiBidWZmZXIgbmVl
ZHMgdG8gYmU/ICBJcyBpdCBkaWZmZXJlbnQgZm9yIFVWRCBhbmQgVkNOPw0KDQpBdCBsZWFzdCBv
cmlnaW5hbGx5IHdlIGFsbG9jYXRlZCBhIHNlcGFyYXRlIDRLQiBCTyBpbiBWUkFNIGZvciB0aGlz
LiBUaGUgDQptZXNzYWdlIHdhcyBxdWl0ZSBsYXJnZSBJSVJDLg0KDQpDaHJpc3RpYW4uDQoNCj4N
Cj4gQWxleA0KPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2
ZF92Nl8wLmMgfCA4ICsrKystLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y2XzAuYw0KPj4+IGluZGV4IDY3MDc4NGE3ODUxMi4uOTA5YmMyY2U3OTFmIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jDQo+Pj4gQEAgLTIxNSwxMiArMjE1
LDEyIEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlDQo+Pj4gICAgICAgIHVpbnQ2NF90IGR1bW15
Ow0KPj4+ICAgICAgICBpbnQgaSwgcjsNCj4+Pg0KPj4+IC0gICAgIHIgPSBhbWRncHVfam9iX2Fs
bG9jX3dpdGhfaWIocmluZy0+YWRldiwgaWJfc2l6ZV9kdyAqIDQsICZqb2IpOw0KPj4+ICsgICAg
IHIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIocmluZy0+YWRldiwgKGliX3NpemVfZHcgKiA0
KSArIDEwMjQsICZqb2IpOw0KPj4+ICAgICAgICBpZiAocikNCj4+PiAgICAgICAgICAgICAgICBy
ZXR1cm4gcjsNCj4+Pg0KPj4+ICAgICAgICBpYiA9ICZqb2ItPmlic1swXTsNCj4+PiAtICAgICBk
dW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7DQo+Pj4gKyAgICAgZHVtbXkgPSBpYi0+Z3B1X2Fk
ZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOw0KPj4+DQo+Pj4gICAgICAgIGliLT5sZW5ndGhfZHcgPSAw
Ow0KPj4+ICAgICAgICBpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDE4Ow0KPj4+
IEBAIC0yNzcsMTIgKzI3NywxMiBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJv
eV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0KPj4+ICAgICAgICB1aW50NjRfdCBkdW1t
eTsNCj4+PiAgICAgICAgaW50IGksIHI7DQo+Pj4NCj4+PiAtICAgICByID0gYW1kZ3B1X2pvYl9h
bGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcgKiA0LCAmam9iKTsNCj4+PiArICAg
ICByID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIChpYl9zaXplX2R3ICog
NCkgKyAxMDI0LCAmam9iKTsNCj4+PiAgICAgICAgaWYgKHIpDQo+Pj4gICAgICAgICAgICAgICAg
cmV0dXJuIHI7DQo+Pj4NCj4+PiAgICAgICAgaWIgPSAmam9iLT5pYnNbMF07DQo+Pj4gLSAgICAg
ZHVtbXkgPSBpYi0+Z3B1X2FkZHIgKyAxMDI0Ow0KPj4+ICsgICAgIGR1bW15ID0gaWItPmdwdV9h
ZGRyICsgKGliX3NpemVfZHcgKiA0KTsNCj4+Pg0KPj4+ICAgICAgICBpYi0+bGVuZ3RoX2R3ID0g
MDsNCj4+PiAgICAgICAgaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
