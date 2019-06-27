Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0257DE9
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 10:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4406E82B;
	Thu, 27 Jun 2019 08:09:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1164A6E82B
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 08:09:38 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3170.namprd12.prod.outlook.com (20.179.64.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 08:09:36 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58%7]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 08:09:36 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Topic: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Index: AQHVK+fJXp+C2SF0xkCEf4zbx9jaSqateYCogAFDEOCAAGpLRQ==
Date: Thu, 27 Jun 2019 08:09:36 +0000
Message-ID: <BN8PR12MB36024D2AA3A2FA2C2C19DCC989FD0@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190626062402.18551-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <MN2PR12MB3344BE7B57FC531F96DEDB44E4FD0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344BE7B57FC531F96DEDB44E4FD0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11269b19-e97c-44ac-5bf1-08d6fad6cb93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3170; 
x-ms-traffictypediagnostic: BN8PR12MB3170:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB31702317F9F37AA26E82AF4A89FD0@BN8PR12MB3170.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(13464003)(189003)(199004)(2501003)(102836004)(53546011)(476003)(3846002)(11346002)(99286004)(7696005)(6116002)(486006)(6506007)(305945005)(7736002)(74316002)(76176011)(446003)(2906002)(86362001)(6436002)(25786009)(186003)(33656002)(6246003)(8936002)(4326008)(66066001)(6306002)(71190400001)(110136005)(229853002)(71200400001)(53936002)(81156014)(256004)(14444005)(5660300002)(81166006)(52536014)(8676002)(316002)(55016002)(966005)(72206003)(9686003)(68736007)(66446008)(64756008)(66556008)(26005)(73956011)(478600001)(66476007)(14454004)(66946007)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3170;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TU1QHiZp3lThxAQAGy1tqIl33tgLnVrLwE4hohsRiyDO2h7V7IAxVuSLCVssCBcvZ5KnPNt5IAU/32k/VE9cfRmuJYyIkH8Y52pFwOeyUEnEXX8WnJoh2uCgsZaXz29zhhP9L4gYcJJ8y1EAy8tBwt8TBZ24DDy9mLD/0HrQpm0U2i5EV/FMevU1m1V23ewtW2aacB0Za8tuXwS86K82SoYlgYkAmyx3yu+QXLZTTwVTYW1HeyX969rFyc5aW3fGcYgUnVnJ/4E7B6FYnyHobic0TYXwZr8Rl/PEPoUn9coRgD6cw39qAqpYjx+H35D0QDRPjVXSeLdKSV7Or9j/MPcU2PTn7rpk4jBRE8ngIH8rdxXuwzCUAnugZexP30/bBJM7P0yaln6cvIfV9riDAyeeucivnJvwcDCXfoloQEc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11269b19-e97c-44ac-5bf1-08d6fad6cb93
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 08:09:36.3662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3170
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrBx4x7XFAWby/CWcAglGfq+Kjzc/BE1b4UHN+5hS4A=;
 b=kQxUC92latviU0RkyyX+p3VSrj2f1cJ4CxORwG/k461Tw3OL6O5WHsUjS8uYOOLmpPKx9tlBmjXo6rmueh38ROPg2+RoD89QpsCFnmhPkzd9VyhCA+OBhYXf84ZMSdsJ1400QQ58Wp/G/X5Lg5iETjsrcrDeNu4zNQtYQYkpano=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEV2YW4sIGdvdCB5b3VyIHBvaW50LiBUaGVuIEknbGwga2VlcCB0aGUgcGF0Y2ggb25s
eSBpbiBvdXIgYnJpbmcgdXAgYnJhbmNoLgoKQlIsClhpYW9qaWUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogUXVhbiwgRXZhbgpTZW50OiBUaHVyc2RheSwg
SnVuZSAyNywgMjAxOSA5OjUxOjIyIEFNClRvOiBZdWFuLCBYaWFvamllOyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogV2FuZywgS2V2aW4oWWFuZykKU3ViamVjdDogUkU6IFtQQVRD
SF0gZHJtL2FtZC9wb3dlcnBsYXk6IHdhcm4gb24gc211IGludGVyZmFjZSB2ZXJzaW9uIG1pc21h
dGNoCgpJIGRvIG5vdCB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVhLgpBcyB0aGVyZSBpcyBzdGls
bCBzb21lIGNhc2VzIHRoYXQgdmVyc2lvbiBtaXNtYXRjaCB3aWxsIGNhdXNlIHVuZXhwZWN0ZWQg
IGlzc3Vlcy4gQW5kIHRoZXkgd2lsbCBiZSBoYXJkIHRvIGRlYnVnLgpJZiB0aGlzIGlzIGZvciBk
ZWJ1ZyBwdXJwb3NlIG9ubHksIEkgd291bGQgc3VnZ2VzdCB0byBrZWVwIHRoaXMgaW4geW91ciBj
dXN0b20gYnJhbmNoIG9ubHkuCgpSZWdhcmRzLApFdmFuCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YKPiBZdWFuLCBYaWFvamllCj4gU2VudDogV2VkbmVzZGF5LCBKdW5l
IDI2LCAyMDE5IDI6MzQgUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IHdhcm4gb24gc211IGludGVyZmFjZSB2ZXJzaW9u
Cj4gbWlzbWF0Y2gKPgo+IEN1cnJlbnQgU01VIElGIHZlcnNpb24gY2hlY2sgaXMgdG9vIHN0cmlj
dCwgZHJpdmVyIHdpdGggb2xkIHNtdTExX2RyaXZlcl9pZi5oCj4gc29tZXRpbWVzIHdvcmtzIGZp
bmUgd2l0aCBuZXcgU01VIGZpcm13YXJlLiBXZSBwcmVmZXIgdG8gc2VlIGEgd2FybmluZwo+IGlu
c3RlYWQgYSBlcnJvciBmb3IgZGVidWcgcHVycG9zZXMuCj4KPiBCUiwKPiBYaWFvamllCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJvbTogWXVhbiwgWGlh
b2ppZQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyNiwgMjAxOSAyOjI0OjE5IFBNCj4gVG86IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFdhbmcsIEtldmluKFlhbmcpOyBZdWFu
LCBYaWFvamllCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogd2FybiBvbiBz
bXUgaW50ZXJmYWNlIHZlcnNpb24KPiBtaXNtYXRjaAo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhb2pp
ZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jCj4gaW5kZXggYzNmNDhmYWU2ZjMyLi4zMzlkMDYzZTI0ZmYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwo+IEBAIC0yNzIsOCAr
MjcyLDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfY2hlY2tfZndfdmVyc2lvbihzdHJ1Y3QKPiBz
bXVfY29udGV4dCAqc211KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJzbXUgZncgdmVyc2lv
biA9IDB4JTA4eCAoJWQuJWQuJWQpXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNtdS0+
c21jX2lmX3ZlcnNpb24sIGlmX3ZlcnNpb24sCj4gICAgICAgICAgICAgICAgICAgICAgICAgc211
X3ZlcnNpb24sIHNtdV9tYWpvciwgc211X21pbm9yLCBzbXVfZGVidWcpOwo+IC0gICAgICAgICAg
ICAgICBwcl9lcnIoIlNNVSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7Cj4gLSAg
ICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIHByX3dhcm4oIlNN
VSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7Cj4gICAgICAgICB9Cj4KPiAgICAg
ICAgIHJldHVybiByZXQ7Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
