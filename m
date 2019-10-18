Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91047DCCE3
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE556E13F;
	Fri, 18 Oct 2019 17:34:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385306E13F
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVAj8jPn+zkLZxakqAvdE/Qi83TybGmn+wkIpvC5tbVKL35ucch98DVCeW5v0ZoT+MbfQZEHxB+Fo9xjxav+AXUmcy0mFUHwmV6qpzloKoOkyBG559/Ro0qC4JysjaXmbU6RLz3vOBRxbTNGgbwQ/BVELXxKrjA088NEI4M7YUewODzOcHehoxJcxNhJmB4iFZFqvA/xIrNy7lvVLAn/sl2PTyRWihKjFzL/wn4J4LnSnpv9txSeruhuOPt0O+aYyTcGabTSUZfCi4IgeNGHLf8pX+ijwyb1KTQdrn5KysOLnYdlDWCZpulMa5ACWR6Ye2gIFKdYq3YZquzOZOyRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoSndIq/IRKnJPFTuf3BknFO08d9mOCcUlA7svjJb+I=;
 b=knefyLaFe9B4ufq/CaN80iu345W9p+1pCZlJny+iyPH9fxM2pTCict6TB9pKcSXoLuONQRHB9rUHTnBn+w0SA5TVwfxbTIcMSj4kQ8mBUjf2KY+Qiis9DnNO3w+jlxIEM3mD2tE8kaQhFy3APoJH0Eb2nYu2pvECmTYVQjCqaccEsqJyOrz0HY2SAu/TTclx3QnrTczgM3GDVDTj+F8GRuTlC6IE/uOl062+BqIwzklRv/SudGgZ755kXVaF8Z9uRsnQmNyCIsEFzXwTWxynHZoCf6zyUXAb7vwswr+O77z+XwWc335KdgNN9JRdpXfpixLMLxamxhyYATaDnONGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 17:34:48 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 17:34:47 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Topic: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Index: AQHVhcApOQbEtJBw1kOd8JCAgRq7tKdgiU4AgAAf3AA=
Date: Fri, 18 Oct 2019 17:34:47 +0000
Message-ID: <b5977e92-156f-8eb4-2ea5-2e5616f10db3@amd.com>
References: <20191018142711.19261-1-Philip.Yang@amd.com>
 <73684157-12eb-9167-fb19-63e3ad02b16a@amd.com>
In-Reply-To: <73684157-12eb-9167-fb19-63e3ad02b16a@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8478a91-595b-428c-96b1-08d753f178dc
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28630017BD6FC9E1C47B4349E66C0@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(199004)(189003)(11346002)(66476007)(6436002)(7736002)(99286004)(66446008)(102836004)(66946007)(66556008)(229853002)(6512007)(31686004)(6506007)(53546011)(64756008)(305945005)(5660300002)(52116002)(76176011)(25786009)(26005)(386003)(186003)(8676002)(81166006)(8936002)(81156014)(256004)(14444005)(6486002)(446003)(4001150100001)(110136005)(71190400001)(486006)(316002)(71200400001)(14454004)(66066001)(6246003)(476003)(86362001)(36756003)(2616005)(31696002)(478600001)(6116002)(3846002)(2906002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSbsvMNPSAFxKUpoKjxpf/GPh8TcaBzKdz77rWHFdoJMwObkoncqTKFQdy60aLs1+PKDMoQ2OBe4hDBcOhdV0YKYybVnRrUnGUN4ZJ6CHjVXA5OrhMIgnOXOcSqS1vK3KX+VToophHIR1LKA2xjBnfh66Ue/SWhxT2l5E+expuhtXQkqBeYFlap0GBL5De4Qo14pkfEjszY0E3Ht0MP+sJIO2EXC1Ageu1ixaxgQDTS5dfpEGxPamFXxiwqyxfRm7ZMsT0i81jxpcdvTncO6V45GmqA2ieB+SdqGPMBppba5Qn2KiVWT/aPSaQtIDi5oknOYBBL32tC1YykBBSB83lWTawfrvza+MN2OBxWHXteQVXFfRNGqMqBtFUsyGeavYrnq0lJ84n0rgTMJ3BboPkuyYGd6SSvjMYel6sx46XM=
Content-ID: <491C829D3275244F9179F11BC9FA2706@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8478a91-595b-428c-96b1-08d753f178dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:34:47.8629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qhk6YCx5Q4HCNlt/W8FeB0GOGy6GHXLKo8CuUFwxtsermsAlHHYONu9mGNE1cO7k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoSndIq/IRKnJPFTuf3BknFO08d9mOCcUlA7svjJb+I=;
 b=3DU8LAxTFjtrPTMfOVkkUY5MNocJ08QUZhcO4f0yjg1/LxVHjoq741sng42RI7UAz/wUyEVVPRGToFPgIJm82LmtTS/F1+oWLZh7MO3pyBR1hLmOEpNVF3oNF2RYyR32i/PMGQMO6k6dmPGQU3GBm742EggaIg2JsJuTvhoOFzg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQoNCk9uIDIwMTktMTAtMTggMTE6NDAgYS5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPiBP
biAyMDE5LTEwLTE4IDEwOjI3IGEubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4+IElmIGRldmlj
ZSBpcyBsb2NrZWQgZm9yIHN1c3BlbmQgYW5kIHJlc3VtZSwga2ZkIG9wZW4gc2hvdWxkIHJldHVy
bg0KPj4gZmFpbGVkIC1FQUdBSU4gd2l0aG91dCBjcmVhdGluZyBwcm9jZXNzLCBvdGhlcndpc2Ug
dGhlIGFwcGxpY2F0aW9uIGV4aXQNCj4+IHRvIHJlbGVhc2UgdGhlIHByb2Nlc3Mgd2lsbCBoYW5n
IHRvIHdhaXQgZm9yIHJlc3VtZSBpcyBkb25lIGlmIHRoZSBzdXNwZW5kDQo+PiBhbmQgcmVzdW1l
IGlzIHN0dWNrIHNvbWV3aGVyZS4gVGhpcyBpcyBiYWNrdHJhY2U6DQo+IA0KPiBUaGlzIGRvZXNu
J3QgZml4IHByb2Nlc3NlcyB0aGF0IHdlcmUgY3JlYXRlZCBiZWZvcmUgc3VzcGVuZC9yZXN1bWUg
Z290DQo+IHN0dWNrLiBUaGV5IHdvdWxkIHN0aWxsIGdldCBzdHVjayB3aXRoIHRoZSBzYW1lIGJh
Y2t0cmFjZS4gU28gdGhpcyBpcw0KPiBqdXQgYSBiYW5kLWFpZC4gVGhlIHJlYWwgdW5kZXJseWlu
ZyBwcm9ibGVtLCB0aGF0IGlzIG5vdCBnZXR0aW5nDQo+IGFkZHJlc3NlZCwgaXMgc3VzcGVuZC9y
ZXN1bWUgZ2V0dGluZyBzdHVjay4NCj4gDQo+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+IA0K
VGhpcyBpcyB0byBhZGRyZXNzIGFwcGxpY2F0aW9uIHN0dWNrIHRvIHF1aXQgaXNzdWUgYWZ0ZXIg
c3VzcGVuZC9yZXN1bWUgDQpnb3Qgc3R1Y2suIFRoZSByZWFsIHVuZGVybHlpbmcgc3VzcGVuZC9y
ZXN1bWUgaXNzdWUgc2hvdWxkIGJlIGFkZHJlc3NlZCANCnNlcGFyYXRlbHkuDQoNCkkgd2lsbCBz
dWJtaXQgdjIgcGF0Y2ggdG8gZml4IHByb2Nlc3NlcyB0aGF0IHdlcmUgY3JlYXRlZCBiZWZvcmUg
DQpzdXNwZW5kL3Jlc3VtZSBnb3Qgc3R1Y2suDQoNClBoaWxpcA0KDQo+IFJlZ2FyZHMsDQo+ICAg
wqAgRmVsaXgNCj4gDQo+IA0KPj4NCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldIElORk86
IHRhc2sgcm9jbWluZm86MzAyNCBibG9ja2VkIGZvciBtb3JlDQo+PiB0aGFuIDEyMCBzZWNvbmRz
Lg0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gICAgICAgTm90IHRhaW50ZWQNCj4+IDUu
MC4wLXJjMS1rZmQtY29tcHV0ZS1yb2NtLWRrbXMtbm8tbnBpLTExMzEgIzENCj4+IFtUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldICJlY2hvIDAgPg0KPj4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rh
c2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuDQo+PiBbVGh1IE9jdCAxNyAx
Njo0MzozNyAyMDE5XSByb2NtaW5mbyAgICAgICAgRCAgICAwICAzMDI0ICAgMjk0Nw0KPj4gMHg4
MDAwMDAwMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gQ2FsbCBUcmFjZToNCj4+IFtU
aHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IF9fc2NoZWR1bGUrMHgzZDkvMHg4YTANCj4+IFtU
aHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBzY2hlZHVsZSsweDMyLzB4NzANCj4+IFtUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldICBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4YS8weDEwDQo+
PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tdXRleF9sb2NrLmlzcmEuOSsweDFlMy8w
eDRlMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gX19jYWxsX3NyY3UrMHgyNjQv
MHgzYjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IHByb2Nlc3NfdGVybWluYXRp
b25fY3BzY2grMHgyNC8weDJmMA0KPj4gW2FtZGdwdV0NCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3
IDIwMTldICBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKzB4MjQvMHgyZjANCj4+IFthbWRncHVd
DQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XQ0KPj4ga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9m
cm9tX2FsbF9kZXZpY2VzKzB4NDIvMHg2MCBbYW1kZ3B1XQ0KPj4gW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIGtmZF9wcm9jZXNzX25vdGlmaWVyX3JlbGVhc2UrMHgxYmUvMHgyMjANCj4+IFth
bWRncHVdDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tbXVfbm90aWZpZXJfcmVs
ZWFzZSsweDNlLzB4YzANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBleGl0X21tYXAr
MHgxNjAvMHgxYTANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IF9faGFuZGxlX21t
X2ZhdWx0KzB4YmEzLzB4MTIwMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gZXhp
dF9yb2J1c3RfbGlzdCsweDVhLzB4MTEwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAg
bW1wdXQrMHg0YS8weDEyMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGRvX2V4aXQr
MHgyODQvMHhiMjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IGhhbmRsZV9tbV9m
YXVsdCsweGZhLzB4MjAwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZG9fZ3JvdXBf
ZXhpdCsweDNhLzB4YTANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBfX3g2NF9zeXNf
ZXhpdF9ncm91cCsweDE0LzB4MjANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBkb19z
eXNjYWxsXzY0KzB4NGYvMHgxMDANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBlbnRy
eV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5DQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgfCA2ICsrKy0tLQ0KPj4gICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4+IGluZGV4IGQ5ZTM2ZGJmMTNk
NS4uNDBkNzVjMzlmMDhlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2NoYXJkZXYuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NoYXJkZXYuYw0KPj4gQEAgLTEyMCwxMyArMTIwLDEzIEBAIHN0YXRpYyBpbnQga2ZkX29wZW4o
c3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQ0KPj4gICAgCQlyZXR1cm4g
LUVQRVJNOw0KPj4gICAgCX0NCj4+ICAgIA0KPj4gKwlpZiAoa2ZkX2lzX2xvY2tlZCgpKQ0KPj4g
KwkJcmV0dXJuIC1FQUdBSU47DQo+PiArDQo+PiAgICAJcHJvY2VzcyA9IGtmZF9jcmVhdGVfcHJv
Y2VzcyhmaWxlcCk7DQo+PiAgICAJaWYgKElTX0VSUihwcm9jZXNzKSkNCj4+ICAgIAkJcmV0dXJu
IFBUUl9FUlIocHJvY2Vzcyk7DQo+PiAgICANCj4+IC0JaWYgKGtmZF9pc19sb2NrZWQoKSkNCj4+
IC0JCXJldHVybiAtRUFHQUlOOw0KPj4gLQ0KPj4gICAgCWRldl9kYmcoa2ZkX2RldmljZSwgInBy
b2Nlc3MgJWQgb3BlbmVkLCBjb21wYXQgbW9kZSAoMzIgYml0KSAtICVkXG4iLA0KPj4gICAgCQlw
cm9jZXNzLT5wYXNpZCwgcHJvY2Vzcy0+aXNfMzJiaXRfdXNlcl9tb2RlKTsNCj4+ICAgIA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
